//
//  ProfileSettingViewController.m
//  iTell
//
//  Created by Thap on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileSettingViewController.h"
#import "Global.h"
#import "DescriptionViewController.h"
#import "AlbumViewController.h"

@interface ProfileSettingViewController ()

@end

@implementation ProfileSettingViewController

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
    [self.view.layer removeAllAnimations];
    // Do any additional setup after loading the view from its nib.
    NSArray *array = [NSArray arrayWithObjects:yearLb,monthLb,dateLb, nil];
    keyBoardInput = [[AccessoryKeybroad alloc] initWithTextItems:array parent:scrollView];
    NSString* myPhone = [Global shareGlobal].user.mobileNumber;
    NSString *phone1 = [myPhone substringWithRange:NSMakeRange(0, 3)];
    NSString *phone2 = [myPhone substringWithRange:NSMakeRange(3, 3)];
    NSString *phone3 = [myPhone substringFromIndex:6];
    NSString *phone = [NSString stringWithFormat:@"%@-%@-%@",phone1, phone2, phone3];
    phoneLb.text = phone;
    
    nickNameLb.text = [Global shareGlobal].user.nick;
    nameLb.text = [Global shareGlobal].user.name;
    sexSwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(230, 150, 40, 26) onLabelText:@"女性" offLabelText:@"男性" onLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]] offLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]] onLabelTextColor:[UIColor whiteColor] offLabelTextColor:[UIColor whiteColor] sliderColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"handle.png"]]];
    sexSwitch.delegate = self;
    sexSwitch.tag = 1;
    if ([Global shareGlobal].user.gender) {
        [sexSwitch setOn:TRUE];
    } else {
        [sexSwitch setOn:FALSE];
    }
    
    [scrollView addSubview:sexSwitch];
    [sexSwitch release];
    
    birthdaySwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(230, 210, 40, 26) onLabelText:@"On" offLabelText:@"Off" onLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]] offLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]] onLabelTextColor:[UIColor whiteColor] offLabelTextColor:[UIColor whiteColor] sliderColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"handle.png"]]];
    birthdaySwitch.delegate = self;
    birthdaySwitch.tag = 2;
    [birthdaySwitch setOn:TRUE];
    isDisplayBirthday = TRUE;
    [scrollView addSubview:birthdaySwitch];
    [birthdaySwitch release];
    
    NSString *birthday =  [Global shareGlobal].user.birth;
    NSArray *arrayBirth = [birthday componentsSeparatedByString:@"-"];
    NSString* year = [arrayBirth objectAtIndex:0];
    NSString* month = [arrayBirth objectAtIndex:1];
    NSString* day = [[[arrayBirth objectAtIndex:2] componentsSeparatedByString:@" "] objectAtIndex:0];
    
    yearLb.text = year;
    monthLb.text = month;
    dateLb.text = day;

}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)valueChanged:(BOOL)switchValue sender:(CustomSwitch *)sender{
    
    if (sender.tag == 1) { // sex switch
        isFemale = switchValue;
        NSLog(@"isFe = %d", isFemale);
    } else {
        isDisplayBirthday = switchValue;
        NSLog(@"isDis = %d", isDisplayBirthday);
    }
} 
-(IBAction)backBtnClicked:(id)sender{

    [self.navigationController popViewControllerAnimated:TRUE];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileSettingCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[ProfileSettingCellViewController alloc] init];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.scroll setContentSize:CGSizeMake(321, 65)];
    }
    cell.delegate = self;
    cell.cellIndex = indexPath.row;
    switch (indexPath.row) {
        case 0:
        {
            cell.textLb.text = @"プロフィールコメント";
            cell.iconImageView.image = [UIImage imageNamed:@"message_icon.png"];
        }
            break;
        case 1:
        {
            cell.textLb.text = @"アルバム編集";
            cell.iconImageView.image = [UIImage imageNamed:@"camera_setting_icon.png"];
        }
            break;
                
        default:
            
            break;
    }
   
    cell.cellIndex = indexPath.row;
    cell.selectionStyle = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

-(void)cellSelected:(NSInteger)cellIndex{
    
    switch (cellIndex) {
        case 0:
        {
            DescriptionViewController *descriptionView = [[DescriptionViewController alloc] initWithNibName:@"DescriptionViewController" bundle:Nil];
            [self.navigationController pushViewController:descriptionView animated:TRUE];
            [descriptionView release];
        }
            break;
        case 1:
        {
            AlbumViewController *album = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
            [self.navigationController pushViewController:album animated:TRUE];
            [album release];
        }
            break;
        default:
            break;
    }
}

@end
