//
//  MainPageViewController.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/06/16.
//

import UIKit
import Foundation
class MainPageViewController: UIViewController {
    let storyboardName = "MainPage"
    let storyboardID = "MainPage"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var movieBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var dramaBtn: UIButton!
    @IBOutlet weak var sportsBtn: UIButton!
    @IBOutlet weak var exhibitionBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts: [PostData] = []
    let dateformatter1 = DateFormatter()
    let dateformatter2 = DateFormatter()
    let today = Date()
    let postHelper = PostHelper()
    let categoryHelper = CategoryHelper()
    var postList: [Post] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormat1Setting()
        dataFormat2Setting()
        
        if(categoryHelper.fetchCategory().isEmpty){
            categoryHelper.insertCategoryData()
        }
        postList = postHelper.fetchAllPost()
        posts = postToPostData(postss:postList)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postList = postHelper.fetchAllPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    func dateFormat1Setting(){
        dateformatter1.locale = Locale(identifier: "ko_KR")
        dateformatter1.timeZone = TimeZone(identifier: "KST")
        dateformatter1.dateFormat = "YYYY.MM.dd E"
    }
    
    func dataFormat2Setting(){
        dateformatter2.locale = Locale(identifier: "ko_KR")
        dateformatter2.timeZone = TimeZone(identifier: "KST")
        dateformatter2.dateFormat = "YYYY-MM-dd"
    }
    
        
    //MARK: - button 처리
    @IBAction func all(_ sender: Any) {
        //button UI
        //db에서 모두 불러오기 async
        postList = postHelper.fetchAllPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    @IBAction func movie(_ sender: Any) {
        //db에서 영화 불러오기 async
        postList = postHelper.fetchMoviePost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    
    @IBAction func drama(_ sender: Any) {
        //db에서 드라마 불러오기 async
        postList = postHelper.fetchDramaPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    
    @IBAction func play(_ sender: Any) {
        //db에서 연극 불러오기 async
        postList = postHelper.fetchPlayPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    @IBAction func sports(_ sender: Any) {
        //db에서 스포츠 불러오기 async
        postList = postHelper.fetchSportsPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    @IBAction func exhibition(_ sender: Any) {
        //db에서 전시 불러오기 async
        postList = postHelper.fetchExhibitionPost()
        posts = postToPostData(postss:postList)
        collectionView.reloadData()
    }
    
    func postToPostData(postss: [Post]) -> [PostData]{
        var postDataList: [PostData] = []
        for post in postss {
            let pd = PostData(title: post.title!, date: post.date!, score: post.score, category: intToCategoryName[post.category as! Int]!)
            if post.image != nil {
                pd.image = post.image
            }
            if post.link != nil {
                pd.link = post.link
            }
            if post.content != nil {
                pd.content = post.content
            }
            postDataList.append(pd)
        }
        return postDataList
    }
}


//MARK: -- collection view extension
extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "post_cell", for: indexPath) as? PostCell else {
            return UICollectionViewCell()
        }
        cell.categoryLabel.text = categoryMap[posts[indexPath.item].category]
        cell.imgView.image = UIImage(data: posts[indexPath.item].image ?? Data())
        cell.titleLabel.text = posts[indexPath.item].title
        cell.dateLabel.text = posts[indexPath.item].date
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
}

extension MainPageViewController: UICollectionViewDelegate {
    //상세화면으로 이동
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt: IndexPath){
        guard let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.image = posts[didSelectItemAt.item].image
        vc.titles = posts[didSelectItemAt.item].title
        vc.date = posts[didSelectItemAt.item].date
        vc.score = posts[didSelectItemAt.item].score
        vc.content = posts[didSelectItemAt.item].content
        vc.indexs = didSelectItemAt.item
        vc.category = CategoryNameToString[posts[didSelectItemAt.item].category]!
        vc.modalPresentationStyle = .automatic
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
    

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                              layout collectionViewLayout: UICollectionViewLayout,
                              sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ( collectionView.bounds.width - 30 ) / 2
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return inset
    }
    
}

//Cell class
class PostCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
}
