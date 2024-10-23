//
//  Piyopiyo.swift
//  AnimalShogi
//
//  Created by TAIGA ITO on 2024/10/23.
//

import Foundation

class Piyopiyo {
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
    
    
}
