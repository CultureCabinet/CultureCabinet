//
//  Category.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/06/23.
//

import Foundation

enum Category {
    case movie
    case drama
    case play
    case sports
    case exhibition
}

let categoryMap: [Category:String] = [
    .movie: "🎞",
    .drama: "🎬",
    .play: "🎭",
    .sports: "⚾️",
    .exhibition: "🖼"
]
