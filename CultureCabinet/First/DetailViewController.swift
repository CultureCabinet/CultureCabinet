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
    
 
    @IBOutlet weak var star_detail: CosmosView!
    @IBOutlet weak var photo_detail: UIImageView!
    
    @IBOutlet weak var content_detail: UITextView!
    
    @IBOutlet weak var date_detail: UILabel!
    
    var content: String?
    var date: Date?
    var image: Data?
    var score: Float?
    var titles: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //popUpView.layer.cornerRadius = 10
        //cellNumLabel.text = cellNum
        
        photo_detail.image = UIImage(data: image ?? Data())
        date_detail.text = dateFormatter.string(from: date!)
        star_detail.rating = Double(score ?? 3)
        content_detail.text = content
        
    }
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
