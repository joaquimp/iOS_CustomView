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
        
        for view in progressViews{
            view.setNeedsDisplay()
        }
    }

    @IBAction func widthChange(_ sender: Any) {
        setValues(width: CGFloat(self.widthSlider.value), progress: nil, target: nil)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        setValues(width: nil, progress: CGFloat(self.progressSlider.value), target: nil)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        setValues(width: nil, progress: nil, target: CGFloat(self.targetSlider.value))
    }
    
    func setValues(width:CGFloat?, progress:CGFloat?, target:CGFloat?){
        if let width = width{
            for view in progressViews{
                view.circleWidth = width
            }
        }
        if let progress = progress{
            for view in progressViews{
                view.progressValue = progress
            }
        }
        if let target = target{
            for view in progressViews{
                view.targetValue = target
            }
        }
    }
}

