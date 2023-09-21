//
//  CategoryItemView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

struct CategoryItemView: View {
    @State var category: Category
    var body: some View {
        VStack (spacing: 10) {
            // image
            Image(category.menuList.image)
                .resizable()
                .scaledToFill()
            // name
            Text(category.menuList.name)
                .font(.system(.headline, weight: .semibold))
            // count of elements
            Text("\(category.menuList.subMenuCount) товаров")
                .foregroundColor(Color.secondaryColor)
                .padding(.bottom)
        }
        .foregroundColor(.white)
        //frame for background
        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 6)
        .background(Color.grayColor)
        .cornerRadius(10)
    }
}

#Preview {
    CategoryItemView(category: MockData.simpleCategoryItem)
}
