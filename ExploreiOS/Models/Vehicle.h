//
//  Vehicle.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
@property (nonatomic, assign)   NSInteger   numberOfWheels;
@property (nonatomic, copy)     NSString    *powerSource;
@property (nonatomic, copy)     NSString    *brandName;
@property (nonatomic, copy)     NSString    *modelName;
@property (nonatomic, assign)   NSInteger   modelYear;

//Basic operation methods
-(NSString *)goForward;
-(NSString *)goBackward;
-(NSString *)stopMoving;
-(NSString *)changeGears:(NSString *)newGearName;
-(NSString *)turn:(NSInteger)degrees;
-(NSString *)makeNoise;

//Convenience method for UITableViewCells and UINavigationBar titles.
-(NSString *)vehicleTitleString;
//Convenience method to get the vehicle's details.
-(NSString *)vehicleDetailsString;

@end
