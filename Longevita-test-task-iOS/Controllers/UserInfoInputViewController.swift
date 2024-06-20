//
//  UserInfoInputViewController.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import UIKit
import IHProgressHUD

class UserInfoInputViewController: UIViewController {
    
    //MARK: - Constants

    private enum Constants {
        static let userInfoInputViewHeight = 90
    }
    
    //MARK: - Views
    
    private let dateUserInfoInputView = UserInfoInputView(type: .date)
    private let hourUserInfoInputView = UserInfoInputView(type: .hour)
    private let minuteUserInfoInputView = UserInfoInputView(type: .minute)
    private let nameUserInfoInputView = UserInfoInputView(type: .name)
    private let surnameUserInfoInputView = UserInfoInputView(type: .surname)
    private let sexUserInfoInputView = UserInfoInputView(type: .sex)
    private var inputFieldsStackView: UIStackView!
    
    lazy var arrangedSubviews: [UIView] = [
        dateUserInfoInputView,
        hourUserInfoInputView,
        minuteUserInfoInputView,
        nameUserInfoInputView,
        surnameUserInfoInputView,
        sexUserInfoInputView
    ]
    
    @IBAction func onSubmit(_ sender: Any) {
        validate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    //MARK: - Validate
    
    private func validate() {
        let dateData = dateUserInfoInputView.textField.text ?? ""
        let hourData = hourUserInfoInputView.textField.text ?? ""
        let minuteData = minuteUserInfoInputView.textField.text ?? ""
        let nameData = nameUserInfoInputView.textField.text ?? ""
        let surnameData = surnameUserInfoInputView.textField.text ?? ""
        let sexData = sexUserInfoInputView.textField.text ?? ""
        
        let viewModel = ViewModel(model: .init(date: dateData, hour: hourData, minute: minuteData, name: nameData, surname: surnameData, sex: sexData))
        
        viewModel.validate {[weak self] (errorMessage) in
            if errorMessage == nil {
                self?.fire(viewModel: viewModel)
            } else {
                IHProgressHUD.set(minimumDismiss: 2.5)
                IHProgressHUD.showError(withStatus: errorMessage ?? "")
            }
        }
    }
    
    //MARK: - StackView
    
    func setupStackView() {
        inputFieldsStackView = UIStackView(arrangedSubviews: arrangedSubviews)
        inputFieldsStackView.axis = .vertical
        inputFieldsStackView.distribution = .fillEqually

        addStackView()
        inputFieldsStackView.autoSetDimension(.height, toSize: CGFloat(inputFieldsStackView.arrangedSubviews.count * Constants.userInfoInputViewHeight))
    }
    
    private func addStackView() {
        view.addSubview(inputFieldsStackView)
        inputFieldsStackView.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
    }
}

extension UserInfoInputViewController {
    
    //MARK: - Fire
    
    private func fire(viewModel: ViewModel) {
        IHProgressHUD.show()
        viewModel.fetch {[weak self] (user, error) in
            if error == nil  {
                IHProgressHUD.dismiss()
                guard let user = user else { return }
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(DetailsViewController(viewModel: ViewModel(model: user)), animated: true)
                }
            }
        }
    }
}
