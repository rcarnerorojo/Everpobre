//
//  RCRNoteViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRNoteViewController.h"
#import "RCRNote.h"
#import "RCRNameCell.h"
#import "RCRTextCell.h"
#import "RCRDatesCell.h"
#import "RCRPhotoCell.h"
#import "RCRPhotoContainer.h"

@interface RCRNoteViewController ()

@property (strong, nonatomic) RCRNameCell *nameCell;
@property (strong, nonatomic) RCRTextCell *textCell;
@property (strong, nonatomic) RCRDatesCell *datesCell;
@property (strong, nonatomic) RCRPhotoCell *imageCell;

@property (strong, nonatomic) NSArray *cells;

@end

@implementation RCRNoteViewController

-(id) initWithNote:(RCRNote *)note{
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _note = note;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //registro la definicion de la celda que voy a utilizar
    [self.tableView registerNib:[UINib nibWithNibName:@"RCRNameCell" bundle:nil] forCellReuseIdentifier:[RCRNameCell cellId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"RCRTextCell" bundle:nil] forCellReuseIdentifier:[RCRTextCell cellId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"RCRDatesCell" bundle:nil] forCellReuseIdentifier:[RCRDatesCell cellId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"RCRPhotoCell" bundle:nil] forCellReuseIdentifier:[RCRPhotoCell cellId]];
    
    //creo las celdas personalizadas
    _nameCell = [self.tableView dequeueReusableCellWithIdentifier:[RCRNameCell cellId]];
    _textCell = [self.tableView dequeueReusableCellWithIdentifier:[RCRTextCell cellId]];
    _datesCell = [self.tableView dequeueReusableCellWithIdentifier:[RCRDatesCell cellId]];
    _imageCell = [self.tableView dequeueReusableCellWithIdentifier:[RCRPhotoCell cellId]];
    
    //array con diccionario para ahorrar código al configurar la tabla
    _cells = @[
               @{@"title":@"Name",
                 @"cells":@[self.nameCell]
                 },
               @{@"title":@"Text",
                 @"cells":@[self.textCell]
                 },
               @{@"title":@"Dates",
                 @"cells":@[self.datesCell]
                 },
               @{@"title":@"Image",
                 @"cells":@[self.imageCell]
                 }
               ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Delegate

//número secciones
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cells.count;
}

//title de seccion
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *sectionCells = [self.cells objectAtIndex:(NSUInteger) section];
    return [sectionCells objectForKey:@"title"];
}

//número de filas en la sección
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *sectionCells = [self.cells objectAtIndex:section];
    NSArray *cells = [sectionCells objectForKey:@"cells"];
    return [cells count];
}

//celda
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *sectionCells = [self.cells objectAtIndex:indexPath.section];
    NSArray *cells = [sectionCells objectForKey:@"cells"];
    UITableViewCell *cell = [cells objectAtIndex:indexPath.row];
    return cell;
}

//altura celda
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = 0;
    
    switch (indexPath.section){
        case 0: height = [RCRNameCell cellHeight];
            break;
        case 1: height = [RCRTextCell cellHeight];
            break;
        case 2: height = [RCRDatesCell cellHeight];
            break;
        case 3: height = [RCRPhotoCell cellHeight];
            break;
        default: height = 44.0f;
            break;
    }
    
    return height;
}

//sincronizar contenido celda
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell isKindOfClass:[RCRNameCell class]]){
        self.nameCell.name.text = self.note.name;
    }else if ([cell isKindOfClass:[RCRTextCell class]]){
        [self.textCell.text setText:@"texto"];
    }else if ([cell isKindOfClass:[RCRDatesCell class]]){
        NSDateFormatter *fmt=[NSDateFormatter new];
        fmt.dateStyle=NSDateFormatterFullStyle;
//        self.datesCell.dateCreation.text = [fmt stringFromDate:self.note.creationDate];
        self.datesCell.dateCreation.text = [NSString stringWithFormat:@"%f",[self.note.creationDate timeIntervalSince1970]];
//        self.datesCell.dateModification.text = [fmt stringFromDate:self.note.modificationDate];
        self.datesCell.dateModification.text = [NSString stringWithFormat:@"%f",[self.note.modificationDate timeIntervalSince1970]];
    }else if ([cell isKindOfClass:[RCRPhotoCell class]]){
        RCRPhotoContainer *phc = self.note.photo;
        self.imageCell.photo.image = phc.image;
    }
}

@end
