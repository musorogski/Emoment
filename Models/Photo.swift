//
//  Photo.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

// Models/Photo.swift 파일 생성

import UIKit
import Photos

struct Photo: Identifiable {
    let id = UUID()
    let asset: PHAsset
    var uiImage: UIImage?

    init(asset: PHAsset, uiImage: UIImage? = nil) {
        self.asset = asset
        self.uiImage = uiImage
    }
}
