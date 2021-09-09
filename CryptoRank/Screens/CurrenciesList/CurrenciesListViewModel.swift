//
//  CurrenciesListViewModel.swift
//  CurrenciesListViewModel
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation
import Combine

final class CurrenciesListViewModel: ObservableObject {

    @Published
    var items: [CurrenciesListItem] = []

    var cancellable = Set<AnyCancellable>()

    let tickersService = TickersService()

    let refreshInterval: TimeInterval = 30

    var category: CurrenciesCategory = .name

    init() {
        Timer.publish(every: refreshInterval, on: .main, in: .default)
            .autoconnect()
            .prepend(Date())
            .flatMap { [self] _ in
                tickersService.tickers()
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            }, receiveValue: { [self] tickers in
                self.items = tickers.data.map({ datum in
                    CurrenciesListItem(from: datum)
                })
                sort(by: category)
            })
            .store(in: &cancellable)
    }

    func sort(by category: CurrenciesCategory) {
        self.category = category
        items.sort { lhs, rhs in
            switch category {
            case .name:
                return lhs.name < rhs.name
            case .volume24:
                return lhs.volume24 < rhs.volume24
            case .change24:
                return lhs.percentChange24H < rhs.percentChange24H
            }
        }
    }

}
