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
            HStack {
                Text("\(item.name)")
                Spacer()
                Text("$\(item.priceUsd)")
            }
            .font(.title3)
            HStack {
                Text("\(item.symbol)")
                Spacer()
                Text("$\(formatNumber(item.volume24))")
                ChangePriceView(timeframe: .hour, value: item.percentChange1H)
                ChangePriceView(timeframe: .day, value: item.percentChange24H)
            }
            .font(.footnote)
        }
    }

}

struct ChangePriceView: View {

    enum Timeframe: String {
        case hour = "1H"
        case day = "24H"
    }

    let timeframe: Timeframe

    let value: Double

    var body: some View {
        Text("\(timeframe.rawValue) \(String(format: "%.2f", value))%")
            .foregroundColor(value >= 0 ? .green : .red)
    }

}

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}

func formatNumber(_ n: Double) -> String {
    let num = abs(n)
    let sign = (n < 0) ? "-" : ""

    switch num {
    case 1_000_000_000...:
        var formatted = num / 1_000_000_000
        formatted = formatted.reduceScale(to: 1)
        return "\(sign)\(formatted)B"

    case 1_000_000...:
        var formatted = num / 1_000_000
        formatted = formatted.reduceScale(to: 1)
        return "\(sign)\(formatted)M"

    case 1_000...:
        var formatted = num / 1_000
        formatted = formatted.reduceScale(to: 1)
        return "\(sign)\(formatted)K"

    case 0...:
        return "\(n)"

    default:
        return "\(sign)\(n)"
    }
}
