//
//  HapticFeedbackTableViewCell.swift
//  haptic-feedback
//
//  Created by zuolin on 2020/2/1.
//

import UIKit

class HapticFeedbackTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: HapticFeedbackTableViewCell.self)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        
        let views = [
            "titleLabel": titleLabel
        ]
        
        let metrics = [
            "topMargin": 16.0,
            "bottomMargin": 16.0,
            "leftMargin": 16.0,
            "rightMargin": 16.0
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[titleLabel(>=40)]-bottomMargin-|", options: [], metrics: metrics, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftMargin-[titleLabel]-rightMargin-|", options: [], metrics: metrics, views: views)
        
        contentView.addConstraints(verticalConstraints)
        contentView.addConstraints(horizontalConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HapticFeedbackTableViewCell {
    public func bindingHapticFeedback(_ hapticFeedbackTypeProtocol: HapticFeedbackTypeProtocol) {
        titleLabel.text = hapticFeedbackTypeProtocol.title
    }
}
