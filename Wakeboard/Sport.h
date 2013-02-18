//
//  Sport.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location, TrickPost, TrickType, UserProfile;

@interface Sport : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *trickPosts;
@property (nonatomic, retain) NSSet *trickTypes;
@property (nonatomic, retain) NSSet *locations;
@property (nonatomic, retain) UserProfile *whoFollows;
@end

@interface Sport (CoreDataGeneratedAccessors)

- (void)addTrickPostsObject:(TrickPost *)value;
- (void)removeTrickPostsObject:(TrickPost *)value;
- (void)addTrickPosts:(NSSet *)values;
- (void)removeTrickPosts:(NSSet *)values;

- (void)addTrickTypesObject:(TrickType *)value;
- (void)removeTrickTypesObject:(TrickType *)value;
- (void)addTrickTypes:(NSSet *)values;
- (void)removeTrickTypes:(NSSet *)values;

- (void)addLocationsObject:(Location *)value;
- (void)removeLocationsObject:(Location *)value;
- (void)addLocations:(NSSet *)values;
- (void)removeLocations:(NSSet *)values;

@end
