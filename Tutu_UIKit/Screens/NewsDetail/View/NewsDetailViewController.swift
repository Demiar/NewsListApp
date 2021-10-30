//
//  ViewController.swift
//  Tutu_UIKit
//
//  Created by Алексей on 20.10.2021.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: NewsDetailModelProtocol!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = viewModel.title
        summaryLabel.text = viewModel.detailText
        DispatchQueue.main.async {
            self.viewModel.getImage() { [self] image in
                activityIndicator.isHidden = true
                activityIndicator.stopAnimating()
                imageView.image = image
            }
        }
    }


}

