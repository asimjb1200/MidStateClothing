//
//  ProductDetailView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 9/1/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    var product: StripeProduct
    
    var body: some View {
        GeometryReader { geometry in
            Text("Hey")
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(leading:
            HStack {
                Text(product.productName)
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

struct ProductDetailView_Previews: PreviewProvider {

    static var previews: some View {
        ProductDetailView(product: StripeProduct(productID: "test", photoUrl: "https://files.stripe.com/links/fl_test_ewgnyyjInsUfuf5T1YJCI55d", price: 20, productName: "Asim", productSex: "Male"))
    }
}
