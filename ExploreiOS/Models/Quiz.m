//
//  Quiz.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/31814/objectively-speaking-2-a-crash-course-in-objective-c-for-ios-6
//
//  Created by Fazil T on 02/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "Quiz.h"

@interface Quiz()
@property (nonatomic, strong) NSString * quote;
@property (nonatomic, strong) NSString * ans1;
@property (nonatomic, strong) NSString * ans2;
@property (nonatomic, strong) NSString * ans3;
/*
 This is known as a class extension, which gives you the ability to read and write to these properties locally inside your implementation. But to the rest of the world, these properties still appear read-only.
 */
@end

@implementation Quiz
- (id)initWithQuiz:(NSString*)plistName
{
    if ((self = [super init]))
    {
        NSString *plistFilePath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        self.movieArray = [NSMutableArray arrayWithContentsOfFile:plistFilePath];
        self.quizCount = [self.movieArray count];
        self.tipCount = 0;
    }
    return self;
}

- (void) nextQuestion: (NSUInteger) idx
{
    self.quote = [NSString stringWithFormat:@"'%@'",self.movieArray[idx][@"quote"]];
    
    self.ans1 = self.movieArray[idx][@"ans1"];
    self.ans2 = self.movieArray[idx][@"ans2"];
    self.ans3 = self.movieArray[idx][@"ans3"];
    self.tip = self.movieArray[idx][@"tip"];

    if (idx == 0) {
        self.correctCount = 0;
        self.incorrectCount = 0;
        self.tipCount = 0;
    }
}
- (BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer
{
    NSString * ans = self.movieArray[question] [@"answer"];
    if  ([ans intValue] == answer) {
        self.correctCount++;
        return YES;
    } else  {
        self.incorrectCount++;
        return NO;
    }
}
@end
