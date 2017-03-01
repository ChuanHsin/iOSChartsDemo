//
//  ChartsViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        //使座標軸好看些＆把Ｘ軸名稱值加上去
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        
        setChart(dataPoints: months, values: unitsSold)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            //let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i] )
            dataEntries.append(dataEntry)
        }
        
        //let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
        //let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        
        //X軸名稱加置底部
        lineChartView.xAxis.labelPosition = .bottom
        
        lineChartView.xAxis.granularity = 1
        lineChartView.xAxis.granularityEnabled = true
    }
}
