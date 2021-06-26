//
//  ViewController.swift
//  CultureCabinet
//
//  Created by 권예진 on 2021/06/21.
//

import UIKit
import CoreData

class CreateController: UIViewController {
    var container:NSPersistentContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        let entity = NSEntityDescription.entity(forEntityName: "Post", in:self.container.viewContext)
        let post_thing = NSManagedObject(entity: entity!, insertInto: self.container.viewContext)
        post_thing.setValue("미나리 감상",forKey: "title")
        post_thing.setValue("2021-06-21",forKey: "date")
        post_thing.setValue(4.5,forKey: "score")
        post_thing.setValue("감동적이었다.",forKey: "content")
        //post_thing.setValue("/sample.png",forKey: "image")
        post_thing.setValue("https://www.notion.so/Coredata-1f5350c3351942e58d20e0e7ea426bd5",forKey: "link")
        post_thing.setValue(0,forKey: "category")
        do{
            try self.container.viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
        let entity1 = NSEntityDescription.entity(forEntityName: "User", in:self.container.viewContext)
        let user_thing = NSManagedObject(entity: entity1!, insertInto: self.container.viewContext)
        user_thing.setValue("test_user",forKey: "username")
        //user_thing.setValue("/sample.png",forKey: "image")
        user_thing.setValue(2,forKey: "level")
       
        do{
            try self.container.viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
        let entity2 = NSEntityDescription.entity(forEntityName: "Category", in:self.container.viewContext)
        let category_thing = NSManagedObject(entity: entity2!, insertInto: self.container.viewContext)
        category_thing.setValue(0,forKey: "movie")
        category_thing.setValue(1,forKey: "drama")
        category_thing.setValue(2,forKey: "play")
        category_thing.setValue(3,forKey: "sports")
        category_thing.setValue(4,forKey: "exhibition")
       
        do{
            try self.container.viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
     fetchContact()
    }

    func fetchContact(){
        do{
            let content = try self.container.viewContext.fetch(Post.fetchRequest())as! [Post]
            content.forEach{
                print($0.title)
            }
            let content1 = try self.container.viewContext.fetch(User.fetchRequest())as! [User]
            content1.forEach{
                print($0.username)
            }
            let content2 = try self.container.viewContext.fetch(Category.fetchRequest())as! [Category]
            content2.forEach{
                print($0.drama)
            }
            }catch{
                print(error.localizedDescription)
            }
        }
    
}

