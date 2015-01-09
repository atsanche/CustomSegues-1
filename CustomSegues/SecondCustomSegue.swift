//
//  SecondCustomSegue.swift
//  CustomSegues
//
//  Created by Bilal Arslan on 06/01/15.
//  Copyright (c) 2015 Bilal Arslan. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {
   
    override func perform() {
        var firstViewController = sourceViewController.view as UIView!
        var thirdViewController = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdViewController, belowSubview: firstViewController)
        
        thirdViewController.transform = CGAffineTransformScale(thirdViewController.transform, 0.001, 0.001)
        
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstViewController.transform = CGAffineTransformScale(thirdViewController.transform, 0.001, 0.001)
            
            }) { (Finished) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    thirdViewController.transform = CGAffineTransformIdentity
                    
                    }, completion: { (Finished) -> Void in
                        
                        firstViewController.transform = CGAffineTransformIdentity
                        self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
                })
        }
    }
}