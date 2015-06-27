//
//  ViewController.swift
//  ParseStarterProject
//
//  Created by Mathieu Skulason on 18/06/15.
//  Copyright (c) 2015 Mathieu Skulason. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate {
    
    var usernameTextField = SideImageTextField()
    var passwordTextField = SideImageTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.flatTealColor()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let titleLabel = UILabel(frame: CGRectMake(0, CGRectGetWidth(self.view.frame) * 0.4, CGRectGetWidth(self.view.frame), 24))
        titleLabel.text = "Parse Starter"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.maxwellBoldWithSize(28.0)
        self.view.addSubview(titleLabel)
        
        usernameTextField.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 110, CGRectGetHeight(self.view.frame) * 0.5, 220, 40)
        usernameTextField.layer.borderWidth = (1.5)
        usernameTextField.layer.borderColor = UIColor.flatTealColorDark().CGColor
        usernameTextField.textField.placeholder = "username"
        usernameTextField.textField.font = UIFont.openSansItalicWithSize(15.0)
        self.view.addSubview(usernameTextField)
        
        passwordTextField.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 110, CGRectGetMaxY(usernameTextField.frame) + 10, 220, 40)
        passwordTextField.layer.borderWidth = (1.5)
        passwordTextField.layer.borderColor = UIColor.flatTealColorDark().CGColor
        passwordTextField.textField.placeholder = "********"
        passwordTextField.textField.font = UIFont.openSansItalicWithSize(15.0)
        passwordTextField.textField.secureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        
        let loginButton = UIButton(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 60, CGRectGetHeight(self.view.frame) * 0.7, 120, 36));
        loginButton.layer.backgroundColor = UIColor.flatTealColorDark().CGColor;
        loginButton.layer.cornerRadius = 4.0;
        loginButton.titleLabel?.font = UIFont.openSansWithSize(17.0)
        loginButton.setTitle("LOGIN", forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.flatWhiteColor(), forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.flatGrayColor(), forState: UIControlState.Highlighted)
        loginButton.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(loginButton)
        
        let signupButton = UIButton(frame: CGRectMake(CGRectGetMidX(self.view.frame) - 60, CGRectGetMaxY(loginButton.frame) + 14, 120, 36))
        signupButton.layer.backgroundColor = UIColor.flatTealColorDark().CGColor;
        signupButton.layer.cornerRadius = 4.0
        signupButton.titleLabel?.font = UIFont.openSansWithSize(17.0)
        signupButton.setTitle("SIGNUP", forState: UIControlState.Normal)
        signupButton.setTitleColor(UIColor.flatWhiteColor(), forState: UIControlState.Normal)
        signupButton.setTitleColor(UIColor.flatGrayColor(), forState: UIControlState.Highlighted)
        signupButton.addTarget(self, action: "signup", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signupButton)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() != nil) {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
    
    func login() {
        
        PFUser.logInWithUsernameInBackground(usernameTextField.textField.text, password:passwordTextField.textField.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                })
            } else {
                // The login failed. Check error to see why.
            }
        }
            }
    
    func signup() {
        self.performSegueWithIdentifier("signupSegue", sender: self)
    }
    
    func dismissKeyboard() {
        println("dismiss keyboard")
        self.view.endEditing(true)
    }


}

