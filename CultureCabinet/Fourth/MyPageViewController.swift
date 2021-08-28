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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let picker = UIImagePickerController()
    let userHelper = UserHelper()
    let postHelper = PostHelper()
    let categoryHelper = CategoryHelper()
    var user = User()
    var posts:[Post] = []
    var categoryCnts:[CategoryName:Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.sourceType = .photoLibrary

        if(userHelper.fetchUser().isEmpty){
            //처음 실행시 유저 데이터 삽입
            let initUser = UserData(image: (UIImage(named: "profile")?.jpegData(compressionQuality: 1))!, level: 0, username: "CC")
            initUser.level = Decimal(string: "1") as NSDecimalNumber? as! Int
            userHelper.insertUser(u: initUser)
        }
        
        if(categoryHelper.fetchCategory().isEmpty){
            categoryHelper.insertCategoryData()
        }
        categoryCnts = setListCnt(category: categoryHelper.fetchCategory()[0])

    }
    
    override func viewDidAppear(_ animated: Bool) {
        categoryCnts = setListCnt(category: categoryHelper.fetchCategory()[0])
        
        user = userHelper.fetchUser()[0]

        profileImage.image = UIImage(data: user.image!)
        profileImage.layer.cornerRadius = 10
        
        usernameLabel.text = user.username
        
        scoreBoardView.layer.cornerRadius = 10
        scoreBoardView.layer.shadowColor = UIColor.darkGray.cgColor
        scoreBoardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        scoreBoardView.layer.shadowRadius = 3
        scoreBoardView.layer.shadowOpacity = 0.4
        
        userScoreLabel.text = "\(user.username!)님은 지금까지 총"
        
        posts = postHelper.fetchAllPost()
        scoreLabel.text = "\(posts.count)"
        
        collectionView.reloadData()
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
    
    //프로필 이미지 변경
    @IBAction func editButton(_ sender: Any) {
        editButton.showsMenuAsPrimaryAction = true
        //캘린더 이름 변경
        let editName = UIAction(title: "이름 변경", image: UIImage(systemName: "pencil"), handler: {(editTitle) in
            let alert = UIAlertController(title: "사용자 이름 변경", message: "변경할 이름을 입력하세요", preferredStyle: .alert)
            let save = UIAlertAction(title: "완료", style: .default, handler: { _ in
                self.user.username = (alert.textFields?[0].text)!
                self.userHelper.updateUser(u: self.user)
                self.viewDidAppear(false)
            })
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.user.username
            })
            alert.addAction(save)
            self.present(alert, animated: true, completion: nil)
        })
        //캘린더 대표 사진 변경
        let editImage = UIAction(title: "프로필 사진 변경", image: UIImage(systemName: "photo"), handler: {_ in
            self.present(self.picker, animated: true, completion: nil)
        })
        //취소
        let cancel = UIAction(title: "취소", attributes: .destructive, handler: { _ in } )
        editButton.menu = UIMenu(title: "", image: UIImage(systemName: "heart.fill"), identifier: nil, options: .displayInline, children: [editName, editImage, cancel])

    }
}

extension MyPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.user.image = image.jpegData(compressionQuality: 0.7)
        }
        dismiss(animated: true, completion: nil)
        self.viewDidAppear(false)
        self.userHelper.updateUser(u: self.user)
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
            cell.categoryCntLabel.text = String(posts.count)
            break
        default:
            cell.categoryLabel.text = intToCategoryNameString[indexPath.item-1]
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
    @IBOutlet weak var categoryCntLabel: UILabel!
}
