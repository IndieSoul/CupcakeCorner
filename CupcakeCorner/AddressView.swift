//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Luis Enrique Rosas Espinoza on 18/02/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            order.loadAddressFromUserDefaults()
        }
        .onDisappear() {
            order.saveAddressToUserDefaults()
        }
    }
}

#Preview {
    AddressView(order: Order())
}
