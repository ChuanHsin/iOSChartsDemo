//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {

    
    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        barChartView.noDataText = "You need to provide data for the chart."
       
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i] )
            //let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        //barChartView.chartDescription?.text = "abc"
        //chartDataSet.colors = [UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)]
        
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        //X軸名稱加置底部
        barChartView.xAxis.labelPosition = .bottom
        //加入圖表動畫
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        //加入限定線
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
        
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight){
        print(" Chart Value  \(entry.description)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.delegate = self
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        //使座標軸好看些＆把Ｘ軸名稱值加上去
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.granularityEnabled = true
        
        setChart(dataPoints: months, values: unitsSold)
    }
    
}

