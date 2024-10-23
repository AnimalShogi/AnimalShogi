//
//  PieceMovement.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

struct Position: Equatable {
    let row: Int
    let col: Int
}

func isValidMove(from: Position, to: Position, piece: Piece, board: GameBoard) -> Bool {
    let rowDiff = abs(from.row - to.row)
    let colDiff = abs(from.col - to.col)

    switch piece.type {
    case .lion:
        return rowDiff <= 1 && colDiff <= 1
    case .elephant:
        return (rowDiff == 1 && colDiff == 1)
    case .giraffe:
        return (rowDiff == 0 && colDiff == 1) || (rowDiff == 1 && colDiff == 0)
    case .chick:
        if piece.player == .player1 {
            return from.row + 1 == to.row && from.col == to.col
        } else {
            return from.row - 1 == to.row && from.col == to.col
        }
    case .hen:
        return rowDiff <= 1 && colDiff <= 1
    }
}
