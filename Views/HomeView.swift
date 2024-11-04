//
//  HomeView.swift
//  Emoment
//
//  Created by paul_k on 11/4/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Emonment")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: SearchView()) {
                    Text("새 슬라이드쇼 만들기")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
