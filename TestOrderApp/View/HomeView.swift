//
//  ContentView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // Background Color of View
                Color.myBackgroundColor.edgesIgnoringSafeArea(.all)
                
                // Content View
                contentView
            }
            .onAppear {
                viewModel.fetchData()
                viewModel.fetchItems()
            }
        }
    }
    // Title
    var title: some View {
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
    // Top Bar
    var topBar: some View {
        HStack {
            title
            Spacer()
            Image(systemName: "phone")
                .font(.system(.title3, weight: .bold))
                .foregroundColor(.white)
            
        }
    }
    // Scroll View of Categories
    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.menuItems.indices, id: \.self) { index in
                    let menuItem = viewModel.menuItems[index]
                    VStack(spacing: 10) {
                        RemoteImageView(urlString: menuItem.image)
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 9)
                        Text(menuItem.name)
                            .font(.system(.headline, weight: .semibold))
                        Text("\(menuItem.subMenuCount) товаров")
                            .foregroundColor(Color.mySecondaryColor)
                            .padding(.bottom)
                            .font(.system(.headline))
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 5.5)
                    .background(viewModel.selectedCategoryIndex == index ? Color.myBlueColor : Color.myGrayColor)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.linear) {
                            viewModel.selectedCategoryIndex = index
                            viewModel.selectedMenuID = viewModel.menuItems[viewModel.selectedCategoryIndex].menuID
                            viewModel.fetchItems()
                        }
                    }
                }
            }
        }
    }
    // Scroll View of Items of the selected category
    var itemsGridView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: viewModel.columns, alignment: .leading, spacing: 10) {
                ForEach(viewModel.categoryItems, id: \.id) { item in
                    VStack {
                        VStack {
                            Text(item.name)
                                .font(.system(.headline, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 8)
                            
                            Text(item.content)
                                .font(.system(.caption, weight: .medium))
                                .foregroundColor(Color.mySecondaryColor)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 3)
                                .padding(.top, 3)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(item.price.formatPrice())")
                                    .font(.system(.headline, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text("/ \(item.weight)")
                                    .font(.system(.subheadline, weight: .regular))
                                    .foregroundColor(Color.mySecondaryColor)
                                
                                if item.spicy == "Y" {
                                    Text("🌶️")
                                }
                            }
                            
                            RemoteImageView(urlString: item.image)
                                .scaledToFill()
                                .frame(height: UIScreen.main.bounds.height / 7)
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 2.3, height: UIScreen.main.bounds.height / 3.5)
                        .background(Color.black)
                        .cornerRadius(15)
                        Button {
                            print("Add to cart")
                        } label: {
                            Text("В корзину")
                                .foregroundColor(.white)
                                .font(.system(.headline, weight: .regular))
                                .padding(.vertical, 12)
                                .padding(.horizontal, 20)
                                .background(Color.myBlueColor)
                                .cornerRadius(10)
                        }
                        .offset(y: -30)
                    }
                }
            }
        }
    }
    // Content View
    var contentView: some View {
        VStack(alignment: .leading) {
            
            // Top Bar
            topBar
            
            // Categories View
            categoriesView
            .padding(.top, 20)
            
            Text(viewModel.menuItems.indices.contains(viewModel.selectedCategoryIndex) ? viewModel.menuItems[viewModel.selectedCategoryIndex].name : "")
                .font(.system(.title, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 20)
            // Grid View of Items in selected category
            itemsGridView
            
        }
        .padding(.horizontal, 10)
    }

}

