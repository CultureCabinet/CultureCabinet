//
//  Category+CoreDataProperties.swift
//  CultureCabinet
//
//  Created by 권예진 on 2021/06/26.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var drama: NSDecimalNumber?
    @NSManaged public var exhibition: NSDecimalNumber?
    @NSManaged public var movie: NSDecimalNumber?
    @NSManaged public var play: NSDecimalNumber?
    @NSManaged public var sports: NSDecimalNumber?

}

extension Category : Identifiable {

}
