//
//  ViewController.swift
//  HelloChart
//
//  Created by rd on 2018/11/8.
//  Copyright © 2018年 Clark. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var stepperOne: UIStepper!
    @IBOutlet weak var stepperTwo: UIStepper!
    
    var stepperOneValue = PieChartDataEntry(value: 0)
    var stepperTwoValue = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        print(stepperOne.value)
        stepperOneValue.value = stepperOne.value
        stepperOneValue.label = "iOS"
        
        print(stepperTwo.value)
        stepperTwoValue.value = stepperTwo.value
        stepperTwoValue.label = "macOS"
        numberOfDownloadsDataEntries = [stepperOneValue, stepperTwoValue]
        updateChartData()
    }

    @IBAction func changeStepperOne(_ sender: UIStepper) {
        stepperOneValue.value = sender.value
        updateChartData()
        
    }
    
    @IBAction func changeStepperTwo(_ sender: UIStepper) {
        stepperTwoValue.value = sender.value
        updateChartData()
        
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        if #available(iOS 11.0, *) {
            let colors = [UIColor(named: "iOSColor"), UIColor(named: "macColor")]
            chartDataSet.colors = colors as! [NSUIColor]
        } else {
            // Fallback on earlier versions
        }

        pieChart.data = chartData
  
    }

}

