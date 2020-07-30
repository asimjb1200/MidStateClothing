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
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        Group {

            if userInfo.isAuthed == .undefined {
                Text("Loading...")
            } else if userInfo.isAuthed == .signedOut && googleDelegate.signedIn == false {
                LoginView()
            } else {
                HomeView()
            }
        }
        // this runs as soon as content view appears
        .onAppear {
            // listen for any changes to auth state
            self.userInfo.configureFirebaseStateDidChange()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
