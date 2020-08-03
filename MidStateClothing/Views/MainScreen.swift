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
        NavigationView {
            VStack(spacing: 10) {
                ForEach(categoryArray, id: \.self) { category in
                    NavigationLink(destination: ResultView(choice: category.name)) {
                        MainCategories(category: category.name, photo: category.photo)
                    }
                }
            }
            .navigationBarTitle("Mid$tate Clothing")
        }
    }
}

struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct CategoryHolder: Hashable {
    var name: String!
    var photo: String!
    let clothingTypes = ["Tops", "Bottoms"]

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
