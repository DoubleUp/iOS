//
//  Movie.h
//  Wakeboard
//
//  Created by Gary Robinson on 2/17/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TrickPost;

@interface Movie : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) TrickPost *trickPost;

@end
