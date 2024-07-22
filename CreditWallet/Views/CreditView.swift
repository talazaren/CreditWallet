//
//  AddCreditView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/22/24.
//

import SwiftUI

struct CreditView: View {
    @EnvironmentObject var router: Router
    
    @State var credit = Credit(
        name: "",
        percent: "",
        fullCost: "",
        initialFee: "",
        term: ""
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Калькулятор ипотеки")
                .font(.heading2())
                .padding(.vertical, 20)
            
            LabeledTextField(title: "НАЗВАНИЕ ИПОТЕКИ", placeholder: "Квартира в ЖК Мечта", text: $credit.name)
            LabeledTextField(title: "СТОИМОСТЬ НЕДВИЖИМОСТИ", placeholder: "1 000 000", text: $credit.fullCost)
            LabeledTextField(title: "ПЕРВОНАЧАЛЬНЫЙ ВЗНОС", placeholder: "500 000", text: $credit.initialFee)
            LabeledTextField(title: "ПРОЦЕНТНАЯ СТАВКА", placeholder: "5%", text: $credit.percent)
            LabeledTextField(title: "СРОК", placeholder: "10 лет", text: $credit.term)
            
            Spacer()
            
            Button(action: {
                router.navigateTo(.calculateCredit)
            }) {
                HStack {
                    Spacer()
                    
                    Text("Рассчитать")
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
        .padding(.horizontal, 25)
    }
    
}

struct LabeledTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.bodyText1())
                .foregroundStyle(.gray)
            
            TextField(placeholder, text: $text)
                .padding(.horizontal, 15)
                .frame(height: 50)
                .background(Color("AppGray"))
                .cornerRadius(25)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    CreditView()
}
