//
//  OrderView.swift
//  TestOrderApp
//
//  Created by Андрей Коваленко on 21.09.2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            Text("Order")
                .font(.system(.title, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    OrderView()
}
