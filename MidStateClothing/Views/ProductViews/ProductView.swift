//
//  ProductView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/26/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.imageCache) var cache: ImageCache
    var product: StripeProduct
    var height: CGFloat
    var width: CGFloat
    
    init(product: StripeProduct, height: CGFloat, width: CGFloat) {
        self.product = product
        self.height = height
        self.width = width
    }
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(self.product.productName)
                    .padding()
                    Spacer()
                    Text("$\(self.product.price)")
                    .padding()
                }
                UrlImageView(width: self.width, url: product.photoUrl, placeholder: Text("Loading..."), cache: cache).aspectRatio(contentMode: .fit)
            }
        }.frame(width: self.width, height: self.height)
        
        
        }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: StripeProduct(productID: "test", photoUrl: "https://files.stripe.com/links/fl_test_ewgnyyjInsUfuf5T1YJCI55d", price: 20, productName: "test", productSex: "male"), height: 300, width: 400.0)
    }
}
