//
//  RCRNotebooksViewController.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRNotebooksViewController.h"
#import "RCRNotebook.h"
#import "RCRNotesViewController.h"
#import "RCRNote.h"

@interface RCRNotebooksViewController ()

@end

@implementation RCRNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"EVERPobre";
    
    //Añadimos botón de nueva libreta
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNotebook:)];

    self.navigationItem.rightBarButtonItem = addBtn;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Debemos crear un método para decir cómo tiene que ser la celda de nuestra clase. No podemos dejar esto en manos de AGTCoreDataTableViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Reuse Id
    static NSString *cellId = @"notebookCell";
    
    // Averiguar de qué libreta me están hablando
    RCRNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear una celda (nos mandará una de la caché)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil){//no hay celdas de este tipo en caché
        //tengo que crear la celda a pelo
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //sincronizar modelo (libreta) -> vista (celda)
    cell.textLabel.text = nb.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)",[fmt stringFromDate:nb.modificationDate],(unsigned long)nb.notes.count];
    
    //la devuelvo
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar si el pollo quiere eliminar
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        //Borramos la libreta, pero ¿cuál es?
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        RCRNotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];

        [ctx deleteObject:difunto];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove";
}

#pragma mark - Table Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    //Averiguar cuál es la libreta
    RCRNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];

    //Creo la selección de datos
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[RCRNote entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:RCRNotebookAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:RCRNotebookAttributes.modificationDate ascending:NO]];
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r
                                                                        managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    //Creo una instancia de controlador de notas
    RCRNotesViewController *nVC = [[RCRNotesViewController alloc]initWithFetchedResultsController:fc
                                                                                            style:UITableViewStylePlain];
    //Asignamos el notebook
    [nVC setNotebook:nb];
    
    //Lo pusheo
    [self.navigationController pushViewController:nVC animated:YES];
    
}

#pragma mark - Actions

-(void) addNotebook:(id) sender{
    
    [RCRNotebook notebookWithName:@"Nueva libreta" context:self.fetchedResultsController.managedObjectContext];

}


@end
