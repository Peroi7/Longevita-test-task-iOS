//
//  UserInfoInputViewController.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import UIKit

class UserInfoInputViewController: UIViewController {
    
    private enum Constants {
        static let userInfoInputViewHeight = 90
    }
    
    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputFieldsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
}

extension UserInfoInputViewController {
    
    //MARK: - StackView
    
    private func setupStackView() {
        inputFieldsStackView.addArrangedSubview(UserInfoInputView(type: .date))
        inputFieldsStackView.addArrangedSubview(UserInfoInputView(type: .hour))
        inputFieldsStackView.addArrangedSubview(UserInfoInputView(type: .minute))
        inputFieldsStackView.addArrangedSubview(UserInfoInputView(type: .name))
        inputFieldsStackView.addArrangedSubview(UserInfoInputView(type: .surname))
        
        stackViewHeightConstraint.constant = CGFloat(inputFieldsStackView.arrangedSubviews.count * Constants.userInfoInputViewHeight) // dynamic stackView height
    }
}
