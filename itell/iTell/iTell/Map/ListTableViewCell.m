//
//  ListTableViewCell.m
//  iTell
//
//  Created by admin trator on 8/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ListTableViewCell.h"
#import "UserInfo.h"

@implementation ListTableViewCell

@synthesize userInfo;
@synthesize delegate;
@synthesize cellIndex;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        self = [array objectAtIndex:0];

        
        //[scrollView setScrollEnabled:FALSE];
        
    }
    return self;
}

- (void) showCellInfo{
    
    [_scrollView setContentSize:CGSizeMake(640, 63)];
    NSInteger i = cellIndex %5;
    
    NSString *outerImage  = [NSString stringWithFormat:@"outer_tabnner-tab_chat_%d.png", i];
    outerImageView.image = [UIImage imageNamed:outerImage];
    
    NSString *inerShadowImage = [NSString stringWithFormat:@"inner-tab-%d-shadow@2x.png",i+1];
    interShadowImageView.image = [UIImage imageNamed:inerShadowImage];
    
    NSString *inerimage = [NSString stringWithFormat:@"inner-tab_chat_%d@2x.png",i];
    interImageView.image = [UIImage imageNamed:inerimage];
    
    //show location image
    if (userInfo.type == kTypeOther) {
        locationImageView.image = [UIImage imageNamed:@"location_icon-1@2x.png"];
    } else if (userInfo.type == kTypeFriend){
        locationImageView.image = [UIImage imageNamed:@"location_icon-2@2x.png"];
    }
    //show nickname status time
    nickNameLb.text = userInfo.nickname;
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    float xPos = scrollView.contentOffset.x;
    
    if (xPos < - 88) {
        if ([delegate respondsToSelector:@selector(switchToRightView:)]) {
            [delegate switchToRightView:cellIndex];
        }
        
    } else if (xPos > 105) {
        if ([delegate respondsToSelector:@selector(switchToLeftView:)]) {
            [delegate switchToLeftView:cellIndex];
             [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
    } else if (xPos> 0 && xPos < 105){
        [scrollView setContentOffset:CGPointMake(0, 0) animated:TRUE];
    }
        
    

}

@end
