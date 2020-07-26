//
//  ContentView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/20/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // grab the user from the environment
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Group {
            if userInfo.isAuthed == .undefined {
                Text("Loading...")
            } else if userInfo.isAuthed == .signedOut {
                LoginView()
            } else {
                HomeView()
            }
        }
        // this runs as soon as content view appears
        .onAppear {
            // change the isAuthed in user from undefined to signed out
            self.userInfo.configureFirebaseStateDidChange()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
