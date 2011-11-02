//
//  MapViewAnnotation.m
//  MapApp
//
//  Created by  on 2011/10/12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d
{
    [super init];
	title = ttl;
	coordinate = c2d;
	return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)dealloc
{
    [title release];
	[super dealloc];
}

@end
