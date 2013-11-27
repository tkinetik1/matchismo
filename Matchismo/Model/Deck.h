//
//  Deck.h
//  Matchismo
//
//  Created by Tyson Frederick on 2/26/13.
//  Copyright (c) 2013 san jose state university. All rights reserved.
//

#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
