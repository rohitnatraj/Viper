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

- (UIAlertController *)displayAlertWithType:(AlertType)type actionHandler:(void (^) (NSString *buttonTitle, NSString *userInputtedText))actionHandler {
        if (actionHandler) {
                actionHandler(self.buttonTitleToBePushed, self.textFieldTextToBeEntered);
        }
        return nil;
}

- (UIAlertController *)displayAlertWithType:(AlertType)type andPlaceholderText:(NSString *)placeholderText actionHandler:(void (^) (NSString *buttonTitle, NSString *userInputtedText))actionHandler {
        if (actionHandler) {
                actionHandler(self.buttonTitleToBePushed, self.textFieldTextToBeEntered);
        }
        return nil;
}

@end

#define VariableName(arg) (@""#arg)

#define CALL_ORIGIN [[[[NSThread callStackSymbols] objectAtIndex:1] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]] objectAtIndex:1]

@interface BaseTestClass ()

@property (nonatomic, strong) NSMutableDictionary *checkpoints;
@property (nonatomic) NSInteger checkpointHitCount;
@property (nonatomic) BOOL checkpointOrderIrrelevant;

@end


@implementation BaseTestClass

#pragma mark - Setup

- (void)setUp {
        [super setUp];
        
        id <WireframeTestProtocol> protocolWireframe = self.wireframe;
        protocolWireframe.view = self.viewMock;
        
        id <PresenterTestProtocol> protocolPresenter = protocolWireframe.presenter;
        protocolPresenter.view = (id)self.viewMock;
        self.viewMock.presenter = protocolWireframe.presenter;
        
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

- (void)setCheckpoints:(NSMutableDictionary *)checkpoints {
        _checkpoints = checkpoints;
        self.checkpointHitCount = 0;
        self.checkpointOrderIrrelevant = false;
}

#pragma mark - Getter

- (AlertControllerMock *)alertControllerMock {
        if (!_alertControllerMock) {
                _alertControllerMock = [AlertControllerMock new];
        }
        return (id)_alertControllerMock;
}

#pragma mark - Checkpoints

- (void)verifyCheckpoints {
        NSMutableArray *checkpointsNotHit = [NSMutableArray new];
        NSMutableArray *checkpointsHit = [NSMutableArray new];
        BOOL unhitCheckpoints = false;
        BOOL outOfOrderCheckpoints = false;
        
        for (NSInteger currentCheckpointNumber=1; currentCheckpointNumber<=self.checkpoints.count; currentCheckpointNumber++) {
                NSNumber *key = @(currentCheckpointNumber);
                NSNumber *value = self.checkpoints[key];
                if (!value) {
                        [checkpointsNotHit addObject:key.stringValue];
                        unhitCheckpoints = true;
                } else {
                        [checkpointsHit addObject:value.stringValue];
                        if (value.integerValue != currentCheckpointNumber) {
                                outOfOrderCheckpoints = true;
                        }
                }
        }
        
        if (unhitCheckpoints) {
                NSString *checkpointsNotHitString = [checkpointsNotHit componentsJoinedByString:@", "];
                XCTFail(@"\n\n\n\n****** TEST FAILED ******\n\nDESCRIPTION: %@\n\nTest failed due to unhit checkpoints!: #%@\n\n-------------------------\n\n\n\n", self.testDescription, checkpointsNotHitString);
        } else if (outOfOrderCheckpoints && !self.checkpointOrderIrrelevant) {
                NSString *checkpointsOrder = [checkpointsHit componentsJoinedByString:@", "];
                XCTFail(@"\n\n\n\n****** TEST FAILED ******\n\nDESCRIPTION: %@\n\nTest failed. Checkpoints were hit out of order!: #%@\n\n-------------------------\n\n\n\n", self.testDescription, checkpointsOrder);
        } else {
                NSString *checkpointsOrder = [checkpointsHit componentsJoinedByString:@", "];
                NSString *passMessage = (self.checkpointOrderIrrelevant) ? @"All checkpoints passed (order set as irrelevant...)!" : @"All checkpoints passed in the correct order!";
                NSLog(@"\n\n\n\n****** TEST PASSED ******\n\nDESCRIPTION: %@\n\n%@ (%@)\n\n-------------------------\n\n\n\n", self.testDescription, passMessage, checkpointsOrder);
                
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
        self.checkpointHitCount ++;
        NSNumber *key = @(checkpoint);
        self.checkpoints[key] = @(self.checkpointHitCount);
}

- (void)setCheckpointOrderIrrelevant {
        self.checkpointOrderIrrelevant = true;
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
