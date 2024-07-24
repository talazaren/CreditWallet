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
                CustomListView()
            }
            .padding(.horizontal, 20)
            
            CircleButtonView {
                router.navigateTo(.addCredit)
            }
        }
    }
}



