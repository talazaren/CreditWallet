//
//  CustomListView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/24/24.
//

import SwiftUI

struct CustomListView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var user: Person
    
    var body: some View {
        List {
            ForEach(user.credits) { credit in
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(credit.name)
                            .font(.subheading2())
                            .foregroundStyle(Color.primary)
                                
                        Text("\(credit.monthlyPayment.rounded(), specifier: "%.0f") руб/мес")
                            .font(.bodyText2())
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
                            
                    Circle()
                        .frame(width: 50)
                        .foregroundStyle(Color.appBlue.opacity(0.8))
                        .overlay(
                            Text(credit.percent + "%")
                                .font(.subheading2())
                                .foregroundStyle(Color.white)
                        )
                }
                .onTapGesture {
                    router.navigateTo(.calculateCredit(credit: credit))
                }
            }
            .onDelete(perform: removeRows)
            .listRowBackground(Color.appGray.opacity(0.0))
        }
        .listStyle(.plain)
        .padding(.vertical, 10)
    }
    
    private func removeRows(at offsets: IndexSet) {
        user.credits.remove(atOffsets: offsets)
    }
}

