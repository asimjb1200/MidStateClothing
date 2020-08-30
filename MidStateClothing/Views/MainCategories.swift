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
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    
    init(category: String, photo: String, width: CGFloat, height: CGFloat) {
        self.category = category
        self.photo = photo
        self.width = width
        self.height = height
    }
    var body: some View {

                Image(self.photo)
                    .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.width, height: self.height)
                        .clipped()
        
        }
    
}

struct MainCategories_Previews: PreviewProvider {
    static var previews: some View {
        MainCategories(category: "Women", photo: "womenMerch", width: 440, height: 300)
    }
}
