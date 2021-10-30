//
//  TableViewCell.swift
//  Tutu_UIKit
//
//  Created by Алексей on 22.10.2021.
//

import UIKit

class NewsListCell: UITableViewCell {
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var articleId: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var viewModel: NewsListCellModelProtocol! {
        didSet {
            newsTitle.text = viewModel.title
            newsDate.text = viewModel.date
            articleId.text = viewModel.articleId
            viewModel.loadImage() { [self] data in
                activity.isHidden = true
                activity.stopAnimating()
                newsImage.image = data
            }
        }
    }

}
