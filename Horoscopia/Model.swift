//
//  Model.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import Foundation


class Model: ObservableObject {
    
    @Published var signedIn = UserDefaults.standard.bool(forKey: "signedIn")
    @Published var zodiac = UserDefaults.standard.string(forKey: "zodiac")
    
    func signIn(){
        UserDefaults.standard.set(true, forKey: "signedIn")
        signedIn = true
    }
    
    func signOut(){
        UserDefaults.standard.set(false, forKey: "signedIn")
        signedIn = false
    }
    
    func setZodoac(zodiac: String){
        self.zodiac = zodiac
        UserDefaults.standard.set(zodiac, forKey: "zodiac")
    }
}
