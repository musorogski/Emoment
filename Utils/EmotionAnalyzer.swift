//
//  EmotionAnalyzer.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//
import UIKit
import Vision

class EmotionAnalyzer {
    static let shared = EmotionAnalyzer()

    func analyzeEmotion(from image: UIImage, completion: @escaping (EmotionType?) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(nil)
            return
        }

        let request = VNRecognizeEmotionsRequest { request, error in
            if let error = error {
                print("감정 인식 중 오류 발생: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let results = request.results as? [VNRecognizedEmotionObservation], let emotionObservation = results.first else {
                completion(nil)
                return
            }

            // 가장 높은 감정 추출
            let primaryEmotion = emotionObservation.emotionScores.max { a, b in a.value < b.value }
            if let emotionIdentifier = primaryEmotion?.key, let emotionType = EmotionType(rawValue: emotionIdentifier) {
                completion(emotionType)
            } else {
                completion(nil)
            }
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global().async {
            do {
                try handler.perform([request])
            } catch {
                print("이미지 처리 중 오류 발생: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
