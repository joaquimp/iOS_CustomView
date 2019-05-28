//
//  ColorPaletteView.swift
//  CustomView
//
//  Created by Rafael Galdino on 28/05/19.
//  Copyright © 2019 Joaquim Pessoa Filho. All rights reserved.
//

import UIKit

@IBDesignable
class ColorPaletteView: UIView {
    
    let colorArray = [ 0x000000, 0xfe0000, 0xff7900, 0xffb900, 0xffde00, 0xfcff00, 0xd2ff00, 0x05c000, 0x00c0a7, 0x0600ff, 0x6700bf, 0x9500c0, 0xbf0199, 0xffffff ]

    override func draw(_ rect: CGRect) {
        //Important constants for circle
        var start:CGPoint   = CGPoint(x: rect.minX, y: rect.midY)
        var end:CGPoint     = CGPoint(x: rect.maxX, y: rect.midY)
        
        //Calculating end point of progress bar
        let squareLength:CGFloat = rect.width / CGFloat(colorArray.count)
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set line attributes
        context?.setLineWidth(rect.height)
        
        // Draw the MAIN line
        for i in 0..<colorArray.count{
            context?.setStrokeColor(uiColorFromHex(rgbValue: colorArray[i]).cgColor)
            context?.move(to: CGPoint(x: start.x, y: start.y))
            context?.addLine(to: CGPoint(x: end.x, y: end.y))
            context?.strokePath()
            start = CGPoint(x: start.x + squareLength,
                            y: start.y)
            end = CGPoint(x: start.x + squareLength,
                          y: end.y)
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
