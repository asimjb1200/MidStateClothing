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
    // whenever this variable changes, publish the notify the views that use it to redraw
    @Published var mensShirts = [StripeProduct]()
    
    init() {
        getMenItems()
    }
    
    private func getMenItems() {
        // hit the URL and
        guard let url = URL(string: "http://localhost:3000/bags") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
                print("Reaching out to network")
                self.mensShirts = try! JSONDecoder().decode([StripeProduct].self, from: data!)
        }
        .resume()
    }
}

struct MenShirts: View {
    // subscribe to this object and watch for changes in it
    @ObservedObject var productVM = ProductViewModel()
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(self.productVM.mensShirts) { item in
                        ProductView(product: item, height: geometry.size.height/2, width: geometry.size.width)
                    }
                }
            }
        }
    }
}

struct MenProducts_Previews: PreviewProvider {
    static var previews: some View {
        MenShirts()
    }
}
