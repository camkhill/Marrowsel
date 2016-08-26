//
//  TutorialViewController.swift
//  Marrowsel
//
//  Created by Hill, Cameron on 8/24/16.
//  Copyright © 2016 Hill, Cameron. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var spinButton: UIImageView!
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var spinImageView: UIImageView!
    @IBOutlet weak var takeCarouselButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialScrollView.contentSize = CGSize(width: 1280,height: 568)
        tutorialScrollView.delegate = self
        spinImageView.alpha = 0
        takeCarouselButton.enabled = false
        pageControl.hidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //On reaching the last page, display "take carousel for a spin and activate button
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
        
        
        if page == 3 {
            takeCarouselButton.enabled = true
            UIImageView.animateWithDuration(0.5, animations: {
                self.spinImageView.alpha = 1
            self.pageControl.hidden = true
            })
        } else {
            takeCarouselButton.enabled = false
            UIImageView.animateWithDuration(0.5, animations: {
                self.spinImageView.alpha = 0
            self.pageControl.hidden = false
            })
        }
        // Set the current page, so the dots will update
    }
    
    

}
