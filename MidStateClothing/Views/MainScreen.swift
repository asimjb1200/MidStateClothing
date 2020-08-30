//
//  HomeScreen.swift
//  MidStateClothing
//
//  Created by Asim Brown on 7/30/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    @State var products: [StripeProduct] = []
    
    var body: some View {
        GeometryReader{ geometry in
        NavigationView {
            VStack() {
                NavigationLink(destination: WomenCategories()) {
                    
                        MainCategories(category: "Women", photo: "womenMerch", width: geometry.size.width, height: geometry.size.height/3)
                    
                }
                NavigationLink(destination: MenCategories()) {
                    
                        MainCategories(category: "Men", photo: "menMerch1", width: geometry.size.width, height: geometry.size.height/3)
                    
                }
                NavigationLink(destination: MenCategories()) {
                    
                        MainCategories(category: "Accessories", photo: "accessories4", width: geometry.size.width, height: geometry.size.height/3)
                    
                }
            }
                
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(leading:
                    HStack {
                        Image("midstate_noBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 180,  alignment: .bottomLeading)
//                            .padding(UIScreen.main.bounds.size.width)
                    }
                    ,trailing:
                    HStack {
                        Button(action: {
                        }) {
                            Image(systemName: "cart")
                            }.foregroundColor(Color.black)
                    }
            )
        }
        }
        .onAppear {
            GetProductData.singleton.getMenItems { (products) in
                self.products = products
                print(self.products)
            }
        }
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
