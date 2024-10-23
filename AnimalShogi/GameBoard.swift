//
//  GameBoard.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

enum PieceType {
    case lion, elephant, giraffe, chick, hen
}

enum Player {
    case player1, player2
}

struct Piece {
    let type: PieceType
    let player: Player
}

struct GameBoard {
    var board: [[Piece?]] = Array(repeating: Array(repeating: nil, count: 3), count: 4)

    init() {
        // プレイヤー1の駒配置
        board[0][0] = Piece(type: .giraffe, player: .player1)
        board[0][1] = Piece(type: .lion, player: .player1)
        board[0][2] = Piece(type: .elephant, player: .player1)
        board[1][1] = Piece(type: .chick, player: .player1)

        // プレイヤー2の駒配置
        board[3][0] = Piece(type: .elephant, player: .player2)
        board[3][1] = Piece(type: .lion, player: .player2)
        board[3][2] = Piece(type: .giraffe, player: .player2)
        board[2][1] = Piece(type: .chick, player: .player2)
    }
}
