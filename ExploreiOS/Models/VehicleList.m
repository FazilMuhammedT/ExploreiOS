//
//  VehicleList.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/45942/intro-object-oriented-design-part-2
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "VehicleList.h"
#import "Car.h"
#import "Motorcycle.h"
#import "Truck.h"

@implementation VehicleList

+ (VehicleList *)sharedInstance
{
    //Declare a static instance variable
    static VehicleList *_vehicleList = nil;
    
    //Create a token that facilitates only creating this item once.
    static dispatch_once_t onceToken;
    
    //Use Grand Central Dispatch to create a single instance and do any initial setup only once.
    dispatch_once(&onceToken, ^{
        //These are only invoked the onceToken has never been used before.
        _vehicleList = [[VehicleList alloc] init];
        _vehicleList.vehicles = [VehicleList initialVehicleList];
    });
    
    //Returns the shared instance variable.
    return _vehicleList;
}

/*
 Instead of checking the null/not null status of the _vehicleList instance variable, GCD can more quickly test whether the onceToken has been executed or not in order to decide whether it needs to create the _vehicleList instance. Using GCD to perform this check is also thread-safe, since dispatch_once ensures that when it’s called from multiple threads, each thread will finish before the next one is allowed to try and create the instance.
 
 You can’t accidentally overwrite the _vehicleList instance. Since static variables can only be initialized once, if someone accidentally adds another [[VehicleList alloc] init] call once the _vehicleList variable has an initialized object, it won’t have any effect on your existing VehicleList object.
 */

+ (NSArray *)initialVehicleList
{
    //Initialize mutable array.
    NSMutableArray *vehicles = [NSMutableArray array];
    
    //Create a car.
    Car *mustang = [Car carWithBrandName:@"Ford"
                               modelName:@"Mustang"
                               modelYear:1968
                             powerSource:@"gas engine"
                           numberOfDoors:2
                             convertible:YES
                               hatchback:NO
                                 sunroof:NO
                    ];
    
    //Add it to the array
    [vehicles addObject:mustang];
    
    //Create another car.
    Car *outback = [Car carWithBrandName:@"Subaru"
                               modelName:@"Outback"
                               modelYear:1999
                             powerSource:@"gas engine"
                           numberOfDoors:5 convertible:NO
                               hatchback:YES
                                 sunroof:NO
                    ];
    
    //Add it to the array.
    [vehicles addObject:outback];
    
    //Create another car
    Car *prius = [Car carWithBrandName:@"Toyota"
                             modelName:@"Prius"
                             modelYear:2007
                           powerSource:@"hybrid engine"
                         numberOfDoors:5
                           convertible:YES
                             hatchback:YES
                               sunroof:YES
                  ];
    
    //Add it to the array.
    [vehicles addObject:prius];
    
    //Add a motorcycle
    MotorCycle *harley = [MotorCycle motorcycleWithBrandName:@"Harley-Davidson"
                                                   modelName:@"Softail"
                                                   modelYear:1979
                                                 engineNoise:@"Vrrrrrrrroooooooooom!"
                          ];
    
    //Add it to the array.
    [vehicles addObject:harley];
    
    //Add another motorcycle
    MotorCycle *kawasaki = [MotorCycle motorcycleWithBrandName:@"Kawasaki"
                                                     modelName:@"Ninja"
                                                     modelYear:2005
                                                   engineNoise:@"Neeeeeeeeeeeeeeeeow!"
                            ];
    
    //Add it to the array
    [vehicles addObject:kawasaki];
    
    //Create a truck
    Truck *silverado = [Truck truckWithBrandName:@"Chevrolet"
                                       modelName:@"Silverado"
                                       modelYear:2011
                                     powerSource:@"gas engine"
                                          wheels:4
                          cargoCapacityCubicFeet:53
                        ];
    
    [vehicles addObject:silverado];
    
    //Create another truck
    Truck *eighteenWheeler = [Truck truckWithBrandName:@"Peterbilt"
                                             modelName:@"579"
                                             modelYear:2013
                                           powerSource:@"diesel engine"
                                                wheels:18
                                cargoCapacityCubicFeet:408
                              ];
    
    [vehicles addObject:eighteenWheeler];
    
    //Sort the array by the model year
    NSSortDescriptor *modelYear = [NSSortDescriptor sortDescriptorWithKey:@"modelYear" ascending:NO];
    [vehicles sortUsingDescriptors:@[modelYear]];
    
    return vehicles;

}
@end
