//
//  LoadingView.swift
//  ActivityIndicator
//
//  Created by Matthias Nagel on 29.11.19.
//  Copyright © 2019 Matthias Nagel. All rights reserved.
//

import UIKit

final class LoadingView: UIView {
    fileprivate var backgroundLayer: CAShapeLayer!
    fileprivate var triangle1Layer: CAShapeLayer!
    fileprivate var triangle2Layer: CAShapeLayer!
    
    fileprivate let marginMin = -15
    fileprivate let marginMax = 15
    
    public static let width: CGFloat = 100
    public static let height: CGFloat = 125
        
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: LoadingView.width, height: LoadingView.height))
        
        let currentPoints = getRandomPoints()
        backgroundLayer = getRandomShape(points: currentPoints)
        triangle1Layer = getTriangle1Shape(points: currentPoints)
        triangle2Layer = getTriangle2Shape(points: currentPoints)

        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(triangle1Layer)
        self.layer.addSublayer(triangle2Layer)
        
        if let fromBackgroundPath = backgroundLayer?.path, let fromTriangle1Path = triangle1Layer?.path, let fromTriangle2Path = triangle2Layer?.path {
            animate(fromBackgroundPath: fromBackgroundPath, fromTriangle1Path: fromTriangle1Path, fromTriangle2Path: fromTriangle2Path)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(fromBackgroundPath: CGPath, fromTriangle1Path: CGPath, fromTriangle2Path: CGPath) {
        
        let randomPoints = getRandomPoints()
        
        guard let toBackgroundPath = getRandomShape(points: randomPoints).path else {
            return
        }
        
        guard let toTriangle1Path = getTriangle1Shape(points: randomPoints).path else {
            return
        }
        
        guard let toTriangle2Path = getTriangle2Shape(points: randomPoints).path else {
            return
        }
        
        CATransaction.begin()
        let backgroundAnimation = CABasicAnimation(keyPath: "path")
        backgroundAnimation.fromValue = fromBackgroundPath
        backgroundAnimation.toValue = toBackgroundPath
        backgroundAnimation.duration = 1
        backgroundAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        CATransaction.setCompletionBlock {
            self.animate(fromBackgroundPath: toBackgroundPath, fromTriangle1Path: toTriangle1Path, fromTriangle2Path: toTriangle2Path)
        }
        backgroundLayer.add(backgroundAnimation, forKey: "backgroundAnimation")
        CATransaction.commit()
        
        let triangle1Animation = CABasicAnimation(keyPath: "path")
        triangle1Animation.fromValue = fromTriangle1Path
        triangle1Animation.toValue = toTriangle1Path
        triangle1Animation.duration = 1
        triangle1Animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        triangle1Layer.add(triangle1Animation, forKey: "triangle1Animation")
        
        let triangle2Animation = CABasicAnimation(keyPath: "path")
        triangle2Animation.fromValue = fromTriangle2Path
        triangle2Animation.toValue = toTriangle2Path
        triangle2Animation.duration = 1
        triangle2Animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        triangle2Layer.add(triangle2Animation, forKey: "triangle2Animation")
        
    }
    
    func getRandomPoints() -> [CGPoint] {
      let point1 = CGPoint(x: LoadingView.width/2 + getRandomMargin(), y: 0 + getRandomMargin())
      let point2 = CGPoint(x: LoadingView.width + getRandomMargin(), y: LoadingView.height/3 + getRandomMargin())
      let point3 = CGPoint(x: LoadingView.width + getRandomMargin(), y: LoadingView.height/3*2 + getRandomMargin())
      let point4 = CGPoint(x: LoadingView.width/2 + getRandomMargin(), y: LoadingView.height + getRandomMargin())
      let point5 = CGPoint(x: 0 + getRandomMargin(), y: LoadingView.height/3*2 + getRandomMargin())
      let point6 = CGPoint(x: 0 + getRandomMargin(), y: LoadingView.height/3 + getRandomMargin())
        
        return [point1, point2, point3, point4, point5, point6]
    }
    
    fileprivate func getRandomShape(points: [CGPoint]) -> CAShapeLayer {
        
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        path.addLine(to: points[4])
        path.addLine(to: points[5])
        path.addLine(to: points[0])
        
        let layer = CAShapeLayer()
        layer.fillColor = #colorLiteral(red: 0.5217987895, green: 0.5218115449, blue: 0.52180475, alpha: 1).cgColor
        layer.path = path.cgPath
        
        return layer
    }
    
    func getTriangle1Shape(points: [CGPoint]) -> CAShapeLayer {
        
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        path.addLine(to: points[0])
        
        let layer = CAShapeLayer()
        layer.fillColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        layer.lineWidth = 0
        layer.path = path.cgPath
        
        return layer
    }
    
    func getTriangle2Shape(points: [CGPoint]) -> CAShapeLayer {
        
        let path = UIBezierPath()
        path.move(to: points[1])
        path.addLine(to: points[3])
        path.addLine(to: points[4])
        path.addLine(to: points[1])
        
        let layer = CAShapeLayer()
        layer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        layer.lineWidth = 0
        layer.path = path.cgPath
        
        return layer
    }
    
    func getRandomMargin() -> CGFloat {
        return CGFloat(Int.random(in: marginMin ..< marginMax))
    }
}
