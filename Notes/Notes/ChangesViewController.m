//
//  SecondViewController.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "ChangesViewController.h"

@interface ChangesViewController ()

@end

@implementation ChangesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second";
    
    self.view.backgroundColor = [UIColor colorWithRed:194.0/255.0 green:211.0/255.0 blue:205.0/255.0 alpha:1.0];
    [self createTextField];
    [self createSaveButton];
    [self createTapGestureForTextField];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addConstrains];
}

#pragma mark - Create Button
- (void) createSaveButton {
    self.saveButton = [[UIButton alloc] init];
    [self.saveButton addTarget:self action:@selector(actionMethodForSaveButton:) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.backgroundColor = [UIColor whiteColor];
    [self.saveButton setTitle:@"Сохранить" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.saveButton];
}
#pragma mark - Create textfield
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
#pragma mark - Create TapGesture
- (void) createTapGestureForTextField {
    UITapGestureRecognizer *handle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionForTapGestureRecognizer:)];
    [self.view addGestureRecognizer:handle];
}

#pragma mark - Create action for button
- (void) actionMethodForSaveButton: (UIButton *) sender {
    NSLog(@"click");
}

- (void) actionForTapGestureRecognizer: (UITapGestureRecognizer *) handle {
    [self.view endEditing:YES];
}

#pragma mark - Constrains

- (void) addConstrains {
    [self createConstrainsForSaveButton];
    [self createConstrainsForTextField];
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


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.textField]) {
        [self.textField resignFirstResponder];
    }
    
    return YES;
}


@end
