//
//  BackGroundView.swift
//  AnimalShogi
//
//  Created by saki on 2024/10/23.
//

import SwiftUI

struct BackGroundView: View {
    var body: some View {
        VStack(spacing: 6) {
            ForEach(0..<4) { row in
                HStack(spacing: 3) {
                    ForEach(0..<3) { col in
                        Rectangle()
                            .fill(Color.yellow.opacity(0.3))
                            .frame(width: 100, height: 100)
                    }
                }
            }
            
        }
      
    }
}

#Preview {
    BackGroundView()
}
