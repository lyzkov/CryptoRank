//
//  TickersProviderMock.swift
//  TickersProviderMock
//
//  Created by lyzkov on 10/09/2021.
//

import Foundation
import Combine

@testable import CryptoRank

private let json =
"""
{
"data": [
    {
        "id": "90",
        "symbol": "BTC",
        "name": "Bitcoin",
        "nameid": "bitcoin",
        "rank": 1,
        "price_usd": "46205.70",
        "percent_change_24h": "-0.53",
        "percent_change_1h": "-0.08",
        "percent_change_7d": "-6.72",
        "price_btc": "1.00",
        "market_cap_usd": "866780060627.88",
        "volume24": 28501182980.629158,
        "volume24a": 37041292177.25957,
        "csupply": "18759159.00",
        "tsupply": "18759159",
        "msupply": "21000000"
    }
],
"info": {
    "coins_num": 6105,
    "time": 1631262662
}
}
"""

final class TickersProviderMock: TickersProvider {

    lazy var tickers: Tickers = try! decoder.decode(Tickers.self, from: json.data(using: .utf16)!)

    func tickers(limit: Int) -> AnyPublisher<Tickers, Error> {
        Just(tickers)
            .mapError { _ in
                NSError()
            }
            .eraseToAnyPublisher()
    }
}
