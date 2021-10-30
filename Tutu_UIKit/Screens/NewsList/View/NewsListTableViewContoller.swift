//
//  TableViewController.swift
//  Tutu_UIKit
//
//  Created by Алексей on 20.10.2021.
//

import UIKit

class NewsListTableViewContoller: UITableViewController {
    private var viewModel: NewsListViewModel! {
        didSet {
            viewModel.getArticles { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsListViewModel()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsListCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = viewModel.numberOfRows() - 1
        if indexPath.row == lastElement {
            viewModel.getArticles { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewModel = viewModel.detailsViewModel(at: indexPath)
        performSegue(withIdentifier: "showDetail", sender: detailsViewModel)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewsDetailViewController else { return }
        destination.viewModel = sender as? NewsDetailModelProtocol
    }
}
