//
//  NewsListViewController.swift
//  News
//
//  Created by Jean Camargo on 15/10/22.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var newsListTableView: UITableView!

    private var newsList: [NewsModel]? {
        didSet {
            self.newsListTableView.reloadData()
        }
    }

    var localDataProvider: NewsListLocalDataProvider?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTableView()
        self.initLocalDataProvider()
    }

    private func setUpTableView() {
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
    }

    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension NewsListViewController: NewsListLocalDataProviderProtocol {
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
    }
    
    func errorData(_ provider: GenericDataProvider?, error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
