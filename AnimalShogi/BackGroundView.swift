//
//  BackGroundView.swift
//  AnimalShogi
//
//  Created by saki on 2024/10/23.
//

import SwiftUI

struct BackGroundView: View {
    var body: some View {
        Image("playboard")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    BackGroundView()
}
