//
//  HomeScreen.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/30/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var categoryArray: [CategoryHolder] = [CategoryHolder(name: "Women", photo: "stockModel"), CategoryHolder(name: "Men", photo: "stockModel2"), CategoryHolder(name: "Accessories", photo: "accessories")]
    // var category = CategoryHolder(name: "Women", photo: "stockModel")
    
    
    var body: some View {
        VStack {
            ForEach(categoryArray, id: \.self) { category in
                
                MainCategories(category: category.name, photo: category.photo)
            }
    }
    }
}

class CategoryHolder {
    var name: String!
    var photo: String!

    init(name:String, photo:String) {
        self.name = name
        self.photo = photo
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
