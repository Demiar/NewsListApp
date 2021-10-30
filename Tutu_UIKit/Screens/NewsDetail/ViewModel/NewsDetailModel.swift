//
//  NewsDetailModel.swift
//  Tutu_UIKit
//
//  Created by Алексей on 23.10.2021.
//

import Foundation
import UIKit

protocol NewsDetailModelProtocol: AnyObject {
    var title: String { get }
    var detailText: String { get }
    init(article: Article)
    func getImage(completion: @escaping (UIImage?) -> ())
}

class NewsDetailModel: NewsDetailModelProtocol {
    
    var title: String {
        article.title
    }
    
    var detailText: String {
        article.summary
    }
    
    private let article: Article
    private let imageCache = ImageCache()
    
    required init(article: Article) {
        self.article = article
    }
    
    func getImage(completion: @escaping (UIImage?) -> ()) {
        ImageManager.shared.getImage(from: article.imageUrl) { data in
            let image = UIImage(data: data)
            image?.jpegData(compressionQuality: 0.2)
            completion(image)
        }
    }
    
}
