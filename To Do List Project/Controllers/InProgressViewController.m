//
//  InProgressViewController.m
//  To Do List Project
//
//  Created by Hala on 28/02/2021.
//

#import "InProgressViewController.h"

@interface InProgressViewController (){
    NSUserDefaults *defaults;
}

@end

@implementation InProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // to remove empty cell in table
    _inProgressTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // declear user defaults
    defaults = [NSUserDefaults standardUserDefaults];

    // NSMutableArray for in progress tasks
//    if ([[defaults objectForKey:@"in_progress_tasks"] mutableCopy] == nil) {
//        _inProgressTasks = [NSMutableArray new];
//    }else{
//        _inProgressTasks = [[defaults objectForKey:@"in_progress_tasks"] mutableCopy];
//    }
    
    
    [_inProgressTableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    if ([[defaults objectForKey:@"in_progress_tasks"] mutableCopy] == nil) {
        _inProgressTasks = [NSMutableArray new];
    }else{
        _inProgressTasks = [[defaults objectForKey:@"in_progress_tasks"] mutableCopy];
    }
    
    [_inProgressTableView reloadData];
}

- (void)editTaskDelegation:(NSMutableDictionary *)dictionary :(NSInteger)indexValue{

    //[_inProgressTasks replaceObjectAtIndex:(NSUInteger)indexValue withObject:dictionary];
    
        
    [_inProgressTasks removeObjectAtIndex:indexValue];
    [_inProgressTasks addObject:dictionary];
    
    
    [defaults setObject:_inProgressTasks forKey:@"in_progress_tasks"];
    [defaults synchronize];
    [_inProgressTableView reloadData];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_inProgressTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InProgressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MMM-yyyy hh:min a"];
    NSString *dateString = [formatter stringFromDate:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"date"]];
    
    cell.labelDate.text = dateString;
    cell.labelName.text = [[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"name"];

    if([[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString: @"High"]){
        cell.imagePriority.tintColor = [UIColor redColor];
    }else if([[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString: @"Medium"]){
        cell.imagePriority.tintColor = [UIColor blueColor];
    }else{
        cell.imagePriority.tintColor = [UIColor greenColor];
    }
    
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // remove from 2 arrays
    //[_allTasks removeObjectAtIndex:indexPath.row];
    
    
    [_inProgressTasks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    [defaults setObject:_inProgressTasks forKey:@"in_progress_tasks"];
    
    [defaults synchronize];
    [_inProgressTableView reloadData];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    EditTaskViewController *editTask = [self.storyboard instantiateViewControllerWithIdentifier:@"edit_task"];
    
    [editTask setInProgressEditDelegation:self];
    

    [editTask setEditName:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"name"]];

    [editTask setEditDescription:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"description"]];

    [editTask setEditPriority:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"priority"]];

    [editTask setEditDate:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"date"]];
    
    [editTask setEditState:[[_inProgressTasks objectAtIndex:indexPath.row] objectForKey:@"state"]];
        
    [editTask setRowIndex:indexPath.row];
    
    
    
    
    [self.navigationController pushViewController:editTask animated:YES];
    
}


- (IBAction)reloadAction:(id)sender {
    [_inProgressTableView reloadData];
}

@end
