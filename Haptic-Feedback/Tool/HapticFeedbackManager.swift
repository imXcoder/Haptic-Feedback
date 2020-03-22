//
//  HapticFeedbackManager.swift
//  haptic-feedback
//
//  Created by zuolin on 2020/2/1.
//

import UIKit

class HapticFeedbackManager {
    
    private lazy var selectionFeedbackGenerator: UISelectionFeedbackGenerator = {
        let feedbackGenerator = UISelectionFeedbackGenerator()
        
        return feedbackGenerator
    }()
    
    private lazy var notificationFeedbackGenerator: UINotificationFeedbackGenerator = {
        let feedbackGenerator = UINotificationFeedbackGenerator()
        
        return feedbackGenerator
    }()
    
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?

    // MARK: - UISelectionFeedbackGenerator
    public func excuteSelectionChanged() {
        selectionFeedbackGenerator.selectionChanged()
    }
    
    // MARK: - UINotificationFeedbackGenerator
    public func executeNotificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        notificationFeedbackGenerator.notificationOccurred(notificationType)
    }
    
    // MARK: - UIImpactFeedbackGenerator
    public func excuteImpactOccurred(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
        
        guard let impactFeedbackGenerator = impactFeedbackGenerator else {
            return
        }
                
        impactFeedbackGenerator.prepare()
        impactFeedbackGenerator.impactOccurred()
    }
}
