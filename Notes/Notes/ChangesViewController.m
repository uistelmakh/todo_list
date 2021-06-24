//
//  SecondViewController.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "ChangesViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ChangesViewController ()

@end
BOOL isGrantedNotificationAccess;
@implementation ChangesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second";
    
    self.view.backgroundColor = [UIColor colorWithRed:194.0/255.0 green:211.0/255.0 blue:205.0/255.0 alpha:1.0];
    [self createTextField];
    [self createDatePicker];
    [self createSaveButton];
    [self createTapGestureForTextField];
    
    isGrantedNotificationAccess = NO;
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert+UNAuthorizationOptionBadge+UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        isGrantedNotificationAccess = granted;
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addConstrains];
}

#pragma mark - Create UI elements
- (void) createSaveButton {
    self.saveButton = [[UIButton alloc] init];
    [self.saveButton addTarget:self action:@selector(actionMethodForSaveButton:) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.backgroundColor = [UIColor whiteColor];
    [self.saveButton setTitle:@"Сохранить" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
}

- (void) createTextField {
    self.textField = [[UITextField alloc] init];
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textField.layer.borderWidth = 1.0;
    self.textField.layer.cornerRadius = 8;
    self.textField.delegate = self;
    self.textField.placeholder = @"Заметка";
    [self.view addSubview:self.textField];
}

- (void) createTapGestureForTextField {
    UITapGestureRecognizer *handle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionForTapGestureRecognizer:)];
    [self.view addGestureRecognizer:handle];
}

- (void) createDatePicker {
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.minimumDate = [NSDate date];
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.datePicker];
}

 
#pragma mark - Notification and save information

- (void) setNotification {
    NSString *eventInfo = self.textField.text;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm dd:MMMM.yyyy";
    NSString *eventDate = [formatter stringFromDate:self.eventDate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay|NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self.eventDate];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:eventInfo, @"eventInfo", eventDate, @"eventDate",  nil];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.userInfo = dictionary;
    content.title = @"Notes";
    content.body = eventInfo;
    content.badge = @1;
    content.sound = [UNNotificationSound defaultSound];
    
    
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Notification" content:content trigger:trigger];
    [center addNotificationRequest:request withCompletionHandler:nil];
}

#pragma mark - Create actions
- (void) actionMethodForSaveButton: (UIButton *) sender {
    
    if (self.eventDate && [self.textField.text length] != 0) {
        
        if ([self.eventDate compare:[NSDate date]] == NSOrderedSame) {
            
            [self showAlertWithMessage:@"Дата будущего события не может совпадать с текущей датой"];
            
        } else if ([self.eventDate compare:[NSDate date]] == NSOrderedAscending) {
            [self showAlertWithMessage:@"Дата будущего события не может быть ранее текущего"];
        } else {
            
            [self setNotification];
            [self showAlertWithMessage:@"Данные успешно сохранены"];
            
        }
        
    } else if (self.eventDate && [self.textField.text length] == 0) {
        
        [self showAlertWithMessage:@"Пожалуйста, заполните текстовое поле"];
        
    } else if (!self.eventDate && [self.textField.text length] != 0) {
        
        [self showAlertWithMessage:@"Пожалуйста, выберите время"];
        
    } else {
        
        [self showAlertWithMessage:@"Пожалуйста, заполните текстовое поле и выберете время"];
        
    }
    
}

- (void) actionForTapGestureRecognizer: (UITapGestureRecognizer *) handle {
    
    if ([self.textField.text length] != 0) {
        [self.view endEditing:YES];
    } else {
        
        [self showAlertWithMessage:@"Для сохранения события введите значение в текстовое поле"];
    }
}

- (void) datePickerValueChanged {
    self.eventDate = self.datePicker.date;
    NSLog(@"datePickerValueChanged %@", self.eventDate);
}

#pragma mark - Constrains

- (void) addConstrains {
    [self createConstrainsForSaveButton];
    [self createConstrainsForTextField];
    [self createConstrainsForDatePicker];
}

- (void) createConstrainsForSaveButton {
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.saveButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.saveButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.saveButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.saveButton.heightAnchor constraintEqualToConstant:100].active = YES;
}

- (void) createConstrainsForTextField {
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [self.textField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [self.textField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:64].active = YES;
    [self.textField.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (void) createConstrainsForDatePicker {
    
    self.datePicker.translatesAutoresizingMaskIntoConstraints = NO;
    [self.datePicker.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.datePicker.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.textField]) {
        
        if ([self.textField.text length] != 0) {
            [self.textField resignFirstResponder];
            return YES;
        } else {
            
            [self showAlertWithMessage:@"Для сохранения события введите значение в текстовое поле"];
        }
    }
    return NO;
}

- (void) showAlertWithMessage: (NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Внимание" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ок" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
