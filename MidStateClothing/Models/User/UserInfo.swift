//
//  Register.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/21/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation
import FirebaseAuth

// I want to be able to observe changes in the user state, so it'll be an observable object
class UserInfo: ObservableObject {
    enum FBAuthState {
        // the 3 possible user states
        case undefined, signedOut, signedIn
    }
    
    // announce to all views using this object when changes are made, and refresh those views
    @Published var isAuthed: FBAuthState = .undefined
    @Published var user: FBUser = .init(uid: "", name: "", email: "")
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    func configureFirebaseStateDidChange() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard let _ = user else {
                self.isAuthed = .signedOut
                return
            }
            self.isAuthed = .signedIn
//            FBFirestore.retrieveFBUser(uid: user.uid) { (result) in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
    }
}
