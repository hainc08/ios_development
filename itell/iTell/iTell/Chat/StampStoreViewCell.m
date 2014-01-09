//
//  FriendsViewCell.m
//  iTell
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StampStoreViewCell.h"

#define kTimeOutLoadImage 60

@interface StampStoreViewCell()
@end

@implementation StampStoreViewCell
@synthesize lbTitle,lbCost,lbSortContent;
@synthesize imgStamp;


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc {
    [lbTitle release];
    [lbCost release];
    [lbSortContent release];
    [imgStamp release];
    [super dealloc];
}
@end
