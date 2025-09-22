//
//  PayWall.swift
//  PayWall-Demo
//
//  Created by William Lopez on 9/17/25.
//

import SwiftUI

struct PayWall: View {
    @State private var viewModel = PayWallViewModel()
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .fontWeight(.medium)
                }
            }.padding(.bottom, 15)
            header
            subscriptionDetails
            Spacer()
            subsriptionPlans
            Spacer()
            payButtons
            Spacer()
            Text(viewModel.legalAttributedString)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxHeight: 30)
                .minimumScaleFactor(0.1)
        }
        .padding(.top, 15)
        .padding(.horizontal, 20)
        .background(
            ZStack {
                Color.white
                LinearGradient(
                    gradient: Gradient(colors: [
                        .white,
                        .purple.opacity(0.07),
                        .purple.opacity(0.1),
                        .purple.opacity(0.15)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }.ignoresSafeArea()
        )
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.system(.title, design: .default, weight: .bold))
                    .foregroundStyle(.black)
                Text(viewModel.subtitle)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.6))
            }
            .minimumScaleFactor(0.3)
            Spacer()
        }
        .frame(maxHeight: 70)
        .padding(.bottom, 15)
    }
    
    private var subscriptionDetails: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(viewModel.bullets) { bullet in
                HStack {
                    bullet.image
                        .resizable()
                        .scaledToFit()
                    Text(bullet.text)
                }
            }
            .font(.footnote)
            .foregroundStyle(.black)
            .fontWeight(.light)
            .frame(height: 25)
            .minimumScaleFactor(0.2)
            
            Button(action: {
                
            }) {
                Text("See all features")
                    .foregroundColor(.purple2)
                    .fontWeight(.semibold)
                    .font(.caption2)
            }
            .minimumScaleFactor(dynamicTypeSize.isAccessibilitySize ? 0.4 : 1)
            .padding(.vertical, 6)
            
            Divider()
            
            HStack {
                Image(.creditIcon)
                    .resizable()
                    .scaledToFit()
                Text("included monthly credits: \(viewModel.includedMonthlyCredits) credits")
                    .foregroundStyle(.black)
                    .font(.footnote)
                    .fontWeight(.light)
                    .minimumScaleFactor(0.4)
            }.frame(height: 25)
            
            Divider().padding(.bottom, 6)
            
            HStack {
                Button(action: {
                    
                }) {
                    Text("What can I use credits for?")
                        .lineLimit(1)
                        .foregroundStyle(.purple2)
                        .fontWeight(.semibold)
                        .font(.caption2)
                        .minimumScaleFactor(0.3)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("view credit packs")
                        .foregroundStyle(.purple2)
                        .fontWeight(.semibold)
                        .font(.caption2)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                }
                .minimumScaleFactor(dynamicTypeSize.isAccessibilitySize ? 0.4 : 1)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.5), radius: 1)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5), radius: 1)
        )
    }
    
    private var subsriptionPlans: some View {
        HStack {
            SubscriptionPlanButton(
                title: "Starter",
                credits: "20 credits/month",
                price: "$20",
                discount: "10%",
                isSelected: viewModel.subscriptionPlan == .starter
            ) {
                viewModel.subscriptionPlan = .starter
            }
            
            SubscriptionPlanButton(
                title: "Active",
                credits: "40 credits/month",
                price: "$40",
                discount: "16%",
                isSelected: viewModel.subscriptionPlan == .active
            ) {
                viewModel.subscriptionPlan = .active
            }
            
            SubscriptionPlanButton(
                title: "Alive +",
                credits: "100 credits/month",
                price: "$100",
                discount: "18%",
                isSelected: viewModel.subscriptionPlan == .alive
            ) {
                viewModel.subscriptionPlan = .alive
            }
        }.animation(.easeInOut, value: viewModel.subscriptionPlan)
    }
    
    private var payButtons: some View {
        HStack {
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "applelogo")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(.white)
                        .scaledToFit()
                    
                    Text("Apple Pay")
                        .lineLimit(1)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                }
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .minimumScaleFactor(0.2)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.paywallButtonBG)
                    .shadow(color: .gray.opacity(0.5), radius: 3)
            )
            Spacer()
            Button(action: {
                
            }) {
                HStack {
                    Image(.webIcon)
                        .resizable()
                        .scaledToFit()
                    HStack(spacing: 3) {
                        Text("Web")
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                        
                        Text("18% off")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundStyle(.white.opacity(0.6))
                            
                    }.lineLimit(1)
                }
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .minimumScaleFactor(0.2)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.paywallButtonBG)
                    .shadow(color: .gray.opacity(0.5), radius: 3)
            )
        }.buttonStyle(.plain)
    }
}

#Preview {
    PayWall()
}
