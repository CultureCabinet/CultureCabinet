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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //popUpView.layer.cornerRadius = 10
        //cellNumLabel.text = cellNum
        print(content)
        photo_detail.image = UIImage(data: image ?? Data())
        title_detail.text = titles
        date_detail.text = date
        star_detail.rating = Double(score ?? 3)
        content_detail.text = content
    }
    
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        postHelper.delete(row:indexs ?? 0)
//        let alert = UIAlertController(title: "알림", message: "성공적으로 삭제했습니다.", preferredStyle: .alert)
//        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
//
//        alert.addAction(confirm)
//
//        present(alert, animated: false, completion: nil)
        dismiss(animated: false, completion: nil)
        
    }
}
