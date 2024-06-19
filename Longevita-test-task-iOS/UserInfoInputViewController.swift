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
    private let sexUserInfoInputView = UserInfoInputView(type: .sex)

    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputFieldsStackView: UIStackView!
    
    @IBAction func onSubmit(_ sender: Any) {
        validate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    private func fire(viewModel: ViewModel) {
        viewModel.fetch {[weak self] (user, error) in
            error == nil ?  DispatchQueue.main.async {
                self?.navigationController?.pushViewController(UIViewController(), animated: true)
            } : DispatchQueue.main.async {
                self?.showAlert(for: error?.localizedDescription ?? "")
            }
        }
    }
    
    private func validate() {
        let dateData = dateUserInfoInputView.textField.text ?? ""
        let hourData = hourUserInfoInputView.textField.text ?? ""
        let minuteData = minuteUserInfoInputView.textField.text ?? ""
        let nameData = nameUserInfoInputView.textField.text ?? ""
        let surnameData = surnameUserInfoInputView.textField.text ?? ""
        let sexData = sexUserInfoInputView.textField.text ?? ""
        
        let viewModel = ViewModel(model: .init(date: dateData, hour: hourData, minute: minuteData, name: nameData, surname: surnameData, sex: sexData))
        
        viewModel.validate {[weak self] (errorMessage) in
            errorMessage == nil ? self?.fire(viewModel: viewModel) : DispatchQueue.main.async {
                self?.showAlert(for: errorMessage ?? "")
                return
            }
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
        inputFieldsStackView.addArrangedSubview(sexUserInfoInputView)
        
        stackViewHeightConstraint.constant = CGFloat(inputFieldsStackView.arrangedSubviews.count * Constants.userInfoInputViewHeight) // dynamic stackView height
    }
}
