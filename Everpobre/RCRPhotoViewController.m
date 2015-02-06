//
//  RCRPhotoViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRPhotoViewController.h"
#import "RCRNote.h"
#import "RCRPhotoContainer.h"

@interface RCRPhotoViewController ()
    @property (strong, nonatomic) RCRNote* model;
@end

@implementation RCRPhotoViewController

-(id) initWithModel:(RCRNote*) model{
    
    if ([self initWithNibName:nil bundle:nil]){
        _model = model;
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //sincronizamos modelo -> vista
    self.photoView.image = self.model.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //sincronizamos vista -> modelo
    self.model.photo.image = self.photoView.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    
}

- (IBAction)deletePhoto:(id)sender {
    
}
@end
