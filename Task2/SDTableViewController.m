//
//  SDTableViewController.m
//  task2
//
//  Created by Kostya on 05.12.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "SDTableViewController.h"

@interface SDTableViewController ()

@end

@implementation SDTableViewController
@synthesize  userPassTabel, userPassArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    userPassArray = [[NSMutableArray alloc] initWithObjects:@"First message",@"Second message", nil];
  
    self.title = @"Your Accounts";
    
    
     //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *editButton         = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                           target:self
                                           action:@selector(editButton:)];
    UIBarButtonItem *createButton         = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                             target:self
                                             action:@selector(createButton:)];
   
    self.navigationItem.rightBarButtonItems =
    [NSArray arrayWithObjects:editButton,createButton,nil];
}
-(void)editButton:(id)sender
{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)createButton:(id)sender
    {
        NSString  *userAccountL =  self.userAccountLogin.text;
        if (!userPassArray)
        {userPassArray = [[NSMutableArray alloc]init];}
        else{
            [userPassArray insertObject:userAccountL atIndex:0];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.userPassTabel insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [userPassArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellIdentifier" forIndexPath:indexPath];

    cell.textColor = [UIColor greenColor];
    cell.textLabel.text = [userPassArray objectAtIndex:indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
   
        return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [userPassTabel setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [userPassArray removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 
    }   
}

@end
