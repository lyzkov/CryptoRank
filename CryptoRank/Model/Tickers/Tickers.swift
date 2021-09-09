//
//  Tickers.swift
//  Tickers
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation

// MARK: - Tickers
struct Tickers: Codable {
    let data: [Datum]
    let info: Info

    enum CodingKeys: String, CodingKey {
        case data
        case info
    }
}
