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
    
    private let dateUserInfoInputView = UserInfoInputView(type: .date)
    private let hourUserInfoInputView = UserInfoInputView(type: .hour)
    private let minuteUserInfoInputView = UserInfoInputView(type: .minute)
    private let nameUserInfoInputView = UserInfoInputView(type: .name)
    private let surnameUserInfoInputView = UserInfoInputView(type: .surname)

    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputFieldsStackView: UIStackView!
    
    @IBAction func onSubmit(_ sender: Any) {
        validate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    private func validate() {
        do {
            let dateData = try dateUserInfoInputView.textField.validatedText(validationType: .date)
            let hourData = try hourUserInfoInputView.textField.validatedText(validationType: .hour)
            let minuteData = try minuteUserInfoInputView.textField.validatedText(validationType: .minute)
            let nameData = try nameUserInfoInputView.textField.validatedText(validationType: .name)
            let surname = try surnameUserInfoInputView.textField.validatedText(validationType: .surname)
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    //MARK: - Alert
    
    private func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UserInfoInputViewController {
    
    //MARK: - StackView
    
    private func setupStackView() {
        inputFieldsStackView.addArrangedSubview(dateUserInfoInputView)
        inputFieldsStackView.addArrangedSubview(hourUserInfoInputView)
        inputFieldsStackView.addArrangedSubview(minuteUserInfoInputView)
        inputFieldsStackView.addArrangedSubview(nameUserInfoInputView)
        inputFieldsStackView.addArrangedSubview(surnameUserInfoInputView)
        
        stackViewHeightConstraint.constant = CGFloat(inputFieldsStackView.arrangedSubviews.count * Constants.userInfoInputViewHeight) // dynamic stackView height
    }
}
