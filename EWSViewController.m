//
//  EWSViewController.m
//  EWS Lab Activity
//
//  Created by Caleb Freed on 12/30/13.
//  Copyright (c) 2013 Caleb Freed. All rights reserved.
//

#import "EWSViewController.h"

@interface EWSViewController ()

@end

@implementation EWSViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationItem.title = @"Labs";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor orangeColor];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor blueColor];
    [refreshControl addTarget:self action:@selector(updateJson:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];

    _jsonResponse = [[NSMutableArray alloc] init];
    _labs = [[NSMutableArray alloc] init];

    [self updateJson:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) updateJson: (UIRefreshControl *)refreshControl
{
    NSString *labUrl = [NSString stringWithFormat:@"https://my.engr.illinois.edu/labtrack/util_data_json.asp?"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:labUrl  parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * tempDict = (NSDictionary *)responseObject;
        NSLog(@"Response: %@", tempDict[@"data"]);
        _jsonResponse = tempDict[@"data"];
        NSLog(@"JSONRESPOSNE: %@", _jsonResponse[0]);
        [_labs removeAllObjects];
        for(int i = 0; i < [_jsonResponse count]; i++)
        {
            if([_jsonResponse[i][@"strlabname"] isEqualToString:@"DCL L416"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//DCL L416
                [mutDict setObject:@"Digital Computer Lab" forKey:@"name"];//DCL L416
                [mutDict setObject:@"40.1131082" forKey:@"lat"];
                [mutDict setObject:@"-88.22652339999999" forKey:@"lng"];
                [mutDict setObject:@"L416" forKey:@"room"];//DCL L416
                [mutDict setObject:@"1304 Springfield Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"DCL L440"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//DCL L440
                [mutDict setObject:@"Digital Computer Lab" forKey:@"name"];
                [mutDict setObject:@"40.1131082" forKey:@"lat"];
                [mutDict setObject:@"-88.22652339999999" forKey:@"lng"];
                [mutDict setObject:@"L440" forKey:@"room"];
                [mutDict setObject:@"1304 Springfield Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"DCL L520"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//DCL L520
                [mutDict setObject:@"Digital Computer Lab" forKey:@"name"];
                [mutDict setObject:@"40.1131082" forKey:@"lat"];
                [mutDict setObject:@"-88.22652339999999" forKey:@"lng"];
                [mutDict setObject:@"L520" forKey:@"room"];
                [mutDict setObject:@"1304 Springfield Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"EH 406B1"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//EH 406B1
                [mutDict setObject:@"Engineering Hall" forKey:@"name"];
                [mutDict setObject:@"40.1108517" forKey:@"lat"];
                [mutDict setObject:@"-88.226974" forKey:@"lng"];
                [mutDict setObject:@"406B1" forKey:@"room"];
                [mutDict setObject:@"1308 W Green St, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"EH 406B8"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//EH 406B8
                [mutDict setObject:@"Engineering Hall" forKey:@"name"];
                [mutDict setObject:@"40.1108517" forKey:@"lat"];
                [mutDict setObject:@"-88.226974" forKey:@"lng"];
                [mutDict setObject:@"406B8" forKey:@"room"];
                [mutDict setObject:@"1308 W Green St, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"EVRT 252"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//EVRT 252
                [mutDict setObject:@"Everitt Lab" forKey:@"name"];
                [mutDict setObject:@"40.1108681" forKey:@"lat"];
                [mutDict setObject:@"-88.2283044" forKey:@"lng"];
                [mutDict setObject:@"252" forKey:@"room"];
                [mutDict setObject:@"619 S Wright St, Champaign, IL 61820" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"GELIB 057"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//GELIB 057
                [mutDict setObject:@"Grainger Library" forKey:@"name"];
                [mutDict setObject:@"40.1127329" forKey:@"lat"];
                [mutDict setObject:@"-88.22564059999999" forKey:@"lng"];
                [mutDict setObject:@"057" forKey:@"room"];
                [mutDict setObject:@"1301 West Springfield Avenue, Urbana, Illinois 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"GELIB 4th"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//GELIB 4th
                [mutDict setObject:@"Grainger Library" forKey:@"name"];
                [mutDict setObject:@"40.1127329" forKey:@"lat"];
                [mutDict setObject:@"-88.22564059999999" forKey:@"lng"];
                [mutDict setObject:@"4th" forKey:@"room"];
                [mutDict setObject:@"1301 West Springfield Avenue, Urbana, Illinois 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"MEL 1001"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//MEL 1001
                [mutDict setObject:@"Mechanical Engineering Lab" forKey:@"name"];
                [mutDict setObject:@"40.1116671" forKey:@"lat"];
                [mutDict setObject:@"-88.2259866" forKey:@"lng"];
                [mutDict setObject:@"1001" forKey:@"room"];
                [mutDict setObject:@"105 S Mathews Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"MEL 1009"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Windows" forKey:@"types"];//MEL 1009
                [mutDict setObject:@"Mechanical Engineering Lab" forKey:@"name"];
                [mutDict setObject:@"40.1116671" forKey:@"lat"];
                [mutDict setObject:@"-88.2259866" forKey:@"lng"];
                [mutDict setObject:@"1009" forKey:@"room"];
                [mutDict setObject:@"105 S Mathews Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"SIEBL 0218"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//SIEBL 0218
                [mutDict setObject:@"Siebel Center" forKey:@"name"];
                [mutDict setObject:@"40.1138245" forKey:@"lat"];
                [mutDict setObject:@"-88.2240759" forKey:@"lng"];
                [mutDict setObject:@"0218" forKey:@"room"];
                [mutDict setObject:@"201 N Goodwin Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"SIEBL 0220"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//SIEBL 0220
                [mutDict setObject:@"Siebel Center" forKey:@"name"];
                [mutDict setObject:@"40.1138245" forKey:@"lat"];
                [mutDict setObject:@"-88.2240759" forKey:@"lng"];
                [mutDict setObject:@"0220" forKey:@"room"];
                [mutDict setObject:@"201 N Goodwin Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
            else if([_jsonResponse[i][@"strlabname"] isEqualToString:@"SIEBL 0222"])
            {
                NSMutableDictionary *mutDict;
                mutDict = [_jsonResponse[i] mutableCopy];
                [mutDict setObject:@"Linux" forKey:@"types"];//SIEBL 0222
                [mutDict setObject:@"Siebel Center" forKey:@"name"];
                [mutDict setObject:@"40.1138245" forKey:@"lat"];
                [mutDict setObject:@"-88.2240759" forKey:@"lng"];
                [mutDict setObject:@"0222" forKey:@"room"];
                [mutDict setObject:@"201 N Goodwin Ave, Urbana, IL 61801" forKey:@"address"];
                [_labs addObject:mutDict];
            }
//            if(i == 0 || i == 3 || i == 4 || i == 7 || i == 8 || i == 9)
//            {
//                NSMutableDictionary *mutDict;
//                mutDict = [_jsonResponse[i] mutableCopy];
//                [mutDict setObject:@"Win" forKey:@"types"];//DCL L416
//                [_labs addObject:mutDict];
//            }
//            else{
//                NSMutableDictionary *mutDict;
//                mutDict = [_jsonResponse[i] mutableCopy];
//                [mutDict setObject:@"Lin" forKey:@"types"];//DCL L416
//                [_labs addObject:mutDict];
//            }
        }
//        
//        NSMutableDictionary *mutDict;
//        mutDict = [_jsonResponse[0] mutableCopy];
//        [mutDict setObject:@"Win" forKey:@"types"];//DCL L416
//        _labs[0] = mutDict;
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[1] setObject:@"Lin" forKey:@"types"];//DCL L440
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[2] setObject:@"Lin" forKey:@"types"];//DCL L520
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[3] setObject:@"Win" forKey:@"types"];// EH 406B1
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[4] setObject:@"Win" forKey:@"types"];// EH 406B8
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[5] setObject:@"Lin" forKey:@"types"];//EVRT 251
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[6] setObject:@"Lin" forKey:@"types"];//GELIB 057
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[7] setObject:@"Win" forKey:@"types"];// GELIB 4th
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[8] setObject:@"Win" forKey:@"types"];//MEL 1001
//        
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[9] setObject:@"Win" forKey:@"types"];//MEL 1009
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[10] setObject:@"Lin" forKey:@"types"];//SIEBL 0218
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[11] setObject:@"Lin" forKey:@"types"];//SIEBL 0220
//        _labs[0] = mutDict;
//
//        mutDict = [_jsonResponse[1] mutableCopy];
//        [_jsonResponse[12] setObject:@"Lin" forKey:@"types"];//SIEBL0222
//        _labs[0] = mutDict;



        loaded = YES;
        [self.tableView reloadData];
        [refreshControl endRefreshing];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row % 2 == 0)
    {
        return 5.0;
    }
    else return 44.0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return ([_labs count] * 2);
}

- (void)tableView: (UITableView*)tableView
  willDisplayCell: (UITableViewCell*)cell
forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = indexPath.row % 2
    ? [UIColor colorWithRed: 30.0/255.0 green: 94.0/255.0 blue: 255.0/255.0 alpha: 1.0]
    : [UIColor clearColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ewsCell";
    EWSCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(loaded == YES)
    {
//        cell.textLabel.text = [NSString stringWithFormat:@"%@, %d Free", _jsonResponse[indexPath.row][@"strlabname"],([_jsonResponse[indexPath.row][@"machinecount"] integerValue]-[_jsonResponse[indexPath.row][@"inusecount"] integerValue])];
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@/%@", _jsonResponse[indexPath.row][@"inusecount"],_jsonResponse[indexPath.row][@"machinecount"]];
        if(indexPath.row % 2 != 0){
            [cell.layer setCornerRadius:7.0f];
            [cell.layer setMasksToBounds:YES];
            //[cell.layer setBorderWidth:2.0f];
            int diff = [_labs[indexPath.row/2][@"machinecount"] integerValue]-[_labs[indexPath.row/2][@"inusecount"] integerValue];
            cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
            cell.name.text = _labs[indexPath.row/2][@"strlabname"];
            cell.free.text = [NSString stringWithFormat:@"%d Free", diff];
            cell.type.text = _labs[indexPath.row/2][@"types"];
            cell.userInteractionEnabled = YES;
            if(diff < 5)
            {
                cell.name.textColor = [UIColor redColor];
                cell.free.textColor = [UIColor redColor];
            }
            else if(diff > 5 && diff < 15)
            {
                cell.name.textColor = [UIColor orangeColor];
                cell.free.textColor = [UIColor orangeColor];
            }
            else{
                cell.name.textColor = [UIColor greenColor];
                cell.free.textColor = [UIColor greenColor];
            }
        }
        else{
            cell.name.text = @"";
            cell.free.text = @"";
            cell.type.text = @"";
            [cell.layer setMasksToBounds:NO];
            cell.userInteractionEnabled = NO;

            //cell.backgroundColor = [UIColor clearColor];
        }
    }
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"toDetails" sender:self];
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"toDetails"])
    {
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];

        [segue.destinationViewController setLab:_labs[selectedRowIndex.row/2]];
    }
}


@end
