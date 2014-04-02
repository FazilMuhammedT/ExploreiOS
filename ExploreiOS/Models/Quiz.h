//
//  Quiz.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/31814/objectively-speaking-2-a-crash-course-in-objective-c-for-ios-6
//
//  Created by Fazil T on 02/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject
@property (nonatomic, strong) NSMutableArray * movieArray;
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger incorrectCount;
@property (nonatomic, assign) NSInteger quizCount;
@property (nonatomic, readonly, strong) NSString * quote;
@property (nonatomic, readonly, strong) NSString * ans1;
@property (nonatomic, readonly, strong) NSString * ans2;
@property (nonatomic, readonly, strong) NSString * ans3;

@property (nonatomic, assign) NSInteger tipCount;
@property (nonatomic, strong) NSString * tip;

- (id)initWithQuiz:(NSString*)plistName;
-(void) nextQuestion: (NSUInteger) idx;
-(BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer;

@end
