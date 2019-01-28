//
//  LoginViewController.swift
//  Clonestagram
//
//  Created by Shridhar Sukhani on 1/27/19.
//  Copyright © 2019 Shridhar Sukhani. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth

typealias FIRUser = FirebaseAuth.User
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
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI() else {
            return
        }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        print("Handle User Sign Up/Log In")
    }
}
