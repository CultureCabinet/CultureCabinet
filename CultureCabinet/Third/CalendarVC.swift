//
//  CalendarVC.swift
//  CultureCabinet
//
//  Created by jjuyaa on 2021/06/24.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController {
    static let identifier = "CalendarVC"

    @IBOutlet var calendarView: FSCalendar!
    
    @IBOutlet var dateIcon: UIImageView!
    @IBOutlet var selectedDateLabel: UILabel!
    @IBOutlet var cabinetCollectionView: UICollectionView!
    
    let dateFormatter = DateFormatter()
    var one: [Date] = []
    var two: [Date] = []
    var threeMore: [Date] = []
    var cabinet_theme: [String] = ["🎞", "🎬", "🎞"]
    var cabinet_img_name: [String] = ["twilight", "슬기로운의사생활", "twilight"]
    var cabinet_comment: [String] = ["책을 읽고 본 후기는 조금 아쉬웠지만, 재미있었다. 다음 이야기는 어떻게 표현되었을지 궁금해지는 영화였다. ", "very good drama\n", "I love 뱀파이어"]
    
    var selectedDate: Date = Date()
    var selectedDateString: String = ""
    
    var posts: [PostData] = []
    let postHelper = PostHelper()
    let categoryHelper = CategoryHelper()
    var postList: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        postList = postHelper.fetchAllPost()
        print("postList")
        print(postList)
        posts = postToPostData(postss:postList)
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        setUpEvents()
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
    
    func setUpEvents() {
        for post in posts {
            let date_toDate = dateFormatter.date(from: post.date)
            if one.contains(date_toDate!) {
                one.remove(at: one.firstIndex(of: date_toDate!)!)
                two.append(date_toDate!)
            } else if two.contains(date_toDate!) {
                two.remove(at: two.firstIndex(of: date_toDate!)!)
                threeMore.append(date_toDate!)
            } else if threeMore.contains(date_toDate!) {
                
            } else {
                one.append(date_toDate!)
            }
        }
    }
}

// MARK:- CalendarView
extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.one.contains(date) {
            return 1
        } else if self.two.contains(date) {
            return 2
        } else if self.threeMore.contains(date) {
            return 3
        } else {
            return 0
        }
    }
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        setIcon()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        selectedDate = Date()
        selectedDateString = dateFormatter.string(from: date)
        selectedDateLabel.text = selectedDateString
        
        print("select")
        print(selectedDateString)
        
        postList = postHelper.fetchSelectedDatePost(selectedDateString: selectedDateString)
        posts = postToPostData(postss:postList)
        print("select post")
        print(postList)
        //collectionView.reloadData()
        
    }
    
    func setIcon() {
        dateIcon.layer.cornerRadius = dateIcon.frame.height/2
        dateIcon.layer.borderWidth = 1
        dateIcon.clipsToBounds = true
        dateIcon.backgroundColor = UIColor(named: "coral3")
    }
}

// MARK:- CollectionView
extension CalendarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CabinetCVC.identifier, for: indexPath) as? CabinetCVC else {
            return UICollectionViewCell()
        }
        cell.theme_icon?.text = categoryMap[posts[indexPath.item].category]
        cell.imageView?.image = UIImage(data: posts[indexPath.item].image ?? Data())
        //cell.commentLabel?.text = cabinet_comment[indexPath.row]
        cell.commentLabel?.font = .systemFont(ofSize: 10)
        return cell
    }
}

extension CalendarVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        let height = width*1.8
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension CalendarVC {
    func setUI() {
        setCalendarView()
        setCalendarColor()
        setLabel()
        setCollectionView()
        setCollectionViewNib()
    }
    
    func setCalendarView() {
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.appearance.headerTitleColor = UIColor(named: "coral2")
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarView.appearance.weekdayTextColor = UIColor(named: "coral2")
    }
    
    func setCalendarColor() {
        calendarView.appearance.selectionColor = UIColor(named: "coral2")
        calendarView.appearance.borderRadius = 0
        calendarView.appearance.eventDefaultColor = UIColor(named: "coral2")
        calendarView.appearance.eventSelectionColor = UIColor(named: "coral3")
        self.calendarView.select(Date())
    }
    
    func setCollectionView() {
        cabinetCollectionView.delegate = self
        cabinetCollectionView.dataSource = self
    }
        
    func setCollectionViewNib() {
        let nibName = UINib(nibName: "CabinetCVC", bundle: nil)
        cabinetCollectionView.register(nibName, forCellWithReuseIdentifier: CabinetCVC.identifier)
    }
    
    func setLabel() {
        selectedDateLabel.font = .systemFont(ofSize: 15, weight: .bold)
    }
}
