//
//  QuoteQuizViewController.h
//  ExploreiOS
//
//  Created by Fazil T on 02/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz;
/*
 The class directive is known as a forward declaration. It informs the compiler that the Quiz class will be defined later in the compilation process. This is used to resolve circular dependences.

 Think of it like this: class A depends on class B, but class B has some code that depends on class A. The compiler is unable to resolve this dependency, since it needs to know about both classes at the same time. The class directive tells the compiler: “Hang ten, good buddy, you don’t need to know about this class now. Just know that I’m going to be using it — the definition is coming down the road.”
 */
@interface QuoteQuizViewController : UIViewController

@end
