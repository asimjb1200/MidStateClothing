//
//  WebService.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/31/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation

class WebService {
    func getMenItems(completion: @escaping ([StripeProduct]) -> ()) {
        // hit the URL and
        guard let url = URL(string: "http://127.0.0.1:3000/bags") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // return the data asynchronously so that the call doesn't have to complete before loading the UI
            DispatchQueue.main.async {
                print("Reaching out to network")
                let products = try! JSONDecoder().decode([StripeProduct].self, from: data!)
                completion(products)
            }
        }
    .resume()
    }
}
