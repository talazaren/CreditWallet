//
//  CalculateCreditView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/22/24.
//

import SwiftUI

struct CalculateCreditView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var user: Person
    
    let credit: Credit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Калькулятор ипотеки")
                .font(.heading2())
                .padding(.vertical, 15)
            
            getResults(title: "Ежемесячный платеж", value: credit.monthlyPayment, symbol: "calendar")
            getResults(title: "Полная сумма выплат", value: credit.totalAmountPaid, symbol: "basket.fill")
            getResults(title: "Начисленные проценты", value: credit.totalInterestPaid, symbol: "percent")
            
            Spacer()
            
            CustomButtonView(buttonAction: {
                user.addCredit(credit: credit)
                router.popToRoot()
            }, buttonText: "Сохранить")
        }
        .padding(.horizontal, 25)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    router.popToRoot()
                }) {
                    Text("Отмена")
                }
            }
        }
    }
    
    private func getResults(title: String, value: Double, symbol: String) -> some View {
        HStack {
            Image(systemName: symbol)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.appBlue)
                .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheading2())
                    .foregroundStyle(.gray)
                    .padding(.bottom, 1)
                Text("\(value.rounded(), specifier: "%.0f") руб")
                    .font(.subheading1())
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    CalculateCreditView(credit: Credit(
        name: "Замок на берегу Сочи",
        percent: "15",
        fullCost: "50000000",
        initialFee: "20000000",
        term: "10"))
}
