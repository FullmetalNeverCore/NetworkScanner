//
//  ContentView.swift
//  NetworkScanner
//
//  Created by 0xNeverC0RE on 22/02/2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LANScannerViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .black, Color(hex: 0xB30026)]), startPoint: .top, endPoint: .bottom)
                    .blur(radius: 80)
                    .ignoresSafeArea()

                VStack {
                    Text("Scanning network may take time...")
                    List(viewModel.connectedDevices, id: \.self) { device in
                        DeviceRow(device: device)
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle("Local Network")
                    .navigationBarItems(trailing: Button(action: {
                        viewModel.startScanningLAN()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    })
                }
            }
        }
        .onAppear {
            viewModel.startScanningLAN()
        }
        .onDisappear {
            viewModel.stopScanningLAN()
        }
    }
}



#Preview {
    ContentView()
}
