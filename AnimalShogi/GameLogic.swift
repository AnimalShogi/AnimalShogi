//
//  GameLogic.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

class Game: ObservableObject {
    @Published var gameBoard = GameBoard()
    @Published var currentPlayer: Player = .player1
    @Published var selectedPiecePosition: Position?
    
    func selectPiece(at position: Position) {
        if let piece = gameBoard.board[position.row][position.col], piece.player == currentPlayer {
            selectedPiecePosition = position
        } else  {
            selectedPiecePosition = nil
        }
    }
    
    func movePiece(to: Position) -> Bool {
        
        print("from", selectedPiecePosition)
        print("to", to)
        
        guard let selectedPiecePosition else {
            return false
        }
        guard let piece = gameBoard.board[selectedPiecePosition.row][selectedPiecePosition.col] else {
            return false // 駒がない
        }
        
        if piece.player != currentPlayer {
            return false // 自分の駒ではない
        }
        
        if to.row == selectedPiecePosition.row && to.col == selectedPiecePosition.col {
            self.selectedPiecePosition = nil
            return false
        }
        
        if isValidMove(from: selectedPiecePosition, to: to, piece: piece, board: gameBoard) {
            // 駒を移動させる
            gameBoard.board[to.row][to.col] = piece
            gameBoard.board[selectedPiecePosition.row][selectedPiecePosition.col] = nil
            self.selectedPiecePosition = nil
            
            // 勝利条件をチェックする（ライオンを取ったか）
            if let targetPiece = gameBoard.board[to.row][to.col], targetPiece.type == .lion {
                print("\(currentPlayer) wins!")
            }
            
            // プレイヤー交代
            currentPlayer = (currentPlayer == .player1) ? .player2 : .player1
            return true
        } else {
            return false // 不正な移動
        }
    }
}

