//
//  EmotionSelectionView.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import SwiftUI
import Photos

struct EmotionSelectionView: View {
    let selectedGroup: PHAssetCollection
    let groupName: String
    @State private var selectedEmotion: EmotionType?
    @State private var navigateToSlideShow = false

    var body: some View {
        VStack {
            Text("\(groupName)의 어떤 감정을 선택하시겠습니까?")
                .font(.headline)
                .padding()

            List(EmotionType.allCases, id: \.self) { emotion in
                Button(action: {
                    selectedEmotion = emotion
                    navigateToSlideShow = true
                }) {
                    Text(emotion.description)
                }
            }

            NavigationLink(destination: SlideShowView(selectedGroup: selectedGroup, selectedEmotion: selectedEmotion!), isActive: $navigateToSlideShow) {
                EmptyView()
            }
        }
    }
}
