//
//  mainTableViewController.m
//  XmlAppTest
//
//  Created by  on 2011/10/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "mainTableViewController.h"
#import "XmlAppTestAppDelegate.h"
#import "hotel.h"
#import "detailTableViewController.h"

@implementation mainTableViewController

@synthesize dataSource;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (XmlAppTestAppDelegate *)[[UIApplication sharedApplication] delegate];
    dataSource = appDelegate.hotels;
    self.title = @"台北市旅館資料";
    //initialize the two arrays; dataSource will be initialized and populated by appDelegate
    searchedData = [[NSMutableArray alloc] init];
    tableData = [[NSMutableArray alloc] init];
    [tableData addObjectsFromArray:dataSource];//on launch it should display all the records
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//  return [appDelegate.hotels count];
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
//  hotel *aHotel = [appDelegate.hotels objectAtIndex:indexPath.row];
    hotel *aHotel = [tableData objectAtIndex:indexPath.row];
	
	cell.textLabel.text = aHotel.stitle;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    detailTableViewController *detailViewController = [[detailTableViewController alloc] initWithNibName:@"detailTableViewController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
//  hotel *aHotel = [appDelegate.hotels objectAtIndex:indexPath.row];
    hotel *aHotel = [tableData objectAtIndex:indexPath.row];
    
    detailViewController.detailHotel = aHotel;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // only show the status bar’s cancel button while in edit mode
    sBar.showsCancelButton = YES;
    sBar.autocorrectionType = UITextAutocorrectionTypeNo;
    // flush the previous search content
    [tableData removeAllObjects];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    sBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[tableData removeAllObjects];// remove all data that belongs to previous search
    if([searchText isEqualToString:@""] || searchText==nil)
	{
		[self.tableView reloadData];
		return;
	}
	NSInteger counter = 0;
	for(hotel *name in dataSource)
	{
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		NSRange r = [name.stitle rangeOfString:searchText];
		if(r.location != NSNotFound)
            [tableData addObject:name];
		counter++;
		[pool release];
	}
	[self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	// if a valid search was entered but the user wanted to cancel, bring back the main list content
	[tableData removeAllObjects];
	[tableData addObjectsFromArray:dataSource];
	@try{
		[self.tableView reloadData];
	}
	@catch(NSException *e){
	}
    [sBar resignFirstResponder];
    sBar.text = @"";
}
// called when Search (in our case “Done”) button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)dealloc
{
    [dataSource release];
    [tableData release];
    [searchedData release];
    [sBar release];
    [super dealloc];
}

@end
