//
//  SecondCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Bilal Arslan on 06/01/15.
//  Copyright (c) 2015 Bilal Arslan. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
   
    override func perform() {
        var firstViewController = self.destinationViewController.view as UIView!
        var thirdViewController = self.sourceViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        firstViewController.frame = CGRectOffset(firstViewController.frame, 0.0, screenHeight)
        firstViewController.transform = CGAffineTransformScale(firstViewController.transform, 0.001, 0.001)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstViewController, aboveSubview: thirdViewController)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            thirdViewController.transform = CGAffineTransformScale(thirdViewController.transform, 0.001, 0.001)
            thirdViewController.frame = CGRectOffset(thirdViewController.frame, 0.0, -screenHeight)
            
            firstViewController.transform = CGAffineTransformIdentity
            firstViewController.frame = CGRectOffset(firstViewController.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
}
