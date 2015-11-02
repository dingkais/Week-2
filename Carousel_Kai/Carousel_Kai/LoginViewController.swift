//
//  LoginViewController.swift
//  Carousel_Kai
//
//  Created by Kai Ding on 11/1/15.
//  Copyright © 2015 Kai Ding. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentUIView: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var initialY: CGFloat!
    let offset: CGFloat = -50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        initialY = buttonParentView.frame.origin.y
        scrollView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        // self.buttonParentView.frame.origin = CGPoint(x: self.buttonParentView.frame.origin.x, y: self.initialY + self.offset)
        
        // Move the button up above keyboard
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -120)
        // Calculate the maximum scrollview content Offset y
        let maxContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        // Scroll the scrollview up to the maximum contentOffset
        scrollView.contentOffset.y = maxContentOffsetY
        // Enable scrolling while keyboard is shown
        scrollView.scrollEnabled = true
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.transform = CGAffineTransformIdentity
        // Return the ScrollView to it's original position
        scrollView.contentOffset.y = 0
        // Disable scrolling when keyboard is hidden
        scrollView.scrollEnabled = false
    }
    
    
    
    
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onSignInButton(sender: AnyObject) {
        self.activityIndicator.startAnimating()
        
        
        if email.text == "dingkais@gmail.com" && password.text == "12345"{
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.signInButton.selected = false
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                
            })
        
        } else if email.text!.isEmpty || password.text!.isEmpty {
            self.activityIndicator.stopAnimating()
            self.signInButton.selected = false
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
       
        } else {
            delay(2, closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.signInButton.selected = false
                let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please try again", preferredStyle: .Alert)
            
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion:     nil)
            })
        }
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
