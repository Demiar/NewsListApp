//
//  NewsListCellModel.swift
//  Tutu_UIKit
//
//  Created by Алексей on 22.10.2021.
//

import Foundation
import UIKit

protocol NewsListCellModelProtocol: AnyObject {
    var title: String { get }
    var date: String { get }
    var articleId: String { get }
    var imageData: Data? { get set }
    var urlImage: URL { get }
    init(article: Article)
    func loadImage(completion: @escaping (UIImage?) -> ())
}

class NewsListCellModel: NewsListCellModelProtocol {
        
    var title: String {
        article.title
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: article.publishedAt) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let convertedDate = dateFormatter.string(from: date)
            return convertedDate
        }
        return ""
    }
    
    var articleId: String {
        "\(article.id)"
    }
    
    var imageData: Data?
    
    var urlImage: URL {
        URL(string: article.imageUrl)!
    }
    
    private var article: Article
    private var imageCache = ImageCache()

    required init(article: Article) {
        self.article = article
    }
    
    
    func loadImage(completion: @escaping (UIImage?) -> ()) {
        if let image = imageCache.image(for: urlImage){
            image.jpegData(compressionQuality: 0.2)
            completion(image)
        } else {
            ImageManager.shared.getImage(from: article.imageUrl) { data in
                self.imageCache.insertImage(UIImage(data: data), for: self.urlImage)
                let image = UIImage(data: data)
                image?.jpegData(compressionQuality: 0.2)
                completion(image)
            }
        }
    }
    
}
