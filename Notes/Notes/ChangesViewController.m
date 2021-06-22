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
    
    [self createSaveButton];
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

#pragma mark - Create action for button
- (void) actionMethodForSaveButton: (UIButton *) sender {
    NSLog(@"click");
}

#pragma mark - Constrains

- (void) addConstrains {
    [self createConstrainsForSaveButton];
}

- (void) createConstrainsForSaveButton {
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.saveButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.saveButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.saveButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.saveButton.heightAnchor constraintEqualToConstant:100].active = YES;
    
}



@end
