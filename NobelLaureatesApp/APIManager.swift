//
//  APIManager.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 12.05.2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://api.nobelprize.org/2.1/laureates"
    
    public func getLaureates(completion: @escaping ([LaureateElement]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let laureatesData = try? JSONDecoder().decode(LaureateData.self, from: data) {
                DispatchQueue.main.async {
                    completion(laureatesData.laureates)
                }
            } else {
                print("error")
            }
        }
        session.resume()
    }
}
