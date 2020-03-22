//
//  HapticFeedbackViewModel.swift
//  haptic-feedback
//
//  Created by zuolin on 2020/2/1.
//

extension HapticFeedbackViewModel {
    struct Output {
        let dataSource: [[HapticFeedbackTypeProtocol]] = [
            [HapticFeedbackType.selection],
            [HapticFeedbackType.Notification.success,
             HapticFeedbackType.Notification.warning,
             HapticFeedbackType.Notification.error],
            [HapticFeedbackType.Impact.light,
             HapticFeedbackType.Impact.medium,
             HapticFeedbackType.Impact.heavy,
             HapticFeedbackType.Impact.soft,
             HapticFeedbackType.Impact.rigid]
        ]
    }
}

class HapticFeedbackViewModel {
    let output = Output()
}
