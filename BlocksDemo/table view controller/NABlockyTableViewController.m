//
//  NABlockyTableViewController.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 4/4/14.
//

#import "NABlockyTableViewController.h"

static NSString * const CellIdentifier = @"TestCellIdentifier";

@implementation NABlockyTableViewController

-(void)viewDidLoad {
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:CellIdentifier];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

@end
