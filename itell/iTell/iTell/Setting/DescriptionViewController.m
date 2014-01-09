//
//  DescriptionViewController.m
//  iTell
//
//  Created by Thap on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

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

   
    descriptionTV.inputAccessoryView = toolbar;

    NSString *des = [[NSUserDefaults standardUserDefaults] objectForKey:@"description"];
    NSLog(@"des = %@", des);
    if (des) {
        descriptionTV.text = des;
    }
}
-(IBAction)backBtnClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:TRUE];
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    [scrollView setContentOffset:CGPointMake(0, 20) animated:TRUE];
    return TRUE;
}
-(IBAction)doneBtnClicked:(id)sender{
    [scrollView setContentOffset:CGPointMake(0, 0) animated:TRUE];
    [descriptionTV resignFirstResponder];
}

-(IBAction)saveBtnClicked:(id)sender{
    [[NSUserDefaults standardUserDefaults] setObject:descriptionTV.text forKey:@"description"];
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

@end
