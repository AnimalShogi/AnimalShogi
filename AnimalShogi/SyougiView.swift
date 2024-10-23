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
            
            VStack{
                Text("\(game.currentPlayer == .player1 ? "先手" : "後手")の番です")
                              .font(.headline)
                              .padding()
                
                VStack(spacing: 1) {
                    ForEach(0..<4) { row in
                        HStack(spacing: 1) {
                            ForEach(0..<3) { col in
                                
                                CellView(piece: game.gameBoard.board[row][col],
                                         isSelected: game.selectedPiecePosition == Position(row: row, col: col))
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
                                       
                                    }
                                
                            }
                        }
                    }
                }
                
                
            }
            .padding(.horizontal,100)
            
            
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

#Preview {
    SyougiView()
}

struct CellView: View {
    
    let piece: Piece?
    let isSelected: Bool
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(isSelected ? Color.blue.opacity(0.3) : Color.yellow.opacity(0.3))
                .frame(width: 100, height: 100)
            
            if let piece = piece {
                Image(pieceDisplay(piece: piece))
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 10)
                    .rotationEffect(piece.player == .player1 ? .degrees(180) : .degrees(0))
            }
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

