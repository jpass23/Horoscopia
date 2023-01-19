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
    @State var currentTab: Tab = Tab.today
    
    var body: some View {
        NavigationStack {
            TabView(selection: $currentTab){
                HoroscopeView(day: "yesterday").tag(Tab.yesterday)
                    .tabItem {
                        VStack{
                            Image(systemName: "clock.badge.checkmark")
                            Text("Yesterday")
                        }
                    }
                HoroscopeView(day: "today").tag(Tab.today)
                    .tabItem {
                        VStack{
                            Image(systemName: "clock")
                            Text("Today")
                        }
                    }
                HoroscopeView(day: "tomorrow").tag(Tab.tomorrow)
                    .tabItem {
                        VStack{
                            Image(systemName: "clock.badge.questionmark")
                            Text("Tomorrow")
                        }
                    }
            }.navigationTitle("Hey")
                .toolbar{
                    NavigationLink{
                        SavedView()
                    }label: {
                        Image(systemName: "bookmark.square")
                    }
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
