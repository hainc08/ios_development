//
//  FilterHeightViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "FilterHeightViewController.h"

@interface FilterHeightViewController ()

@end

@implementation FilterHeightViewController
@synthesize cell0;
@synthesize cell1;
@synthesize t1;
@synthesize seg1;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    t1.delegate = self;
    t1.keyboardType = UIKeyboardTypeDecimalPad;
    
    account = [[MyFilter alloc] init];
    
    BOOL hiLow =  [account getHeightFilterHiLow];
    if(hiLow == YES){
        self.seg1.selectedSegmentIndex = 0;
    }else{
        self.seg1.selectedSegmentIndex = 1;
    }
    self.t1.text = [NSString stringWithFormat:@"%d", [account getHeightFilter]];
    [self openPasscodeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    int value = [self.t1.text intValue];
    [account setHeightFilter:value];
    
    if(self.seg1.selectedSegmentIndex == 0){
        [account setHeightFilterHiLow:YES];
    }else{
        [account setHeightFilterHiLow:NO];
    }
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
            cell = cell0;
            break;
        case 1:
            cell = cell1;
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

- (IBAction)t1_EditingDidEnd:(id)sender {
    int value = [[(UITextField *)sender text] intValue];
    [account setHeightFilter:value];
}

- (IBAction)seg1_valueChanged:(id)sender {
    UISegmentedControl* seg = (UISegmentedControl *)sender;
    if(seg.selectedSegmentIndex == 0){
        [account setHeightFilterHiLow:YES];
    }else{
        [account setHeightFilterHiLow:NO];
    }
}

@end
