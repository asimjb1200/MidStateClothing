//
//  SwiftUIView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/21/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    enum Action {
        case signUp, resetPW
    }
    
    @State private var showSheet = false
    @State private var action: Action?
    var body: some View {
        ZStack {
            Image("MS_Backdrop")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
// MARK: Email Log In View
            SignInWithEmailView(showSheet: $showSheet, action: $action)
                // now determine which view to show in the modal
                .sheet(isPresented: $showSheet){
                    if self.action == .signUp {
                        SignUpView()
                    } else {
                        ForgotPasswordView()
                    }
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
