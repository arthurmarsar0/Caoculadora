//
//  Porte.swift
//  Caoculadora
//
//  Created by Arthur Alves Marsaro on 10/05/24.
//

import Foundation

enum Porte: String, CaseIterable{
    case pequeno, medio, grande
    
    func conversaoIdade(anos: Int, meses: Int) -> Int {
        let result: Int
        let k: Int
        switch self {
            case .pequeno:
                k = 6
            case .medio:
                k = 7
            case .grande:
                k = 8
        }
        
        result = anos * k + meses * k / 12
        
        return result
    }
}
