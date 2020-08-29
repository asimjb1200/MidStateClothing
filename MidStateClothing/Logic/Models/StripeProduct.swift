//
//  StripeProduct.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/29/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation

struct StripeProduct: Codable {
    let productID: String
    let price: Int
    let productName: String
    let productSex: String
}