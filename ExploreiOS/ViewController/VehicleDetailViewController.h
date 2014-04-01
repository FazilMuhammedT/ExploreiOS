//
//  VehicleDetailViewController.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

//Forward declaration of a class to be imported in the .m file
@class Vehicle;

@interface VehicleDetailViewController : UIViewController
@property (strong, nonatomic) Vehicle *detailVehicle;

@end
