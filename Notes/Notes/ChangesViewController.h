//
//  SecondViewController.h
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "MainViewController.h"



@interface ChangesViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) NSDate *eventDate;
@end

