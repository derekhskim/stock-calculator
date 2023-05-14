//
//  TipsView.swift
//  Stock Calculator
//
//  Created by Derek Kim on 2023/02/05.
//

import SwiftUI

struct TipsView: View {
    
    @EnvironmentObject private var store: TipStore
        
    var didTapClose: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            
            HStack {
                Spacer()
                Button(action: didTapClose) {
                    Image(systemName: "xmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .gray.opacity(0.2))
                }
            }
            
            Text("Are you enjoying the app? 👀")
                .font(.system(.title2, design: .rounded).bold())
                .multilineTextAlignment(.center)
            
            Text("If yes, please feel free to tip me to support me in making more apps like this!")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            ForEach(store.items) { item in
                TipsItemView(item: item)
            }
        }
        .padding(16)
        .background(Color("card-background"), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(8)
        .overlay(alignment: .top) {
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(6)
                .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .offset(y: -25)
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView {}
            .environmentObject(TipStore())
    }
}
