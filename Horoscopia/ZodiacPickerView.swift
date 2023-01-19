//
//  IntroView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/18/23.
//

import SwiftUI

struct ZodiacPickerView: View {
    @State var zodiac = String()
    @State var birthday = Date()
    let zodiacList = ["Ares","Taurus","Gemini","Cancer","Leo","Virgo", "Libra", "Scorpio","Sagittarius","Capricorn","Aquarius","Pisces"]
    var body: some View {
        VStack {
            Spacer()
            Text("Horoscopia").font(.largeTitle).fontWeight(.bold)
            Spacer()
            Text("Select your zodiac sign:").font(.title)

            Picker("ZodiacPicker", selection: $zodiac) {
                ForEach(zodiacList, id: \.self){zodiac in
                    Text(zodiac).tag(zodiac)
                }
            }.pickerStyle(.menu)
            
            Spacer()
            HStack{
                DatePicker("Enter your birthday: ", selection: $birthday, displayedComponents: .date)
            }
            Spacer()
        }
        .padding()
        
    }
}

struct ZodiacPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZodiacPickerView()
    }
}
