//
//  detailTableViewController.h
//  XmlAppTest
//
//  Created by  on 2011/10/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class hotel;

@interface detailTableViewController : UITableViewController <MKMapViewDelegate>{
    hotel *detailHotel;
	MKMapView *mapView;
	UITableView *tableView;
}

@property (nonatomic, retain) hotel *detailHotel;
@property (nonatomic,retain) MKMapView *mapView;

@end
