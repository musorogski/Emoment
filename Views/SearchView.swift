//
//  Untitled.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import SwiftUI
import Photos

struct SearchView: View {
    @State private var searchText = ""
    @State private var photos: [Photo] = []

    var body: some View {
        VStack {
            TextField("검색어를 입력하세요", text: $searchText, onCommit: {
                performSearch()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            List(photos) { photo in
                // PhotoCell을 사용하여 사진 표시
                PhotoCell(photo: photo)
            }
        }
    }

    private func performSearch() {
        // 검색 로직 구현
        // EmotionAnalyzer와 FaceRecognizer를 사용하여 사진 필터링
    }
}
