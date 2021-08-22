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
            category.setValue(0, forKey: "drama")
            category.setValue(0, forKey: "movie")
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
    
    //210818 추가
    func insert(categoryName: String){
//        let categoryName = intToCategoryNameString[category]
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        var categoryCnt = Category()
        do {
            categoryCnt = try context.fetch(fetchRequest)[0] as! Category
            let updateData = try context.fetch(fetchRequest)[0] as! NSManagedObject
            if(categoryName == "drama"){
                updateData.setValue(categoryCnt.drama as! Int + 1, forKey: "drama")
            }else if(categoryName == "movie"){
                updateData.setValue(categoryCnt.movie as! Int + 1, forKey: "movie")
            }else if(categoryName == "play"){
                updateData.setValue(categoryCnt.play as! Int + 1, forKey: "play")
            }else if(categoryName == "sports"){
                updateData.setValue(categoryCnt.sports as! Int + 1, forKey: "sports")
            }else if(categoryName == "exhibition"){
                updateData.setValue(categoryCnt.exhibition as! Int + 1, forKey: "exhibition")
            }
            do{
                try context.save()
            }catch{
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    //
    func delete(categoryName: String){
//        let categoryName = intToCategoryNameString[category]
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        var categoryCnt = Category()
        do {
            categoryCnt = try context.fetch(fetchRequest)[0] as! Category
            let updateData = try context.fetch(fetchRequest)[0] as! NSManagedObject
            if(categoryName == "drama"){
                updateData.setValue(categoryCnt.drama as! Int - 1, forKey: "drama")
            }else if(categoryName == "movie"){
                updateData.setValue(categoryCnt.movie as! Int - 1, forKey: "movie")
            }else if(categoryName == "play"){
                updateData.setValue(categoryCnt.play as! Int - 1, forKey: "play")
            }else if(categoryName == "sports"){
                updateData.setValue(categoryCnt.sports as! Int - 1, forKey: "sports")
            }else if(categoryName == "exhibition"){
                updateData.setValue(categoryCnt.exhibition as! Int - 1, forKey: "exhibition")
            }
            do{
                try context.save()
            }catch{
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
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
