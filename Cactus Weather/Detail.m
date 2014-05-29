//
//  Detail.m
//  Cactus Weather
//
//  Created by Admin on 23.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

@implementation Detail
@synthesize SpeedWind, strWind, morn, mornStr, day,night, nightStr, dayStr, eve, eveStr, pressure, pressureStr,                      curImage, daysImg, myCity, cityStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *curWind =[NSString stringWithFormat:@"Speed: %@ m/s", strWind];
    SpeedWind.text = curWind;
    
    NSString *curMon = [NSString stringWithFormat:@"Morning: %@°C", mornStr];
    morn.text = curMon;
    
    NSString *curDay = [NSString stringWithFormat:@"Day: %@°C", dayStr];
    day.text = curDay;
    
    NSString *curEve = [NSString stringWithFormat:@"Evening: %@°C", eveStr];
    eve.text =curEve;
    
    NSString *curNight = [NSString stringWithFormat:@"Night: %@°C", nightStr];
    night.text =curNight;
    
    NSString *curPressure = [NSString stringWithFormat:@"Pressure: %@", pressureStr];
    pressure.text =curPressure;
    NSString *curCity = [NSString stringWithFormat:@"%@", cityStr];
    myCity.text = curCity;
    
    UIImage *newImage = [UIImage imageWithData:curImage];
    daysImg.image = newImage;
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
