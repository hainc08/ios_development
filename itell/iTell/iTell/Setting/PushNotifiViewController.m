//
//  PrivacyViewController.m
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import "PushNotifiViewController.h"
#import "SettingPushViewCell.h"
#import "SettingViewController.h"
#import "Global.h"

@interface PushNotifiViewController ()

@end

@implementation PushNotifiViewController

@synthesize tblView,supperController;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"SettingPushViewCell";
    SettingPushViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }	
    NSString *txtTitle = @"";
    switch (indexPath.row) {
        case 0:
            txtTitle = @"FriendsのiTell";
            cell.isOn = [Global getValueState:kTagPushFriend];
            break;
        case 1:
            cell.isOn = [Global getValueState:kTagPushFr];
            txtTitle = @"Friendsd";
            break;
        case 2:
            cell.isOn = [Global getValueState:kTagPushItell];
            txtTitle = @"iTell";
            break;
        default:
            cell.isOn = [Global getValueState:kTagPushFriend];
            txtTitle = @"FriendsのiTell";
            break;
    }
    if(cell.isOn) {
        cell.imgOnOff.image = [UIImage imageNamed:@"on_button.png"];
    }else {
        cell.imgOnOff.image = [UIImage imageNamed:@"off_button.png"];
    }
    cell.controller = self;
    cell.delegate = self;
    cell.indexCell = indexPath.row;
    [cell initSettingCell];
    cell.lbName.text = txtTitle;
    cell.selectionStyle = UITableViewCellAccessoryDisclosureIndicator;
	return cell;    return nil;
}

- (IBAction)actionBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)stateOnOff:(int)indexCell isOn:(BOOL)isOn {
    switch (indexCell) {
        case 0:
            [Global setValueState:isOn withKey:kTagPushFriend];
            break;
        case 1:
            [Global setValueState:isOn withKey:kTagPushFr];
            break;
        case 2:
            [Global setValueState:isOn withKey:kTagPushItell];
            break;
        default:
            [Global setValueState:isOn withKey:kTagPushFriend];
            break;
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
