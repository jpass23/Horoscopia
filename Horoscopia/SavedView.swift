//
//  SavedView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        List {
            ForEach(model.savedList, id: \.self) { horoscope in
                NavigationLink {
                    HoroscopeView(saved: true, horoscope: horoscope)
                } label: {
                    Text(horoscope.zodiac).fontWeight(.bold) + Text(": ") + Text(horoscope.horoscope.current_date)
                }
            }
        }.navigationTitle("Saved Horoscopes")
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
