//
//  LoginViewController.swift
//  Clonestagram
//
//  Created by Shridhar Sukhani on 1/27/19.
//  Copyright © 2019 Shridhar Sukhani. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {
    @IBOutlet weak var registerOrLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerOrLoginButton.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Finish this
    }
}
