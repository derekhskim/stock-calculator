import SwiftUI

struct StockAverageCalculatorView: View {
    
    // State variables to store the input values
    @State private var stockAmount = ""
    @State private var purchasePrice = ""
    @State private var stockFields: [[String]] = [["", ""]]
    
    // State variable to toggle the visibility of the average section
    @State private var showAverage = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Stock Average Calculator")) {
                    // TextField to input the amount of stocks purchased
                    TextField("Amount of stocks purchased", text: $stockAmount)
                        .keyboardType(.decimalPad)
                    // TextField to input the purchase price
                    TextField("Purchase price", text: $purchasePrice)
                        .keyboardType(.decimalPad)
                }
                // For each set of fields in the stockFields array, create a section with two TextFields
                ForEach(0..<stockFields.count, id: \.self) { index in
                    Section {
                        TextField("Number of shares purchased", text: self.$stockFields[index][0])
                            .keyboardType(.decimalPad)
                        TextField("Purchase price", text: self.$stockFields[index][1])
                            .keyboardType(.decimalPad)
                    }
                }
                
                // Button to add another set of fields
                Button(action: {
                    self.stockFields.append(["", ""])
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }) {
                    Text("Add another stock")
                }
                
                // Add a "Calculate" button to show the average section
                Section {
                    Button(action: {
                        self.showAverage = true
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }) {
                        Text("Calculate")
                    }
                }
                // Only show the average section if the showAverage state variable is true
                if showAverage {
                    Section(header: Text("Average Result")) {
                        // Display the total amount of stocks purchased & average stock price
                        Text("Total Stocks Purcahsed: \(calculateTotalAmount(), specifier: "%.2f")")
                        Text("Average Price: \(calculateAverage(), specifier: "%.2f")")
                    }
                }
                
                // Add a "Reset" button to reset all textfields
                Section {
                    Button(action: {
                        self.showAverage = false
                        self.stockAmount = ""
                        self.purchasePrice = ""
                        self.stockFields = [["", ""]]
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }) {
                        Text("Reset")
                    }
                }
            }
            .navigationBarTitle("Stock Calculator")
        }
    }
    
    // Calculate the total amount of stocks
    func calculateTotalAmount() -> Double {
        var totalAmount = 0.0
        
        // Add the values from the initial fields
        if let stockAmount = Double(stockAmount) {
            totalAmount += stockAmount
        }
        
        // Add the values from the additional fields
        for fields in stockFields {
            if let stockAmount = Double(fields[0]) {
                totalAmount += stockAmount
            }
        }
        
        return totalAmount
    }
    
    // Calculate the average stock price
    func calculateAverage() -> Double {
        var totalAmount = 0.0
        var totalPrice = 0.0
        
        // Add the values from the initial fields
        if let stockAmount = Double(stockAmount), let purchasePrice = Double(purchasePrice) {
            totalAmount += stockAmount
            totalPrice += stockAmount * purchasePrice
        }
        
        // Add the values from the additional fields
        for fields in stockFields {
            if let stockAmount = Double(fields[0]), let purchasePrice = Double(fields[1]) {
                totalAmount += stockAmount
                totalPrice += stockAmount * purchasePrice
            }
        }
        
        // Calculate and return the average
        return totalPrice / totalAmount
    }
    // Hide numberpad when user taps out of the textfields
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

struct StockAverageCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockAverageCalculatorView()
    }
}
