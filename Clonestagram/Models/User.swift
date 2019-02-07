//
//  User.swift
//  Clonestagram
//
//  Created by Shridhar Sukhani on 1/28/19.
//  Copyright © 2019 Shridhar Sukhani. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRAuth
import FirebaseDatabase.FIRDatabase

class User: Codable {
    let uid: String
    let username: String
    
    private static var _current: User?
    
    static var current: User {
        guard let user = _current else {
            fatalError("Error: Current User does not exist")
        }
        return user
    }
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let userDict = snapshot.value as? [String: Any], let username = userDict["username"] as? String else {
            return nil
        }
        self.uid = snapshot.key
        self.username = username
    }
    
    static func setCurrent(user: User, writeToUserDefaults: Bool = false) {
        _current = user
        
        if writeToUserDefaults {
            if let userData = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(userData, forKey: Constants.UserDefaults.currentUser)
            }
        }
    }
}
