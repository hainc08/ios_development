//
//  ViewStamps.m
//  iTell
//
//  Created by mai van hai on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewStamps.h"

@implementation ViewStamps

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"ViewStamps" owner:self options:nil];
        self = [nibObjects objectAtIndex:0];
        // Initialization code
    }
    return self;
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
