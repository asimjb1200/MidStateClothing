//
//  HomeView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/22/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        NavigationView {
            Group {
            if googleDelegate.signedIn {
                Text("Logged in as \(GIDSignIn.sharedInstance().currentUser!.profile.name)")
                .navigationBarTitle("MidState Clothing")
                    .navigationBarItems(trailing: Button(action: {
                            GIDSignIn.sharedInstance().signOut()
                        self.googleDelegate.signedIn = false
                        }) {
                            Text("Sign Out")
                        })
            } else {
                Text("Logged in as \(userInfo.user.name)")
                .navigationBarTitle("MidState Clothing")
                    .navigationBarItems(trailing: Button("Log Out") {
                        FBAuth.logout { (result) in
                            print("Logged Out")
                        }
                    })
            }
            }

// MARK: Retrieve User From Firebase
                .onAppear {
                    // confirm if an authed user exists
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }// if it does exist, retrieve it and set local userInfo to it
                    FBFirestore.retrieveFBUser(uid: uid) { (result) in
                        switch result {
                        case .failure(let error):
                            print(error.localizedDescription)
                        case .success(let user):
                            self.userInfo.user = user
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
