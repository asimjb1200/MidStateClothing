//
//  HomeScreen.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/30/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct MainCategories: View {
    var category: String = ""
    var photo: String = ""
    
    init(category: String, photo: String) {
        self.category = category
        self.photo = photo
    }
    var body: some View {
       ZStack {
        Image(self.photo)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 200)
        
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(self.category)
                .padding(.vertical, 15)
                .frame(width: 200)
                .font(.largeTitle)
                .background(Color.white)
                .cornerRadius(25)
                .foregroundColor(.green)
                .opacity(0.75)
                .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.green, lineWidth: 5)
                )
            }
        }
    }
}

struct MainCategories_Previews: PreviewProvider {
    static var previews: some View {
        MainCategories(category: "Women", photo: "stockModel")
    }
}
