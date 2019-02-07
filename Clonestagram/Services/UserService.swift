//
//  UserService.swift
//  Clonestagram
//
//  Created by Shridhar Sukhani on 1/28/19.
//  Copyright © 2019 Shridhar Sukhani. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        let ref = Database.database().reference().root.child("users").child(firUser.uid)
        ref.setValue(userAttrs, withCompletionBlock: { (error, dbRef) in
            if let error = error {
                assertionFailure("Error in UserService.create(:username:completion): \(error.localizedDescription)")
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                return completion(User(snapshot: snapshot))
            })
        })
    }
    
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().root.child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            completion(User(snapshot: snapshot))
        })
    }
}
