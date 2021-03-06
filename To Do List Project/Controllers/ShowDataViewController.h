//
//  ShowDataViewController.h
//  To Do List Project
//
//  Created by Hala on 02/03/2021.
//

#import <UIKit/UIKit.h>
#import "EditTaskViewController.h"
#import "ToDoViewController.h"
#import "showDelegation.h"
#import "DataModelManager.h"
#import "EditDelegation.h"

@interface ShowDataViewController : UIViewController <showDelegation>

@property id <EditDelegation> editDedegation;

@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;

@property (weak, nonatomic) IBOutlet UITextView *showDescriptionTextView;

@property (weak, nonatomic) IBOutlet UILabel *showPriorityLabel;


@property (weak, nonatomic) IBOutlet UILabel *showDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *showStateLabel;

@property (strong, nonatomic) IBOutlet UIView *showView;

@property NSString* showName;
@property NSString* showDescription;
@property NSString* showPriority;
@property NSString* showState;
@property NSDate* showDate;
@property NSInteger rowIndex;
@property NSDate* showCreationDate;

@property NSMutableDictionary *showDictionary;


@end

