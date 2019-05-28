//
//  ViewController.swift
//  CustomViewComponent
//
//  Created by Joaquim Pessoa Filho on 22/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class ProgressCircleViewController: UITableViewController {

    @IBOutlet weak var progressCircleView: ProgressCircleView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    var progress: Float = 0 {
        didSet {
            progressLabel.text = "\(String(format: "%.2f", progress*100))%"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress = progressSlider.value
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        progress = self.progressSlider.value
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    @IBAction func progressColorTap(_ sender: Any) {
        let color = UIColor.random()
        self.progressCircleView?.progressColor = color
        self.progressLabel.textColor = color
        (sender as! UIButton).backgroundColor = color
    }
    
    
    @IBAction func targetColorTap(_ sender: Any) {
        let color = UIColor.random()
        self.progressCircleView?.targetColor = color
        (sender as! UIButton).backgroundColor = color
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
