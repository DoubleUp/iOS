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
        
        self.locationLabel = [UILabel lightGreyRegularLabelWithSize:smallLabelSize];
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
        
        //?? hmm, don't want to have to do this
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

-(void)setCellTrickPost:(TrickPost *)cellTrickPost
{
    _cellTrickPost = cellTrickPost;
    [self updateCellView];
}

-(void)updateCellView
{
    CGFloat yPos = 2*CELL_MARGIN - 5;
    CGFloat labelHeight = 15.0;
    CGFloat labelMargin = 4;
    
    //avatar
    self.avatar.image = [UIImage imageNamed:self.cellTrickPost.whoDidTrick.avatar.imageFile];
    self.avatar.frame = CGRectMake(CELL_MARGIN, yPos, self.avatar.image.size.width, self.avatar.image.size.height);
    self.avatar.hidden = NO;
    
    //riderName
    yPos += 3;
    CGFloat titleXPos = CELL_MARGIN + self.avatar.frame.size.width + 2 * labelMargin;
    self.riderLabel.text = self.cellTrickPost.whoDidTrick.name;
    self.riderLabel.frame = CGRectMake(titleXPos, yPos, 220.0, labelHeight);
    self.riderLabel.textAlignment = NSTextAlignmentLeft;
    [self.riderLabel sizeToFit];
    
    //Location icon and title
    yPos += labelHeight + 10;
    
    self.locationIcon.frame = CGRectMake(titleXPos, yPos + 2, self.locationIcon.frame.size.width, self.locationIcon.frame.size.height);
    
    self.locationLabel.text = self.cellTrickPost.whichLocation.name;
    self.locationLabel.frame = CGRectMake(titleXPos + self.locationIcon.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
    self.locationLabel.textAlignment = NSTextAlignmentLeft;
    [self.locationLabel sizeToFit];
    
    yPos += 35;
    
    //trick photo
    self.trickPhoto.hidden = YES;
    if(self.cellTrickPost.trickImage.imageFile)
    {
        self.trickPhoto.frame = CGRectMake(CELL_MARGIN, yPos, self.trickPhoto.frame.size.width, self.trickPhoto.frame.size.height);
        self.trickPhoto.hidden = NO;
        
        yPos += self.trickPhoto.frame.size.height + CELL_MARGIN;
    }
    
    //trick label
    self.trickLabel.text = self.cellTrickPost.trickType.name;
    self.trickLabel.frame = CGRectMake(CELL_MARGIN, yPos, 220.0, labelHeight);
    self.trickLabel.textAlignment = NSTextAlignmentLeft;
    [self.trickLabel sizeToFit];
    
    if([self.cellTrickPost.trickType.doubleUp boolValue])
    {
        self.doubleUpLabel.text = @"off a double up.";
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
    if([self.cellTrickPost.whoVouchedTrick allObjects].count > 0)
    {
        yPos += labelHeight + 15;
        self.vouchIcon.frame = CGRectMake(CELL_MARGIN, yPos + 1, self.vouchIcon.frame.size.width, self.vouchIcon.frame.size.height);
        
        NSString* vouchText = @"";
        for(NSUInteger i=0; i<[self.cellTrickPost.whoVouchedTrick allObjects].count; i++)
        {
            UserProfile* voucher = (UserProfile*)([[self.cellTrickPost.whoVouchedTrick allObjects] objectAtIndex:i]);
            vouchText = [vouchText stringByAppendingString:voucher.nickName];
            if(i < [self.cellTrickPost.whoVouchedTrick allObjects].count-1)
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
    NSArray* comments = [self.cellTrickPost.comments allObjects];
    if(comments.count > 0)
    {
        yPos += labelHeight + 5;
        if([self.cellTrickPost.whoVouchedTrick allObjects].count <= 0)
            yPos += 15;
        
        self.commentIcon.frame = CGRectMake(CELL_MARGIN, yPos + 4, self.commentIcon.frame.size.width, self.commentIcon.frame.size.height);
        
        //?? just do the first comment for now
        Comment* cellComment = [comments objectAtIndex:0];
        self.commenterLabel.text = cellComment.commenter.nickName;
        self.commenterLabel.frame = CGRectMake(CELL_MARGIN + self.commentIcon.frame.size.width + labelMargin, yPos, 200.0, labelHeight);
        self.commenterLabel.textAlignment = NSTextAlignmentLeft;
        [self.commenterLabel sizeToFit];
        
        self.commentLabel.text = cellComment.text;
        self.commentLabel.frame = CGRectMake(CELL_MARGIN + self.commentIcon.frame.size.width + self.commenterLabel.frame.size.width + 2 *labelMargin, yPos, 200.0, labelHeight);
        self.commentLabel.textAlignment = NSTextAlignmentLeft;
        [self.commentLabel sizeToFit];
    }
    else
    {
        self.commentIcon.hidden = YES;
        self.commentLabel.hidden = YES;
    }
    
    yPos += labelHeight + 2*CELL_MARGIN;
    
    self.separator.frame = CGRectMake(0, yPos, self.frame.size.width, self.separator.frame.size.height);
}

+ (CGFloat)cellHeightForTrickPost:(TrickPost*)trickPost;
{
    //?? this is copied from the function above. This really needs to be done in one function if possible
    CGFloat yPos = 2*CELL_MARGIN - 5;
    CGFloat labelHeight = 15.0;
    
    yPos += 3;
    yPos += labelHeight + 10;
    yPos += 35;
    
    
    if(trickPost.trickImage.imageFile)
    {
        UIImage* img = [UIImage imageNamed:trickPost.trickImage.imageFile];
        yPos += img.size.height + CELL_MARGIN;
    }
    
    if([trickPost.whoVouchedTrick allObjects].count > 0)
    {
        yPos += labelHeight + 15;
    }
    
    if([trickPost.comments allObjects].count > 0)
    {
        yPos += labelHeight + 5;
        if([trickPost.whoVouchedTrick allObjects].count <= 0)
            yPos += 15;
    }
    
    yPos += labelHeight + 2*CELL_MARGIN;
    
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
