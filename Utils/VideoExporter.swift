//
//  VideoExporter.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import AVFoundation
import Photos
import UIKit

class VideoExporter: ObservableObject {
    @Published var exportProgress: Double = 0.0

    func exportVideo(with images: [UIImage], musicURL: URL?, completion: @escaping (URL?) -> Void) {
        // AVAssetWriter를 사용하여 이미지들을 비디오로 변환
        // 음악을 오버레이하고, 프로그레스 업데이트
        // 완성된 비디오를 Photos 라이브러리에 저장
    }
}
