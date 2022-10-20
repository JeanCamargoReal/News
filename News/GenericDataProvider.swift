//
//  GenericDataProvider.swift
//  News
//
//  Created by Jean Camargo on 16/10/22.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provider: GenericDataProvider?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
 
