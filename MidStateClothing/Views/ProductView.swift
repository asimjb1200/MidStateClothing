//
//  ProductView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/26/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    var productID: String = ""
    var photo: String = ""
    var price: Int = 0
    var productName: String = ""
    var height: CGFloat
    var width: CGFloat
    
    init(productID: String, photo: String, price: Int, name: String, height: CGFloat, width: CGFloat) {
        self.productID = productID
        self.photo = photo
        self.price = price
        self.productName = name
        self.height = height
        self.width = width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text(self.productName)
                        .padding()
                        Spacer()
                    Text("$\(self.price)")
                    .padding()
                }
                Image("women_tops")
                .resizable()
                    .frame(width: self.width, height: self.height)
                
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(productID: "test", photo: "women_tops", price: Int(23.50), name: "Basic MidState Tee", height: 50, width: 25.0)
    }
}
