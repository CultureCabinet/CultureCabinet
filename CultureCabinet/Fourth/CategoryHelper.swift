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
