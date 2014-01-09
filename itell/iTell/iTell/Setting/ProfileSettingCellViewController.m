//
//  ProfileSettingCellViewController.m
//  iTell
//
//  Created by Thap on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileSettingCellViewController.h"


@implementation ProfileSettingCellViewController

@synthesize iconImageView, textLb,scroll,cellIndex, delegate;

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
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ProfileSettingCellViewController" owner:self options:nil];
        self = [array objectAtIndex:0];
        
        
        //[scrollView setScrollEnabled:FALSE];
        
    }
    return self;
}
#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    float x = scrollView.contentOffset.x;
    if(x > 50) {
        
        if ([delegate respondsToSelector:@selector(cellSelected:)]) {
            [delegate cellSelected:cellIndex];
        }
    }
}
@end
