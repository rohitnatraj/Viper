//
//  TestClass.m
//  FalconUniversal
//
//  Created by Kevin Teman on 7/11/16.
//  Copyright © 2016 DaVita. All rights reserved.
//

#import "BaseTestClass.h"

#pragma mark - Alert Controller Mock

@interface AlertControllerMock : AlertController <AlertControllerMockProtocol>

@end

@implementation AlertControllerMock

@synthesize buttonTitleToBePushed, textFieldTextToBeEntered, tests;

- (void)displayAlertWithType:(AlertType)type actionHandler:(void (^) (NSString *buttonTitle, NSString *userInputtedText))actionHandler {
        if (actionHandler) {
                actionHandler(self.buttonTitleToBePushed, self.textFieldTextToBeEntered);
        }
}

- (void)displayAlertWithType:(AlertType)type andPlaceholderText:(NSString *)placeholderText actionHandler:(void (^) (NSString *buttonTitle, NSString *userInputtedText))actionHandler {
        if (actionHandler) {
                actionHandler(self.buttonTitleToBePushed, self.textFieldTextToBeEntered);
        }
}

@end

#define VariableName(arg) (@""#arg)

#define CALL_ORIGIN [[[[NSThread callStackSymbols] objectAtIndex:1] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]] objectAtIndex:1]

@interface BaseTestClass ()

@property (nonatomic, strong) NSMutableDictionary *checkpoints;

@end


@implementation BaseTestClass

#pragma mark - Setup

- (void)setUp {
        [super setUp];
        
        self.wireframe.view = self.viewMock;
        [self.wireframe.presenter setView:(id)self.viewMock];
        self.viewMock.presenter = self.wireframe.presenter;
        
        [self.wireframe.presenter setView:(id)self.viewMock];
        self.viewMock.presenter = self.wireframe.presenter;
        
        [self.viewMock setTests:self];
        [self.serviceMock setTests:self];
        [self.alertControllerMock setTests:self];
}

- (void)tearDown {
        [super tearDown];
}

- (void)assertNil:(id)itemToAssert {
        NSString *variableName = VariableName(itemToAssert);
        XCTAssertNil(itemToAssert, @"%@ should have been nil, but wasn't. Caller: %@", variableName, CALL_ORIGIN);
}

- (void)assertNotNil:(id)itemToAssert {
        NSString *variableName = VariableName(itemToAssert);
        XCTAssertNotNil(itemToAssert, @"%@ should have not been nil, but was. Caller: %@", variableName, CALL_ORIGIN);
}

- (void)assertFalse:(BOOL)itemToAssert {
        NSString *variableName = VariableName(itemToAssert);
        XCTAssertFalse(itemToAssert, @"%@ should have been false, but wasn't. Caller: %@", variableName, CALL_ORIGIN);
}

- (void)assert:(int)itemOne isEqualTo:(int)itemTwo {
        
        NSString *firstVariableName = VariableName(itemOne);
        NSString *secondVariableName = VariableName(itemTwo);

        XCTAssertEqual(itemOne, itemTwo, @"%@ should have been equal to %@, but wasn't. Caller: %@", firstVariableName, secondVariableName, CALL_ORIGIN);
}

- (void)assertObject:(id)objectOne isEqualTo:(id)objectTwo {
        
        XCTAssertEqualObjects(objectOne, objectTwo, @"Caller: %@", CALL_ORIGIN);
}

- (void)assertKeyword:(NSString *)keyword existsInString:(NSString *)string {
        if (![string localizedCaseInsensitiveCompare:keyword]) {
                XCTFail(@"Keyword '%@' was not found in string: '%@'. Caller: %@", keyword, string, CALL_ORIGIN);
        }
}

#pragma mark - Setters

- (void)setTestDescription:(NSString *)testDescription {
        _testDescription = testDescription;
        
        if (self.viewMock) {
                self.viewMock.testDescription = _testDescription;
        }
        
        if (self.serviceMock) {
                self.serviceMock.testDescription = _testDescription;
        }
}

#pragma mark - Getter

- (AlertControllerMock *)alertControllerMock {
        if (!_alertControllerMock) {
                _alertControllerMock = (id)[AlertControllerMock new];
        }
        return _alertControllerMock;
}

#pragma mark - Checkpoints

- (void)verifyCheckpoints {
        NSMutableArray *checkpointsNotHit = [NSMutableArray new];
        BOOL failed = false;
        
        for (NSInteger i=1; i<=self.checkpoints.count; i++) {
                NSNumber *key = @(i);
                if ([self.checkpoints[key] isEqual: @false]) {
                        [checkpointsNotHit addObject:key.stringValue];
                        failed = true;
                }
        }
        
        if (failed) {
                NSString *checkpointsNotHitString = [checkpointsNotHit componentsJoinedByString:@", "];
                XCTFail(@"Test failed due to unhit checkpoints: #%@", checkpointsNotHitString);
        }
}

- (void)setNumberOfCheckpoints:(NSInteger)checkpointsAmount {
        self.checkpoints = [NSMutableDictionary new];
        for (NSInteger i=1; i<=checkpointsAmount; i++) {
                NSNumber *key = @(i);
                self.checkpoints[key] = @false;
        }
}

- (void)completeCheckpoint:(NSInteger)checkpoint {
        NSNumber *key = @(checkpoint);
        self.checkpoints[key] = @true;
}

#pragma mark - Convenience

- (BOOL)inTestCase:(NSString *)testCase {
        return [self inTestCases:@[testCase]];
}

- (BOOL)inTestCases:(NSArray <NSString *> *)testCases {
        for (NSString *testCase in testCases) {
                if ([self.testDescription isEqualToString:testCase]) {
                        return true;
                }
        }
        return false;
}

@end
