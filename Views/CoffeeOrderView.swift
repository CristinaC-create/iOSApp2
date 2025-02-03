//
//  CoffeeOrderView.swift
//  iOSApp2
//
//  Created by Cristina Cabral on 2025-02-02.
//

import SwiftUI

import SwiftUI
import SwiftData


struct CoffeeOrderView: View {
    @Environment(\.modelContext) private var context
    @State private var orders: [CoffeeOrder] = []

    @State private var name = ""
    @State private var selectedSize = "Medium"
    @State private var selectedType = "Espresso"
    @State private var addOns: [String] = []
    @State private var specialRequest = ""

    @State private var navigationPath: [User] = []
    @State private var navigateToSummary = false

    let coffeeSizes = ["Small", "Medium", "Large"]
    let coffeeTypes = ["Espresso", "Latte", "Cappuccino"]
    let addOnOptions = ["Milk", "Cream", "Sugar"]

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Text("☕ Coffee Shop")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Select Size", selection: $selectedSize) {
                    ForEach(coffeeSizes, id: \.self) { size in
                        Text(size)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Picker("Select Coffee Type", selection: $selectedType) {
                    ForEach(coffeeTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Text("Add-Ons")
                    .font(.headline)
                HStack {
                    ForEach(addOnOptions, id: \.self) { addOn in
                        Button(action: {
                            if addOns.contains(addOn) {
                                addOns.removeAll { $0 == addOn }
                            } else {
                                addOns.append(addOn)
                            }
                        }) {
                            HStack {
                                Image(systemName: addOns.contains(addOn) ? "checkmark.square.fill" : "square")
                                Text(addOn)
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }

                TextField("Special Request", text: $specialRequest)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: placeOrder) {
                    HStack {
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Place Order")
                    }
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()

                NavigationLink(destination: UserProfileView(user: User(name: name, orderHistory: orders)), isActive: $navigateToSummary) {
                    EmptyView()
                }
            }
            .navigationTitle("Orders")
        }
    }

    private func placeOrder() {
        guard !name.isEmpty else { return }
        let newOrder = CoffeeOrder(name: name, coffeeSize: selectedSize, coffeeType: selectedType, addOns: addOns, specialRequest: specialRequest)

        context.insert(newOrder)
        orders.append(newOrder) // Update the local orders array
        name = ""
        specialRequest = ""
        addOns = []
        navigateToSummary = true
    }
}
