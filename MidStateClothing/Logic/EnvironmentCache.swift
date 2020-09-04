//
//  EnvironmentCache.swift
//  MidStateClothing
//
//  Created by Asim Brown on 9/3/20.
//  Copyright © 2020 Tech World Solutions. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
