//
//  containerView.swift
//  Bezier Paths and Shape Layers
//
//  Created by Tushar Khandaker on 11/8/23.
//

import UIKit

enum ShapeType: CaseIterable {
    case Rect
    case Triangle
    case Circle
    case Arcs
}

class containerView: UIView {

    var path: UIBezierPath!
    
    var currentShape:ShapeType = .Rect {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.darkGray
    }
    
    override func draw(_ rect: CGRect) {
        
        switch self.currentShape {
        case .Rect:
            self.createRectangle()
        case .Triangle:
            self.createTriangle()
        case .Circle:
            self.createCircle()
        case .Arcs:
            self.createArcs()
        }
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        self.path.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        self.path.stroke()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
        

    }
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }

    func createCircle() {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,y: 0.0,width: self.frame.size.height,height: self.frame.size.height))
    }
    
    func createArcs() {
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                            radius: self.frame.size.height/2,
                            startAngle: 180,
                            endAngle: 0,
                            clockwise: true)
    }
}
