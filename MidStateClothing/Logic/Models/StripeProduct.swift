//
//  StripeProduct.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/29/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation

struct StripeProduct: Decodable, Identifiable {
    let id = UUID()
    let productID: String
    let photoUrl: String
    let price: Int
    let productName: String
    let productSex: String
    
    // if my names don't match up to exactly what the API returns, I'll need a coding key
}
