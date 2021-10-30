//
//  DataManager.swift
//  Tutu_UIKit
//
//  Created by Алексей on 22.10.2021.
//

import Foundation

class DataManager {
    static var shared = DataManager()
    private init() {}
    
    private var userDefaults = UserDefaults.standard
    
    func saveArticlesCache(articles: [Article]) {
        do {
            try userDefaults.setObject(articles, forKey: "articles")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getArticlesCache() -> [Article]? {
        var result: [Article] = []
        do {
            result = try userDefaults.getObject(forKey: "articles", castTo: [Article].self)
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
    
    func resetDefaults() {
        let dictionary = userDefaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            userDefaults.removeObject(forKey: key)
        }
    }
}


