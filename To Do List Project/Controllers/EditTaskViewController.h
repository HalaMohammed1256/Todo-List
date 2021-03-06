//
//  EditTaskViewController.h
//  To Do List Project
//
//  Created by Hala on 28/02/2021.
//

#import <UIKit/UIKit.h>
#import "showDelegation.h"
#import "DataModel.h"
#import "InProgressEditDelegation.h"
#import "DoneDelegation.h"


@interface EditTaskViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


@property id <showDelegation> showDelegation;
@property id <InProgressEditDelegation> inProgressEditDelegation;
@property id <DoneDelegation> doneEditDelegation;

@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;


@property (weak, nonatomic) IBOutlet UITextField *editNameTextField;

@property (weak, nonatomic) IBOutlet UITextView *editDescriptionTextView;

@property (weak, nonatomic) IBOutlet UIDatePicker *editDatePicker;

@property (weak, nonatomic) IBOutlet UIPickerView *statePicker;




@property NSString* editName;
@property NSString* editDescription;
@property NSString* editPriority;
@property NSString* editState;
@property NSDate* editDate;
@property NSDate* editCreationDate;
@property NSInteger rowIndex;


@end

