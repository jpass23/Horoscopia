//
//  Model.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import Foundation

struct Horoscope: Hashable, Codable {
    let horoscope: Result
    let zodiac: String
    var isSaved: Bool
    
    init(horoscope: Result, zodiac: String, isSaved: Bool = false) {
        self.horoscope = horoscope
        self.zodiac = zodiac
        self.isSaved = isSaved
    }
    
    mutating func save(){
        self.isSaved = true
    }
    
    mutating func delete(){
        self.isSaved = false
    }
}

struct Result: Codable, Hashable {
    let current_date: String
    let description: String
    let compatibility: String
    let mood: String
    let color: String
    let lucky_number: String
    let lucky_time: String
}

class Model: ObservableObject {
    @Published var signedIn = false // UserDefaults.standard.bool(forKey: "signedIn")
    @Published var zodiac: String? //UserDefaults.standard.string(forKey: "zodiac")
    @Published var savedList = [Horoscope]()
    var resultsList = [String: Horoscope]() //make this @Published
    let colorList: [String: Int] = ["Red": 0xB90E0A, "Orange": 0xFF7A00, "Yellow": 0xFFD500, "Green": 0x3ED104, "Spring Green": 0xA2E340, "Blue": 0x1E8BF7, "Navy Blue": 0x000080, "Teal": 0x008080, "Purple": 0x8B07F7, "Pink": 0xF699CD, "Rose Pink": 0xFC94AF, "Orchid": 0xDA70D6, "Brown": 0x964B00, "Copper": 0xB87333, "Silver": 0xC0C0C0, "Gold": 0xD4AF37, "Shadow Black": 0x000000]
    
    //    init(){
    //        if UserDefaults.standard.bool(forKey: "signedIn"){
    //            let zodiac = UserDefaults.standard.string(forKey: "zodiac")!
    //            apiRequest(sign: zodiac, day: "yesterday")
    //            apiRequest(sign: zodiac, day: "today")
    //            apiRequest(sign: zodiac, day: "tomorrow")
    //        }
    //    }
    
    func signIn() {
        // UserDefaults.standard.set(true, forKey: "signedIn")
        signedIn = true
    }
    
    func signOut() {
        // UserDefaults.standard.set(false, forKey: "signedIn")
        UserDefaults.standard.set(nil, forKey: "zodiac")
        signedIn = false
        resultsList = [String: Horoscope]()
    }
    
    func setZodoac(zodiac: String) {
        self.zodiac = zodiac
        UserDefaults.standard.set(zodiac, forKey: "zodiac")
        apiRequest(sign: zodiac, day: "yesterday")
        apiRequest(sign: zodiac, day: "today")
        apiRequest(sign: zodiac, day: "tomorrow")
    }
    
    func saveHoroscope(horoscope: Horoscope) {
        savedList.append(horoscope)
        let localList = savedList
        if let encodedList = try? JSONEncoder().encode(localList) {
            UserDefaults.standard.set(encodedList, forKey: "savedList")
        }
    }
    
    func removeHoroscope(horoscope: Horoscope) {
        if let index = savedList.firstIndex(of: horoscope) {
            savedList.remove(at: index)
            let localList = savedList
            if let encodedList = try? JSONEncoder().encode(localList) {
                UserDefaults.standard.set(encodedList, forKey: "savedList")
            }
        }
    }
    
    func getListFromDefaults() {
        if let localList = UserDefaults.standard.object(forKey: "savedList") as? Data {
            if let decodedList = try? JSONDecoder().decode([Horoscope].self, from: localList) {
                savedList = decodedList
            }
        }
    }
    
    func apiRequest(sign: String, day: String) {
        guard let url = URL(string: "https://aztro.sameerkumar.website/?sign=\(sign)&day=\(day)") else { fatalError() }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard
                let data = data,
                let response = String(data: data, encoding: .utf8),
                error == nil
            else {
                print(error!)
                return
            }
            // print(response)
            do {
                let JSONData = response.data(using: .utf8)!
                let decoded = try JSONDecoder().decode(Result.self, from: JSONData)
                let decodedHoroscope = Horoscope(horoscope: decoded, zodiac: self.zodiac ?? "")
                self.resultsList.updateValue(decodedHoroscope, forKey: day)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
