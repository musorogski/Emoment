//
//  Untitled.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import AVFoundation

class MusicManager: ObservableObject {
    @Published var musicList: [BackgroundMusic] = []

    init() {
        loadDefaultMusic()
    }

    private func loadDefaultMusic() {
        // 로열티 프리 음악을 감정별로 로드
        musicList = [
            BackgroundMusic(title: "Happy Moment", fileName: "happy_moment", emotion: .happy),
            BackgroundMusic(title: "Exciting Moment", fileName: "exciting_moment", emotion: .excited),
            // 추가 음악들...
        ]
    }

    func importCustomMusic(url: URL) {
        // 사용자가 선택한 음악을 앱으로 가져오는 로직 구현
    }
}
