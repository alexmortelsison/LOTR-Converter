//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Alex Sison on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    @State var leftCurrency: Currency
    @State var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .padding(-5)
                        TextField("Enter Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/ .leading/*@END_MENU_TOKEN@*/)
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        .padding(-5)
                        TextField("Enter Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.ultraThinMaterial.opacity(0.7))
                .clipShape(.capsule)
                .padding()
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(topCurrency: leftCurrency, bottomCurrency: rightCurrency)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(leftCurrency: .silverPenny, rightCurrency: .goldPenny)
}
