//
//  FaceGroupSelectionView.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import SwiftUI
import Photos

struct FaceGroupSelectionView: View {
    @State private var faceGroups: [PHAssetCollection] = []
    @State private var selectedGroup: PHAssetCollection?
    @State private var groupName: String = ""
    @State private var navigateToEmotionSelection = false

    var body: some View {
        VStack {
            Text("다음 중 작업할 인물을 선택하세요")
                .font(.headline)
                .padding()

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(faceGroups, id: \.localIdentifier) { group in
                        Button(action: {
                            selectedGroup = group
                        }) {
                            FaceGroupView(collection: group)
                        }
                    }
                }
            }

            if selectedGroup != nil {
                TextField("이름을 입력하세요", text: $groupName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                NavigationLink(destination: EmotionSelectionView(selectedGroup: selectedGroup!, groupName: groupName), isActive: $navigateToEmotionSelection) {
                    Button(action: {
                        navigateToEmotionSelection = true
                    }) {
                        Text("다음")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            requestPhotoLibraryAccess()
        }
    }

    func requestPhotoLibraryAccess() {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                faceGroups = fetchFaceGroups()
            } else {
                // 권한이 없을 때 처리
            }
        }
    }

    func fetchFaceGroups() -> [PHAssetCollection] {
        let options = PHFetchOptions()
        let faceAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: options)

        var faceGroups: [PHAssetCollection] = []
        faceAlbums.enumerateObjects { (collection, _, _) in
            if collection.assetCollectionSubtype == .smartAlbumUserLibrary {
                faceGroups.append(collection)
            }
        }

        return faceGroups
    }
}

struct FaceGroupView: View {
    let collection: PHAssetCollection
    @State private var image: UIImage? = nil

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(40)
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 80, height: 80)
            }
        }
        .onAppear {
            fetchRepresentativeImage(for: collection) { img in
                image = img
            }
        }
    }

    func fetchRepresentativeImage(for collection: PHAssetCollection, completion: @escaping (UIImage?) -> Void) {
        let assets = PHAsset.fetchAssets(in: collection, options: nil)
        guard let asset = assets.firstObject else {
            completion(nil)
            return
        }

        let imageManager = PHCachingImageManager()
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat

        imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: options) { image, _ in
            completion(image)
        }
    }
}
