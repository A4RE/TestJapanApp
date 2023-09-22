//
//  CategoryModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

struct MenuItem: Codable {
    let menuID: String
    let image: String
    let name: String
    let subMenuCount: Int
}

struct ResponseData: Codable {
    let status: Bool
    let menuList: [MenuItem]
}
