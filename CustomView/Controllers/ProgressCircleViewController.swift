//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var progressCircleView3: ProgressCircleView!
    @IBOutlet weak var progressCircleView2: ProgressCircleView!
    @IBOutlet weak var progressCircleView: ProgressCircleView?
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    @IBOutlet weak var progressPercentageLabel: UILabel!
    @IBOutlet weak var targetPercentageLabel: UILabel!
    
    @IBOutlet weak var progressSegmentedColorPicker: UISegmentedControl!
    @IBOutlet weak var targetSegmentedColorPicker: UISegmentedControl!
    
    private var percentageProgress : Float?
    private var percentageTarget : Float?
    
    private var colorArray : [UIColor] = [ColorPallete.red, ColorPallete.orange, ColorPallete.yellow, ColorPallete.green, ColorPallete.blue, ColorPallete.indigo, ColorPallete.violet]
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        widthSlider.value = 10
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView3?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView3?.targetValue = CGFloat(self.targetSlider.value)
        
        percentageTarget = self.targetSlider.value * 100
        guard let percentageTarget = percentageTarget else { return }
        targetPercentageLabel.text = String(format: "%.2f", percentageTarget) + "%"
        
        percentageProgress = self.progressSlider.value * 100
        guard let percentageProgress = percentageProgress else { return }
        progressPercentageLabel.text = String(format: "%.2f", percentageProgress) + "%"
        
        colorPickerApply(on: progressSegmentedColorPicker)
        colorPickerApply(on: targetSegmentedColorPicker)
    
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
        self.progressCircleView2?.setNeedsDisplay()
        self.progressCircleView3?.setNeedsDisplay()
        
    }

    @IBAction func widthChange(_ sender: Any) {
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView2?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView3?.circleWidth = CGFloat(self.widthSlider.value)
        
    }
    
    @IBAction func progessChange(_ sender: Any) {
        
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView2?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView3?.progressValue = CGFloat(self.progressSlider.value)
        
        percentageProgress = self.progressSlider.value * 100
        guard let percentageProgress = percentageProgress else { return }
        progressPercentageLabel.text = String(format: "%.2f", percentageProgress) + "%"
    }
    
    @IBAction func targetChange(_ sender: Any) {
        
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.progressCircleView2?.targetValue = CGFloat(self.targetSlider.value)
        self.progressCircleView3?.targetValue = CGFloat(self.targetSlider.value)
        
        percentageTarget = self.targetSlider.value * 100
        guard let percentageTarget = percentageTarget else { return }
        targetPercentageLabel.text = String(format: "%.2f", percentageTarget) + "%"
        
    }

    @IBAction func changeProgressColor(_ sender: UISegmentedControl) {
        
        progressCircleView?.progressColor = colorArray[sender.selectedSegmentIndex]
        progressCircleView2?.progressColor = colorArray[sender.selectedSegmentIndex]
        progressCircleView3?.progressColor = colorArray[sender.selectedSegmentIndex]
        progressSlider.tintColor = colorArray[sender.selectedSegmentIndex]
        
    }
    
    @IBAction func changeTargetColor(_ sender: UISegmentedControl) {
        
        progressCircleView?.targetColor = colorArray[sender.selectedSegmentIndex]
        progressCircleView2?.targetColor = colorArray[sender.selectedSegmentIndex]
        progressCircleView3?.targetColor = colorArray[sender.selectedSegmentIndex]
        targetSlider.tintColor = colorArray[sender.selectedSegmentIndex]
        
        
    }
    
    func colorPickerApply(on segmented : UISegmentedControl) {
        
        for i in 0..<segmented.subviews.count {
            let aux : UIView = segmented.subviews[i] as UIView
            aux.tintColor = colorArray[i]
        }
        
    }
    
}

