//
//  SettingViewController.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface SettingViewController ()

@end

@implementation SettingViewController

@synthesize tblView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = TRUE;
    arrCells = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"SettingViewCell";
    SettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }	
    NSString *txtTitle = @"";
    switch (indexPath.row) {
        case 0:
            txtTitle = @"Profile";
            cell.imgIcon.image = [UIImage imageNamed:@"vcard_icon.png"];
            break;
        case 1:
            txtTitle = @"Privacy";
            cell.imgIcon.image = [UIImage imageNamed:@"key_icon.png"];
            break;
        case 2:
            txtTitle = @"Setting Push Notification";
            cell.imgIcon.image = [UIImage imageNamed:@"alert_icon.png"];
            break;
        case 3:
            txtTitle = @"About";
            cell.imgIcon.image = [UIImage imageNamed:@"pacman_icon.png"];
            break;
        case 4:
            txtTitle = @"Help";
            cell.imgIcon.image = [UIImage imageNamed:@"help_icon.png"];
            break;
        default:
            txtTitle = @"Profile";
            cell.imgIcon.image = [UIImage imageNamed:@"vcard_icon.png"];
            break;
    }
    cell.controller = self;
    cell.delegate = self;
    cell.indexCell = indexPath.row;
    [cell initSettingCell];
    cell.lbName.text = txtTitle;
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    [arrCells addObject:cell];
	return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)moveToTest:(UIView *)cell fromPoint:(CGPoint)pos1 toPoint:(CGPoint)pos2 index:(int)index isReverses:(BOOL)isReverses{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue	= [NSValue valueWithCGPoint:pos1];
    anim.toValue	= [NSValue valueWithCGPoint:pos2];
    anim.duration	= 0.5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.removedOnCompletion = NO;
    //anim.autoreverses = isReverses;
    anim.delegate = self;
    [anim setValue:[NSString stringWithFormat:@"move%d",index] forKey:@"animation"];
    [cell.layer addAnimation:anim forKey:nil];
    cell.layer.position = pos2;
}
- (void)scaleView:(UIView*)view fromScale:(float)from toScale:(float)to {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.fromValue = [NSNumber numberWithFloat:from];
    anim.toValue = [NSNumber numberWithFloat:to];
    anim.duration = 0.5;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.removedOnCompletion = NO;
    [view.layer addAnimation:anim forKey:nil];
}

