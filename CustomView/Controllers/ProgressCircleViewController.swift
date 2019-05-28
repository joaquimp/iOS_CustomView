//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    @IBOutlet weak var progressCircleViews: UIView!
    @IBOutlet weak var baseColorSlider: UISlider!
    @IBOutlet weak var progressColorSlider: UISlider!
    @IBOutlet weak var targetColorSlider: UISlider!
    
    @IBOutlet weak var lblTargetPercent: UILabel!
    @IBOutlet weak var lblProgressPercent: UILabel!
    
    let colorArray = [ 0x000000, 0xfe0000, 0xff7900, 0xffb900, 0xffde00, 0xfcff00, 0xd2ff00, 0x05c000, 0x00c0a7, 0x0600ff, 0x6700bf, 0x9500c0, 0xbf0199, 0xffffff ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.circleWidth = CGFloat(self.widthSlider.value)
            chart.progressValue = CGFloat(self.progressSlider.value)
            chart.targetValue = CGFloat(self.targetSlider.value)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.setNeedsDisplay()
        }
    }

    @IBAction func widthChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.circleWidth = CGFloat(self.widthSlider.value)
        }
    }
    
    @IBAction func progessChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.progressValue = CGFloat(self.progressSlider.value)
        }
        lblProgressPercent.text = (String(Int(self.progressSlider.value * 100)) + "%")
    }
    
    @IBAction func targetChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.targetValue = CGFloat(self.targetSlider.value)
        }
        lblTargetPercent.text = (String(Int(self.targetSlider.value * 100)) + "%")
    }
    
    
    @IBAction func baseColorChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.circleColor = uiColorFromHex(rgbValue: colorArray[Int(baseColorSlider.value)])
        }

    }
    
    @IBAction func progressColorChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.progressColor = uiColorFromHex(rgbValue: colorArray[Int(progressColorSlider.value)])
        }
    }
    
    @IBAction func targetColorChange(_ sender: Any) {
        for case
            let (chart as ProgressCircleView) in self.progressCircleViews.subviews
        {
            chart.targetColor = uiColorFromHex(rgbValue: colorArray[Int(targetColorSlider.value)])
        }
    }
    
    
    func uiColorFromHex(rgbValue: Int) -> UIColor {
        
        let red =   CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(rgbValue & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

