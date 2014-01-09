//
//  MapViewController.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ListTableViewCell.h"
#import "ApiRequest.h"

@interface MapViewController : UIViewController<MKMapViewDelegate,UITableViewDelegate, UITableViewDataSource, ListTableViewCellDelegate,ApiRequestDelegate> {
    MKMapView* _mapView;
    IBOutlet UIView *containerView;
    IBOutlet UIView *mapView_;
    IBOutlet UIButton *mapBtn;
    IBOutlet UIButton *listBtn;
    IBOutlet UIImageView *mapImageView;
    IBOutlet UIImageView *listImageView;
    IBOutlet UITableView *_tbl;
    
    IBOutlet UILabel *titleLb;
    BOOL isMapDisplayed;
    BOOL isShowMapAlert;
    MKZoomScale currentZoomLevel;
    NSMutableArray *listFriend;
    NSMutableArray *listOther;
    NSMutableArray *listCompany;
    NSMutableArray *listShowOnTable;
}
@property (nonatomic, retain) MKMapView* mapView;

-(void)showAlertView:(NSString*)message;
-(void)initBarButton;
-(void)initMapView;
-(IBAction)mapBtnClicked:(id)sender;
-(IBAction)listBtnCLicked:(id)sender;
-(void)displayFriendToMap;
-(void)displayOtherToMap;
-(void)displayCompanyToMap;
-(void)getFriend:(float)distance page:(NSInteger)pageNumber;
-(void)getOther:(float)distance page:(NSInteger)pageNumber;
-(void)getCompany:(float)distance page:(NSInteger)pageNumber;
-(NSMutableArray*) sortAscendingDistance:(NSMutableArray*)array;
@end
