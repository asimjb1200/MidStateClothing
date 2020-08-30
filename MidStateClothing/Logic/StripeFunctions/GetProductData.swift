//
//  GetProductData.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/29/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation

class GetProductData{
//    let womensProducts: [StripeProduct]
//    let mensProducts: [StripeProduct]
    let stripeKey = ""
    
    static let singleton = GetProductData()
    
//    private init() {
//        // hit the url and retrieve the men and women's clothing items
//    }
    
    func getMenItems(completion: @escaping ([StripeProduct]) -> ()) {
        // hit the URL and
        guard let url = URL(string: "http://127.0.0.1:3000/bags") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let products = try! JSONDecoder().decode([StripeProduct].self, from: data!)
            
            // return the data asynchronously so that the call doesn't have to complete before loading the UI
            DispatchQueue.main.async {
                completion(products)
            }
        }
    .resume()
    }
}
