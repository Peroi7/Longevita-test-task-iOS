//
//  UserInfoLabelView.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 20/06/2024.
//

import UIKit

class UserInfoLabelView: UserInfoInputView {
        
    //MARK: - Views

    private var userInfoLabel: UILabel!
    private var separatorView: UIView!
    
    override func setup(type: UserInfoInputView.InputType) {
        super.setup(type: type)
    }
    
    //MARK: - Setup
    
    override func addInfoValueView() {
        userInfoLabel = UILabel()
        separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        
        addSubview(userInfoLabel)
        userInfoLabel.addSubview(separatorView)
        
        userInfoLabel.autoPinEdge(.top, to: .bottom, of: inputTitle, withOffset: AppConstants.paddingDefaultSmall)
        userInfoLabel.autoPinEdge(.left, to: .left, of: inputTitle)
        userInfoLabel.autoPinEdge(.right, to: .right, of: inputTitle)
        userInfoLabel.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -AppConstants.paddingDefaultSmall)
        userInfoLabel.autoSetDimension(.height, toSize: Constants.textFieldHeight)
        
        separatorView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        separatorView.autoSetDimension(.height, toSize: 1)
    }
    
    override func setupPlaceholder(type: UserInfoInputView.InputType) { }
    
    //MARK: - Configure
    
    func configure(viewModel: ViewModel, type: InputType) {
        switch type {
        case .date:
            userInfoLabel.text = viewModel.model.date.toDateString(format: .dayMonthYear)
        case .hour:
            userInfoLabel.text = viewModel.model.hour
        case .minute:
            userInfoLabel.text = viewModel.model.minute
        case .name:
            userInfoLabel.text = viewModel.model.name
        case .surname:
            userInfoLabel.text = viewModel.model.surname
        case .sex:
            userInfoLabel.text = viewModel.model.sex
        }
    }
}
