//
//  ListViewController.h
//  iTell
//
//  Created by admin trator on 8/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{

    IBOutlet UITableView *_tbl;
    
}

- (IBAction)showMapView:(id)sender;
- (IBAction)showListView:(id)sender;
@end
