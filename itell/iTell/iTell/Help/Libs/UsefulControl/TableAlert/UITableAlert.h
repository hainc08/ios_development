//
//  UITableAlert2.h
//  UIAlert-EmbeddedTable
//
//  Created by Skylar Cantu on 10/10/09.
//  Copyright 2009 Skylar Cantu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableAlert : UIAlertView <UITableViewDelegate,UITableViewDataSource, UIAlertViewDelegate> {
	id	_tableData;
	NSString *str;
	NSMutableArray *_data;
	NSMutableArray *arrRadio;
	CGRect _frame;
	BOOL isPicker;
@private
	UITableView *table;
}
@property (nonatomic,assign)NSString *str;
@property (nonatomic, assign, setter=setTableData:) id tableData;
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain)NSMutableArray *arrRecord;
@property (nonatomic, assign) CGRect frameThis;
@property (nonatomic, assign)BOOL isPicker;
@property (nonatomic, assign)NSMutableArray *arrRadio;
- (id)initWithRecords:(NSMutableArray *)arr;
-(void)addRadio;
-(void)imageSelected:(int)imageIndex;
-(UIImageView *)image;
@end
