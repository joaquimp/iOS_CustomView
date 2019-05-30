//
//  ProgressBarViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 26/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressBarViewController: UITableViewController {
    
    @IBOutlet weak var progressBarView: ProgressBarView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    @IBOutlet weak var progressSegmentedColorPicker: UISegmentedControl!
    @IBOutlet weak var targetSegmentedColorPicker: UISegmentedControl!
    
        private var colorArray : [UIColor] = [ColorPallete.red, ColorPallete.orange, ColorPallete.yellow, ColorPallete.green, ColorPallete.blue, ColorPallete.indigo, ColorPallete.violet]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressBarView?.lineWidth = CGFloat(self.widthSlider.value)
        self.progressBarView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressBarView?.targetValue = CGFloat(self.targetSlider.value)
        
        colorPickerApply(on: progressSegmentedColorPicker)
        colorPickerApply(on: targetSegmentedColorPicker)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressBarView?.setNeedsDisplay()
    }
    
    @IBAction func widthChange(_ sender: Any) {
        self.progressBarView?.lineWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressBarView?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressBarView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    @IBAction func changeProgressColor(_ sender: UISegmentedControl) {
        
        progressBarView?.progressColor = colorArray[sender.selectedSegmentIndex]
        progressSlider.tintColor = colorArray[sender.selectedSegmentIndex]
        
    }
    
    @IBAction func changeTargetColor(_ sender: UISegmentedControl) {
        
        progressBarView?.targetColor = colorArray[sender.selectedSegmentIndex]
        targetSlider.tintColor = colorArray[sender.selectedSegmentIndex]

    }
    
    func colorPickerApply(on segmented : UISegmentedControl) {
        
        for i in 0..<segmented.subviews.count {
            let aux : UIView = segmented.subviews[i] as UIView
            aux.tintColor = colorArray[i]
        }
        
    }
}

