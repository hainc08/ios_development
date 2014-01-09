//
//  StarAlertView.m
//  StarAlertApp
//
//  Created by admin trator on 6/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StarAlertView.h"
#import "SendSMSViewController.h"


@implementation StarAlertView


@synthesize target;


- (id) initWithPhoneNumber:(NSString*)phoneNumber{
    
    self = [super init];
    if (self) {
    
        CGRect frame =  CGRectMake(40, 100, 238, 253);
        
        for (UIView *view in self.subviews) {
            if ([[[view class] description] isEqualToString:@"UIThreePartButton"]) {
                view.frame = frame;
            }
            
        }
        UIView* container = [[UIView alloc] initWithFrame:CGRectMake(-10,-10,self.frame.size.width +30 ,self.frame.size.height +20 )];
        
        container.backgroundColor = [UIColor clearColor];
        container.clipsToBounds = YES;
        //[container.layer setCornerRadius:10];
        [self addSubview:container];
        
        UIImageView *bgView = [[UIImageView alloc] initWithFrame:container.frame];
        bgView.image = [UIImage imageNamed:@"first_s2_overlay_box.png"];
        [container addSubview:bgView];
        [bgView release]; 
        
        UILabel *phoneNumberLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 238, 60)];
        [phoneNumberLb setTextAlignment:UITextAlignmentCenter];
        phoneNumberLb.font = [UIFont systemFontOfSize:20];
        phoneNumberLb.text = phoneNumber;
        phoneNumberLb.backgroundColor = [UIColor clearColor];
        [container addSubview:phoneNumberLb];
        [phoneNumberLb release];
        
        UILabel *guideLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 218, 100)];
        [guideLb setTextAlignment:UITextAlignmentCenter];
        guideLb.lineBreakMode = UILineBreakModeWordWrap;
        guideLb.numberOfLines = 0;
        guideLb.font = [UIFont systemFontOfSize:14];
        guideLb.text = @"上記の番号にＳＭＳで確認コード\n"
        @"を送信します。\n"
        @"番号を確認の上、送信ブタンを押\n"
        @"してください。";
        guideLb.textColor = [UIColor blackColor];
        guideLb.backgroundColor = [UIColor clearColor];
        [container addSubview:guideLb];
        [guideLb release];
        
        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 180, 79, 38)];
        [closeBtn setImage:[UIImage imageNamed:@"first_s2_button_1_inactive.png"] forState:UIControlStateNormal];
        [closeBtn setImage:[UIImage imageNamed:@"first_s2_button_1_active.png"] forState:UIControlStateSelected];
        [closeBtn addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:closeBtn];
        [closeBtn release];
        
        UIButton *okBtn = [[UIButton alloc] initWithFrame:CGRectMake(140, 180, 79, 38)];
        [okBtn addTarget:self action:@selector(okBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [okBtn setImage:[UIImage imageNamed:@"first_s2_button_2_inactive.png"] forState:UIControlStateNormal];
        [okBtn setImage:[UIImage imageNamed:@"first_s2_button_2_active@2x.png"] forState:UIControlStateSelected];
        [container addSubview:okBtn];
        [okBtn release];
    }
    return self;
}

- (void) okBtnClicked{    
    if (self.target) {
        //call to send 
        [target acceptSendMobilePhone];
    }    
    [super dismissWithClickedButtonIndex:0 animated:TRUE];    
}

- (void) closeButtonClicked{
    NSLog(@"dismiss");
    [super dismissWithClickedButtonIndex:0 animated:TRUE];
    
}

- (void)setFrame:(CGRect)rect {
	CGRect _rect = CGRectMake(40, 100, 238, 253);
	
	[super setFrame:_rect];
	
}

- (void)drawRect:(CGRect)rect {
	NSLog(@"cccccccc");
	[super drawRect:rect];
}


@end
