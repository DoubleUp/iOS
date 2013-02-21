//
//  Image.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/21/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TrickPost, UserProfile;

@interface Image : NSManagedObject

@property (nonatomic, retain) NSString * imageFile;
@property (nonatomic, retain) UserProfile *avatarForUser;
@property (nonatomic, retain) TrickPost *trickPost;

@end
