//
//  ContentView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZodiacPickerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
