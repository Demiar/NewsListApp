//
//  DataManager.swift
//  Tutu_UIKit
//
//  Created by Алексей on 20.10.2021.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private let sessionManager = SessionManager.shared.config
    private let imageCache = ImageCache()
    private init() {}
    
    func getImage(from url: String, completion: @escaping (Data) -> ()) {
        if let image = imageCache.image(for: URL(string: url)!) {
            completion(image.pngData()!)
        } else {
            let request = sessionManager.request(url)
            request.responseData(completionHandler: { response in
                guard let imageData = response.value else { return }
                  completion(imageData)
            })
        }

    }
}
