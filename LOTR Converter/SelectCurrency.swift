//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Alex Sison on 4/5/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                Text("Select the currency you are starting with")
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)

                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) {currency in
                        CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    }
                }

                Text("Select the currency you would like to convert to")
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)

                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
            }
            .padding()
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
