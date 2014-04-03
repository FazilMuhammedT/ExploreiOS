//
//  LibraryAPI.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/46988/ios-design-patterns
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//
/*
 The Facade Design Pattern
 The Facade design pattern provides a single interface to a complex subsystem. Instead of exposing the user to a set of classes and their APIs, you only expose one simple unified API.
 The Facade pattern decouples the code that uses the system from the interface and implementation of the classes you’re hiding; it also reduces dependencies of outside code on the inner workings of your subsystem. This is also useful if the classes under the facade are likely to change, as the facade class can retain the same API while things change behind the scenes.

 */

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI () {
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnline;
}

@end

@implementation LibraryAPI

+ (LibraryAPI*)sharedInstance
{
    // 1 Declare a static variable to hold the instance of your class, ensuring it’s available globally inside your class.
    static LibraryAPI *_sharedInstance = nil;
    
    // 2 Declare the static variable dispatch_once_t which ensures that the initialization code executes only once.
    static dispatch_once_t oncePredicate;
    
    // 3 Use Grand Central Dispatch (GCD) to execute a block which initializes an instance of LibraryAPI. This is the essence of the Singleton design pattern: the initializer is never called again once the class has been instantiated.
    // The dispatch_once function takes care of all the necessary locking and synchronization
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

/*
+ (id)sharedFoo
{
    static Foo *foo = nil;
    if(!foo)
        foo = [[self alloc] init];
    return foo;
}
*/

- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        isOnline = NO;
    }
    return self;
}

- (NSArray*)getAlbums
{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(Album*)album atIndex:(int)index
{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}
@end
