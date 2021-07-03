//
//  PostData.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/06/23.
//

import Foundation

class PostData {
    let title: String
    let date: Date
    let score: Float
    var content: String?
    var image: Data?
    var link: String?
    let category: CategoryName
    
    init(title: String, date: Date, score: Float, content: String, image:Data, link: String, category: CategoryName) {
        self.title = title
        self.date = date
        self.score = score
        self.content = content
        self.image = image
        self.link = link
        self.category = category
    }
    
    init(title: String, date: Date, score: Float, category: CategoryName) {
        self.title = title
        self.date = date
        self.score = score
        self.category = category
    }
}
