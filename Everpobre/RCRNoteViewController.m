//
//  RCRNoteViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

//Constantes
#define NUMBER_OF_SECTIONS 4
#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER @"Created and last modified"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECTION_HEADER @"Photo"
#define NAME_SECTION 0
#define DATES_SECTION 1
#define TEXT_SECTION 2
#define PHOTO_SECTION 3

#import "RCRNoteViewController.h"
#import "RCRNote.h"
#import "RCRNameTableViewCell.h"
#import "RCRTextTableViewCell.h"
#import "RCRDatesTableViewCell.h"
#import "RCRPhotoTableViewCell.h"
#import "RCRPhotoViewController.h"

@interface RCRNoteViewController ()

@end

@implementation RCRNoteViewController

-(id) initWithModel:(RCRNote*) model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _note = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNibs];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //sincronizamos modelo -> vista
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
        default:
            [NSException raise:@"Section no existe" format:nil];
            return @"no hay default en este caso, switch exahustivo";
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //Averiguamos de qué celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:{
            RCRNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[RCRNameTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
        case DATES_SECTION:{
            RCRDatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RCRDatesTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
        case TEXT_SECTION:{
            RCRTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RCRTextTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
        case PHOTO_SECTION:{
            RCRPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RCRPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
        default:
            [NSException raise:@"UnknownSection" format:@"Unknown section %ld",indexPath.section];
            return nil;
            break;
    }
    
}

//-(UITableViewCell *)nameCell:(UITableView*)tableView{
//    
//    RCRNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[RCRNameTableViewCell cellId]];
//    return cell;
//}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [RCRNameTableViewCell height];
            break;
        case DATES_SECTION:
            return [RCRDatesTableViewCell height];
            break;
        case TEXT_SECTION:
            return [RCRTextTableViewCell height];
            break;
        case PHOTO_SECTION:
            return [RCRPhotoTableViewCell height];
            break;
        default:
            break;
    }
    return 0.0f;
}

-(void)registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"RCRNameTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[RCRNameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"RCRDatesTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[RCRDatesTableViewCell cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"RCRTextTableViewCell" bundle:main];
    [self.tableView registerNib:textNib forCellReuseIdentifier:[RCRTextTableViewCell cellId]];
    
    UINib *photNib = [UINib nibWithNibName:@"RCRPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photNib forCellReuseIdentifier:[RCRPhotoTableViewCell cellId]];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == PHOTO_SECTION){
        
        //Mostramos el controlador de fotos
        RCRPhotoViewController *pVC = [[RCRPhotoViewController alloc] initWithModel:self.note];
        [self.navigationController pushViewController:pVC animated:YES];
    }
}


@end
