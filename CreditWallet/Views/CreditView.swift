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
                .padding(.vertical, 15)
            
            LabeledTextField(
                title: "НАЗВАНИЕ ИПОТЕКИ",
                placeholder: "Квартира в ЖК Мечта",
                text: $credit.name
            )
            LabeledTextField(
                title: "СТОИМОСТЬ НЕДВИЖИМОСТИ",
                placeholder: "1 000 000",
                text: $credit.fullCost
            )
            .keyboardType(.numberPad)
            
            LabeledTextField(
                title: "ПЕРВОНАЧАЛЬНЫЙ ВЗНОС",
                placeholder: "500 000",
                text: $credit.initialFee
            )
            .keyboardType(.numberPad)
            
            LabeledTextField(
                title: "ПРОЦЕНТНАЯ СТАВКА",
                placeholder: "5%",
                text: $credit.percent
            )
            .keyboardType(.numberPad)
            
            LabeledTextField(
                title: "СРОК",
                placeholder: "10 лет",
                text: $credit.term
            )
            .keyboardType(.numberPad)
            
            Spacer()
            
            CustomButtonView(buttonAction: {
                router.navigateTo(.calculateCredit(credit: credit))
            }, buttonText: "Рассчитать")
            
        }
        .onTapGesture {
            hideKeyboard()
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
