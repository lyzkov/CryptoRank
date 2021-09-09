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

//    @State
//    var category: Int = 0

    var body: some View {
        VStack {
            List(viewModel.items) { item in
                CurrenciesListItemView(item: item)
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
