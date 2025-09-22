//
//  ContentView.swift
//  PayWall-Demo
//
//  Created by William Lopez on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showPaywall: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                showPaywall.toggle()
            }) {
                Text("Open Paywall")
                    .padding()
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
            .background(Color.blue)
            .clipShape(.buttonBorder)
                
        }.sheet(isPresented: $showPaywall) {
            PayWall()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
