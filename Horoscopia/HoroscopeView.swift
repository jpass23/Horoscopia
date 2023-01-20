//
//  HoroscopeView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import SwiftUI

struct HoroscopeView: View {
    @EnvironmentObject var model: Model
    //@StateObject var vm = HoroscopeViewModel()
    @State var saved = false
    //let day: String
    let horoscope: Result
    
    var body: some View {
        ScrollView{
            ZStack{
                Rectangle().frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight*2).foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .top, endPoint: .bottom))
                VStack(spacing: 50){
                    HStack(spacing: 20){
                        Text(horoscope.current_date).font(.title).fontWeight(.bold)
                        Spacer()
                        Button{
                            saved.toggle()
                        }label: {
                            if saved {
                                Image(systemName: "bookmark.fill")
                            }else{
                                Image(systemName: "bookmark")
                            }
                        }
                    }
                    Group{
                        Image(systemName: "moon.stars.fill").resizable().frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Horoscope: ").fontWeight(.bold) + Text(horoscope.description)
                        Image(systemName: "figure.2.arms.open").resizable().frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Compatibility: ").fontWeight(.bold) + Text(horoscope.compatibility)
                        Image(systemName: "face.smiling.inverse").resizable().frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Mood: ").fontWeight(.bold) + Text(horoscope.mood)
                        Image(systemName: "number.square.fill").resizable().frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Lucky Number: ").fontWeight(.bold) + Text(horoscope.lucky_number)
                        Image(systemName: "clock.fill").resizable().frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Lucky Time: ").fontWeight(.bold) + Text(horoscope.lucky_time)
                    }
                Spacer()
                }.padding()
            }
        }
    }
}
//    func loadData() {
//
//        vm.apiRequest(sign: model.zodiac!, day: day)
//
//    }


//struct HoroscopeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HoroscopeView()
//    }
//}
