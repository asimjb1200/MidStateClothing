//
//  HomeView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/22/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView {
            Text("Logged in as user")
            .navigationBarTitle("MidState Clothing")
                .navigationBarItems(trailing: Button("Log Out") {
                    self.userInfo.isAuthed = .signedOut
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
