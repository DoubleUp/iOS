//
//  Location.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sport, TrickPost;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * minCooordinates;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * maxCoordinates;
@property (nonatomic, retain) NSSet *trickPosts;
@property (nonatomic, retain) NSSet *sports;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addTrickPostsObject:(TrickPost *)value;
- (void)removeTrickPostsObject:(TrickPost *)value;
- (void)addTrickPosts:(NSSet *)values;
- (void)removeTrickPosts:(NSSet *)values;

- (void)addSportsObject:(Sport *)value;
- (void)removeSportsObject:(Sport *)value;
- (void)addSports:(NSSet *)values;
- (void)removeSports:(NSSet *)values;

@end
