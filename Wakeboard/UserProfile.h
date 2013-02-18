//
//  UserProfile.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Image, Sport, TrickPost, TrickType;

@interface UserProfile : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) Comment *comments;
@property (nonatomic, retain) NSSet *trickPosts;
@property (nonatomic, retain) NSSet *vouchedTricks;
@property (nonatomic, retain) Image *avatar;
@property (nonatomic, retain) Sport *sports;
@property (nonatomic, retain) TrickType *accomplishedTricks;
@end

@interface UserProfile (CoreDataGeneratedAccessors)

- (void)addTrickPostsObject:(TrickPost *)value;
- (void)removeTrickPostsObject:(TrickPost *)value;
- (void)addTrickPosts:(NSSet *)values;
- (void)removeTrickPosts:(NSSet *)values;

- (void)addVouchedTricksObject:(TrickPost *)value;
- (void)removeVouchedTricksObject:(TrickPost *)value;
- (void)addVouchedTricks:(NSSet *)values;
- (void)removeVouchedTricks:(NSSet *)values;

@end
