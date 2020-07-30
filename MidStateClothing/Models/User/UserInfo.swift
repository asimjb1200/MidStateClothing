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
        // this listener will observe for the life of the app, when isAuthed is changed it will refresh views using it
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            // check if the user exists
            print("Auth State Event")
            guard let _ = user else {
                print("Auth State Event: no user")
                self.isAuthed = .signedOut // if no user, must be signed out
                return
            }
            print("Auth State Event: User Found")

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
