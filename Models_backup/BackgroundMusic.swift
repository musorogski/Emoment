//
//  Untitled.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import Foundation

struct BackgroundMusic: Identifiable {
    let id = UUID()
    let title: String
    let fileName: String
    let emotion: EmotionType
}
