//
//  EmonmentApp.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import SwiftUI

@main
struct EmonmentApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark) // 다크 모드 기본 설정
        }
    }
}
