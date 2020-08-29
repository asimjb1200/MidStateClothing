//
//  WomenCategories.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/24/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct WomenCategories: View {
    var body: some View {
            GeometryReader{ geometry in
                VStack {
                    Image("women_tops")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .edgesIgnoringSafeArea(.bottom)
                    Image("women_bottoms")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .edgesIgnoringSafeArea(.bottom)
                        
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading:
                        HStack {

                            Text("Women")
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
}

struct WomenCategories_Previews: PreviewProvider {
    static var previews: some View {
        WomenCategories()
    }
}
