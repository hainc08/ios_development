//
//  CSCompanyAnnotationView.h
//  iTell
//
//  Created by Thap on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class CSMapAnnotation;
@interface CSCompanyAnnotationView : MKAnnotationView
{
     CSMapAnnotation* csAnnotation;
}

-(void)showAnotationInfo;
@end
