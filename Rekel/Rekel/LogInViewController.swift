//
//  LogInViewController.swift
//  Rekel
//
//  Created by Chris Kong on 7/6/15.
//  Copyright (c) 2015 Rekel Team. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController
{
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var testObject = PFObject(className: "TestObject")
    testObject["foo"] = "test"
    testObject.saveInBackground()
  }
  

}