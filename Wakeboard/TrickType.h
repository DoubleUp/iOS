//
//  TrickType.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sport, TrickPost, UserProfile;

@interface TrickType : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) TrickPost *trickPosts;
@property (nonatomic, retain) NSSet *sports;
@property (nonatomic, retain) UserProfile *whoAccomplished;
@end

@interface TrickType (CoreDataGeneratedAccessors)

- (void)addSportsObject:(Sport *)value;
- (void)removeSportsObject:(Sport *)value;
- (void)addSports:(NSSet *)values;
- (void)removeSports:(NSSet *)values;

@end
