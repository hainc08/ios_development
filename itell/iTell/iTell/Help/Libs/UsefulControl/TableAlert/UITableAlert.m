//
//  UITableAlert.m
//  UIAlert-EmbeddedTable
//
//  Created by Skylar Cantu on 10/10/09.
//  Copyright 2009 Skylar Cantu. All rights reserved.
//

#import "UITableAlert.h"
#import <QuartzCore/QuartzCore.h>
@implementation UITableAlert
@synthesize isPicker;
@synthesize tableData = _tableData;
@synthesize str;
@synthesize data = _data;
@synthesize frameThis = _frame;
@synthesize arrRecord;
@synthesize arrRadio;

- (id)initWithRecords:(NSMutableArray *)arr{
	CGRect frame;
    self.str = [[[NSString alloc] init] autorelease];
	if ([arr count]<=10) {
        frame = CGRectMake(0, 0, 250, [arr count]*40);
	}
	else
        frame = CGRectMake(0, 0, 320, 10*40);
	self.frameThis = frame;
    self = [super init];
	if (self) {
		_data = [arr mutableCopy];
		table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		table.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1.0];
		table.delegate = self;
		table.dataSource = self;
		table.bounces = NO;
        table.scrollEnabled = NO;
		[table.layer setCornerRadius:10]; 
    }
	
	for (UIView *view in self.subviews) {
		if ([[[view class] description] isEqualToString:@"UIThreePartButton"]) {
			view.frame = frame;
		}
	}
	UIView* container = [[UIView alloc] initWithFrame:CGRectMake(0,0,frame.size.width ,frame.size.height - 1)];
	//UIView* container = [[UIView alloc] initWithFrame:frame];
	container.backgroundColor = [UIColor whiteColor];
	container.clipsToBounds = YES;
	[container.layer setCornerRadius:10];
	[self addSubview:container];
	table.rowHeight = 40;
	table.frame = container.bounds;
	[container addSubview:table];
	self.center = CGPointMake(320/2, 480/2);
    return self;
}

- (void)setFrame:(CGRect)rect {
	
	CGFloat x = (320 - rect.size.width)/2;
	CGFloat y = (480 - self.frame.size.height)/2;
	CGRect _rect = CGRectMake(x, y, self.frameThis.size.width, self.frameThis.size.height);
	[super setFrame:_rect];
        self.center = CGPointMake(320/2, 480/2);
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
}

- (void)dealloc {
	[table release];
    [super dealloc];
}
- (void) applicationDidEnterBackground:(id) sender {
    // We should not be here when entering back to foreground state
    [self dismissWithClickedButtonIndex:[self cancelButtonIndex] animated:NO];
}

#pragma mark 
#pragma mark Property Methods

- (void)setMessage:(NSString *)message {
	return;
}

- (NSString *)message {
	return nil;
}
-(void)imageSelected:(int)imageIndex{
    NSLog(@"image selected");
    for (int i=0; i<[arrRadio count]; i++) {
		[[arrRadio objectAtIndex:i] setImage:[UIImage imageNamed:@"uncheck.png"]];
	}
	
	[[arrRadio objectAtIndex:imageIndex] setImage:[UIImage imageNamed:@"check.png"] ];
	
}
-(UIImageView *)image{
	UIImageView *image = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"uncheck.png"]] autorelease];
	image.frame = CGRectMake(200, 5, 25, 25);
	image.backgroundColor = [UIColor clearColor];
	return image;
    
}
-(void)addRadio{
    arrRadio = [[NSMutableArray alloc] initWithCapacity:1 ];
	
	for (int i = 0; i<[_data count]; i++) {
		[arrRadio addObject:[self image]];
	}
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//if (self.sex)  return 2;
	return [_data count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {	
	return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
    cell.textLabel.text = [_data objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont systemFontOfSize:15];
    
	if (!isPicker) {
		[cell addSubview:[arrRadio objectAtIndex:indexPath.row]];
	}
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isPicker) {
        [self setCancelButtonIndex:indexPath.row];
        [self dismissWithClickedButtonIndex:[self cancelButtonIndex] animated:YES];
    }	
    else {
        UITableViewCell *cell ;
        //get content of cell didselects
        cell = [table  cellForRowAtIndexPath:indexPath];
        NSLog(@"cell value selected: %@",cell.textLabel.text);
        self.str = cell.textLabel.text;

//         NSLog(@"2");
        [self imageSelected:indexPath.row];
        [self dismissWithClickedButtonIndex:1 animated:TRUE];
//        NSLog(@"2");
    }
}

@end
