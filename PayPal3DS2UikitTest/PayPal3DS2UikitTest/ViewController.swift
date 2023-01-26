//
//  ViewController.swift
//  PayPal3DS2UikitTest
//
//  Created by Yoseph Tilahun on 1/26/23.
//

import UIKit
import SwiftUI
import PayPal3DS2

class ViewController: UIViewController {
    var cardInfo: CardInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        cardInfo = CardInfo(id: "UUXX", name: "3DS2", type: "Visa", cardNumber: "411111111111111", threeDS2: "", cvv: "345", postalCode: "95316", expirationDate: "12/24")
        dispalayPayPal3DS2View()
    }


    func dispalayPayPal3DS2View() {
        if let cardInfo = self.cardInfo {
            let threeDS2View = ThreeDSAuthView(calllingView: ContentView() , cardInfo: cardInfo) { [weak self] newcardInfo in
                self?.dismiss(animated: true) {
                    self?.cardInfo = newcardInfo
                }
            }

            DispatchQueue.main.async { [weak self] in
                let controller = UIHostingController(rootView: threeDS2View)
                self?.present(controller, animated: true)
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        EmptyView()
    }
}
