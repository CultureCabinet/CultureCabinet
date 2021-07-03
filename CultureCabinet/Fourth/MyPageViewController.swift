//
//  MyPageViewController.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/02.
//

import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var scoreBoardView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var monthlyCollection: UICollectionView!
    
    let userHelper = UserHelper()
    let postHelper = PostHelper()
    let categoryHelper = CategoryHelper()
    var user = User()
    var posts:[Post] = []
    var categoryCnts:[CategoryName:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///DATA SET
//        userHelper.deleteAll()
//        let user1 = UserData(image: (UIImage(named: "1")?.jpegData(compressionQuality: 1))!, level: 0, username: "sujeong")
//        user1.level = Decimal(string: "1") as NSDecimalNumber?
//        userHelper.insertUser(u: user1)
        categoryCnts = setListCnt(category: categoryHelper.fetchCategory())

    }
    
    override func viewDidAppear(_ animated: Bool) {
        categoryCnts = setListCnt(category: categoryHelper.fetchCategory())
        ///UI
        user = userHelper.fetchUser()
        
        profileImage.image = UIImage(data: user.image!)
        profileImage.layer.cornerRadius = 10
        
        usernameLabel.text = user.username
        
        scoreBoardView.layer.cornerRadius = 10
        scoreBoardView.layer.shadowColor = UIColor.darkGray.cgColor
        scoreBoardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        scoreBoardView.layer.shadowRadius = 3
        scoreBoardView.layer.shadowOpacity = 0.4
        
        setLevelImage(level: user.level as! Int)
        userScoreLabel.text = "\(user.username!)님은 지금까지 총"
        
        posts = postHelper.fetchAllPost()
        scoreLabel.text = "\(posts.count)"
    }
    
    func setListCnt(category: Category) -> [CategoryName:Int]{
        let categoryCnt:[CategoryName:Int] = [
            .movie: category.movie as! Int,
            .drama: category.drama as! Int,
            .play: category.play as! Int,
            .sports: category.sports as! Int,
            .exhibition: category.exhibition as! Int
        ]
        return categoryCnt
    }
    
    func setLevelImage(level: Int){
        switch level {
        case 0:
            levelImage.image = UIImage(named: "trophy")
        case 1:
            levelImage.image = UIImage(named: "trophy")
        default:
            levelImage.image = UIImage(named: "trophy")
        }
    }
    
    
    
    
}

extension MyPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moncell", for: indexPath) as? MonthlyCell else {
            return UICollectionViewCell()
        }
        cell.backView.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.2
        switch indexPath.item {
        case 0:
            cell.categoryLabel.text = "All"
            cell.categoryImoji.text = "🎞🎬🎭⚾️🖼"
            var allCnt = 0
            for v in categoryCnts.values {
                allCnt = allCnt + v
            }
            cell.categoryCntLabel.text = String(allCnt)
            break
        default:
            cell.categoryLabel.text = intToCategoryNameString[indexPath.item-1]
            cell.categoryImoji.text = categoryMap[intToCategoryName[indexPath.item-1]!]
            cell.categoryCntLabel.text = String(categoryCnts[intToCategoryName[indexPath.item-1]!]!)
        }
        
        return cell
    }
    
    
}

extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                              layout collectionViewLayout: UICollectionViewLayout,
                              sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ( collectionView.bounds.width - 20 ) / 2
        let height = CGFloat(96)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return inset
    }
    
}

class MonthlyCell: UICollectionViewCell{
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImoji: UILabel!
    @IBOutlet weak var categoryCntLabel: UILabel!
}
