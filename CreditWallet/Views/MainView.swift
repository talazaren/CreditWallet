//
//  MainView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var user: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.heading2())
                Spacer()
                Image(user.avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 50)
            
            Text("МОИ КРЕДИТЫ")
                .font(.subheading1())
                .foregroundStyle(.gray)
                .padding(.horizontal, 20)
            
            ZStack {
                Color("AppGray")
                    .cornerRadius(20)
                CustomScrollView()
            }
            .padding(.horizontal, 20)
            
            CircleButtonView {
                router.navigateTo(.addCredit)
            }
        }
    }
}

struct CustomScrollView: View {
    @EnvironmentObject var user: Person
    
    var body: some View {
        List {
            ForEach(user.credits) { credit in
                NavigationLink(destination: CalculateCreditView(credit: credit)) {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(credit.name)
                                .font(.subheading2())
                                .foregroundStyle(Color.black)
                                
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
                }
            }
            .onDelete(perform: removeRows)
            .listRowBackground(Color.appGray)
        }
        .listStyle(.plain)
        .padding(.vertical, 20)
    }
    
    private func removeRows(at offsets: IndexSet) {
        user.credits.remove(atOffsets: offsets)
    }
}

