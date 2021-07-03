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
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}

extension CalendarVC {
    func setUI() {
        setCalendarView()
        setCalendarColor()
    }
    
    func setCalendarView() {
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
    func setCalendarColor() {
        calendarView.appearance.selectionColor = UIColor(named: "coral2")
        calendarView.appearance.borderRadius = 0
    }
}

extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        switch dateFormatter.string(from: date) {
        case "2021-06-22":
            return UIColor(named: "coral1")
        case "2021-06-23":
            return UIColor(named: "green1")
        default:
            return appearance.selectionColor
        }
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "오늘"
        case "2021-06-21":
            return "1회"
        case "2021-06-24":
            return "3회"
        case "2021-06-25":
            return "2회"
        default:
            return nil
        }
    }
}
