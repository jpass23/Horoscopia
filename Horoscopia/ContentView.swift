//
//  ContentView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = Model()
    
    var body: some View {
        NavigationStack {
            if model.signedIn {
                MainTabView()
            }else{
                ZodiacPickerView()
            }
        }.environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
