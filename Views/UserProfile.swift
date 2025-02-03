//
//  UserProfile.swift
//  iOSApp2
//
//  Created by Cristina Cabral on 2025-02-02.
//

import SwiftUI


struct UserProfileView: View {
    var user: User

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Name: \(user.name)")
                    .font(.largeTitle)
                    .padding()

                Text("Order History:")
                    .font(.title2)
                    .padding()

                List(user.orderHistory, id: \.self) { order in
                    VStack(alignment: .leading) {
                        Text("Coffee Type: \(order.coffeeType)")
                        Text("Size: \(order.coffeeSize)")
                        Text("Add-Ons: \(order.addOns.joined(separator: ", "))")
                        Text("Special Request: \(order.specialRequest)")
                    }
                    .padding()
                }
            }
            .navigationTitle("User Profile")
        }
    }
}

#Preview {
    UserProfileView(user: User(name: "Cristina", orderHistory: [
        CoffeeOrder(name: "Cristina", coffeeSize: "Small", coffeeType: "Black", addOns: ["Sugar"], specialRequest: ""),
        CoffeeOrder(name: "Cristina", coffeeSize: "Large", coffeeType: "Cream", addOns: ["Sugar"], specialRequest: "")
    ]))
}
