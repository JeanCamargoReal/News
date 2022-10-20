//
//  ViewController.swift
//  News
//
//  Created by Jean Camargo on 15/10/22.
//

import UIKit

class ViewController: UIViewController, NewsListLocalDataProviderProtocol {

    var localDataProvider: NewsListLocalDataProvider?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initLocalDataProvider()
    }

    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }

    func success(model: Any) {
        print("Model: \(model)")
    }
    
    func errorData(_ provider: GenericDataProvider?, error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
