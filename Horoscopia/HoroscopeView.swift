//
//  HoroscopeView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import SwiftUI

struct HoroscopeView: View {
    @EnvironmentObject var model: Model
    @State var saved: Bool
    let horoscope: Horoscope

    init(saved: Bool = false, horoscope: Horoscope) {
        self.saved = saved
        self.horoscope = horoscope
    }

    var body: some View {
        ScrollView {
            ZStack {
                gradientRect
                VStack(spacing: 50) {
                    HStack(spacing: 20) {
                        Text(horoscope.horoscope.current_date).font(.title).fontWeight(.bold)
                        Spacer()
                        Button {
                            if saved {
                                model.removeHoroscope(horoscope: horoscope)
                                saved.toggle()
                            } else {
                                model.saveHoroscope(horoscope: horoscope)
                                saved.toggle()
                            }
                        } label: {
                            if saved {
                                Image(systemName: "bookmark.fill")
                            } else {
                                Image(systemName: "bookmark")
                            }
                        }
                    }
                    Section {
                        Text("Horoscope: ").fontWeight(.bold) + Text(horoscope.horoscope.description)
                        Text("Compatibility: ").fontWeight(.bold) + Text(horoscope.horoscope.compatibility)
                        Text("Mood: ").fontWeight(.bold) + Text(horoscope.horoscope.mood)
                        Text("Lucky Number: ").fontWeight(.bold) + Text(horoscope.horoscope.lucky_number)
                        Text("Lucky Time: ").fontWeight(.bold) + Text(horoscope.horoscope.lucky_time)
                        Text("Color: ").fontWeight(.bold) + Text(horoscope.horoscope.color)
                    }
                    Spacer()
                }.padding()
            } // ZStack
        } // Scrollview
    }

    var gradientRect: some View {
        Rectangle().frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(hex: model.colorList[horoscope.horoscope.color] ?? 0xFFFFFF)]), startPoint: .top, endPoint: .bottom))
    }
}

// struct HoroscopeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HoroscopeView()
//    }
// }
