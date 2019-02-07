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
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User
class LoginViewController: UIViewController {
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
        
        guard let firUser = authDataResult?.user else {
            print("No User Available")
            return
        }
        
        UserService.show(forUID: firUser.uid, completion: { (user) in
            guard let user = user else {
                self.performSegue(withIdentifier: Constants.Segues.toCreateUsername, sender: LoginViewController.self)
                return
            }
            let viewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = viewController
            self.view.window?.makeKeyAndVisible()
            User.setCurrent(user: user, writeToUserDefaults: true)
        })
    }
}
