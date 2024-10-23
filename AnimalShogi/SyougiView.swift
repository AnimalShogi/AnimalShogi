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
     @StateObject var game = Game()
    var body: some View {
        ZStack{
         BackGroundView()
                .padding(.bottom, 25)
            VStack{
                ButtonView()
            
                
                VStack(spacing: 1) {
                    ForEach(0..<4) { row in
                        HStack(spacing: 1) {
                            ForEach(0..<3) { col in
                                    
                                    CellView(piece: game.gameBoard.board[row][col])
                                        .onTapGesture {
                                            let position = Position(row: row, col: col)
                                            // 駒の移動処理
                                            if let selected = game.selectedPiecePosition {
                                                print("move", selected, position)
                                                _ = game.movePiece(to: position)
                                            } else {
                                                print("select", position)
                                                game.selectPiece(at: position)
                                            }
                                            //                                game.movePiece(to: position)
                                        
                                }
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
  
    let piece: Piece?
    var body: some View {
      
            
            if let piece = piece {
                Image(pieceDisplay(piece: piece))
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 10)
            }
        
    }
    func pieceDisplay(piece: Piece) -> String {
        switch piece.type {
        case .lion: return "lion"
        case .elephant: return "zou"
        case .giraffe: return "kirin"
        case .chick: return "hiyoko"
        case .hen: return "niwatori"
        }
    }
}

