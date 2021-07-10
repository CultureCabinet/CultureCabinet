//
//  CalendarVC.swift
//  CultureCabinet
//
//  Created by jjuyaa on 2021/06/24.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController {

    @IBOutlet var calendarView: FSCalendar!
    @IBOutlet var selectLabel: UILabel!
    let dateFormatter = DateFormatter()
    var one: [Date] = []
    var two: [Date] = []
    var threeMore: [Date] = []
    
    let postHelper = PostHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        setUpEvents()
//        postHelper.fetchAllPost()
    }
    
    func setUpEvents() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let one_date1 = formatter.date(from: "2021-07-24")
        let one_date2 = formatter.date(from: "2021-07-22")
        let two_date1 = formatter.date(from: "2021-06-30")
        let two_date2 = formatter.date(from: "2021-07-09")
        let three_date1 = formatter.date(from: "2021-07-01")
        let three_date2 = formatter.date(from: "2021-07-02")
        one += [one_date1!, one_date2!]
        two += [two_date1!, two_date2!]
        threeMore += [three_date1!, three_date2!]
    }
}

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
}

extension CalendarVC {
    func setUI() {
        setCalendarView()
        setCalendarColor()
        setEvent()
        setLabel()
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
        self.calendarView.select(Date())
    }
    
    func setEvent() {
        calendarView.appearance.eventDefaultColor = UIColor(named: "coral2")
        calendarView.appearance.eventSelectionColor = UIColor(named: "coral3")
    }
    
    func setLabel() {
        selectLabel.text = "1회, 2회, 3회 이상"
    }
}
/*
extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        switch dateFormatter.string(from: date) {
        case "2021-07-01":
            return UIColor(named: "coral1")
        case "2021-07-02":
            return UIColor(named: "green1")
        default:
            return appearance.selectionColor
        }
    }
    
    
    
        /*
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if dates.contains(date){
            return 1
        }
        return 0
    }*/
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "오늘"
        case "2021-07-01":
            return "1회"
        case "2021-07-02":
            return "3회"
        case "2021-07-03":
            return "2회"
        default:
            return nil
        }
    }
}*/
