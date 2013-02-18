//
//  TrickPost.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Image, Location, Movie, Sport, TrickType, UserProfile;

@interface TrickPost : NSManagedObject

@property (nonatomic, retain) NSNumber * doubleUp;
@property (nonatomic, retain) NSString * imageFile;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) TrickType *trickType;
@property (nonatomic, retain) Location *whichLocation;
@property (nonatomic, retain) UserProfile *whoDidTrick;
@property (nonatomic, retain) NSSet *whoVouchedTrick;
@property (nonatomic, retain) Sport *trickSport;
@property (nonatomic, retain) Image *trickImage;
@property (nonatomic, retain) Movie *trickMovie;
@end

@interface TrickPost (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addWhoVouchedTrickObject:(UserProfile *)value;
- (void)removeWhoVouchedTrickObject:(UserProfile *)value;
- (void)addWhoVouchedTrick:(NSSet *)values;
- (void)removeWhoVouchedTrick:(NSSet *)values;

@end
