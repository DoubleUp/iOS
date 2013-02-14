//
//  HomeCellView.m
//  Wakeboard
//
//  Created by Gary Robinson on 2/11/13.
//  Copyright (c) 2013 Chad Zeluff. All rights reserved.
//

#import "HomeCellView.h"
#import "UILabel+Additions.h"

#define CELL_MARGIN         10
#define CELL_HEIGHT         150

@interface HomeCellView ()

@property (nonatomic, strong) UILabel *riderLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *trickLabel;
@property (nonatomic, strong) UILabel *doubleUpLabel;
@property (nonatomic, strong) UILabel *vouchLabel;
@property (nonatomic, strong) UILabel *commenterLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIImageView *trickPhoto;
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIImageView *locationIcon;
@property (nonatomic, strong) UIImageView *vouchIcon;
@property (nonatomic, strong) UIImageView *commentIcon;
@property (nonatomic, strong) UIImageView *separator;

@end

@implementation HomeCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGFloat bigLabelSize = 16;
        CGFloat smallLabelSize = 12;
        
        self.riderLabel = [UILabel blackRegularLabelWithSize:bigLabelSize];
        [self addSubview:self.riderLabel];
        
        self.locationLabel = [UILabel lightGreyRegularLabelWithSize:bigLabelSize];
        [self addSubview:self.locationLabel];
        
        self.trickLabel = [UILabel orangeRegularLabelWithSize:bigLabelSize];
        [self addSubview:self.trickLabel];
        
        self.doubleUpLabel = [UILabel blackRegularLabelWithSize:bigLabelSize];
        [self addSubview:self.doubleUpLabel];
        
        self.vouchLabel = [UILabel blueRegularLabelWithSize:smallLabelSize];
        [self addSubview:self.vouchLabel];
        
        self.commenterLabel = [UILabel blueRegularLabelWithSize:smallLabelSize];
        [self addSubview:self.commenterLabel];
        
        self.commentLabel = [UILabel blackRegularLabelWithSize:smallLabelSize];
        [self addSubview:self.commentLabel];
        
        self.trickPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trickPhoto.png"]];
        [self addSubview:self.trickPhoto];
        
        self.avatar = [[UIImageView alloc] init];
        [self addSubview:self.avatar];
        
        self.locationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-location.png"]];
        [self addSubview:self.locationIcon];
        
        self.vouchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-vouch.png"]];
        [self addSubview:self.vouchIcon];
        
        self.commentIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-comments.png"]];
        [self addSubview:self.commentIcon];
        
        self.separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dotted-line.png"]];
        [self addSubview:self.separator];
    }
    return self;
}

-(void)setCellDictionary:(NSDictionary *)cellDictionary
{
    _cellDictionary = cellDictionary;
    [self updateCellView];
}

