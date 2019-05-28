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
    @IBOutlet weak var circuloMédio: ProgressCircleView!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var circuloMenor: ProgressCircleView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var botaoProgressOutlet: UIButton!
    @IBOutlet weak var botaoTargetOutlet: UIButton!
    @IBAction func botaoProgress(_ sender: Any) {
        self.circuloMédio?.progressColor = UIColor(red: .random(in: 0...1),
                                                    green: .random(in: 0...1),
                                                    blue: .random(in: 0...1),
                                                    alpha: 0.8)
        self.circuloMenor?.progressColor = self.circuloMédio!.progressColor
        self.progressCircleView?.progressColor = self.circuloMédio!.progressColor
        botaoProgressOutlet.backgroundColor = self.circuloMédio!.progressColor
        self.progressSlider.tintColor = self.circuloMédio!.progressColor
        self.progressCircleView?.setNeedsDisplay()
        self.circuloMenor?.setNeedsDisplay()
        self.circuloMédio?.setNeedsDisplay()
    }
    
    
    @IBAction func botaoTarget(_ sender: Any) {
        self.circuloMédio?.targetColor = UIColor(red: .random(in: 0...1),
                                                    green: .random(in: 0...1),
                                                    blue: .random(in: 0...1),
                                                    alpha: 0.8)
        self.circuloMenor?.targetColor = self.circuloMédio!.targetColor
        self.progressCircleView?.targetColor = self.circuloMédio!.targetColor
        botaoTargetOutlet.backgroundColor = self.circuloMédio!.targetColor
        self.targetSlider.tintColor = self.circuloMédio!.targetColor
        self.progressCircleView?.setNeedsDisplay()
        self.circuloMenor?.setNeedsDisplay()
        self.circuloMédio?.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.botaoProgressOutlet.backgroundColor = progressSlider.tintColor
        self.botaoTargetOutlet.backgroundColor = targetSlider.tintColor
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
        self.circuloMenor?.circleWidth = CGFloat(self.widthSlider.value)
        self.circuloMédio?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.progressLabel.text = String(format: "%.2f", self.progressSlider.value*100) + "%"
        self.targetLabel.text = String(format: "%.2f", self.targetSlider.value*100) + "%"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.progressCircleView?.setNeedsDisplay()
    }

    @IBAction func widthChange(_ sender: Any) {
        self.circuloMédio?.circleWidth = CGFloat(self.widthSlider.value)
        self.circuloMenor?.circleWidth = CGFloat(self.widthSlider.value)
        self.progressCircleView?.circleWidth = CGFloat(self.widthSlider.value)
    }
    
    @IBAction func progessChange(_ sender: Any) {
        self.circuloMédio?.progressValue = CGFloat(self.progressSlider.value)
        self.circuloMenor?.progressValue = CGFloat(self.progressSlider.value)
        self.progressCircleView?.progressValue = CGFloat(self.progressSlider.value)
        self.progressLabel.text = String(format: "%.2f", self.progressSlider.value*100) + "%"
    }
    
    @IBAction func targetChange(_ sender: Any) {
        self.progressCircleView?.targetValue = CGFloat(self.targetSlider.value)
        self.circuloMédio?.targetValue = CGFloat(self.targetSlider.value)
        self.circuloMenor?.targetValue = CGFloat(self.targetSlider.value)
        self.targetLabel.text = String(format: "%.2f", self.targetSlider.value*100) + "%"
    }
}

