//
//  NetworkService.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

final class NetworkService {
    static let shared = NetworkService()
    private let cache = NSCache<NSString, UIImage>()
    static let baseUrl = "https://vkus-sovet.ru/api"
    private let urlForCategory = baseUrl + "/getMenu.php"
    private let urlForItems = baseUrl + "/getSubMenu.php?menuID="
    
    private init() {
        
    }
    // Function to get Categories from API
    func sendPostRequest(completion: @escaping (ResponseData?) -> Void) {
        guard let url = URL(string: urlForCategory) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer YourAccessToken", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "key1": "value1",
            "key2": "value2"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Ошибка при создании тела запроса: \(error)")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Ошибка запроса: \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                    completion(responseData)
                } catch {
                    print("Ошибка при декодировании ответа: \(error)")
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
    // Function to get Image from URL
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
        
    }
    
    // Function to get Items of the selected category
    func sendPostRequestForMenu(forMenuId menuID: String, completion: @escaping(Result<RspnData, Error>) -> Void) {
        guard let url = URL(string: urlForItems + "\(menuID)") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Response data is nil", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(RspnData.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
