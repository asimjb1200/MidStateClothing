//
//  SignInWithGoogle.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/26/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI
import UIKit
import GoogleSignIn
import FirebaseAuth

struct SignInWithGoogle: View {
    var body: some View {
        Button(action: {
            
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }) {
            Text("Sign In With Google")
            .padding(.vertical, 15)
            .frame(width: 200)
            .background(Color.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
        }
    }
}

struct SignInWithGoogle_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogle()
    }
}
