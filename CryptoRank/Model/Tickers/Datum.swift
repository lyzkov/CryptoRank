//
//  Datum.swift
//  Datum
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let symbol: String
    let name: String
    let nameid: String
    let rank: Int
    let priceUsd: String
    let percentChange24H: String
    let percentChange1H: String
    let percentChange7D: String
    let priceBtc: String
    let marketCapUsd: String
    let volume24: Double
    let volume24A: Double
    let csupply: String
    let tsupply: String
    let msupply: String?

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case nameid
        case rank
        case priceUsd
        case percentChange24H
        case percentChange1H
        case percentChange7D
        case priceBtc
        case marketCapUsd
        case volume24 = "volume24"
        case volume24A = "volume24a"
        case csupply
        case tsupply
        case msupply
    }
}
