//
//  UserInfoInputView.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import UIKit
import PureLayout

class UserInfoInputView: UIView, UITextFieldDelegate {
    
    private enum Constants {
        static let inputTitleHeight: CGFloat = 20.0
        static let inputTitleFont: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        static let textFieldHeight: CGFloat = 40.0
    }
    
    //MARK: - Input Type
    
    enum InputType: String {
        case date = "Date"
        case hour = "Hour"
        case minute = "Minute"
        case name = "Name"
        case surname = "Surname"
    }
    
    private var inputTitle: UILabel!
    private var textField: UITextField!
    
    init(type: InputType) {
        super.init(frame: .zero)
        setup(type: type)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup
    
    private func setup(type: InputType) {
        inputTitle = UILabel()
        textField = UITextField(frame: .zero)
        
        addSubview(inputTitle)
        addSubview(textField)
        
        inputTitle.autoPinEdgesToSuperviewEdges(with: .init(top: AppConstants.paddingDefault, left: AppConstants.paddingDefault + AppConstants.paddingDefaultSmall, bottom: AppConstants.paddingDefault, right: AppConstants.paddingDefault), excludingEdge: .bottom)
        inputTitle.autoSetDimension(.height, toSize: Constants.inputTitleHeight)
        
        textField.autoPinEdge(.top, to: .bottom, of: inputTitle, withOffset: AppConstants.paddingDefaultSmall)
        textField.autoPinEdge(.left, to: .left, of: self, withOffset: AppConstants.paddingDefault)
        textField.autoPinEdge(.right, to: .right, of: inputTitle)
        textField.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -AppConstants.paddingDefaultSmall)
        textField.autoSetDimension(.height, toSize: Constants.textFieldHeight)
        
        inputTitle.font = Constants.inputTitleFont
        inputTitle.text = type.rawValue
        
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
    }
}
