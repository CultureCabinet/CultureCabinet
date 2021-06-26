//
//  User+CoreDataProperties.swift
//  CultureCabinet
//
//  Created by 권예진 on 2021/06/26.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var image: Data?
    @NSManaged public var level: NSDecimalNumber?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
