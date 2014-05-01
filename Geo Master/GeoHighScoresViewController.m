//
//  GeoHighScoresViewController.m
//  Geo Master
//
//  Created by Volker, Joseph on 4/30/14.
//  Copyright (c) 2014 ios.uiowa. All rights reserved.
//

#import "GeoHighScoresViewController.h"
#import "GeoHighScoreTableCell.h"

@interface GeoHighScoresViewController ()

@end

@implementation GeoHighScoresViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
//        if(_recordCollection == nil)
//        {
//            NSLog(@"initialized collection!");
//            _recordCollection = [[GeoRecordCollection alloc] init];
//        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if(_recordCollection == nil)
//    {
//        NSLog(@"initialized collection!");
//        _recordCollection = [[GeoRecordCollection alloc] init];
//    }
    
    self.tableView.dataSource = self;
    
    
    self.recordCollection = [[GeoRecordCollection alloc] init];
    GeoRecord* record1 = [[GeoRecord alloc] init];
    record1.playerName = [NSString stringWithFormat:@"Katniss Everdeen"];
    record1.score = [NSNumber numberWithDouble:45.67];
    
    GeoRecord* record2 = [[GeoRecord alloc] init];
    record2.playerName = [NSString stringWithFormat:@"Peeta Mellark"];
    record2.score = [NSNumber numberWithDouble:12.98];
    
    [self.recordCollection addRecord:record1];
    [self.recordCollection addRecord:record2];
    
    NSLog(@"initialized collection!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.recordCollection getCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"recordCell";
    
    GeoHighScoreTableCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier
                              forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    
    cell.playerNameLabel.text = [self.recordCollection getRecordAtIndex:row].playerName;
    cell.scoreLabel.text = [NSString stringWithFormat:@"%@", [self.recordCollection getRecordAtIndex:row].score];
    [cell.playerNameLabel sizeToFit];
    [cell.scoreLabel sizeToFit];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end