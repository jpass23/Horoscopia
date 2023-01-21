//
//  IntroView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/18/23.
//

import SwiftUI

struct ZodiacPickerView: View {
    @EnvironmentObject var model: Model
    @State var zodiac = String()
    @State var showAlert = false

    let zodiacList = ["No Zodiac", "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    var body: some View {
        VStack {
            Spacer()
            Text("Horoscopia").font(.largeTitle).fontWeight(.bold)
            Spacer()
            Text("Select your zodiac sign:").font(.title)

            Picker("ZodiacPicker", selection: $zodiac) {
                ForEach(zodiacList, id: \.self) { zodiac in
                    Text(zodiac).tag(zodiac)
                }
            }.pickerStyle(.menu)

            Spacer()

            Button {
                if model.zodiac == nil {
                    showAlert.toggle()
                } else {
                    model.signIn()
                }
            } label: {
                buttonView
            }.alert("Please choose a zodiac sign", isPresented: $showAlert) {
                Button("Cancel", role: .cancel) {}
            }.onChange(of: zodiac) { _ in
                model.setZodoac(zodiac: zodiac)
            }
            Spacer()
        }
        .padding()
        .toolbar{
            ToolbarItem{
                NavigationLink {
                    SavedView()
                } label: {
                    Image(systemName: "bookmark.square")
                }
            }
        }
    }

    var buttonView: some View {
        ZStack {
            Rectangle().frame(width: 200, height: 80).cornerRadius(8)
            Text("Continue").font(.title).foregroundColor(.white)
        }
    }
}

struct ZodiacPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZodiacPickerView()
    }
}
