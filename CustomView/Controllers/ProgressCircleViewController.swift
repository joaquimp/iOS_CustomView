//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {
    @IBOutlet var progressViews: [ProgressCircleView]!
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValues(width: CGFloat(self.widthSlider.value), progress: CGFloat(self.progressSlider.value), target: CGFloat(self.targetSlider.value))
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        for chart in progressViews{
            chart.setNeedsDisplay()
        }
    }

    @IBAction func widthChange(_ sender: Any) {
        setValues(width: CGFloat(self.widthSlider.value))
    }
    
    @IBAction func progessChange(_ sender: Any) {
        setValues(progress: CGFloat(self.progressSlider.value))
    }
    
    @IBAction func targetChange(_ sender: Any) {
        setValues(target: CGFloat(self.targetSlider.value))
    }
    
    
    
    func setValues(width:CGFloat){
        setValues(width: width, progress: nil, target: nil)
    }
    
    func setValues(progress:CGFloat){
        setValues(width: nil, progress: progress, target: nil)
    }
    
    func setValues(target:CGFloat){
        setValues(width: nil, progress: nil, target: target)
    }
    func setValues(width:CGFloat?, progress:CGFloat?, target:CGFloat?){
        if let width = width{
            for chart in progressViews{
                chart.circleWidth = width
            }
        }
        if let progress = progress{
            for chart in progressViews{
                chart.progressValue = progress
            }
        }
        if let target = target{
            for chart in progressViews{
                chart.targetValue = target
            }
        }
    }
    
    @IBAction func tapTargetOccur(_ sender : UITapGestureRecognizer){
        for chart in progressViews{
            chart.targetColor = sender.view?.backgroundColor ?? .gray
        }
    }
    
    @IBAction func tapProgressOccur(_ sender : UITapGestureRecognizer){
        for chart in progressViews{
            chart.progressColor = sender.view?.backgroundColor ?? .red
        }
    }
}

