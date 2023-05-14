//
//  ContentView.swift
//  Stock Calculator
//
//  Created by Derek Kim on 2022/12/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var store: TipStore
    @State private var showTips = false
    @State private var showThanks = false
    
    var body: some View {
            TabView {
                StockAverageCalculatorView()
                    .tabItem {
                        Image(systemName: "sum")
                        Text("Average")
                    }
                StockProfitCalculatorView()
                    .tabItem {
                        Image(systemName: "percent")
                        Text("Profit")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TipStore())
    }
}
