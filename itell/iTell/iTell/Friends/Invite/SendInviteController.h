//
//  SendInviteController.h
//  iTell
//
//  Created by tranduc on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"

@interface SendInviteController : UIViewController<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, ApiRequestDelegate>{
    int currPage;
    int maxPage;
}
@property (retain, nonatomic) IBOutlet UITableView *tbInvite;
@property (retain, nonatomic) IBOutlet UIScrollView *svInvite;
- (IBAction)backPressed:(id)sender;

@end
