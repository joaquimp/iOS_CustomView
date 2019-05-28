//
//  CirclewWithLableTableViewController.swift
//  CustomView
//
//  Created by iago salomon on 28/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

class CirclewWithLableTableViewController: UITableViewController {

    
    @IBOutlet weak var progressCircleView: ProgressCircleView?
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var targetSlider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressLabel.text = ("\(String(format: "%.2f",(CGFloat(self.progressSlider.value)*100)))%")
        self.targetLabel.text = ("\(String(format: "%.2f",(CGFloat(self.targetSlider.value)*100)))%")
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
        self.progressLabel.text = ("\(String(format: "%.2f",(CGFloat(self.progressSlider.value)*100)))%")
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.targetLabel.text = ("\(String(format: "%.2f",(CGFloat(self.targetSlider.value)*100)))%")
        
    }
    
    @IBAction func ChageprogressColor(_ sender: UIButton) {
        self.progressCircleView?.progressColor = sender.backgroundColor ?? self.progressCircleView!.progressColor
        
    }
    @IBAction func ChangeProgressColor(_ sender: UIButton) {
        self.progressCircleView?.targetColor = sender.backgroundColor ?? self.progressCircleView!.targetColor
        
    }
    
}
