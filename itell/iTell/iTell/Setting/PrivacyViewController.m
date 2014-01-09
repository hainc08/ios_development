//
//  PrivacyViewController.m
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import "PrivacyViewController.h"
#import "FavouriteCell.h"
#import "BlockListViewController.h"
#import "Global.h"
#import "AppDelegate.h"
#import <AddressBook/AddressBook.h>
#import "SBJSON.h"


@interface PrivacyViewController ()
@property (retain, nonatomic)ApiRequest *apiRequest;
@end



@implementation PrivacyViewController

@synthesize tblView;
@synthesize apiRequest;
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
            cell.isOn = [Global getValueState:kSettingSearchFriend];
            if(cell.isOn) {
                cell.imgOnOff.image = [UIImage imageNamed:@"on_button.png"];
            }else {
                cell.imgOnOff.image = [UIImage imageNamed:@"off_button.png"];
            }
            break;
        case 1:
            cell.isOn = [Global getValueState:kSettingSearchContact];
            if(cell.isOn) {
                cell.imgOnOff.image = [UIImage imageNamed:@"on_button.png"];
            }else {
                cell.imgOnOff.image = [UIImage imageNamed:@"off_button.png"];
            }
            txtTitle = @"Friendsd";
            break;
        case 2:
            txtTitle = @"iTell";
            [cell.imgOnOff removeFromSuperview];
            cell.imgOnOff = nil;
            break;
        default:
            txtTitle = @"FriendsのiTell";
            break;
    }
    
    cell.controller = self;
    cell.delegate = self;
    cell.indexCell = indexPath.row;
    [cell initSettingCell];
    cell.lbName.text = txtTitle;
    cell.selectionStyle = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (IBAction)actionBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)requestSuccess:(ASIFormDataRequest *)request {
    [[AppDelegate instance] showBusyView:NO
                                withText:nil];
    NSLog(@"asdadads");
    NSString *response = [request responseString];
    NSLog(@"easda: %@", response);
}
- (void)stateOnOff:(int)indexCell isOn:(BOOL)isOn {
    switch (indexCell) {
        case 0:
            [Global setValueState:isOn withKey:kSettingSearchFriend];
            if(isOn) {
                NSString *uuid = [Global shareGlobal].user.uuid;
                int userId = [Global shareGlobal].user.userID;
                
                NSString *urlStr= [NSString stringWithFormat:@"%@setting/allow_search", SERVER_URL];

                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSString stringWithFormat:@"%d", userId], @"user_id",
                                     uuid, @"uuid", nil];
                self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kSettingSearchFriend];
                
                [apiRequest requestUsingPostMethod:urlStr postData:dic];
                
                [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
            }else {
                NSString *uuid = [Global shareGlobal].user.uuid;
                int userId = [Global shareGlobal].user.userID;
                
                NSString *urlStr= [NSString stringWithFormat:@"%@setting/deny_search", SERVER_URL];
                
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSString stringWithFormat:@"%d", userId], @"user_id",
                                     uuid, @"uuid", nil];
                self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kSettingSearchFriend];
                
                [apiRequest requestUsingPostMethod:urlStr postData:dic];
                
                [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
            }
            break;
        case 1:  
            [Global setValueState:isOn withKey:kSettingSearchContact];
//            if(isOn) {
//                NSString *urlStr= [NSString stringWithFormat:@"%@setting/post_contact", SERVER_URL];
//                
//                self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kSettingSearchFriend];
//                [self.apiRequest postContactToServer:urlStr names:arrNameContact phones:arrPhoneContact emails:arrEmailContact];
//                [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
//            }else {
//            }
            break;
        case 2:
            [Global setValueState:isOn withKey:kSettingGetBlockList];
        {
            BlockListViewController *blockList = [[BlockListViewController alloc] initWithNibName:@"BlockListViewController" bundle:nil];
            blockList.supperController = self;
            [self.navigationController pushViewController:blockList animated:TRUE];
            [blockList release];
        }
            break;
        default:
            break;
    }
}
#pragma mark getAllContact 
- (void)getAllInfoContact {
    NSMutableArray *arrMutableNameContact;
    NSMutableArray *arrMutablePhoneContact;
    NSMutableArray *arrMutableEmailContact;
    arrMutableNameContact   = [[NSMutableArray alloc] init];
    arrMutablePhoneContact  = [[NSMutableArray alloc] init];
    arrMutableEmailContact  = [[NSMutableArray alloc] init];
    
    ABAddressBookRef _addressBookRef = ABAddressBookCreate();
    NSArray* allPeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(_addressBookRef);
    
   // NSMutableDictionary  *contactsInformation = [[NSMutableDictionary alloc] initWithCapacity:[allPeople count]];
    
    for (id record in allPeople) 
    {

        CFTypeRef emailProp = ABRecordCopyValue((ABRecordRef)record, kABPersonEmailProperty);
        NSString *email = [((NSArray *)ABMultiValueCopyArrayOfAllValues(emailProp)) objectAtIndex:0 ];
        if (!email) {
            email = @"";  
        }
        [arrMutableEmailContact addObject:email];
        CFTypeRef numberPhone = ABRecordCopyValue((ABRecordRef)record, kABPersonPhoneProperty);
        NSString *strPhone = [((NSArray *)ABMultiValueCopyArrayOfAllValues(numberPhone)) objectAtIndex:0 ];
        if (!strPhone) {
            strPhone = @"";  
        }
        [arrMutablePhoneContact addObject:strPhone];
        NSString *strName = (NSString *)ABRecordCopyValue(record, kABPersonFirstNameProperty);
        if (!strName) {
            strName = @"";  
        }
        [arrMutableNameContact addObject:strName];
        NSLog(@"Name: %@  Phone: %@  Email: %@", strName, strPhone, email);
    }
    arrNameContact = [[NSArray arrayWithArray:arrMutableNameContact] retain];
    arrPhoneContact = [[NSArray arrayWithArray:arrMutablePhoneContact] retain];
    arrEmailContact = [[NSArray arrayWithArray:arrMutableEmailContact] retain];
    CFRelease(_addressBookRef);
    [allPeople release];
    allPeople = nil;
}
#pragma mark - apidelegate
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    [[AppDelegate instance] showBusyView:NO
                                withText:nil];
    if ([target isEqualToString:kSettingAllowSearch]) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    NSLog(@"data target: %@",target);
    [[AppDelegate instance] showBusyView:NO
                                withText:nil];
    if ([target isEqualToString:kSettingDenySearch]) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
