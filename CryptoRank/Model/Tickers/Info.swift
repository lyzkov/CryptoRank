//
//  Info.swift
//  Info
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation

// MARK: - Info
struct Info: Codable {
    let coinsNum: Int
    let time: Int

    enum CodingKeys: String, CodingKey {
        case coinsNum
        case time
    }
}
