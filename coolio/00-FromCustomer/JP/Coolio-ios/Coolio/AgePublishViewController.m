//
//  AgePublishViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "AgePublishViewController.h"

@interface AgePublishViewController ()

@end

@implementation AgePublishViewController

#define AGE_MIN 18
#define AGE_MAX 99

@synthesize cell_slider;
@synthesize cell_textField;
@synthesize notifiValue;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self openPasscodeView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheVisibility:) name:@"ToNotifyTheVisibility" object:nil];

    account = [[MyPublish alloc] init];
    self.txt_age.keyboardType = UIKeyboardTypeDecimalPad;
    self.txt_age.delegate = self;
    
    //if(([account getAgeLower] > [account getAgeUpper]) || ([account getAgeUpper] < [account getAgeLower])){
    //    [account setAgeLower:18];
    //    [account setAgeUpper:99];
    //}
    
    value = 0;
    if([self.notifiValue isEqualToString:@"upper"]){
        value = [account getAgeUpper];
    }else{
        value = [account getAgeLower];
    }
    
    //if(age >= AGE_MIN && age <= AGE_MAX){
        [self.txt_age setText:[NSString stringWithFormat:@"%d", value]];
        [self.sli_age setValue:(float)value];
    //}else{
    //    if([self.notifiValue isEqualToString:@"upper"]){
    //        [self.txt_age setText:@"99"];
    //        [self.sli_age setValue:99.0f];
    //    }else{
    //        [self.txt_age setText:@"18"];
    //        [self.sli_age setValue:18.0f];
    //    }
    //}
    
    [self.txt_age becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        if([self.notifiValue isEqualToString:@"upper"]){
            if(value == 0){
                [account setAgeUpper:99];
            }else{
                [account setAgeUpper:value];
            }
        }else{
            if(value == 0){
                [account setAgeLower:18];
            }else{
                [account setAgeLower:value];
            }
        }
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell = cell_textField;
            break;
        case 1:
            cell = cell_slider;
            break;
        default:
            break;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)toNotifyTheVisibility:(NSNotification *)notification
{
    //notifiValue = [notification object];
    


}

- (IBAction)txt_age_EditingDidEnd:(id)sender {
    UITextField* txtField = (UITextField*)sender;
    value = [[txtField text] intValue];
    /*
    if(value < AGE_MIN || value > AGE_MAX){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_AGEPUBLISH_ERROR_02", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if(([account getAgeLower] > [account getAgeUpper]) || ([account getAgeUpper] < [account getAgeLower])){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_AGEPUBLISH_ERROR_01", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        if([notifiValue isEqualToString:@"upper"]){
            [account setAgeUpper:value];
        }else{
            [account setAgeLower:value];
        }
    }
    */
}

- (IBAction)ageSlider_valueChanged:(id)sender {
    NSNumber* num = @([self.sli_age value]);
    value = [num intValue];
    
    NSString* sliderStr = [NSString stringWithFormat:@"%d", value];
    self.txt_age.text = sliderStr;
    
    /*
    if(([account getAgeLower] > [account getAgeUpper]) || ([account getAgeUpper] < [account getAgeLower])){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_AGEPUBLISH_ERROR_01", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        if([notifiValue isEqualToString:@"upper"]){
            [account setAgeUpper:value];
        }else{
            [account setAgeLower:value];
        }
    }
    */
}

@end
