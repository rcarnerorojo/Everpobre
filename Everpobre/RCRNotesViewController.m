//
//  RCRNotesViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRNotesViewController.h"
#import "RCRNote.h"
#import "RCRPhotoContainer.h"
#import "RCRNoteViewController.h"

@implementation RCRNotesViewController

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.title = self.notebook.name;
    //en viewDidLoad todavía no habíamos asignado el notebook al controller. Lo mejor sería hacer otro init en que pasemos también el notebook
    
    //Añadimos botón de nueva libreta
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Reuse Id
    static NSString *cellId = @"noteCell";
    
    // Averiguar de qué libreta me están hablando
    RCRNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear una celda (nos mandará una de la caché)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil){//no hay celdas de este tipo en caché
        //tengo que crear la celda a pelo
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //sincronizar modelo (libreta) -> vista (celda)
    cell.textLabel.text = n.name;
    cell.imageView.image = n.photo.image;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[fmt stringFromDate:n.modificationDate]];
    
    //la devuelvo
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        RCRNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove";
}

#pragma mark - Actions

-(void) addNote:(id) sender{
         
    [RCRNote noteWithName:@"Nueva nota" notebook:self.notebook context:self.fetchedResultsController.managedObjectContext];
    //también podríamos conseguir el contexto de self.notebook.managedObjectContext. Todo objeto Core Data tiene asociado su contexto
}

#pragma mark - Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar la nota
    RCRNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Crear formulario de nota
    RCRNoteViewController *nVC = [[RCRNoteViewController alloc] initWithModel:note];
    
    //Hacer el push
    [self.navigationController pushViewController:nVC animated:YES];
}

@end
