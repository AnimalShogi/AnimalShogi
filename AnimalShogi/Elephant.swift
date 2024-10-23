//
//  Elephant.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

class Elephant {
    var position: [Int] = [0, 0]
    var role: Role
    
    init(role: Role) {
        self.role = role
        if role == .first {
            self.position = [1, 0]
        } else {
            self.position = [1, 3]
        }
    }
    
    func moveUpperRight() {
        position[0] += 1
        position[1] += 1
    }
    
    func moveUpperLeft() {
        position[0] -= 1
        position[1] += 1
    }
    
    func moveLowerRight() {
        position[0] += 1
        position[1] -= 1
    }
    
    func moveLowerLeft() {
        position[0] -= 1
        position[1] -= 1
    }
}
