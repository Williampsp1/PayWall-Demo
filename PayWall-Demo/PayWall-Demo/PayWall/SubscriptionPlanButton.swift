//
//  SubscriptionPlanButton.swift
//  PayWall-Demo
//
//  Created by William Lopez on 9/22/25.
//

import SwiftUI

struct SubscriptionPlanButton: View {
    let title: String
    let credits: String
    let price: String
    let discount: String?
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Text(title)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(credits)
                    .lineLimit(1)
                    .fontWeight(.light)
                    .font(.caption2)
                    .foregroundStyle(.black.opacity(0.6))
                HStack(spacing: 2) {
                    Text(price)
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                    Text("/month")
                        .fontWeight(.light)
                        .foregroundStyle(.black.opacity(0.6))
                }
                .lineLimit(1)
            }
            .padding(15)
            .frame(maxWidth: 101, maxHeight: 124)
            .minimumScaleFactor(0.1)
        }
        .frame(
            maxWidth: isSelected ? 138 : 111,
            maxHeight: isSelected ? 162 : 124
        )
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .stroke(.planBorder, lineWidth: 1)
        )
        .overlay(alignment: .top) {
            if let discount {
                HStack(spacing: 2) {
                    Text("save")
                        .fontWeight(.light)
                    Text(discount)
                        .fontWeight(.medium)
                }
                .foregroundStyle(.black)
                .padding(.horizontal, 4)
                .frame(maxWidth: 46, maxHeight: 15)
                .minimumScaleFactor(0.1)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.saveBG)
                )
                .padding(.top, -8)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SubscriptionPlanButton(title: "Active", credits: "40 credits", price: "$50", discount: "10%", isSelected: true, action: {})
}
