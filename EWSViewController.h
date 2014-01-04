//
//  EWSViewController.h
//  EWS Lab Activity
//
//  Created by Caleb Freed on 12/30/13.
//  Copyright (c) 2013 Caleb Freed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "EWSCell.h"
#import "EWSdetailViewController.h"

@interface EWSViewController : UITableViewController <UITableViewDataSource, UITableViewDataSource>{
    BOOL loaded;
}

@property (strong, nonatomic) NSMutableArray * jsonResponse;
@property (strong, nonatomic) NSMutableArray * labs;

@end
