//
//  ViewController.m
//  Cactus Weather
//
//  Created by Admin on 13.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static NSString *mySearch;
+(NSString*)newSearch {
    return mySearch;
}

- (IBAction)searchButton:(id)sender {
    
    mySearch = myText.text;
}


@synthesize myText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





   
    


@end
