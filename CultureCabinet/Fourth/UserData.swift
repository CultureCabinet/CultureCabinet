//
//  UserData.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/02.
//

import Foundation

class UserData {
    let image: Data
    var level: Int
    let username: String
    
    init(image: Data, level: Int, username: String) {
        self.image = image
        self.level = level
        self.username = username
    }
}
