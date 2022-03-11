//
//  AssetCardSectionView.swift
//  MyAssets
//
//  Created by Mac on 2022/03/09.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State var seletedTab = 1
    @ObservedObject var asset: Asset
    
    var assetData: [AssetData] {
        return asset.data
    }
    
    var body: some View {
        VStack {
            AssetSectionHeaderView(title: asset.type.title)
            TapMenuView(
                tabs: ["지난달 결제", "이번달 결제", "다음달 결제"],
                seletedTab: $seletedTab,
                updated: .constant(.nextMonth(amount: "10,000원"))
            )
            TabView(
                selection: $seletedTab,
                content: {
                    ForEach(0...2, id: \.self) { i in
                        VStack {
                            ForEach(assetData) { data in
                                HStack {
                                    Text(data.title)
                                        .font(.title)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Text(data.creditCardAmounts![i].amount)
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                }
                                Divider()
                            }
                        }
                        .tag(i)
                    }
                }
            )
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummaryData().assets[5]
        AssetCardSectionView(asset: asset)
    }
}
