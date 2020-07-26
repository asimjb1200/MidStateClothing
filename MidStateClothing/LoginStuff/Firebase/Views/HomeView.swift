//
//  HomeView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/22/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView {
            Text("Logged in as \(userInfo.user.name)")
            .navigationBarTitle("MidState Clothing")
                .navigationBarItems(trailing: Button("Log Out") {
                    FBAuth.logout { (result) in
                        print("Logged Out")
                    }
                })
                .onAppear {
                    guard let uid = Auth.auth().currentUser?.uid else {
                        return
                    }
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
