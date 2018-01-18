//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

/* @testable import REPLACE_WITH_MODULE_NAME */



// *********************************** DISCUSSION ************************************* //
//                                                                                      //
//                                                                                      //
// NOTE: Your interactor should have a service on it, and the property should be named  //
// "service". Your service class must inheret from NSObject                             //
//                                                                                      //
// NOTE AGAIN: Due to Objective-C limitations (base class is in Objective-C) your       //
// Wireframe and Protocols will have to be added to the test target.                    //
//                                                                                      //
//                                                                                      //
// STEP 1: Change the "self.serviceMock as! ServiceClass" to your service class name    //
//                                                                                      //
//                                                                                      //
// ************************************************************************************ //



class ___FILEBASENAMEASIDENTIFIER___Tests: BaseTestClass, ___FILEBASENAMEASIDENTIFIER___Delegate {
        
        static let kTestCase1 = "This is an example of a test case describing what is being tested."
        static let kTestCase2 = "This is a second example of a test case describing what is being tested."
        
        //MARK: Setup
        
        var localWireframe:___FILEBASENAMEASIDENTIFIER___Wireframe!
        
        private func recreateStack () {
                self.setUp()
        }
        
        private func createLocalWireframe () {
                let localWireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
                localWireframe.delegate = self
                self.localWireframe = localWireframe
                self.wireframe = localWireframe
        }
        
        override func setUp () {
                
                self.createLocalWireframe()
                super.setUp()
                
                /* Uncomment this to replace alert controllers with mock alert controller
                 self.localWireframe.alertController = self.alertControllerMock;
                 */
                
                ((self.localWireframe.presenter as! ___FILEBASENAMEASIDENTIFIER___Presenter).interactor as! ___FILEBASENAMEASIDENTIFIER___Interactor).service = self.serviceMock as! ServiceClass
                
        }
        
        override func tearDown () {
                super.tearDown()
        }
        
        //MARK: Getters
        
        override var viewMock:ViewMockProtocol! {
                get {
                        if super.viewMock == nil {
                                super.viewMock = ___FILEBASENAMEASIDENTIFIER___ViewMock()
                        }
                        return super.viewMock
                }
                set {
                        super.viewMock = newValue
                }
        }
        
        override var serviceMock:ServiceMockProtocol! {
                get {
                        if super.serviceMock == nil {
                                super.serviceMock = ___FILEBASENAMEASIDENTIFIER___ServiceMock()
                        }
                        return super.serviceMock
                }
                set {
                        super.serviceMock = newValue
                }
        }
        
        //MARK: Tests
        
        func testPublicMethodOnWireframe () {
                // One test method per public method in ___FILEBASENAMEASIDENTIFIER___Wireframe.h
                
                /* Description
                 Set self.testDescription to test descriptions declared at top
                 */
                
                /* Alert View
                 Set self.alertControllerMock.buttonTitleToBePushed to automatically have button pressed
                 Set self.alertControllerMock.textFieldTextToBeEntered to simulate text entered
                 */
                
                /* Service
                 Set self.serviceMock.dataToReturn to manipulate return of data directly
                 Then set back to nil to make sure it doesn't return that data on the next test
                 */
                
                /* Checkpoints
                 Call self.numberOfCheckpoints(aNumber) with number of checkpoints which need to be hit
                 Then self.verifyCheckpoints() to assert checkpoints were hit
                 */
                
                /* Recreate Stack
                 If needed, in between calling methods call self.recreateStack to reinitialize the stack
                 */
        }
        
        //MARK: Module Delegate
        
        /* Delegate methods (outgoing from module)
         func delegateMethod___FILEBASENAMEASIDENTIFIER___ () {
         
         }
         */
        
}
