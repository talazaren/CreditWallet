//
//  CustomButtonView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/23/24.
//

import SwiftUI

struct CustomButtonView: View {
    let buttonAction: () -> Void
    let buttonText: String
    
    var body: some View {
        Button(action: buttonAction) {
            HStack {
                Spacer()
                
                Text(buttonText)
                    .font(.subheading2())
                    .frame(height: 52)
                    .foregroundStyle(Color.white)
                    
                Spacer()
            }
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color("AppBlue"), Color("AppTurquoise"), Color("AppGreen")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
        .padding(.bottom, 20)
    }
}

#Preview {
    CustomButtonView(buttonAction: {}, buttonText: "Рассчитать")
}
