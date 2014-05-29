//
//  WeaterTable.m
//  Cactus Weather
//
//  Created by Admin on 13.05.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "WeaterTable.h"
#import "ViewController.h"
@interface WeaterTable ()

@end

@implementation WeaterTable


@synthesize data, dict;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *search = [ViewController newSearch];
    
    NSString *searchUrl = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/find?q=%@&units=metric&mode=json",search];
    NSLog(@"%@",searchUrl);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    NSURL *url = [NSURL URLWithString:searchUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (conection) {
        data=[NSMutableData data];
        
        
        
    }
    else {
        NSLog(@"Connection Feiled");
    }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)thedata
{
    [data appendData:thedata];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    
   
    dict = [NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
//    NSLog(@"%@",[[[self.dict objectForKey:@"list"] objectAtIndex:0] objectForKey:@"name"]);
//  NSLog(@"%@",[[[[self.dict objectForKey:@"list"] objectAtIndex:0] objectForKey:@"sys"] objectForKey:@"country"]);
//  NSLog(@"%@",dict);
    
    [self.tableView reloadData];

}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    UIAlertView *errorView = [[UIAlertView alloc]initWithTitle:@"error!" message:@"Shit happens :(, check Wi-Fi or 3g" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [errorView show];
    
    NSLog(@"Fail");
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSArray *arr =[dict objectForKey:@"list"]; //берем вложенный в словарь массив и считаем кол-во элементов
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[dict objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [[[[dict objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"sys"] objectForKey:@"country"];
    
  
    
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Days *VcResult = [segue destinationViewController];
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];

    NSString* city = [[[dict objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"name"];
   NSString* country =[[[[dict objectForKey:@"list"] objectAtIndex:indexPath.row] objectForKey:@"sys"]objectForKey:@"country"];
    VcResult.searchResult = [NSString stringWithFormat:@"?q=%@,%@",city,country];
    
    NSLog(@"%@",VcResult.searchResult);
    
}








@end
