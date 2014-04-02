//
//  QuizTipViewController.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/31814/objectively-speaking-2-a-crash-course-in-objective-c-for-ios-6
//
//  Created by Fazil T on 02/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QuizTipViewControllerDelegate;
/*
 A protocol allows classes to share similarly defined behavior. This is helpful when classes are not related to each other, but still behave in similar ways. In this way, classes do not need to “know” about one another, which reduces dependencies throughout your code.
 Notice that the protocol has the word “delegate” in it. What’s a delegate?
 A delegate is an object that performs work on behalf of another object. For example, a foreman delegates the construction of a sidewalk to some of his workers in the same way an object may delegate the processing of information to another object. In this case, the class will notify another object that an event has occurred.

 */
@interface QuizTipViewController : UIViewController
@property (nonatomic, assign) id <QuizTipViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString * tipText;

@end

@protocol QuizTipViewControllerDelegate
- (void)quizTipDidFinish:(QuizTipViewController *)controller;
@end