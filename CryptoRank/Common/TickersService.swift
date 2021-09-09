//
//  TickersService.swift
//  TickersService
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation
import Combine

final class TickersService {

    let url = URL(string: "https://api.coinlore.com/api/tickers/")!

    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func tickers(limit: Int = 21) -> AnyPublisher<Tickers, Error> {
        let url = url.appendingQueryItem(name: "limit", value: "\(limit)")

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Tickers.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
