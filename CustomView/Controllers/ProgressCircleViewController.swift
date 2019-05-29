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
    

    @IBOutlet weak var progressCircleViewMedium: ProgressCircleView!
    
    @IBOutlet weak var progressCircleViewSmall: ProgressCircleView?
    
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var targetSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //circulo maior
        
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        
        //circulo medio
        self.progressCircleViewMedium?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleViewMedium?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleViewMedium?.targetValue = CGFloat(self.targetSlider.value)
        
        //circulo pequeno
        self.progressCircleViewSmall?.circleWidth = CGFloat(self.widthSlider.value)
        
        self.progressCircleViewSmall?.progressValue = CGFloat(self.progressSlider.value)
        
        self.progressCircleViewSmall?.targetValue = CGFloat(self.targetSlider.value)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
        self.progressCircleViewMedium?.setNeedsDisplay()
        
        self.progressCircleViewSmall?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleViewMedium?.circleWidth = CGFloat(self.widthSlider.value)
        
        self.progressCircleViewSmall?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleViewMedium?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleViewSmall?.progressValue = CGFloat(self.progressSlider.value)
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.progressCircleViewMedium?.targetValue = CGFloat(self.targetSlider.value)
        
        self.progressCircleViewSmall?.targetValue = CGFloat(self.targetSlider.value)
    }
}

