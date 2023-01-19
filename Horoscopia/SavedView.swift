//
//  SavedView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        List {
            Text("Horoscope 1")
        }.navigationTitle("Saved Horoscopes")
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
