//
//  Post+CoreDataProperties.swift
//  CultureCabinet
//
//  Created by 권예진 on 2021/06/26.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var category: NSDecimalNumber?
    @NSManaged public var content: String?
    @NSManaged public var date: String?
    @NSManaged public var image: Data?
    @NSManaged public var link: String?
    @NSManaged public var score: Float
    @NSManaged public var title: String?

}

extension Post : Identifiable {

}
