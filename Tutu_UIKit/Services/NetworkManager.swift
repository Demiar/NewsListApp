//
//  NetworkManager.swift
//  Tutu_UIKit
//
//  Created by Алексей on 20.10.2021.
//

import Alamofire
import Foundation

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}

class NetworkManager {
    static var shared = NetworkManager()
    var startFrom = 0
    private let sessionManager = SessionManager.shared.config
    private let url = "https://api.spaceflightnewsapi.net/v3/articles"

    private init() {}
    
    func getArticles(completion : @escaping ([Article]) -> ()) {
        if Connectivity.isConnectedToInternet {
            let parameters: [String: String] = ["_limit": "15", "_start": String(startFrom)]
            let request = sessionManager.request(url, parameters: parameters)
            startFrom += 15
            request.responseDecodable(of: [Article].self) { (response) in
              guard let articles = response.value else { return }
                DataManager.shared.saveArticlesCache(articles: articles)
                completion(articles)
            }
        } else {
            guard let articles = DataManager.shared.getArticlesCache() else { return }
            completion(articles)
        }

    }
}
