//
//  HapticFeedbackType.swift
//  haptic-feedback
//
//  Created by zuolin on 2020/2/1.
//

public enum HapticFeedbackType: Int {
    case selection
        
    public enum Notification: Int {
        case success

        case warning

        case error
    }
    
    public enum Impact: Int {
        case light

        case medium

        case heavy

        @available(iOS 13.0, *)
        case soft

        @available(iOS 13.0, *)
        case rigid
    }
}

protocol HapticFeedbackTypeProtocol {
    var hapticFeedbackTypeRawValue: Int { get }
    var title: String { get }
}

extension HapticFeedbackType: HapticFeedbackTypeProtocol {
    public var hapticFeedbackTypeRawValue: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .selection:
            return "UISelectionFeedbackGenerator"
        }
    }
}

extension HapticFeedbackType.Notification: HapticFeedbackTypeProtocol {
    public var hapticFeedbackTypeRawValue: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .success:
            return "UINotificationFeedbackGenerator.success"
        case .warning:
            return "UINotificationFeedbackGenerator.warning"
        case .error:
            return "UINotificationFeedbackGenerator.error"
        }
    }
}

extension HapticFeedbackType.Impact: HapticFeedbackTypeProtocol {
    public var hapticFeedbackTypeRawValue: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .light:
            return "UIImpactFeedbackGenerator.light"
        case .medium:
            return "UIImpactFeedbackGenerator.medium"
        case .heavy:
            return "UIImpactFeedbackGenerator.heavy"
        case .soft:
            return "UIImpactFeedbackGenerator.soft"
        case .rigid:
            return "UIImpactFeedbackGenerator.rigid"
        }
    }
}

