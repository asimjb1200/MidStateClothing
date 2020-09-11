//
//  ProductDetailView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 9/1/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct SizeView: View {
    @Binding var size: String
    @Binding var showSizeView: Bool
    
    var body: some View {
        Button("Size:") {
            self.size = "M"
        }
    }
}

struct QuantityView: View {
    @Binding var qty: Int
    @Binding var showQtyView: Bool
    
    var body: some View {
        Text("Quantity View")
    }
}

struct ProductDetailView: View {
    var product: StripeProduct
    @State var showSizeView = false
    @State var showQtyView = false
    @State var size: String = ""
    @State var qty: Int = 1
    
    init(product: StripeProduct) {
        self.product = product
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ProductView(product: self.product, height: geometry.size.height/2, width: geometry.size.width)
                Divider()
                HStack(spacing: 200) {
                    Button("Size: \(self.size)") {
                        self.showSizeView.toggle()
                    }
                    .sheet(isPresented: self.$showSizeView) {
                        SizeView(size: self.$size)
                    }
                    
                    Button("Quantity: \(self.qty)") {
                        self.showQtyView.toggle()
                    }
                    .sheet(isPresented: self.$showQtyView) {
                        QuantityView(qty: self.$qty)
                    }
                }
            }
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
