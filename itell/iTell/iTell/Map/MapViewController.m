//
//  MapViewController.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "ListTableViewCell.h"
#import "CSMapAnnotation.h"
#import "CSImageAnnotationView.h"
#import "CSCompanyAnnotationView.h"
#import "MPFoldTransition.h"
#import "ProfileViewController.h"
#import "ChatViewController.h"
#import "UserInfo.h"

#define tGetFriend @"get friend within radius 2 km"
#define tGetOther @"get other user within radius 2 km"
#define tGetCompany @"get company within radius 2 km"

#define RADIUS 2000

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView   = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc{
    
    [super dealloc];
}

- (void)viewDidUnload{
    [_mapView release];
    [mapView_ release];
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = TRUE;
    listOther = [[NSMutableArray alloc] init ];
    listFriend = [[NSMutableArray alloc] init ];
    listCompany = [[NSMutableArray alloc] init ];
    [self initMapView];
   // [self getFriend:2000 page:1];
    [self getOther:200000 page:1];
   // [self getCompany:2000 page:1];
    
    [_tbl setDelegate:self];
   
}

- (void) initMapView{
    isMapDisplayed = TRUE;
    //init map view
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(8, 9, 298, 283)];
	[mapView_ addSubview:_mapView];
	[_mapView setDelegate:self];
    [_mapView setZoomEnabled:YES];
    [_mapView setScrollEnabled:YES];
    [_mapView setShowsUserLocation:YES];
    
     MKCoordinateRegion mapRegion; 
    CLLocation *currentCoor = [[AppDelegate instance] currentLocation];
    mapRegion.center = [currentCoor coordinate];
    mapRegion.span.latitudeDelta = 0.015;
    mapRegion.span.longitudeDelta = 0.015;
    [_mapView setRegion:mapRegion];
    
    CLLocation *deltaLocation = [[CLLocation alloc] initWithLatitude:currentCoor.coordinate.latitude - 0.015 longitude:currentCoor.coordinate.longitude - 0.015 ];
    NSLog(@"distance = %f", [deltaLocation distanceFromLocation:currentCoor]);
    
}

-(void)getFriend:(float)distance page:(NSInteger)page{    
    ApiRequest *request = [[ApiRequest alloc] initWithDelegate:self andTarget:tGetFriend];
    [request getFriend:10 distance:distance page:page];
    
}

- (void)getOther:(float)distance page:(NSInteger)pageNumber{
    ApiRequest *request = [[ApiRequest alloc] initWithDelegate:self andTarget:tGetOther];
    [request getOther:10 distance:distance page:pageNumber];
}
- (void)getCompany:(float)distance page:(NSInteger)pageNumber{
    ApiRequest *request = [[ApiRequest alloc] initWithDelegate:self andTarget:tGetCompany];
    [request getCompany:10 distance:distance page:pageNumber];
}
-(void) requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    BOOL result = [[dictionData objectForKey:@"retval"] boolValue];
    if (result) {
        if ([target isEqualToString:tGetOther]) {
            NSArray *array = [dictionData objectForKey:@"friend_data"];
            for(NSDictionary *dic in array){
                UserInfo *user = [[UserInfo alloc] init];
                user.imageURL = [dic objectForKey:@"avatar"];
                user.imageURL = @"https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash4/c0.0.403.403/p403x403/426954_358249927582016_1561643665_n.jpg";
                user.distance = [[dic objectForKey:@"distance"] floatValue];
                user.isFemale = [[dic objectForKey:@"gender"] boolValue];
                user.location = [[CLLocation alloc] initWithLatitude:[[dic objectForKey:@"latitude"] floatValue] longitude:[[dic objectForKey:@"longitude"] floatValue]];
                user.nickname = [dic objectForKey:@"nick"];
                user.status = @"status";//[dic objectForKey:@"itell"];
                user.type = kTypeOther;
                [listOther addObject:user];
                [user release];
            }
            [self displayOtherToMap];            
        } else if([target isEqualToString:tGetCompany]) {
            NSLog(@"Company = %@", [dictionData description]);
        } else if ([target isEqualToString:tGetFriend]) {
            NSLog(@"friend = %@", [dictionData description]);
            
        }
    }
}
- (void) initBarButton{

    UIBarButtonItem *mapButton =
    [[UIBarButtonItem alloc]
     initWithTitle: @"MAP"
     style:UIBarButtonItemStylePlain
     target: self
     action:@selector(showMapView:)];
    //[mapButton setWidth:150];
    UIBarButtonItem *listButton =
    [[UIBarButtonItem alloc]
     initWithTitle: @"LIST"
     style:UIBarButtonItemStylePlain
     target: self
     action:@selector(showListView:)];
    //[listButton setWidth:150];
    self.title = @"";
    self.navigationItem.leftBarButtonItem = mapButton;
    self.navigationItem.rightBarButtonItem = listButton;
}

