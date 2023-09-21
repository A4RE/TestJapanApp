//
//  NetworkService.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService(); private init() {}
    
    static let baseURL = "https://vkus-sovet.ru/api/getMenu.php"
    
}
