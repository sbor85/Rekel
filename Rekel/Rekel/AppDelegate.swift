//
//  AppDelegate.swift
//  Rekel
//
//  Created by Chris Kong on 7/6/15.
//  Copyright (c) 2015 Rekel Team. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    Parse.enableLocalDatastore()
    Parse.setApplicationId("NRgDzDvBmjTxMoYuWn4VAunsbCoVaWWOUp7N5RzS", clientKey: "3hXLnFilERaD5tIKCclLvuDY3E7FMirElcHufu6o")
    
    return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func applicationWillResignActive(application: UIApplication) {
    
    FBSDKAppEvents.activateApp()
  }
  
  func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
    
    return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
  }

}