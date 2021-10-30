//
//  NewsListViewModel.swift
//  Tutu_UIKit
//
//  Created by Алексей on 21.10.2021.
//

import Foundation

protocol NewsListViewModelProtocol {
    var articles: [Article] { get }
    func getArticles(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> NewsListCellModelProtocol
}

class NewsListViewModel: NewsListViewModelProtocol {
    var articles: [Article] = []
    
    func getArticles(completion: @escaping () -> Void) {

        if articles.isEmpty{
            NetworkManager.shared.getArticles() { article in
                self.articles = article
                completion()
            }
        } else {
            NetworkManager.shared.getArticles() { article in
                if self.articles != article {
                    self.articles += article
                    completion()
                }

            }
        }

    }
    
    func numberOfRows() -> Int {
        articles.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> NewsListCellModelProtocol {
        let article = articles[indexPath.row]
        return NewsListCellModel(article: article)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> NewsDetailModelProtocol {
        let article = articles[indexPath.row]
        return NewsDetailModel(article: article)
    }
    
    
}
