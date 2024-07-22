//
//  MainView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI

struct MainView: View {
    let user: Person = .mockUser
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.heading2())
                Spacer()
                Image("Avatar")
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
            
            ScrollView {
                LazyVStack {
                    ForEach(user.credits) { credit in
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(credit.name)
                                    .font(.subheading2())
                                
                                Text("\(credit.monthlyPayment.rounded(), specifier: "%.0f") руб")
                                    .font(.bodyText1())
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            
                            Circle()
                                .frame(width: 50)
                                .foregroundStyle(Color.blue.opacity(0.8))
                                .overlay(
                                    Text("\(credit.percent.rounded(), specifier: "%.0f")%")
                                        .font(.subheading2())
                                        .foregroundStyle(Color.white)
                                )
                        }
                        Divider()
                            .padding(.horizontal, 0)
                    }
                }
                .padding(15)
            }
            .background(Color("AppGray"))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    MainView()
}
