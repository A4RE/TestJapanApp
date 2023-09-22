//
//  ItemModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

struct MenuListItem: Codable {
    let id: String
    let image: String
    let name: String
    let content: String
    let price: String
    let weight: String
    let spicy: String?
}

struct RspnData: Codable {
    let status: Bool
    let menuList: [MenuListItem]
}

