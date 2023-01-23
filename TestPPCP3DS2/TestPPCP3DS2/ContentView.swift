//
//  ContentView.swift
//  TestPPCP3DS2
//
//  Created by YOSEPH TILAHUN on 1/20/23.
//

import SwiftUI
import PayPal3DS2

struct ContentView: View {
    
    @State var cardInfo: CardInfo = CardInfo(id: "UUXX", name: "3DS2", type: "Visa", cardNumber: "411111111111111", threeDS2: "", cvv: "345", postalCode: "95316", expirationDate: "12/24")

   var body: some View {
       VStack {
        
           if self.cardInfo.threeDS2.isEmpty {
               ThreeDSAuthView(calllingView: self, cardInfo: self.cardInfo) { newCardInfo in
                   self.cardInfo = newCardInfo
                   
               }} else {
                   
                   VStack {
                       
                       Text("Recieved OTP in clear!").font(.system(.title, design:.rounded)).foregroundColor(.blue)
                           .frame(width: 325, height: 80, alignment: .center)
                       
                       Text(self.cardInfo.threeDS2).foregroundColor(.blue)
                           .frame(width: 125, height: 60, alignment: .center)
                       
                       Text(self.cardInfo.responseStatus.statusMessage).foregroundColor(.blue)
                           .frame(width: 225, height: 60, alignment: .center)

                       
                   }
                }
        }
        .padding()
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
