//
//  ScannerViewModel.swift
//  NetworkScanner
//
//  Created by 0xNeverC0RE on 23/02/2024.
//

import Foundation
import SwiftUI



struct DeviceRow: View {
    var device: [AnyHashable: String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(device[DEVICE_NAME] ?? "")
            Text(device[DEVICE_IP_ADDRESS] ?? "")
        }
    }
}

class LANScannerViewModel: NSObject,ObservableObject, LANScanDelegate {
    @Published var connectedDevices: [[AnyHashable: String]] = []
    @Published var currentWifiSSID: String = ""
    @Published var progress: Float = 0.0

    private var scanner: LanScan?

    override init() {
        super.init()
        startScanningLAN()
    }

    func startScanningLAN() {
        scanner?.stop()
        scanner = LanScan(delegate: self)

        connectedDevices = []
        progress = 0.0


        scanner?.start()
    }

    func stopScanningLAN() {
        scanner?.stop()
    }

    func lanScanHasUpdatedProgress(_ counter: Int, address: String!) {
        DispatchQueue.main.async {
            self.progress = Float(counter) / Float(MAX_IP_RANGE)
        }
    }

    func lanScanDidFindNewDevice(_ device: [AnyHashable: Any]!) {
        DispatchQueue.main.async {
            self.connectedDevices.append(device as! [AnyHashable: String])
        }
    }

    func lanScanDidFinishScanning() {
        DispatchQueue.main.async {
        }
    }
}
