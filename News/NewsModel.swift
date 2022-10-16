//
//  NewsModel.swift
//  News
//
//  Created by Jean Camargo on 16/10/22.
//

import Foundation

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlImage: String
    var publishedAt: Date
    var content: String?
}
