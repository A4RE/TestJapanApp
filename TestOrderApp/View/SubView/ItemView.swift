//
//  ItemView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

struct ItemView: View {
    @State var item: Item
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                // name
                Text(item.menuList.name)
                    .font(.system(.title3, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top)
                // Main ingridient
                Text(item.menuList.content)
                    .font(.system(.caption, weight: .medium))
                    .foregroundColor(Color.secondaryColor)
                    .multilineTextAlignment(.center)
                //price
                HStack {
                    Text("\(item.menuList.price) Р")
                        .font(.system(.headline, weight: .semibold))
                        .foregroundColor(.white)
                    Text("/ \(item.menuList.weight) г.")
                        .font(.system(.subheadline, weight: .regular))
                        .foregroundColor(Color.secondaryColor)
                    // if spicy
                    if item.menuList.spicy == "Y" {
                        Text("🌶️")
                    }
                }
                .padding(.top, 20)
                // image
                Image(item.menuList.image)
                    .resizable()
                    .aspectRatio(2, contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height / 6)
            }
            .padding(.horizontal, 5)
            .frame(width: UIScreen.main.bounds.width / 2.2)
            .background(Color.black)
            .cornerRadius(10)
            // button add to cart
            Button(action: {
                
            }, label: {
                Text("В корзину")
                    .foregroundColor(.white)
                    .font(.system(.title3, weight: .semibold))
                    .padding()
                    .background(Color.blueColor)
                    .cornerRadius(10)
            })
            .offset(y: -40)
        }
    }
}

#Preview {
    ItemView(item: MockDataItem.simpleItem)
}
