//
//  CurrencyView.swift
//  CurrencyView
//
//  Created by lyzkov on 09/09/2021.
//

import SwiftUI

struct CurrenciesListItemView: View {

    let item: CurrenciesListItem

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(item.id)")
            Text("Name: \(item.name)")
            Text("Symbol: \(item.symbol)")
            Text("Price USD: \(item.priceUsd)")
            Text("% Change 1h: \(item.percentChange1H)")
            Text("% Change 24h: \(item.percentChange24H)")
            Text("Volume: \(item.volume24)")
        }
    }

}
