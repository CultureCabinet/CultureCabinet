//
//  UserData.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/02.
//

import Foundation

class UserData {
    let image: Data
    let lavel: Int
    let username: String
    
    init(image: Data, level: Int, username: String) {
        self.image = image
        self.lavel = level
        self.username = username
    }
}
