//
//  PayWallViewModel.swift
//  PayWall-Demo
//
//  Created by William Lopez on 9/19/25.
//


import Foundation
import SwiftUI

@Observable class PayWallViewModel {
    var subscriptionPlan: SubscriptionPlan = .starter

    enum SubscriptionPlan {
        case starter
        case active
        case alive
    }

    var title: String { details.title }
    var subtitle: String { details.subtitle }
    var bullets: [Bullet] { details.bullets }
    var includedMonthlyCredits: String { details.includedCredits }
    
    var legalAttributedString: AttributedString {
        // 1. Start with the full text
        var attributedString = AttributedString("Cancel anytime. Subscription auto-renews. By joining you agree to our privacy policy and terms of use.")
        attributedString.font = .footnote

        if let infoRange = attributedString.range(of: "Cancel anytime. Subscription auto-renews. By joining you agree to our") {
            attributedString[infoRange].foregroundColor = .black.opacity(0.5)
        }
        
        if let andRange = attributedString.range(of: "and") {
            attributedString[andRange].foregroundColor = .black.opacity(0.5)
        }
        // 2. Find and link "privacy policy"
        if let privacyRange = attributedString.range(of: "privacy policy") {
            attributedString[privacyRange].link = URL(string: "https://www.google.com")
            attributedString[privacyRange].underlineStyle = .single
            attributedString[privacyRange].foregroundColor = .black
        }
        
        // 3. Find and link "terms of use"
        if let termsRange = attributedString.range(of: "terms of use") {
            attributedString[termsRange].link = URL(string: "https://www.google.com")
            attributedString[termsRange].underlineStyle = .single
            attributedString[termsRange].foregroundColor = .black
        }
        
        return attributedString
    }
    
    private var details: SubscriptionPlanDetails {
        switch subscriptionPlan {
        case .starter:
            return SubscriptionPlanDetails(
                title: "Starter",
                subtitle: "Build your wellness habits",
                bullets: [
                    Bullet(image: Image(.gptPlusIcon), text: "AliveGPT Plus - Adaptive Wellness Intelligence"),
                    Bullet(image: Image(.aiTokenIconStarter), text: "Daily AI Usage Limits"),
                    Bullet(image: Image(.wellnessDimensionsIcon), text: "Track and View all 6 wellness dimensions"),
                    Bullet(image: Image(.weeklyWellnessIcon), text: "Weekly wellness trend analysis"),
                    Bullet(image: Image(.matchingIcon), text: "Smart provider matching")
                ],
                includedCredits: "20"
            )
        case .active:
            return SubscriptionPlanDetails(
                title: "Active",
                subtitle: "Optimize Your Wellness Performance",
                bullets: [
                    Bullet(image: Image(.gptProIcon), text: "AliveGPT Pro - Predictive wellness companion"),
                    Bullet(image: Image(.aiTokenIconActive), text: "Enhanced AI Usage Daily"),
                    Bullet(image: Image(.personalInsightsIcon), text: "Personal Behaviour Insights"),
                    Bullet(image: Image(.graphIcon), text: "30 day trend tracking & predictions"),
                    Bullet(image: Image(.personalizationIcon), text: "Personalized precision provider matching")
                ],
                includedCredits: "40"
            )
        case .alive:
            return SubscriptionPlanDetails(
                title: "Alive +",
                subtitle: "Transform your complete wellness ecosystem",
                bullets: [
                    Bullet(image: Image(.gptMaxIcon), text: "AliveGPT Max - Quantum wellness orchestration"),
                    Bullet(image: Image(.aiTokenIconAlive), text: "Premium AI Usage Daily"),
                    Bullet(image: Image(.personalityIcon), text: "Full personality assessment integration"),
                    Bullet(image: Image(.calendarIcon), text: "365 day comprehensive wellness tracking"),
                    Bullet(image: Image(.providerMatchingIcon), text: "Premium provider matching")
                ],
                includedCredits: "100"
            )
        }
    }
}
