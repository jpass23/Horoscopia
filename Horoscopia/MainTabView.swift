//
//  MainTabView.swift
//  Horoscopia
//
//  Created by Jaden Passero on 1/19/23.
//

import SwiftUI
enum Tab {
    case yesterday, today, tomorrow
}

struct MainTabView: View {
    @EnvironmentObject var model: Model
    @State var currentTab: Tab = .today
    @State var showAlert: Bool = false

    var body: some View {
        NavigationStack {
            if model.resultsList["today"] == nil{
                Text("Loading...")
            }else{
                TabView(selection: $currentTab) {
                    HoroscopeView(horoscope: model.resultsList["yesterday"]!).tag(Tab.yesterday)
                        .tabItem {
                            VStack {
                                Image(systemName: "clock.badge.checkmark")
                                Text("Yesterday")
                            }
                        }
                    HoroscopeView(horoscope: model.resultsList["today"]!).tag(Tab.today)
                        .tabItem {
                            VStack {
                                Image(systemName: "clock")
                                Text("Today")
                            }
                        }
                    HoroscopeView(horoscope: model.resultsList["tomorrow"]!).tag(Tab.tomorrow)
                        .tabItem {
                            VStack {
                                Image(systemName: "clock.badge.questionmark")
                                Text("Tomorrow")
                            }
                        }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showAlert.toggle()
                        } label: {
                            Text(model.zodiac ?? "No zodiac").font(.largeTitle).fontWeight(.bold).foregroundColor(.black)
                        }.alert("Switch Zodiac?", isPresented: $showAlert) {
                            Button("Yes") {
                                model.signOut()
                                model.zodiac = nil
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                    }
                    ToolbarItem {
                        NavigationLink {
                            SavedView()
                        } label: {
                            Image(systemName: "bookmark.square")
                        }
                    }
                }
            }
        }
    }
}

// struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
// }
