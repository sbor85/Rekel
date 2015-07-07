//
//  LogInViewController.swift
//  Rekel
//
//  Created by Chris Kong on 7/6/15.
//  Copyright (c) 2015 Rekel Team. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LogInViewController: UIViewController
{
  var dictionary: NSDictionary!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func fbLoginButtonClicked(sender: UIButton)
  {
    var fbLoginManager: FBSDKLoginManager = FBSDKLoginManager()
    // var permissions = ["public_profile", "email", "user_friends"]
    fbLoginManager.logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
      if (error == nil) {
        var fbLoginResult: FBSDKLoginManagerLoginResult = result
        if (fbLoginResult.grantedPermissions.contains("email"))
        {
          self.getFBUserData()
          fbLoginManager.logOut()
        }
      }
    })
  }
  
  func getFBUserData() {
    if((FBSDKAccessToken.currentAccessToken()) != nil) {
      FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
        if (error == nil) {
          self.dictionary = result as! NSDictionary
          println(result)
          println(self.dictionary)
          NSLog(self.dictionary.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as! String)
        }
      })
    }
  }

}