//
//  PhotoCell.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

// Views/PhotoCell.swift 파일 생성

import SwiftUI
import Photos

struct PhotoCell: View {
    let photo: Photo

    var body: some View {
        if let image = photo.uiImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
        } else {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 100, height: 100)
        }
    }
}
