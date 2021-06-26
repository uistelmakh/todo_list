//
//  ViewController.h
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *array;

@end

