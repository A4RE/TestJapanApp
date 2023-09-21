//
//  ContentView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    // Categories View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(MockData.categories, id: \.self) { category in
                                CategoryItemView(category: category)
                            }
                        }
                    }
                    .padding(.top, 20)
                    // Choose categorie name
                    Text("Суши")
                        .font(.system(.title, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    // View of Items in category
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(MockDataItem.items, id: \.self) { item in
                                ItemView(item: item)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(.white)
                            .overlay(alignment: .center) {
                                Image(systemName: "globe.americas.fill")
                                    .foregroundColor(.red)
                                    .background(.black)
                                    .cornerRadius(12)
                                    .scaleEffect(1.4)
                            }
                        Text("vkussovet".uppercased())
                            .font(.system(.title2, weight: .bold))
                            .foregroundColor(.white)

                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "phone")
                        .font(.system(.title3, weight: .bold))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
