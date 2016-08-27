//
//  IntroViewController.swift
//  Marrowsel
//
//  Created by Hill, Cameron on 8/24/16.
//  Copyright © 2016 Hill, Cameron. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var intro_tile1: UIImageView!
    @IBOutlet weak var intro_tile2: UIImageView!
    @IBOutlet weak var intro_tile3: UIImageView!
    @IBOutlet weak var intro_tile4: UIImageView!
    @IBOutlet weak var intro_tile5: UIImageView!
    @IBOutlet weak var intro_tile6: UIImageView!
    
    //get all initial position
    
    var newOffset : Float = 0
    
    //Set Y initials, offsets, ratios
    let initialY1:Float = 746;let initialY2:Float = 746;let initialY3:Float = 822;let initialY4:Float = 900;let initialY5:Float = 900;let initialY6:Float = 900
    let yOffset1:Float = -385;let yOffset2:Float = -240;let yOffset3:Float = -415;let yOffset4:Float = -408;let yOffset5:Float = -480;let yOffset6:Float = -500;
    let rotationRatio : CGFloat = 10/568
    let rotation1:CGFloat=10;let rotation2:Float=10;let rotation3:Float=10;let rotation4:Float=10;let rotation5:Float=10;let rotation6:Float=10;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //calcInitialVals()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        //Set initial image positions and rotations
        intro_tile1.frame.origin.y = intro_tile1.frame.origin.y - CGFloat(385)
        intro_tile1.frame.origin.x = intro_tile1.frame.origin.x - 38
        intro_tile1.transform = CGAffineTransformRotate(intro_tile1.transform, CGFloat(-10*(M_PI)/180))
        //intro_tile1.transform = CGAffineTransformScale(intro_tile1.transform, 1.3, 1.3)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(introScrollView.contentOffset.y)
        
        setImagePositions(offset)
        
    }

    func setImagePositions(scrollOffset: Float) {
        
        print(scrollOffset)
        
        //if scrollOffset >= -20 && scrollOffset <= 568 {
        //Calculate Y ratios
        let yRatio1 = yOffset1/Float(568);let yRatio2 = yOffset2/Float(568);let yRatio3 = yOffset3/Float(568);let yRatio4 = yOffset4/Float(568);let yRatio5 = yOffset5/Float(568);let yRatio6 = yOffset6/Float(568);
        
        
        //Set Y positions
        //intro_tile1.frame.origin.y = CGFloat(initialY1+yOffset1-scrollOffset*yRatio1)
        intro_tile2.frame.origin.y = CGFloat(initialY2+yOffset2-scrollOffset*yRatio2)
        intro_tile3.frame.origin.y = CGFloat(initialY3+yOffset3-scrollOffset*yRatio3)
        intro_tile4.frame.origin.y = CGFloat(initialY4+yOffset4-scrollOffset*yRatio4)
        intro_tile5.frame.origin.y = CGFloat(initialY5+yOffset5-scrollOffset*yRatio5)
        intro_tile6.frame.origin.y = CGFloat(initialY6+yOffset6-scrollOffset*yRatio6)
        
        
        let degreeChange = CGFloat(scrollOffset-newOffset)*CGFloat(rotationRatio)*CGFloat((M_PI/180))
        let scaleChange = 1-CGFloat(scrollOffset-newOffset)*CGFloat(0.3/568)
        
        
        //Set rotations CGAffineTranformRotate
        //let t : CGAffineTransform = (1,2)
        let tx1 : CGFloat = 0
        let ty1 : CGFloat = CGFloat(-(scrollOffset-newOffset)*yRatio1)
        
        intro_tile1.transform = CGAffineTransformTranslate(intro_tile1.transform, CGFloat(-0.01), ty1)
        intro_tile1.transform = CGAffineTransformRotate(intro_tile1.transform, degreeChange)
        //intro_tile1.transform = CGAffineTransformScale(intro_tile1.transform, scaleChange, scaleChange)
        
        
        
        
        
        //Use this to only transform by the difference b/w old and new scroll position
        newOffset = scrollOffset
        //}
        
    }

}
