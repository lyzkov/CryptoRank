//
//  CurrenciesListViewModel.swift
//  CurrenciesListViewModel
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation
import Combine

final class CurrenciesListViewModel: ObservableObject {

    @Published var items: [CurrenciesListItem] = []

    var cancellable = Set<AnyCancellable>()

    let tickersService = TickersService()

    init() {
        tickersService.tickers()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            }, receiveValue: { tickers in
                self.items = tickers.data.map({ datum in
                    CurrenciesListItem(from: datum)
                })
            })
            .store(in: &cancellable)
    }

}
