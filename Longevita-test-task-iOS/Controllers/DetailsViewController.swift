//
//  DetailsViewController.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 19/06/2024.
//

import UIKit

class DetailsViewController: UserInfoInputViewController {
    
    //MARK: - Views

    private let dateUserInfoLabelView = UserInfoLabelView(type: .date)
    private let hourUserInfoLabelView = UserInfoLabelView(type: .hour)
    private let minuteUserInfoLabelView = UserInfoLabelView(type: .minute)
    private let nameUserInfoLabelView = UserInfoLabelView(type: .name)
    private let surnameUserInfoLabelView = UserInfoLabelView(type: .surname)
    private let sexUserInfoLabelView = UserInfoLabelView(type: .sex)
    
    override var arrangedSubviews: [UIView] {
        get {
            return [dateUserInfoLabelView, hourUserInfoLabelView, minuteUserInfoLabelView, nameUserInfoLabelView, surnameUserInfoLabelView, sexUserInfoLabelView]
        } set {
            
        }
    }
        
    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        configure(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"
        view.backgroundColor = .white
    }
    
    override func setupStackView() {
        super.setupStackView()
    }
}

extension DetailsViewController {
    
    //MARK: - Configure
    
    private func configure(viewModel: ViewModel) {
        dateUserInfoLabelView.configure(viewModel: viewModel, type: .date)
        hourUserInfoLabelView.configure(viewModel: viewModel, type: .hour)
        minuteUserInfoLabelView.configure(viewModel: viewModel, type: .minute)
        nameUserInfoLabelView.configure(viewModel: viewModel, type: .name)
        surnameUserInfoLabelView.configure(viewModel: viewModel, type: .surname)
        sexUserInfoLabelView.configure(viewModel: viewModel, type: .sex)
    }
}
