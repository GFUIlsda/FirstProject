//
//  ITLibrary.m
//  ITBook
//
//  Created by SkyLORD on 04.07.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import "ITLibrary.h"
#import "ITBook.h"
#import "Person.h"

@interface ITLibrary ()

@property (nonatomic, readonly) NSMutableArray *books;
@property (nonatomic, readonly) NSMutableArray *persons;

@end

@implementation ITLibrary

@synthesize books=_books, persons=_persons;

- (void)addBook:(ITBook *)aBook;
{
	[self.books addObject:aBook];
}

- (void)removeBook:(ITBook *)aBook;
{
	[self.books removeObject:aBook];
}

- (void)addPerson:(Peron *)aPerson;
{
	[self.persons addObject:aPerson];
}

- (void)removePerson:(Person *)aPerson;
{
	[self.persons removeObject:aPerson];
}

//
- (void)dealloc
{
	[_books release];
	[_persons release];
	
	[super dealloc];
}

-(NSMutableArray *)books
{
	if (nil == _books)
	{
		_books = [NSMutableArray new];
	}
	return _books;
}

-(NSMutableArray *)persons
{
	if (nil == _persons)
	{
		_persons = [NSMutableArray new];
	}
	return _persons;
}

@end
