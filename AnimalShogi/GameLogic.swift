//
//  GameLogic.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

class Game {
    var gameBoard = GameBoard()
    var currentPlayer: Player = .player1
    
    func movePiece(from: Position, to: Position) -> Bool {
        guard let piece = gameBoard.board[from.row][from.col] else {
            return false // 駒がない
        }
        
        if piece.player != currentPlayer {
            return false // 自分の駒ではない
        }
        
        if isValidMove(from: from, to: to, piece: piece, board: gameBoard) {
            // 駒を移動させる
            gameBoard.board[to.row][to.col] = piece
            gameBoard.board[from.row][from.col] = nil
            
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

