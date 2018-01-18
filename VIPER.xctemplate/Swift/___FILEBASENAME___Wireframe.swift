//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___Wireframe : NSObject, ___FILEBASENAMEASIDENTIFIER___PresenterToWireframeInterface {
        
        // MARK: - VIPER Stack
        lazy var presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        lazy var interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        lazy var view: ___FILEBASENAMEASIDENTIFIER___View = {
                let sb = ___FILEBASENAMEASIDENTIFIER___Wireframe.storyboard()
                let vc = sb.instantiateViewController(withIdentifier: k___FILEBASENAMEASIDENTIFIER___ViewIdentifier) as! ___FILEBASENAMEASIDENTIFIER___View
                return vc
        }()
        
        // Uncomment the following comment lines to use a navigationController instead
        /*
        private lazy var navigationController: UINavigationController = {
                let sb = ___FILEBASENAMEASIDENTIFIER___Wireframe.storyboard()
                let v = sb.instantiateViewController(withIdentifier: k___FILEBASENAMEASIDENTIFIER___NavigationControllerIdentifier) as! UINavigationController
                return v
        }()
        lazy var view: ___FILEBASENAMEASIDENTIFIER___View = {
                return self.navigationController.viewControllers[0] as! ___FILEBASENAMEASIDENTIFIER___View
        }()
        */
        
        // MARK: - Instance Variables
        weak var delegate: ___FILEBASENAMEASIDENTIFIER___Delegate?
        
        // MARK: - Initialization
        override init() {
                super.init()
                
                let p = self.presenter
                
                interactor.presenter = p
                p.interactor = interactor
                p.view = view
                p.wireframe = self
                view.presenter = p
        }

	class func storyboard() -> UIStoryboard {
                return UIStoryboard(name: k___FILEBASENAMEASIDENTIFIER___StoryboardIdentifier, bundle: Bundle(for: ___FILEBASENAMEASIDENTIFIER___Wireframe.self))
	}
        
        // MARK: - Operational
        
        // MARK: - Module Interface
        
        // MARK: - Wireframe Interface
        
}
