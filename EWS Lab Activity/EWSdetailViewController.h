//
//  EWSdetailViewController.h
//  EWS Lab Activity
//
//  Created by Caleb Freed on 12/31/13.
//  Copyright (c) 2013 Caleb Freed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface EWSdetailViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *lab;
@property (weak, nonatomic) IBOutlet UILabel *inuse;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *types;
@property (weak, nonatomic) IBOutlet UILabel *hours;
@end
