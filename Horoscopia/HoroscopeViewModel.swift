//
//  HoroscopeViewModel.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

//import Foundation
//
//struct Result: Codable, Hashable {
//    let current_date: String
//    let description: String
//    let compatibility: String
//    let mood: String
//    let color: String
//    let lucky_number: String
//    let lucky_time: String
//}
//
//class HoroscopeViewModel: ObservableObject {
//    @Published var results = [Result]()
//
//    func apiRequest(sign: String, day: String) {
//        guard let url = URL(string: "https://aztro.sameerkumar.website/?sign=\(sign)&day=\(day)") else { fatalError() }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard
//                let data = data,
//                let response = String(data: data, encoding: .utf8),
//                error == nil
//            else {
//                print(error!)
//                return
//            }
//
//            print(response)
//
//            do {
//                let JSONData = response.data(using: .utf8)!
//                let decoded = try JSONDecoder().decode(Result.self, from: JSONData)
//                self.results.append(decoded)
//            } catch {
//                print(error)
//            }
//
//            print(self.results[0].color)
//        }
//
//        task.resume()
//    }
//}
