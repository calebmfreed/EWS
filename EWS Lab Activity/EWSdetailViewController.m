//
//  EWSdetailViewController.m
//  EWS Lab Activity
//
//  Created by Caleb Freed on 12/31/13.
//  Copyright (c) 2013 Caleb Freed. All rights reserved.
//
#define METERS_PER_MILE 1609.344

#import "EWSdetailViewController.h"

@interface EWSdetailViewController ()

@end

@implementation EWSdetailViewController
{
    GMSMapView *mapView_;
}

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
	// Do any additional setup after loading the view.
    
    NSArray * dofweek = [NSArray arrayWithObjects:@"Mon",@"Tues",@"Wed",@"Thurs", @"Fri", @"Sat", @"Sun", nil];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"LabInfo" ofType:@"plist"];
    NSDictionary *properties = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@", _lab[@"strlabname"]);
    NSLog(@"%@", properties);
    NSLog(@"Labs:%@", properties[@"Labs"][_lab[@"strlabname"]]);
    _inuse.text = [NSString stringWithFormat:@"%@/%@", _lab[@"inusecount"],_lab[@"machinecount"]];
    _address.text = _lab[@"address"];
    _types.text = properties[@"Labs"][_lab[@"strlabname"]][@"Num"];
    NSString * temp = @"";
    NSInteger numH = [properties[@"Labs"][_lab[@"strlabname"]][@"Hours"] count];
    if(numH == 1)
    {
        temp = [NSString stringWithFormat:@"%@\n", properties[@"Labs"][_lab[@"strlabname"]][@"Hours"][0]];
    }
    else{
        for(int i = 0; i < numH; i++)
        {
            NSLog(@"Temp:%@",properties[@"Labs"][_lab[@"strlabname"]][@"Hours"][i]);
            temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%@:%@\n", dofweek[i], properties[@"Labs"][_lab[@"strlabname"]][@"Hours"][i]]];

        }
    }
    NSLog(@"TEMP:%@", temp);
    _hours.text = temp;

    self.navigationItem.title = _lab[@"strlabname"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"screenH:%f", screenHeight);
    CGRect frame = CGRectMake(0, 0, 320.0f,screenHeight/2);
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[_lab[@"lat"] doubleValue]
                                                            longitude:[_lab[@"lng"] doubleValue]
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:frame camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.frame = frame;
    [self.view addSubview:mapView_];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([_lab[@"lat"] doubleValue], [_lab[@"lng"] doubleValue]);
    marker.title = _lab[@"name"];
    marker.snippet = _lab[@"strlabname"];
    marker.map = mapView_;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
