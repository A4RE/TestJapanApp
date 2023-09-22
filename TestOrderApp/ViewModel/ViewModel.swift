//
//  CategoryViewModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = []
    @Published var selectedCategoryIndex: Int = 0
    @Published var selectedMenuID: String?
    @Published var categoryItems: [MenuListItem] = []
    
    // Add recieved data to array of categories
    func fetchData() {
        NetworkService.shared.sendPostRequest { response in
            DispatchQueue.main.async {
                if let response = response {
                    self.menuItems = response.menuList
                }
            }
        }
    }
}
