//
//  SlideShowView.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//
import SwiftUI
import Photos

struct SlideShowView: View {
    let selectedGroup: PHAssetCollection
    let selectedEmotion: EmotionType
    @State private var photos: [UIImage] = []
    @State private var currentIndex = 0
    @State private var isPlaying = true
    @State private var transition: AnyTransition = .opacity
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            if !photos.isEmpty {
                Image(uiImage: photos[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .transition(transition)
            } else {
                Text("사진이 없습니다.")
            }
        }
        .onAppear {
            fetchPhotos()
        }
        .onReceive(timer) { _ in
            if isPlaying {
                withAnimation {
                    currentIndex = (currentIndex + 1) % photos.count
                }
            }
        }
        .onTapGesture {
            isPlaying.toggle()
        }
        .navigationBarItems(trailing: Button("내보내기") {
            // 비디오로 내보내기 구현
        })
    }

    func fetchPhotos() {
        let assets = PHAsset.fetchAssets(in: selectedGroup, options: nil)
        let imageManager = PHCachingImageManager()
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat

        assets.enumerateObjects { (asset, _, _) in
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 1920, height: 1080), contentMode: .aspectFit, options: options) { image, _ in
                if let image = image {
                    EmotionAnalyzer.shared.analyzeEmotion(from: image) { emotion in
                        if emotion == selectedEmotion {
                            DispatchQueue.main.async {
                                photos.append(image)
                            }
                        }
                    }
                }
            }
        }
    }
}
