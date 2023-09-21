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
            Text("Cart")
                .tabItem {
                    Image(systemName: "bag")
                        .background(Color.background)
                }
            Text("Info")
                .tabItem {
                    Image(systemName: "info")
                        .background(Color.background)
                }
        }
        .accentColor(.yellow)
    }
}

#Preview {
    TabBarView()
}
