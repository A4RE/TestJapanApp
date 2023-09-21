//
//  ItemModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

struct Item: Hashable {
    let status: Bool
    let menuList: MenuList
}

struct MenuList: Hashable {
    let id: String
    let image: String
    let name: String
    let content: String
    let price: String
    let weight: String
    let spicy: String
}

struct MockDataItem {
    
    static let simpleItem = Item(status: true, menuList: MenuList(id: "1", image: "example2", name: "Магура спайси", content: "Тунец, соус спайси", price: "100", weight: "50", spicy: "Y"))
    
    static let simpleItem2 = Item(status: true, menuList: MenuList(id: "2", image: "example2", name: "Магура", content: "Тунец", price: "80", weight: "40", spicy: "N"))
    
    static let simpleItem3 = Item(status: true, menuList: MenuList(id: "3", image: "example2", name: "Магура спайси", content: "Тунец, соус спайси", price: "100", weight: "50", spicy: "Y"))
    
    static let simpleItem4 = Item(status: true, menuList: MenuList(id: "4", image: "example2", name: "Магура", content: "Тунец", price: "80", weight: "40", spicy: "N"))
    
    static let items = [simpleItem, simpleItem2, simpleItem3, simpleItem4]
    
}
