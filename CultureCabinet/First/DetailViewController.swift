//
//  DetailViewController.swift
//  CultureCabinet
//
//  Created by 권예진 on 2021/07/10.
//


import UIKit
import Cosmos

class DetailViewController: UIViewController {
    //@IBOutlet weak var popUpView: UIView!
    //@IBOutlet weak var cellNumLabel: UILabel!
    
    let postHelper = PostHelper()
    let categoryHelper = CategoryHelper()
    var postList: [Post] = []
    @IBOutlet weak var star_detail: CosmosView!
    @IBOutlet weak var photo_detail: UIImageView!
    
    @IBOutlet weak var content_detail: UITextView!
    
  
    @IBOutlet weak var title_detail: UILabel!
    @IBOutlet weak var date_detail: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    var content: String?
    var date: String?
    var image: Data?
    var score: Float?
    var titles: String?
    var indexs: Int?
    var category: String!
    
    let dateformatter1 = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //popUpView.layer.cornerRadius = 10
        //cellNumLabel.text = cellNum
        print(content)
        dateFormat1Setting()
        
        photo_detail.image = UIImage(data: image ?? Data())
        title_detail.text = titles
        date_detail.text = date
        star_detail.rating = Double(score ?? 3)
        content_detail.text = content
    }
    
   
    func dateFormat1Setting(){
        dateformatter1.locale = Locale(identifier: "ko_KR")
        dateformatter1.timeZone = TimeZone(identifier: "KST")
        dateformatter1.dateFormat = "YYYY-MM-dd"
    }
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        postHelper.delete(row:indexs ?? 0)
//        let CategoryNameToString: [CategoryName:String] = [
//            .movie:"movie",
//            .drama:"drama",
//            .play:"play",
//            .sports:"sports",
//            .exhibition:"exhibition"
//        ]
        
       
        
        categoryHelper.delete(categoryName: category)
        
       
//        let alert = UIAlertController(title: "알림", message: "성공적으로 삭제했습니다.", preferredStyle: .alert)
//        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
//
//        alert.addAction(confirm)
//
//        present(alert, animated: false, completion: nil)
        dismiss(animated: false, completion: nil)
        
    }
}
