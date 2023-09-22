//
//  TabBarView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI




struct TabBarView: View {
    
    let tabBar = UITabBar.appearance()

    init() {
        tabBar.unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                }
            InfoView()
                .tabItem {
                    Image(systemName: "info")
                }
        }
        .accentColor(.yellow)
    }
}

#Preview {
    TabBarView()
}
