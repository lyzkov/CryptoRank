//
//  ContentView.swift
//  CryptoRank
//
//  Created by lyzkov on 09/09/2021.
//

import SwiftUI

struct CurrenciesListView: View {

    @State
    var items: [CurrencyListItem] = [
        .init(),
    ]

    @State
    var category: Int = 0

    var body: some View {
        VStack {
            List(items) { item in
                CurrencyView(item: item)
            }
//            Picker("Category", selection: $category) {
//                Text("Name")
//                Text("Volume 24")
//                Text("% Change 24")
//            }
//            .pickerStyle(.segmented)
//            .padding()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesListView()
    }
}

struct CurrencyListItem: Identifiable {
    let id: String = "777"
    let symbol: String = "ADA"
    let name: String = "Cardano"
//    let nameid: String
//    let rank: Int
    let priceUsd: String = "666"
    let percentChange24H: String = "5"
    let percentChange1H: String = "-0.99"
//    let percentChange7D: String
//    let priceBtc: String
//    let marketCapUsd: String
    let volume24: Double = 989.3
//    let volume24A: Double
//    let csupply: String
//    let tsupply: String
//    let msupply: String?
}
