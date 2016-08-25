//
//  LoginViewController.swift
//  Marrowsel
//
//  Created by Hill, Cameron on 8/24/16.
//  Copyright © 2016 Hill, Cameron. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginScrollView.delegate = self
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification){
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    }
    
    //TODO this function isn't working
    func keyboardWillHide(notification: NSNotification){
        buttonParentView.frame.origin.y = buttonInitialY
        
        //TODO this doesnt seem to go back
        //loginScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    @IBAction func didTapOutside(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func onTapSignIn(sender: AnyObject) {
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            if emailTextField.text!.isEmpty {
                //Alert email req
                let emailAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                }
                
                emailAlertController.addAction(cancelAction)
                
                //Display Alert
                presentViewController(emailAlertController, animated: true, completion: {})
                
            } else {
                //PW req
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
}
