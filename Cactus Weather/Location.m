//
//  Location.m
//  Cactus Weather
//
//  Created by Admin on 25.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "Location.h"

@interface Location ()

@end

@implementation Location
@synthesize  mapView, lockCoordinate, lat, lon;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
       
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager =[[CLLocationManager alloc]init];
   
    MKMapItem *currentPoint = [MKMapItem mapItemForCurrentLocation];
    [currentPoint isCurrentLocation];
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    lat = [NSString stringWithFormat:@"%.0f",userLocation.coordinate.latitude];
    lon = [NSString stringWithFormat:@"%.0f", userLocation.coordinate.longitude];
    NSString *coord =[NSString stringWithFormat:@"lat=%@,lon=%@",lat,lon];
    NSLog(@"Latitude: %.0f" , userLocation.coordinate.latitude);
    NSLog(@"Longitude: %.0f" , userLocation.coordinate.longitude);
    return coord;
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Days *navVC = [segue destinationViewController];
    


 navVC.searchResult =[NSString stringWithFormat:@"?lat=%@&lon=%@", lat, lon];
    NSLog(@"%@",navVC.searchResult);
}


@end
