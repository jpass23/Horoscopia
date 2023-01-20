//
//  Model.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import Foundation

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
    
    @Published var signedIn = false //UserDefaults.standard.bool(forKey: "signedIn")
    @Published var zodiac = UserDefaults.standard.string(forKey: "zodiac")
    var savedList = [Result]()
    var resultsList = [String: Result]()
    
    init(){
        if UserDefaults.standard.bool(forKey: "signedIn"){
            let zodiac = UserDefaults.standard.string(forKey: "zodiac")!
            apiRequest(sign: zodiac, day: "yesterday")
            apiRequest(sign: zodiac, day: "today")
            apiRequest(sign: zodiac, day: "tomorrow")
        }
    }
    
    func signIn(){
        UserDefaults.standard.set(true, forKey: "signedIn")
        signedIn = true
    }
    
    func signOut(){
        UserDefaults.standard.set(false, forKey: "signedIn")
        signedIn = false
        resultsList = [String: Result]()
    }
    
    func setZodoac(zodiac: String){
        self.zodiac = zodiac
        UserDefaults.standard.set(zodiac, forKey: "zodiac")
        apiRequest(sign: zodiac, day: "yesterday")
        apiRequest(sign: zodiac, day: "today")
        apiRequest(sign: zodiac, day: "tomorrow")
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

            print(response)

            do {
                let JSONData = response.data(using: .utf8)!
                let decoded = try JSONDecoder().decode(Result.self, from: JSONData)
                self.resultsList.updateValue(decoded, forKey: day)
            } catch {
                print(error)
            }

            //print(self.results[0].color)
        }

        task.resume()
    }
}
