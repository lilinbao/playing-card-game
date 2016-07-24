//
//  ViewController.m
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int score;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *gameButtons;

@end

@implementation ViewController

-(CardMatchingGame *) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.gameButtons count] unsignedCard:[self createDeck]];
    return _game;
}

- (Deck *)deck
{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

-(Deck *)createDeck//abstract class, needs to be concreate, make sure that this is public(put it to your .h file)
{
    return nil;
}
- (void) setScore:(int)score
{
    _score = score;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",score];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchBottonCard:(UIButton *)sender {
    
    NSUInteger cardIndex = [self.gameButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    self.score = self.game.score;
}

-(void) updateUI
{
    for (UIButton *cardBtn in self.gameButtons) {
        NSUInteger cardIndex = [self.gameButtons indexOfObject:cardBtn];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardBtn setTitle:[self titleTextForCard:card] forState:UIControlStateNormal];
        [cardBtn setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        if([card isChosen] && [card isMatched]){
            [cardBtn setEnabled:NO];
        }
    }
}

-(NSString *) titleTextForCard:(Card *)card
{
    return card.chosen? card.contents:@"";
}

-(UIImage *) backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed: card.chosen? @"cardfront" : @"cardbackground"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
