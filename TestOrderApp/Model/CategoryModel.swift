//
//  CategoryModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

struct Category: Hashable {
    let status: Bool
    let menuList: Menu
}

struct Menu: Hashable {
    let menuID: String
    let image: String
    let name: String
    let subMenuCount: String
}

struct MockData {
    
    static let simpleCategoryItem = Category(status: true,
                                             menuList: Menu(menuID: "1", image: "example", name: "Сэты", subMenuCount: "5"))
    
    static let categories = [simpleCategoryItem, simpleCategoryItem, simpleCategoryItem]
    
}
