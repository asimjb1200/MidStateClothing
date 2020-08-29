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
    var price: NSNumber = 0
    var productName: String = ""
    
    init(productID: String, photo: String, price: NSNumber, name: String) {
        self.productID = productID
        self.photo = photo
        self.price = price
        self.productName = name
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
                    .frame(width: geometry.size.width, height: geometry.size.height/2)
                
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(productID: "test", photo: "women_tops", price: 23.50, name: "Basic MidState Tee")
    }
}
