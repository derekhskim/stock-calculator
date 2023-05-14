//
//  TipStore.swift
//  Stock Calculator
//
//  Created by Derek Kim on 2023/02/05.
//

import Foundation
import StoreKit

final class TipStore: ObservableObject {
    
    @Published private(set) var items = [Product]()
    
    init() {
        Task { [weak self] in
            await self?.retrieveProducts()
        }
    }
}

private extension TipStore {
    
    @MainActor
    func retrieveProducts() async {
        
        do {
            
            let products = try await Product.products(for: myTipProductIdentifiers).sorted(by: { $0.price < $1.price })
            items = products
            
        } catch {
            print(error)
        }
    }
}
