//
//  ViewController.swift
//  CustomSegues
//
//  Created by Bilal Arslan on 06/01/15.
//  Copyright (c) 2015 Bilal Arslan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var lblMessage:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSecondViewController() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
        
        // Some Animation
        let originalColor = self.view.backgroundColor
        self.view.backgroundColor = UIColor.orangeColor()
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.view.backgroundColor = originalColor
        })
    }
    
    @IBAction func showThirdViewController(sender: AnyObject) {
        self.performSegueWithIdentifier("idSecondSegue", sender: self)
        
        // Some Animation
        let originalColor = self.view.backgroundColor
        self.view.backgroundColor = UIColor.orangeColor()
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.view.backgroundColor = originalColor
        })

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idFirstSegue" {
            let secondViewController = segue.destinationViewController as SecondViewController
            secondViewController.message = "Hello from the 1st View Controller"
            
//            // Some Animation also can be written here.
//            let originalColor = self.view.backgroundColor
//            self.view.backgroundColor = UIColor.redColor()
//            
//            UIView.animateWithDuration(1.0, animations: { () -> Void in
//                self.view.backgroundColor = originalColor
//            })
        }
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.orangeColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        } else {
            self.lblMessage.text = "Welcome back from View Controller #3"
        }
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            } else if id == "idSecondSegueUnwind" {
                let unWindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unWindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
        
    }
}

