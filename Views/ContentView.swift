//
//  ContentView.swift
//  iOSApp2
//
//  Created by Cristina Cabral on 2025-02-02.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() 
          

                VStack {
                    Spacer()
                    NavigationLink(destination: CoffeeOrderView()) {
                        Text("Go to Coffee Shop")
                            .font(.title)
                            .padding(10)
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(Text("Coffee Shop"))
        }
    }
}

#Preview {
    ContentView()
}
