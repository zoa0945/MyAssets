//
//  TapMenuView.swift
//  MyAssets
//
//  Created by Mac on 2022/03/09.
//

import SwiftUI

struct TapMenuView: View {
    var tabs: [String]
    @Binding var seletedTab: Int
    @Binding var updated: CreditCardAmounts?
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count) { row in
                Button {
                    seletedTab = row
                    UserDefaults.standard.set(true, forKey: "creditcard_update_checked: \(row)")
                } label: {
                    VStack(spacing: 10) {
                        HStack {
                            if updated?.id == row {
                                let checked = UserDefaults.standard.bool(forKey: "creditcard_update_checked: \(row)")
                                Circle()
                                    .fill(
                                        !checked
                                        ? Color.red
                                        : Color.clear
                                    )
                                    .frame(width: 6, height: 6)
                                    .offset(x: 2, y: -8)
                            } else {
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 6, height: 6)
                                    .offset(x: 2, y: -8)
                            }
                            Text(tabs[row])
                                .font(.system(.headline))
                                .foregroundColor(
                                    seletedTab == row
                                    ? .accentColor
                                    : .gray
                                )
                                .offset(x: -4, y: 0)
                        }
                        .frame(height: 52)
                        Rectangle()
                            .fill(
                                seletedTab == row
                                ? Color.secondary
                                : Color.clear
                            )
                            .frame(height: 3)
                            .offset(x: 4, y: 0)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(height: 55)
    }
}

struct TapMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TapMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"], seletedTab: .constant(1), updated: .constant(.currentMonth(amount: "10,000원")))
    }
}
