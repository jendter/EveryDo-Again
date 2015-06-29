//
//  NewToDoViewController.m
//  EveryDo
//
//  Created by Josh Endter on 6/24/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "NewToDoViewController.h"
#import "Todo.h"

@interface NewToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIButton *createTodoButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegmentedControl;


@end

@implementation NewToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.descriptionTextField.clipsToBounds = YES;
    self.descriptionTextField.layer.cornerRadius = 5.0f;
    
//    // Make the navigation bar translucent
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createNewTodo:(id)sender {
    NSManagedObjectContext *context = self.managedObjectContext;
    Todo *newTodoItem = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:context];
    
    newTodoItem.timeStamp = [NSDate date];
    newTodoItem.title = self.titleTextField.text;
    newTodoItem.todoDescription = self.descriptionTextField.text;
    newTodoItem.priority = [NSNumber numberWithInteger:self.prioritySegmentedControl.selectedSegmentIndex];
    
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)viewTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
