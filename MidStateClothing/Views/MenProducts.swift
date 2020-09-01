//
//  MenProducts.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/30/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    // event that will give me the product view model
    var didChange = PassthroughSubject<ProductViewModel, Never>()
    
    // whenever this variable changes, publish the notify the views that use it to redraw
    var mensProducts = [StripeProduct]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        getMenItems()
    }
    
    func getMenItems() {
        WebService().getMenItems { products in
            self.mensProducts = products
        }
    }
}

struct MenProducts: View {
    // subscribe to this object and watch for changes in it
    @ObservedObject var productVM = ProductViewModel()
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(self.productVM.mensProducts) { item in
                        ProductView(productID: item.productID, photo: "menMerch", price: item.price, name: item.productName, height: geometry.size.height/2, width: geometry.size.width)
                    }
                }
            }
        }
        .onAppear(perform: self.productVM.getMenItems)
    }
}

struct MenProducts_Previews: PreviewProvider {
    static var previews: some View {
        MenProducts()
    }
}
