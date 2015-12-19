//
//  SDTableViewController.m
//  Safe Drive
//
//  Created by Kostya on 05.12.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//

#import "SDTableViewController.h"

@interface SDTableViewController ()

@end

@implementation SDTableViewController
@synthesize  userPassTabel, userPassArray;

#pragma mark понять для чего надо делать @synthesize


- (void)viewDidLoad {
    [super viewDidLoad];
    userPassArray = [[NSMutableArray alloc] initWithObjects:@"Mail.ru",@"Vkontakte", nil];
  
    self.title = @"Your Accounts";
    
#pragma mark  понять почему происходит неизветный бред кнопка edit срабатывает со второго раза почему?
    
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
        [self performSegueWithIdentifier:@"createButton" sender:sender];
    }




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [userPassArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellIdentifier" forIndexPath:indexPath];

#pragma mark дописать проверку на if (cell == NULL)
    if (cell == NULL)
    {
        //cell = [[UITableView alloc] initWithFrame:UITableViewStylePlain];
    }
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
    
#pragma mark понять зачем эта строка нужна?
    [userPassTabel setEditing:editing animated:animated];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [userPassArray removeObjectAtIndex:indexPath.row];
#pragma mark   понять почему обращаемся именно к row?
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 
    }   
}

-(IBAction)test:(id)sender
{    NSString  *userAccountL =  self.userAccountLogin.text;
    if (!userPassArray)
    {userPassArray = [[NSMutableArray alloc]init];}
    else{
        [userPassArray insertObject:userAccountL atIndex:0];
        }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.userPassTabel insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
