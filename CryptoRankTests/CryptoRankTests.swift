//
//  CryptoRankTests.swift
//  CryptoRankTests
//
//  Created by lyzkov on 09/09/2021.
//

import XCTest
@testable import CryptoRank

final class CryptoRankTests: XCTestCase {

    let tickersProvider = TickersProviderMock()

    var viewModel: CurrenciesListViewModel!

    override func setUpWithError() throws {
        viewModel = CurrenciesListViewModel(provider: tickersProvider)
    }

    func testLoadItems() throws {
        let itemsPublisher = viewModel.$items.collectNext(1)
        let itemsArrays = try self.await(itemsPublisher)
        XCTAssertEqual(itemsArrays.count, 1)
        XCTAssertEqual(itemsArrays.first, [CurrenciesListItem(id: "90", symbol: "BTC", name: "Bitcoin", priceUsd: "46205.70", percentChange24H: -0.53, percentChange1H: -0.08, volume24: 28501182980.629158)])
    }

}
