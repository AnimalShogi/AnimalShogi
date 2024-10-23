//
//  SyougiView.swift
//  AnimalShogi
//
//  Created by saki on 2024/10/23.
//

import SwiftUI

struct SyougiView: View {
    var body: some View {
        ZStack{
            BackGroundView()
            VStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 40)
            }
            .padding(.top, 630)
         

        }
    }
}

#Preview {
    SyougiView()
}
