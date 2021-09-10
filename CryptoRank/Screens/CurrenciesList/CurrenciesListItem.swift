//
//  CurrenciesListItem.swift
//  CurrenciesListItem
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation

struct CurrenciesListItem: Identifiable, Equatable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    let percentChange24H: Double
    let percentChange1H: Double
    let volume24: Double
}

extension CurrenciesListItem {

    init(from datum: Datum) {
        id = datum.id
        symbol = datum.symbol
        name = datum.name
        priceUsd = datum.priceUsd
        percentChange24H = Double(datum.percentChange24H) ?? 0
        percentChange1H = Double(datum.percentChange1H) ?? 0
        volume24 = datum.volume24
    }

}
