//
//  ViewController.swift
//  Frames&Bounds
//
//  Created by Ashutosh Billa on 18/11/17.
//  Copyright © 2017 Ashutosh Billa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    // Labels
    @IBOutlet weak var frameX: UILabel!
    @IBOutlet weak var frameY: UILabel!
    @IBOutlet weak var frameWidth: UILabel!
    @IBOutlet weak var frameHeight: UILabel!
    @IBOutlet weak var boundsX: UILabel!
    @IBOutlet weak var boundsY: UILabel!
    @IBOutlet weak var boundsWidth: UILabel!
    @IBOutlet weak var boundsHeight: UILabel!
    
    // Boundary Lines
    var verticalLine1 = UIView()
    var verticalLine2 = UIView()
    var horizontalLine1 = UIView()
    var horizontalLine2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGestureAction(_:))))
        
        verticalLine1 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 1, height: greenView.bounds.height*2)))
        verticalLine2 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 1, height: greenView.bounds.height*2)))
        horizontalLine1 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 1)))
        horizontalLine2 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 1)))
        
        view.addSubview(verticalLine1)
        view.addSubview(verticalLine2)
        view.addSubview(horizontalLine1)
        view.addSubview(horizontalLine2)
        
        verticalLine1.backgroundColor = UIColor.black
        verticalLine2.backgroundColor = UIColor.black
        horizontalLine1.backgroundColor = UIColor.black
        horizontalLine2.backgroundColor = UIColor.black
        
        updateBoundaryLines()
    }

    @objc func handleTapGestureAction(_ sender: UITapGestureRecognizer) {
        switch greenView.tag {
        case 0:
            greenView.tag = 1
            greenView.transform = CGAffineTransform(rotationAngle: CGFloat(45))
        case 1:
            greenView.tag = 0
            greenView.transform = CGAffineTransform.identity
        default:
            break
        }
        updateBoundaryLines()
    }

    func updateBoundaryLines() {
        let minX = greenView.frame.minX
        let minY = greenView.frame.minY
        let maxX = greenView.frame.maxX
        let maxY = greenView.frame.maxY
        let width = greenView.frame.width
        let height = greenView.frame.height
        
        verticalLine1.frame = CGRect(origin: CGPoint(x: minX, y: minY), size: CGSize(width: 1, height: height))
        verticalLine2.frame = CGRect(origin: CGPoint(x: maxX, y: minY), size: CGSize(width: 1, height: height))
        
        horizontalLine1.frame = CGRect(origin: CGPoint(x: minX, y: minY), size: CGSize(width: width, height: 1))
        horizontalLine2.frame = CGRect(origin: CGPoint(x: minX, y: maxY), size: CGSize(width: width, height: 1))
        
        updateLabels()
    }
    
    func updateLabels() {
        frameX.text = greenView.frame.origin.x.toString
        frameY.text = greenView.frame.origin.y.toString
        frameWidth.text = greenView.frame.width.toString
        frameHeight.text = greenView.frame.height.toString
        
        boundsX.text = greenView.bounds.origin.x.toString
        boundsY.text = greenView.bounds.origin.y.toString
        boundsWidth.text = greenView.bounds.width.toString
        boundsHeight.text = greenView.bounds.height.toString
        
        
        print("Frame MinX", greenView.frame.minX)
        print("Frame MaxX", greenView.frame.maxX)
        print("Frame MinY", greenView.frame.minY)
        print("Frame MaxY", greenView.frame.maxY)
        
        print("Bounds MinX", greenView.bounds.minX)
        print("Bounds MaxX",greenView.bounds.maxX)
        print("Bounds MinY",greenView.bounds.minY)
        print("Bounds MaxX",greenView.bounds.maxY)
    }

}

extension CGFloat {
    var toString: String {
        return String(format: "%.2f", self)
    }
}
