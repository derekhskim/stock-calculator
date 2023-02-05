//
//  StockProfitCalculatorView.swift
//  Stock Calculator
//
//  Created by Derek Kim on 2022/12/17.
//

import SwiftUI

struct StockProfitCalculatorView: View {
    
    // State variables to store the input values
    @State private var numberOfShares = ""
    @State private var purchasePrice = ""
    @State private var sellPrice = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Stock Profit Calculator")) {
                    // TextField to input the number of shares purchased
                    TextField("Number of shares purchased", text: $numberOfShares)
                        .keyboardType(.decimalPad)
                    // TextField to input the purchase price
                    TextField("Purchase price", text: $purchasePrice)
                        .keyboardType(.decimalPad)
                    // TextField to input the sell price
                    TextField("Sell price", text: $sellPrice)
                        .keyboardType(.decimalPad)
                }
                // Calculate the profit or loss
                Section(header: Text("Profit / Loss")) {
                    // Display the profit or loss
                    Text("\(calculateProfitLoss(), specifier: "%.2f")")
                }
                
                // Add a "Reset" button to clear the input fields
                Section {
                    Button(action: {
                        self.numberOfShares = ""
                        self.purchasePrice = ""
                        self.sellPrice = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }) {
                        Text("Reset")
                    }
                }
            }
            .navigationBarTitle("Stock Calculator")
        }
    }
    
    // Calculate the profit or loss
    func calculateProfitLoss() -> Double {
        if let numberOfShares = Double(numberOfShares), let purchasePrice = Double(purchasePrice), let sellPrice = Double(sellPrice) {
            return (sellPrice - purchasePrice) * numberOfShares
        } else {
            return 0.0
        }
    }
    
    // Hide numberpad when user taps out of the textfields
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

struct StockProfitCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockProfitCalculatorView()
    }
}
