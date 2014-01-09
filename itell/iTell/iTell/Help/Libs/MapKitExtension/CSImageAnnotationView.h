//
//  CSImageAnnotationView.h
//  mapLines
//
//  Created by Craig on 5/15/09.
//  Copyright 2009 Craig Spitzkoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "AsyncImageView.h"

@class CSMapAnnotation;
@interface CSImageAnnotationView : MKAnnotationView
{
	AsyncImageView* _imageView;
    CSMapAnnotation* csAnnotation;
}

@property (nonatomic, retain) AsyncImageView* imageView;

-(void)showAnotationInfo;

@end
