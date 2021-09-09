//
//  ContentView.swift
//  CryptoRank
//
//  Created by lyzkov on 09/09/2021.
//

import SwiftUI

struct CurrenciesListView: View {

    @ObservedObject
    var viewModel = CurrenciesListViewModel()

    @State
    var category: CurrenciesCategory = .name

    var body: some View {
        VStack {
            List(viewModel.items) { item in
                CurrenciesListItemView(item: item)
            }
            Picker("Category", selection: $category) {
                Text("Name").tag(CurrenciesCategory.name)
                Text("Volume 24").tag(CurrenciesCategory.volume24)
                Text("% Change 24").tag(CurrenciesCategory.change24)
            }
            .onChange(of: category) { newValue in
                viewModel.sort(by: newValue)
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }

}

enum CurrenciesCategory: Int {
    case name
    case volume24
    case change24
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesListView()
    }
}
