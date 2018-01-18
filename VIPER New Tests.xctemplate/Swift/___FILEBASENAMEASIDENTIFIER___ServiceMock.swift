//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

/* @testable import REPLACE_WITH_MODULE_NAME */

class ___FILEBASENAMEASIDENTIFIER___ServiceMock: ___FILEBASENAMEASIDENTIFIER___Service, ServiceMockProtocol {
        
        public var dataToReturn: Any!
        public var testDescription: String!
        public var tests:BaseTestClass?
        
        func testMethodWithSomething(someParameter:String, success:((_ result:[String:Any]) -> ())?, failure:((_ error:NSError) -> ())?) {
                
                if self.dataToReturn != nil {
                        success?(self.dataToReturn as! [String:Any])
                        return
                }
                
                /* Call success handler immediately with fake data depending on which test case we're in
                 if self.tests.inTestCase(kTestCase1) {
                        success?(["fakeKey":"fakeValue"])
                 }
                 */
        }
}
