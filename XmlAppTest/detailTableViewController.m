//
//  detailTableViewController.m
//  XmlAppTest
//
//  Created by  on 2011/10/19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "detailTableViewController.h"
#import "hotel.h"
#import "MapViewAnnotation.h"

@implementation detailTableViewController

@synthesize detailHotel;
@synthesize mapView,tableView;

- (MKMapView *)mapView
{
    if(!mapView)
        mapView = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    return mapView;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

#define MAP_BUTTON_TITLE @"MAP"
#define LIST_BUTTON_TITLE @"LIST"

- (void)viewDidLoad
{
    [super viewDidLoad];
		
		self.title = @"細項資料";
	    if(!tableView && [self.view isKindOfClass:[UITableView class]]) {
            tableView = (UITableView *)self.view;
    }
		
    self.view =[[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame]autorelease];

    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];

    self.mapView.frame = self.view.bounds;
    [self.view addSubview:self.mapView];

    self.mapView.hidden = YES;
    self.mapView.delegate = self;

    //add rightbutton
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:MAP_BUTTON_TITLE style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMap)] autorelease];
}

- (void)toggleMap
{
  if (self.mapView.isHidden) {
      self.mapView.hidden = NO;
      self.tableView.hidden = YES;
      self.navigationItem.rightBarButtonItem.title = LIST_BUTTON_TITLE;
      mapView.mapType = MKMapTypeStandard;
      mapView.showsUserLocation = YES;

      CLLocationCoordinate2D coordinate;
      coordinate.latitude = [detailHotel.latitude doubleValue];
      coordinate.longitude = [detailHotel.longitude doubleValue]; 
      mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
//     NSString *mapTitle = detailHotel.stitle;
    //annotation
      MapViewAnnotation *nwAnnotation = [[MapViewAnnotation alloc] initWithTitle:detailHotel.stitle andCoordinate:coordinate];
      [mapView addAnnotation:nwAnnotation];
      [nwAnnotation release];
  }
  else
  {
    self.mapView.hidden = YES;
    self.tableView.hidden = NO;
    self.navigationItem.rightBarButtonItem.title = MAP_BUTTON_TITLE;
  }
}

- (void)mapView:(MKMapView *)sender annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
  //switch to another view
//  myViewControlelr *myVC = [[[myViewControlelr alloc] init] autorelease];
//  [self.view addSubview:myVC.view];
  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    switch (indexPath.section) {
		case 0:
			cell.textLabel.text = detailHotel.stitle;
			break;
		case 1:
			cell.textLabel.text = detailHotel.CAT2;
			break;
		case 2:
			cell.textLabel.text = detailHotel.address;
			break;
		case 3:
			cell.textLabel.text = detailHotel.MEMO_TEL;
			break;
		case 4:
			cell.textLabel.text = detailHotel.xurl;
			break;
		}
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *rtnName;
		switch (section) {
		case 0:
			rtnName = @"旅館名稱";
			break;
		case 1:
			rtnName = @"類別";
			break;
		case 2:
			rtnName = @"地址";
			break;
		case 3:
			rtnName = @"電話";
			break;
		case 4:
			rtnName = @"網址";
			break;
		}
    return rtnName;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