-(void)displayOtherToMap{
    NSLog(@"number others = %d", [listOther count]);
    CSMapAnnotation* annotation = nil;

    for(UserInfo *user in listOther){
        // create the image annotation
        annotation = [[CSMapAnnotation alloc] initWithCoordinate: user.location.coordinate annotationType:CSMapAnnotationTypeImage userData:user];
        [_mapView addAnnotation:annotation];
        [annotation release];
    }
	

}
-(void)displayFriendToMap{

}
-(void)displayCompanyToMap{

}
#pragma mark - MapView delegate
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
	[_mapView setHidden:FALSE];
    if(isShowMapAlert){
        MKMapRect mRect = self.mapView.visibleMapRect;
        MKMapPoint neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
        //  MKMapPoint swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
        CLLocationCoordinate2D neCoord = MKCoordinateForMapPoint(neMapPoint);
        //  CLLocationCoordinate2D swCoord = MKCoordinateForMapPoint(swMapPoint);
        CLLocation *cornerLocation = [[CLLocation alloc] initWithLatitude:neCoord.latitude longitude:neCoord.longitude];
        
        float distance = [[AppDelegate instance].currentLocation distanceFromLocation:cornerLocation];
        if (distance > 2000) {
            [self showAlertView:@"Only show your friend from the region"];
            isShowMapAlert = FALSE;
        }
}
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
	[_mapView setHidden:FALSE];

}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    isShowMapAlert = TRUE;
//    MKMapRect mRect = self.mapView.visibleMapRect;
//    MKMapPoint neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
//  //  MKMapPoint swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
//    CLLocationCoordinate2D neCoord = MKCoordinateForMapPoint(neMapPoint);
//  //  CLLocationCoordinate2D swCoord = MKCoordinateForMapPoint(swMapPoint);
//    CLLocation *cornerLocation = [[CLLocation alloc] initWithLatitude:neCoord.latitude longitude:neCoord.longitude];
//    
//    float distance = [[AppDelegate instance].currentLocation distanceFromLocation:cornerLocation];
//    NSLog(@"distance = %f", distance);

}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKAnnotationView* annotationView = nil;
	
    
	if([annotation isKindOfClass:[CSMapAnnotation class]])
	{
		// determine the type of annotation, and produce the correct type of annotation view for it.
		CSMapAnnotation* csAnnotation = (CSMapAnnotation*)annotation;
		if(csAnnotation.annotationType == CSMapAnnotationTypeStart || 
		   csAnnotation.annotationType == CSMapAnnotationTypeEnd)
		{
			NSString* identifier = @"Pin";
			MKPinAnnotationView* pin = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
			
			if(nil == pin)
			{
				pin = [[[MKPinAnnotationView alloc] initWithAnnotation:csAnnotation reuseIdentifier:identifier] autorelease];
			}
			
			[pin setPinColor:(csAnnotation.annotationType == CSMapAnnotationTypeEnd) ? MKPinAnnotationColorRed : MKPinAnnotationColorGreen];
			
			annotationView = pin;
		}
		else if(csAnnotation.annotationType == CSMapAnnotationTypeImage)
		{
			NSString* identifier = @"Image";
			
			CSImageAnnotationView* imageAnnotationView = (CSImageAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
			if(nil == imageAnnotationView)
			{
				imageAnnotationView = [[[CSImageAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];	
				imageAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
                [imageAnnotationView showAnotationInfo];
			}
			
			annotationView = imageAnnotationView;
		}
		
		[annotationView setEnabled:YES];
		//[annotationView setCanShowCallout:YES];
	}
	
    
	return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
 //show info detail of anotation	
}
-(void)showAlertView:(NSString *)message{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    [self performSelector:@selector(hideAlert:) withObject:alert afterDelay:2];
     [alert release];
}
-(void)hideAlert:(UIAlertView*)alertView{

    [alertView dismissWithClickedButtonIndex:0 animated:TRUE];
}
#pragma mark - Map list btn clicked
-(IBAction)mapBtnClicked:(id)sender{

    if (!isMapDisplayed) {
        isMapDisplayed = TRUE;
        _tbl.hidden = TRUE;
        [UIView transitionWithView:containerView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            [_tbl removeFromSuperview];
                            [containerView addSubview:mapView_]; }
                        completion:nil];
        titleLb.text = @"Map";
    
        mapImageView.image = [UIImage imageNamed:@"location_button_active.png"];
        listImageView.image = [UIImage imageNamed:@"list_button.png"];

    }
}
-(IBAction)listBtnCLicked:(id)sender{
//get data for list show
    if (listShowOnTable) {
        [listShowOnTable removeAllObjects];
    } else {
        listShowOnTable = [[NSMutableArray alloc] init ];
    }
    [listShowOnTable addObjectsFromArray:listFriend];
    [listShowOnTable addObjectsFromArray:listOther];
    [listShowOnTable addObjectsFromArray:listCompany];
   
//sort ascending by distance
    listShowOnTable = [[self sortAscendingDistance:listShowOnTable] retain];
     NSLog(@"listShowOntable = %d", [listShowOnTable count]);
    [_tbl reloadData];
//show animation
    if (isMapDisplayed) {
        isMapDisplayed = FALSE;
        _tbl.hidden = FALSE;
        [UIView transitionWithView: containerView
                          duration:1.0 
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            [mapView_ removeFromSuperview];
                            [containerView addSubview:_tbl]; }
                        completion:nil];
        titleLb.text = @"List";
        
        mapImageView.image = [UIImage imageNamed:@"location_button.png"];
        listImageView.image = [UIImage imageNamed:@"list_button_active.png"];
    }
    
}

-(NSMutableArray*) sortAscendingDistance:(NSMutableArray*)array{
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"distance"
                                                  ascending:YES] autorelease];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [array sortedArrayUsingDescriptors:sortDescriptors];
    NSMutableArray *returnArr = [NSMutableArray arrayWithArray:sortedArray];
    return returnArr;
}

#pragma mark - TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //    if ([friendList count] == 0) {
    //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Do not any friend" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //        [alert show];
    //    }
    
    
    return [listShowOnTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[ListTableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.delegate = self;
    cell.cellIndex = indexPath.row;
    cell.userInfo = [listShowOnTable objectAtIndex:indexPath.row];
    [cell showCellInfo];
    return cell;
}

- (void) switchToLeftView:(NSInteger)cellIndex{
    
    ChatViewController *chatView = [[ChatViewController alloc] initWithNibName:@"ChatViewController" bundle:Nil];
    [self.navigationController pushViewController:chatView foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
    [chatView release];
}

- (void) switchToRightView:(NSInteger)cellIndex{
    
    ProfileViewController *profileController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:Nil];
    [self.navigationController pushViewController:profileController foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
    [profileController release];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
