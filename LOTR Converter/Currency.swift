//
//  Currency.swift
//  LOTR Converter
//
//  Created by Alex Sison on 4/5/24.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    var id: Currency {self}
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    
    var image: ImageResource {
        switch self {
        case .copperPenny: .copperpenny
        case .silverPenny: .silverpenny
        case .silverPiece: .silverpiece
        case .goldPenny: .goldpenny
        case .goldPiece: .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
}
