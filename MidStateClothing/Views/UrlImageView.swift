//
//  UrlImageView.swift
//  MidStateClothing
//
//  Created by Asim Brown on 9/1/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import SwiftUI

struct UrlImageView <Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    var width: CGFloat
    private let placeholder: Placeholder?

    init(width: CGFloat, url: String, placeholder: Placeholder? = nil, cache: ImageCache? = nil) {
        loader = ImageLoader(url: url, cache: cache)
        self.width = width
        self.placeholder = placeholder
    }
    
    var body: some View {
//        Image(uiImage: UrlImageView.defaultImage!)
//            .resizable()
//            .scaledToFit()
//        .frame(width: self.width, height: 300)
//            .aspectRatio(contentMode: .fill)
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }

}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(width: 300, url: "https://files.stripe.com/links/fl_test_ewgnyyjInsUfuf5T1YJCI55d", placeholder: Text("Loading..."))
    }
}
