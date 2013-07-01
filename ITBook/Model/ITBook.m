//
//  ITBook.m
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
			#import "ITBook.h"

// <ad constants is a good way to make these constants defined once for the whole app>
			static NSString *const sITBookDefaultTitle = @"Unknown";
			static NSString *const sITBookDefaultAuthor = @"No Name";

			NSString *const kITBookTitleKey = @"title";
			NSString *const kITBookAuthorKey = @"author";
			NSString *const kITBookYearKey = @"year";
			NSString *const kITBookPaperbackKey = @"paperback";

//* <These directives provide the scoping information the compiler needs to associate the enclosed methods with the corresponding class. A method’s definition therefore matches its corresponding declaration in the interface, except for the inclusion of a code block.> *//
			@implementation ITBook

// <compiler directive to ask the compiler to generate the methods according to the specification in the declaration>
			@synthesize title = _title, author = _author, year = _year, hardcover = _hardcover;

// ad method declararation for variable "title":
			- (id)initWithTitle:(NSString *)aTitle
			{
						return [self initWithTitle:aTitle author:nil year:0 paperback:NO];
			}

// ad method declararation for variable "author":
			- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor
			{
						return [self initWithTitle:aTitle author:anAuthor year:0 paperback:NO];
			}

// ad method declararation for variable "year":
			- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear
			{
						return [self initWithTitle:aTitle author:anAuthor year:0 paperback:NO];
			}

// ad method declararation for variable "coverType":
			- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear paperback:(BOOL)aCoverType
			{
						self = [super init];
						if (self)
						{
								self.title = aTitle;
								self.author = anAuthor;
								self.year = aYear;
								self.paperback = aCoverType;
						}
						return self;
			}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "dict":
			- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
			{
						self = [super init];
						if (self)
						{
								self.title = [aDict objectForKey:kITBookTitleKey];
								self.author = [aDict objectForKey:kITBookAuthorKey];
								self.year = [[aDict objectForKey:kITBookYearKey] integerValue];
								[self setPaperback:[[aDict objectForKey:kITBookPaperbackKey] boolValue]];
						}
	
						return self;
			}

// ad method declararation for variable "representation":
			- (NSDictionary *)dictionaryRepresentation
						{
								NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	
								if (nil != self.title || NO == [sITBookDefaultTitle isEqualToString:self.title])
								{
										[theRepresentation setObject:self.title forKey:kITBookTitleKey];
								}
	
								if (nil != self.author)
								{
										[theRepresentation setObject:self.author forKey:kITBookAuthorKey];
								}
	
								[theRepresentation setObject:@(self.year) forKey:kITBookYearKey];
								[theRepresentation setObject:@(self.isPaperback) forKey:kITBookPaperbackKey];
	
								return [[theRepresentation copy] autorelease];
						}

// free the memory:
			- (void)dealloc
						{
								[_title release];
								[_author release];
	
								[super dealloc];
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "title":
			- (void)setTitle:(NSString *)aTitle
						{
								if (_title != aTitle)
								{
										[_title autorelease];
										_title = [aTitle copy];
								}
						}

			- (NSString *)title
						{
								return (nil == _title) ? sITBookDefaultTitle : _title;
						}

// ad method declararation for variable "author":
			- (void)setAuthor:(NSString *)anAuthor
						{
								if (_author != anAuthor)
								{
										[_author autorelease];
										_author = [anAuthor copy];
								}
						}

			- (NSString *)author
						{
								return _author;
						}

// ad method declararation for variable "year":
			- (void)setYear:(NSInteger)aYear
						{
								if (_year != aYear)
								{
										_year = aYear;
								}
						}


			- (NSInteger)year
						{
								return _year;
						}

// ad method declararation for variable "paperBack":
			- (void)setPaperback:(BOOL)isPaperback
						{
								if (_coverType != isPaperback)
								{
										_coverType = isPaperback;
								}
						}

			- (BOOL)isPaperback
						{
								return _coverType;
						}

// ad method declararation for variable "hardCover":
			- (void)setHardcover:(BOOL)isHardcover
						{
								if (_coverType == isHardcover)
								{
										_coverType = isHardcover;
								}
						}

			- (BOOL)isHardcover
						{
								return !_coverType;
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "representation":
			- (NSString *)stringRepresentation
						{
								NSString * theCoverTypeStringRepresentahion = self.isPaperback ? @"Paperback": @"Hardcover";
	 
								return [NSString stringWithFormat:@"Title:%@. Author:%@. Year:%ld. Covertype:%@.", self.title, nil == self.author ? sITBookDefaultAuthor : self.author , self.year, theCoverTypeStringRepresentahion];
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad to return a new array that is a copy of the receiving array for "title"
			+ (NSArray *)booksSortByTitleWithSet:(NSSet *)aBooks
						{
								return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByTitle:)];
						}

// ad to return a new array that is a copy of the receiving array for "author"
			+ (NSArray *)booksSortByAuthorWithSet:(NSSet *)aBooks
						{
								return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByAuthor:)];
						}

// ad to return a new array that is a copy of the receiving array for "year"
			+ (NSArray *)booksSortByYearWithSet:(NSSet *)aBooks
						{
								return [aBooks.allObjects sortedArrayUsingSelector:@selector(isEqualByYear:)];
						}

// ad to return a new array that is a copy of the receiving array for "title"
			+ (NSArray *)booksSortByTitleWithArray:(NSArray *)aBooks
						{
								return [aBooks sortedArrayUsingSelector:@selector(isEqualByTitle:)];
						}

// ad to return a new array that is a copy of the receiving array for "author"
			+ (NSArray *)booksSortByAuthorWithArray:(NSArray *)aBooks
						{
								return [aBooks sortedArrayUsingSelector:@selector(isEqualByAuthor:)];
						}

// ad to return a new array that is a copy of the receiving array for "year"
			+ (NSArray *)booksSortByYearWithArray:(NSArray *)aBooks
						{
								return [aBooks sortedArrayUsingSelector:@selector(isEqualByYear:)];
}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// sorting request for "title":
			- (NSComparisonResult)isEqualByTitle:(ITBook *)aBook
						{
								return [self.title compare:aBook.title];
						}

// sorting request for "author":
			- (NSComparisonResult)isEqualByAuthor:(ITBook *)aBook
						{
								return [self.author compare:aBook.author];
						}

// sorting request for "year":
			- (NSComparisonResult)isEqualByYear:(ITBook *)aBook
						{
								if (self.year > aBook.year)
								{
										return NSOrderedAscending;
								}
								if (self.year < aBook.year)
								{
										return NSOrderedDescending;
								}
								return NSOrderedSame;
						}

			@end
