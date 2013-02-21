//
//  Comment.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/21/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TrickPost, UserProfile;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) UserProfile *commenter;
@property (nonatomic, retain) TrickPost *trickPost;

@end
