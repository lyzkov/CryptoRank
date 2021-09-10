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
    let percentChange24H: String
    let percentChange1H: String
    let volume24: Double
}

extension CurrenciesListItem {

    init(from datum: Datum) {
        id = datum.id
        symbol = datum.symbol
        name = datum.name
        priceUsd = datum.priceUsd
        percentChange24H = datum.percentChange24H
        percentChange1H = datum.percentChange1H
        volume24 = datum.volume24
    }

}
