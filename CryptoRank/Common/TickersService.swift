//
//  TickersService.swift
//  TickersService
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation
import Combine

let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

protocol TickersProvider {
    func tickers(limit: Int) -> AnyPublisher<Tickers, Error>
}

final class TickersService: TickersProvider {
    let url = URL(string: "https://api.coinlore.com/api/tickers/")!

    func tickers(limit: Int) -> AnyPublisher<Tickers, Error> {
        let url = url.appendingQueryItem(name: "limit", value: "\(limit)")

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Tickers.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