-(void)updateCellView
{
    CGFloat yPos = CELL_MARGIN;
    CGFloat labelHeight = 15.0;
    CGFloat labelMargin = 4;
    
    //avatar
    self.avatar.image = [UIImage imageNamed:[self.cellDictionary objectForKey:@"avatarFile"]];;
    self.avatar.frame = CGRectMake(CELL_MARGIN, yPos, self.avatar.image.size.width, self.avatar.image.size.height);
    self.avatar.hidden = NO;
    
    //riderName
    yPos += 3;
    CGFloat titleXPos = CELL_MARGIN + self.avatar.frame.size.width + 2 * labelMargin;
    self.riderLabel.text = [self.cellDictionary objectForKey:@"riderName"];
    self.riderLabel.frame = CGRectMake(titleXPos, yPos, 220.0, labelHeight);
    self.riderLabel.textAlignment = NSTextAlignmentLeft;
    [self.riderLabel sizeToFit];
    
    //Location icon and title
    yPos += labelHeight + 7;
    
    self.locationIcon.frame = CGRectMake(titleXPos, yPos + 5, self.locationIcon.frame.size.width, self.locationIcon.frame.size.height);
    
    self.locationLabel.text = [self.cellDictionary objectForKey:@"locationName"];
    self.locationLabel.frame = CGRectMake(titleXPos + self.locationIcon.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
    self.locationLabel.textAlignment = NSTextAlignmentLeft;
    [self.locationLabel sizeToFit];
    
    yPos += 35;
    
    //?? trick photo here
    self.trickPhoto.hidden = YES;
    if([self.cellDictionary objectForKey:@"photoFile"])
    {
        self.trickPhoto.frame = CGRectMake(CELL_MARGIN, yPos, self.trickPhoto.frame.size.width, self.trickPhoto.frame.size.height);
        self.trickPhoto.hidden = NO;
        
        yPos += self.trickPhoto.frame.size.height + CELL_MARGIN;
    }
    
    //trick label
    self.trickLabel.text = [self.cellDictionary objectForKey:@"trickTitle"];
    self.trickLabel.frame = CGRectMake(CELL_MARGIN, yPos, 220.0, labelHeight);
    self.trickLabel.textAlignment = NSTextAlignmentLeft;
    [self.trickLabel sizeToFit];
    
    if([[self.cellDictionary objectForKey:@"wasDoubleUp"] boolValue])
    {
        self.doubleUpLabel.text = @"off a double up";
        self.doubleUpLabel.frame = CGRectMake(CELL_MARGIN + self.trickLabel.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
        self.doubleUpLabel.textAlignment = NSTextAlignmentLeft;
        [self.doubleUpLabel sizeToFit];
        self.doubleUpLabel.hidden = NO;
    }
    else
    {
        self.doubleUpLabel.hidden = YES;
    }
    
    //vouches
    NSArray* vouchers = [self.cellDictionary objectForKey:@"vouchers"];
    if(vouchers.count > 0)
    {
        yPos += labelHeight + 15;
        self.vouchIcon.frame = CGRectMake(CELL_MARGIN, yPos + 1, self.vouchIcon.frame.size.width, self.vouchIcon.frame.size.height);
        
        NSString* vouchText = @"";
        for(NSUInteger i=0; i<vouchers.count; i++)
        {
            vouchText = [vouchText stringByAppendingString:(NSString*)([vouchers objectAtIndex:i])];
            if(i < vouchers.count-1)
                vouchText = [vouchText stringByAppendingString:@", "];
        }
        self.vouchLabel.text = vouchText;
        self.vouchLabel.frame = CGRectMake(CELL_MARGIN + self.vouchIcon.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
        self.vouchLabel.textAlignment = NSTextAlignmentLeft;
        [self.vouchLabel sizeToFit];
        
        self.vouchLabel.hidden = NO;
        self.vouchIcon.hidden = NO;
    }
    else
    {
        self.vouchLabel.hidden = YES;
        self.vouchIcon.hidden = YES;
    }
    
    //comments
    NSArray* comments = [self.cellDictionary objectForKey:@"comments"];
    if(comments.count > 0)
    {
        yPos += labelHeight + 5;
        if(vouchers.count <= 0)
            yPos += 15;
        
        self.commentIcon.frame = CGRectMake(CELL_MARGIN, yPos + 4, self.commentIcon.frame.size.width, self.commentIcon.frame.size.height);
        
        //?? just do the first comment for now
        NSDictionary* commentDict = [comments objectAtIndex:0];
        
        self.commenterLabel.text = (NSString*)([commentDict objectForKey:@"commentor"]);
        self.commenterLabel.frame = CGRectMake(CELL_MARGIN + self.commentIcon.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
        self.commenterLabel.textAlignment = NSTextAlignmentLeft;
        [self.commenterLabel sizeToFit];
        
        self.commentLabel.text = (NSString*)([commentDict objectForKey:@"comment"]);
        self.commentLabel.frame = CGRectMake(CELL_MARGIN + self.commentIcon.frame.size.width + self.commenterLabel.frame.size.width + 2 *labelMargin, yPos, 200.0, labelHeight);
        self.commentLabel.textAlignment = NSTextAlignmentLeft;
        [self.commentLabel sizeToFit];
    }
    else
    {
        self.commentIcon.hidden = YES;
        self.commentLabel.hidden = YES;
    }
    
    yPos += 40;
    
    self.separator.frame = CGRectMake(0, yPos/*CELL_HEIGHT - self.separator.frame.size.height*/, self.frame.size.width, self.separator.frame.size.height);

    _cellHeight = yPos + self.separator.frame.size.height;
}

+ (CGFloat)heightForDictionary:(NSDictionary*)dictionary
{
    CGFloat yPos = CELL_MARGIN;
    CGFloat labelHeight = 15.0;
    
    yPos += 3;
    yPos += labelHeight + 7;
    yPos += 35;
    
    if([dictionary objectForKey:@"photoFile"])
    {
        UIImage* img = [UIImage imageNamed:[dictionary objectForKey:@"photoFile"]];
        yPos += img.size.height + CELL_MARGIN;
    }
    
    NSArray* vouchers = [dictionary objectForKey:@"vouchers"];
    if(vouchers.count > 0)
    {
        yPos += labelHeight + 15;
    }
    
    NSArray* comments = [dictionary objectForKey:@"comments"];
    if(comments.count > 0)
    {
        yPos += labelHeight + 5;
        if(vouchers.count <= 0)
            yPos += 15;
    }
    
    yPos += 40;
    
    UIImage* separator = [UIImage imageNamed:[dictionary objectForKey:@"dottedLine"]];
    yPos += separator.size.height;
    
    return yPos;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
