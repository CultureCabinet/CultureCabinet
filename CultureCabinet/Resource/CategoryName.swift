//
//  Category.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/06/23.
//

import Foundation

enum CategoryName {
    case movie
    case drama
    case play
    case sports
    case exhibition
}

let categoryMap: [CategoryName:String] = [
    .movie: "🎞",
    .drama: "🎬",
    .play: "🎭",
    .sports: "⚾️",
    .exhibition: "🖼"
]

let intToCategoryNameString: [Int:String] = [
    0:"movie",
    1:"drama",
    2:"play",
    3:"sports",
    4:"exhibition"
]

let intToCategoryName: [Int:CategoryName] = [
    0:.movie,
    1:.drama,
    2:.play,
    3:.sports,
    4:.exhibition
]

let CategoryNameToInt: [CategoryName:Int] = [
    .movie:0,
    .drama:1,
    .play:2,
    .sports:3,
    .exhibition:4
]

let CategoryNameToString: [CategoryName:String] = [
    .movie:"movie",
    .drama:"drama",
    .play:"play",
    .sports:"sports",
    .exhibition:"exhibition"
]
