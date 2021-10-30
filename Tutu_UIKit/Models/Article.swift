//
//  Service.swift
//  Tutu_UIKit
//
//  Created by Алексей on 20.10.2021.
//

import Foundation

struct Article: Codable, Equatable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let title: String
    let url: String?
    let imageUrl: String
    let newsSite: String?
    let summary: String
    let publishedAt: String
    let updatedAt: String?
    let featured: Bool?
    let launches: [Launches]?
    let events: [Events]?
    
    struct Launches: Codable {
        let id: String
        let provider: String
    }

    struct Events: Codable {
        let id: Int
        let provider: String
    }
}


