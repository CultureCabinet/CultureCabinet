//
//  ChartViewController.swift
//  CultureCabinet
//
//  Created by 임수정 on 2021/07/10.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!
    var unitsSold: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        barChartView.borderLineWidth = 0
        
        setChart(dataPoints: months, values: unitsSold)
        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Record")

        // 차트 컬러
        chartDataSet.colors = [.systemGreen]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
