//
//  MainHostController.swift
//  NewXcodeProject
//
//  Created by Fabio Acri on 24/08/2019.
//  Copyright © 2019 Fabio Acri. All rights reserved.
//

import UIKit
import SwiftUI

final class MainHostController: UIViewController {
    
    private var viewModel: TrailerViewModel
    private var uiHostController: UIHostingController<ContentView>
    private var contentView: ContentView
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = TrailerViewModel()
        contentView = ContentView(viewModel: viewModel)
        uiHostController = UIHostingController(rootView: contentView)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.initModel()
       
        addChild(uiHostController)
        uiHostController.view.frame = view.bounds
        view.addSubview(uiHostController.view)
        uiHostController.didMove(toParent: self)
    }
}
