//
//  Giraffe.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

class Giraffe {
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
    
    func moveForeward() {
        position[1] += 1
    }
    
    func moveBackward() {
        position[1] -= 1
    }
    
    func moveRight() {
        position[0] += 1
    }
    
    func moveLeft() {
        position[0] -= 1
    }
}
