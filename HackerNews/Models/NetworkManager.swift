//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Evgeniy Uskov on 28.10.2019.
//  Copyright © 2019 Evgeniy Uskov. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    let URL_FRONT_PAGE_NEWS = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: URL_FRONT_PAGE_NEWS) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
