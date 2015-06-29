//
//  DetailViewController.m
//  EveryDoAgain
//
//  Created by Josh Endter on 6/29/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegmentedControl;


@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem valueForKey:@"todoDescription"];
        Todo *detailItem = self.detailItem;
        self.titleTextField.text = detailItem.title;
        self.descriptionTextField.text = detailItem.todoDescription;
        self.prioritySegmentedControl.selectedSegmentIndex = [detailItem.priority intValue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.descriptionTextField.clipsToBounds = YES;
    self.descriptionTextField.layer.cornerRadius = 5.0f;
    
    [self configureView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.isMovingFromParentViewController) {
        self.detailItem.title = self.titleTextField.text;
        self.detailItem.todoDescription = self.descriptionTextField.text;
        self.detailItem.priority = [NSNumber numberWithInteger:self.prioritySegmentedControl.selectedSegmentIndex];
        
        // Save the context.
        NSError *error = nil;
        NSManagedObjectContext *context = [self.detailItem managedObjectContext];
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
