//
//  HapticFeedbackViewController.swift
//  haptic-feedback
//
//  Created by zuolin on 2020/2/1.
//

import UIKit

class HapticFeedbackViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .white
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.lightGray
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: 16.0, bottom: .zero, right: 16.0)
        
        tableView.register(HapticFeedbackTableViewCell.self, forCellReuseIdentifier: HapticFeedbackTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
    private let viewModel = HapticFeedbackViewModel()
    private let manager = HapticFeedbackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        
        let views = [
            "tableView": tableView
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views)
        
        view.addConstraints(verticalConstraints)
        view.addConstraints(horizontalConstraints)
        
        bindingTableView()
    }
}

extension HapticFeedbackViewController {
    private func bindingTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Table view delegate
extension HapticFeedbackViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if 0 == indexPath.section {
            manager.excuteSelectionChanged()
        } else if 1 == indexPath.section {
            guard let notificationFeedbackType = UINotificationFeedbackGenerator.FeedbackType(rawValue: viewModel.output.dataSource[indexPath.section][indexPath.row].hapticFeedbackTypeRawValue) else {
                return
            }
            
            manager.executeNotificationOccurred(notificationFeedbackType)
        } else if 2 == indexPath.section {
            guard let impactFeedbackType = UIImpactFeedbackGenerator.FeedbackStyle(rawValue: viewModel.output.dataSource[indexPath.section][indexPath.row].hapticFeedbackTypeRawValue) else {
                return
            }
            
            manager.excuteImpactOccurred(impactFeedbackType)
        }
    }
}

// MARK: - Table view data source
extension HapticFeedbackViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.output.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HapticFeedbackTableViewCell.reuseIdentifier, for: indexPath)
        
        guard let hapticFeedbackTableViewCell = cell as? HapticFeedbackTableViewCell else {
            return cell
        }
                
        let hapticFeedbackTypeProtocol = viewModel.output.dataSource[indexPath.section][indexPath.row]
        hapticFeedbackTableViewCell.bindingHapticFeedback(hapticFeedbackTypeProtocol)
                
        return hapticFeedbackTableViewCell
    }
}

