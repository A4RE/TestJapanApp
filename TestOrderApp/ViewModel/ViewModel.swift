//
//  CategoryViewModel.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = []
    @Published var selectedCategoryIndex: Int = 0
    @Published var selectedMenuID: String = "21"
    @Published var categoryItems: [MenuListItem] = []
    @Published var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
    // Request to take items of selected category and add them into array
    func fetchItems() {
        
        NetworkService.shared.sendPostRequestForMenu(forMenuId: selectedMenuID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseData):
                    self?.categoryItems = responseData.menuList
                case .failure(let error):
                    print("Error while fetching data: \(error)")
                }
            }
        }
    }
}
