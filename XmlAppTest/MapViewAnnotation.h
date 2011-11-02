//
//  MapViewAnnotation.h
//  MapApp
//
//  Created by  on 2011/10/12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface MapViewAnnotation : NSObject <MKAnnotation>{
	NSString *title;
	NSString *subtitle;
	CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy)NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithTitle:(NSString *)ttl andCoordinate: (CLLocationCoordinate2D) c2d;
@end