- (void)viewCellSelected:(UITableViewCell *)tbCell indexCell:(int)index {
    indexCellSelected = index;
    NSLog(@"cell selected: %d", indexCellSelected);
    SettingViewCell *cellSelected  = [arrCells objectAtIndex:index];
    CGPoint point1 = CGPointMake(cellSelected.viewTop.frame.origin.x + cellSelected.viewTop.frame.size.width/2, cellSelected.viewTop.frame.origin.y + cellSelected.viewTop.frame.size.height/2);
    CGPoint point2 = CGPointMake(cellSelected.viewTop.frame.origin.x + cellSelected.viewTop.frame.size.width/2 - 500, cellSelected.viewTop.frame.origin.y + cellSelected.viewTop.frame.size.height/2);
    [self moveToTest:cellSelected.viewTop fromPoint:point1 toPoint:point2 index:-1 isReverses:NO];
    if (indexCellSelected >= 0) {
        for (int i = indexCellSelected + 1; i < [arrCells count]; i++) {
            UITableViewCell *cell = [arrCells objectAtIndex:i];
            CGPoint point1 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
            CGPoint point2 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2 + 500);
            [self moveToTest:cell fromPoint:point1 toPoint:point2 index:i isReverses:YES];
        }
        for (int i = 0; i < indexCellSelected + 1; i++) {
            UITableViewCell *cell = [arrCells objectAtIndex:i];
            CGPoint point1 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2);
            CGPoint point2 = CGPointMake(cell.frame.origin.x + cell.frame.size.width/2, cell.frame.origin.y + cell.frame.size.height/2 - 500);
            [self moveToTest:cell fromPoint:point1 toPoint:point2 index:i isReverses:YES];
        }
    }
}
- (void)resetPosition:(int)index {
    for (int i = 0; i < index + 1; i++) {
        SettingViewCell *cell = [arrCells objectAtIndex:i];
        cell.layer.position = CGPointMake(cell.layer.position.x, cell.layer.position.y + 500);
    }
    for (int i = index + 1; i < [arrCells count]; i++) {
        SettingViewCell *cell = [arrCells objectAtIndex:i];
        cell.layer.position = CGPointMake(cell.layer.position.x, cell.layer.position.y - 500);
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *value = [anim valueForKey:@"animation"];
    
    switch (indexCellSelected) {
        case 0://Profile controller
        {
            if ([value isEqualToString:@"move0"]) {
                [self resetPosition:indexCellSelected];
                SettingViewCell *cell = [arrCells objectAtIndex:indexCellSelected];
                cell.viewTop.layer.position = CGPointMake(cell.viewTop.layer.position.x + 500, cell.viewTop.layer.position.y);
                ProfileSettingViewController *profileView = [[ProfileSettingViewController alloc] initWithNibName:@"ProfileSettingViewController" bundle:nil];
                [self.navigationController pushViewController:profileView animated:NO];
               // [self scaleView:profileView.view fromScale:0.1 toScale:1.0];
                [profileView release]; 
            }
        }
         break;   
        case 1://Privacy　controller
        {
            if ([value isEqualToString:@"move1"]) {
                [self resetPosition:indexCellSelected];
                SettingViewCell *cell = [arrCells objectAtIndex:indexCellSelected];
                cell.viewTop.layer.position = CGPointMake(cell.viewTop.layer.position.x + 500, cell.viewTop.layer.position.y);
                PrivacyViewController *privacyController = [[PrivacyViewController alloc] initWithNibName:@"PrivacyViewController" bundle:nil];
                [self.navigationController pushViewController:privacyController animated:NO];
              //  [self scaleView:privacyController.view fromScale:0.1 toScale:1.0];
                [privacyController release];
            }
        }
            break;
        case 2://Push Notification
        {
            if ([value isEqualToString:@"move2"]) {
                [self resetPosition:indexCellSelected];
                SettingViewCell *cell = [arrCells objectAtIndex:indexCellSelected];
                cell.viewTop.layer.position = CGPointMake(cell.viewTop.layer.position.x + 500, cell.viewTop.layer.position.y);
                PushNotifiViewController *pushController = [[PushNotifiViewController alloc] initWithNibName:@"PushNotifiViewController" bundle:nil];
                [self.navigationController pushViewController:pushController animated:NO];
              //  [self scaleView:pushController.view fromScale:0.1 toScale:1.0];
                [pushController release];
            }
        }
            break;
        case 3://About
        {
            if ([value isEqualToString:@"move3"]) {
                [self resetPosition:indexCellSelected];
                SettingViewCell *cell = [arrCells objectAtIndex:indexCellSelected];
                cell.viewTop.layer.position = CGPointMake(cell.viewTop.layer.position.x + 500, cell.viewTop.layer.position.y);
                AboutViewController *aboutController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
                aboutController.supperController = self;
                [self.navigationController pushViewController:aboutController animated:NO];
                //[self scaleView:aboutController.view fromScale:0.1 toScale:1.0];
                [aboutController release];
            }
        }
            break;
        case 4://Help
        {
            if ([value isEqualToString:@"move4"]) {
                [self resetPosition:indexCellSelected];
                SettingViewCell *cell = [arrCells objectAtIndex:indexCellSelected];
                cell.viewTop.layer.position = CGPointMake(cell.viewTop.layer.position.x + 500, cell.viewTop.layer.position.y);
                HelpViewController *helpController = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
                helpController.supperController = self;
                [self.navigationController pushViewController:helpController animated:NO];
                //[self scaleView:helpController.view fromScale:0.1 toScale:1.0];
                [helpController release];
            }
        }
            break;
        default:
            break;
    }
}
@end
