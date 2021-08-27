//
//  UserHelper.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/02.
//

import Foundation
import CoreData
import UIKit

class UserHelper {
    let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
    
    func fetchUserbyUsername(username: String)-> User {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", username)
        var user = User()
        do {
            user = try context.fetch(fetchRequest)[0] as! User
        } catch {
            print(error.localizedDescription)
        }
        return user
    }
    
    func fetchUser()-> [User] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        var user:[User] = []
        do {
            user = try context.fetch(fetchRequest) as! [User]
        } catch {
            print(error.localizedDescription)
        }
        return user
    }
    
    func insertUser(u: UserData){
        if let entity = self.entity {
            let user = NSManagedObject(entity: entity, insertInto: context)
            user.setValue(u.image, forKey: "image")
            user.setValue(u.level, forKey: "level")
            user.setValue(u.username, forKey: "username")

            do {
                try context.save()
                print("suc")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func updateUser(u: User){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        var user = User()
        do {
            user = try context.fetch(fetchRequest)[0] as! User
            user.setValue(u.image, forKey: "image")
            user.setValue(u.level, forKey: "level")
            user.setValue(u.username, forKey: "username")
            do {
                try context.save()
                print("suc update")
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAll(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(delete)
        } catch {
            print(error.localizedDescription)
        }
    }
}
