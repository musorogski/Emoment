//
//  Untitled.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import Foundation

enum EmotionType: String, CaseIterable {
    case anger = "Anger"
    case contempt = "Contempt"
    case disgust = "Disgust"
    case fear = "Fear"
    case happiness = "Happiness"
    case neutral = "Neutral"
    case sadness = "Sadness"
    case surprise = "Surprise"

    var description: String {
        switch self {
        case .anger:
            return "화남"
        case .contempt:
            return "경멸"
        case .disgust:
            return "혐오"
        case .fear:
            return "두려움"
        case .happiness:
            return "행복"
        case .neutral:
            return "중립"
        case .sadness:
            return "슬픔"
        case .surprise:
            return "놀람"
        }
    }
}
