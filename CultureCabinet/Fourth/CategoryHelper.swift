//
//  CategoryHelper.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/03.
//

import Foundation
import CoreData
import UIKit

class CategoryHelper {
    let entity = NSEntityDescription.entity(forEntityName: "Category", in: context)
    
    func insertCategoryData(){
        if let entity = self.entity {
            let category = NSManagedObject(entity: entity, insertInto: context)
            category.setValue(1, forKey: "drama")
            category.setValue(1, forKey: "movie")
            category.setValue(0, forKey: "play")
            category.setValue(0, forKey: "sports")
            category.setValue(0, forKey: "exhibition")
            do {
                try context.save()
                print("suc_ca")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCategory() -> Category {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        var categoryCnt = Category()
        do {
            categoryCnt = try context.fetch(fetchRequest)[0] as! Category
        } catch {
            print(error.localizedDescription)
        }
        return categoryCnt
    }
    
}
