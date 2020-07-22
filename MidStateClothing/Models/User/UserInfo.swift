//
//  Register.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/21/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation

// I want to be able to observe changes in the user state, so it'll be an observable object
class UserInfo: ObservableObject {
    enum FBAuthState {
        // the 3 possible user states
        case undefined, signedOut, signedIn
    }
    
    // announce to all views using this object when changes are made, and refresh those views
    @Published var isAuthed: FBAuthState = .undefined
    
    func configureFirebaseStateDidChange() {
        self.isAuthed = .signedOut
//        self.isAuthed = .signedIn
    }
}
