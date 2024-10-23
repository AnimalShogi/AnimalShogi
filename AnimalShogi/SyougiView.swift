//
//  SyougiView.swift
//  AnimalShogi
//
//  Created by saki on 2024/10/23.
//

import SwiftUI

struct SyougiView: View {
    let boardRows = 4
    let boardCols = 3
    var body: some View {
        ZStack{
            //    BackGroundView()
            VStack{
                
                ButtonView()
                
                
                VStack(spacing: 1) {
                    ForEach(0..<4) { row in
                        HStack(spacing: 1) {
                            ForEach(0..<3) { col in
                                CellView()
                            }
                        }
                    }
                }
                
                ButtonView()
                    .padding(.top,30)
            }
               
                
            }
        }
    }

struct ButtonItemView: View {
    var body: some View {
        Circle()
            .fill(Color.gray)
            .frame(width: 42)
           
    }
}

struct ButtonView: View{
    var body: some View {
        ZStack{
            //左下
            ZStack{
                ButtonItemView()
                Text("")
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                
            }
            .padding(.top,  100)
            .padding(.leading, 100)
            
            //右上
            ZStack{
                ButtonItemView()
                Text("")
                    .foregroundStyle(.white)
            }
            .padding(.bottom,  100)
            .padding(.leading, 100)
            .onTapGesture {
                
            }
            //左下
            ZStack{
                ButtonItemView()
                Text("")
                    .foregroundStyle(.white)
            }
            .padding(.top,  100)
            .padding(.trailing, 100)
            .onTapGesture {
                
            }
            
            //左上
            ZStack{
                ButtonItemView()
                Text("")
                    .foregroundStyle(.white)
            }
            .padding(.bottom,  100)
            .padding(.trailing, 100)
            .onTapGesture {
                
            }
            
            VStack{
                ZStack{
                    ButtonItemView()
                    Text("↑")
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    
                }
                
                HStack{
                    
                    ZStack{
                        ButtonItemView()
                        Text("←")
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 50)
                    .onTapGesture {
                        
                    }
                    ZStack{
                        ButtonItemView()
                        Text("→")
                            .foregroundStyle(.white)
                    }
                    .onTapGesture {
                        
                    }
                    
                }
                ZStack{
                    ButtonItemView()
                    Text("↓")
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
  
    
   
}
#Preview {
    SyougiView()
}

struct CellView: View {
    //   let piece: AnimalShogiGame.BoardPiece
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow.opacity(0.3))
                .frame(width: 100, height: 100)
            
            //            if piece.piece != .none {
            //                Text(piece.piece.image)
            //                    .font(.system(size: 40))
            //                    .rotationEffect(piece.player == .second ? .degrees(180) : .degrees(0))
            //            }
        }
    }
}




















