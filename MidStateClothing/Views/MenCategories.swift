//
//  MenCategories.swift
//  MidStateClothing
//
//  Created by Asim Brown on 8/24/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct MenCategories: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                NavigationLink(destination: MenProducts()) {
                    Image("men_tshirts")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                }
                NavigationLink(destination: MenProducts()) {
                    Image("shorts")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .clipped()
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(leading:
                HStack {
                    Text("Men")
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

struct MenCategories_Previews: PreviewProvider {
    static var previews: some View {
        MenCategories()
    }
}
