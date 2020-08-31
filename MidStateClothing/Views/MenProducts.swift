//
//  MenProducts.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/30/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var test = "Message to Display"
//    @Published var womensProducts: [StripeProduct] = []
    @Published var mensProducts: [StripeProduct] = []
    let stripeKey = ""
        
    static let singleton = ProductViewModel()
    
    private init() {
        
    }
    
//    completion: @escaping ([StripeProduct]) -> ()
    func getMenItems() {
//        if self.mensProducts.isEmpty {
//
//        }
        // hit the URL and
        guard let url = URL(string: "http://127.0.0.1:3000/bags") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            // return the data asynchronously so that the call doesn't have to complete before loading the UI
            DispatchQueue.main.async {
//                completion(products)
                self.mensProducts = try! JSONDecoder().decode([StripeProduct].self, from: data!)
            }
        }
    .resume()
    }
}

struct MenProducts: View {
    @ObservedObject var productVM = ProductViewModel.singleton
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                ScrollView {
            ForEach(self.productVM.mensProducts) { item in
//                Text(item.productID)
                ProductView(productID: item.productID, photo: "menMerch", price: item.price, name: item.productName, height: geomtry.size.height/4, width: geomtry.size.width)
            }
                }

            }
        }
        .onAppear {
            ProductViewModel.singleton.getMenItems()
        }
    }
}

struct MenProducts_Previews: PreviewProvider {
    static var previews: some View {
        MenProducts()
    }
}
