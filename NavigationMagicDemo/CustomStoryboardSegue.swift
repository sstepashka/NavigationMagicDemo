//
//  CustomStoryboardSegue.swift
//  NavigationMagicDemo
//
//  Created by Kuragin Dmitriy on 10/11/15.
//  Copyright © 2015 Kuragin Dmitriy. All rights reserved.
//

import UIKit

class CustomStoryboardSegue: UIStoryboardSegue {
    override func perform() {
        if let navigationController = sourceViewController.navigationController {
            CATransaction.begin()
            
            let window = UIApplication.sharedApplication().keyWindow!
            
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            transition.duration = 0.2
            transition.fillMode = kCAFillModeForwards
            transition.removedOnCompletion = true
            
            window.layer.addAnimation(transition, forKey: .None)
        
            navigationController.popToRootViewControllerAnimated(false)
            navigationController.pushViewController(self.destinationViewController, animated: false)
            
            CATransaction.commit()
            
        } else {
            fatalError("Not found navigation controller")
        }
    }
}
