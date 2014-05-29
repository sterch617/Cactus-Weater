//
//  Location.h
//  Cactus Weather
//
//  Created by Admin on 25.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Detail.h"


@interface Location : UIViewController
{
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
    NSString *lat;
    NSString *lon;
}
@property(nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) CLLocationCoordinate2D lockCoordinate;

@property(nonatomic, strong)NSString *lat;
@property(nonatomic, strong) NSString *lon;

//- (NSString*)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;
@end
