
CREATE PROCEDURE libraryDatabase
AS
BEGIN

	CREATE TABLE tbl_publisher (
		publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
		publisher_address VARCHAR(50) NOT NULL,
		publisher_phone VARCHAR(20) NOT NULL
	);

	CREATE TABLE tbl_book (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_title VARCHAR(50) NOT NULL,
		publisher_name VARCHAR(50) FOREIGN KEY REFERENCES tbl_publisher(publisher_name)
	);

	CREATE TABLE tbl_libraryBranch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_borrower (
		card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(50) NOT NULL,
		borrower_phone VARCHAR(20) NOT NULL
	);

	CREATE TABLE tbl_bookAuthors (
		book_id INT FOREIGN KEY REFERENCES tbl_book(book_id),
		author_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_bookLoans (
		book_id INT FOREIGN KEY REFERENCES tbl_book(book_id),
		branch_id INT FOREIGN KEY REFERENCES tbl_libraryBranch(branch_id),
		card_no INT FOREIGN KEY REFERENCES tbl_borrower(card_no),
		date_out DATE NOT NULL,
		due_date DATE NOT NULL
	);

	CREATE TABLE tbl_bookCopies (
		book_id INT FOREIGN KEY REFERENCES tbl_book(book_id),
		branch_id INT FOREIGN KEY REFERENCES tbl_libraryBranch(branch_id),
		no_of_copies INT NOT NULL
	);


	INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES
		('Indiana Jones Inc.', '999 Temple Of Doom St.', '123-4567'),
		('Raining Cats & Dogs Inc.', '765 Woof Meow Rd.', '891-2345'),
		('Seymore Clearly & Co.', '123 Glasses Blvd.', '678-9123'),
		('Sum Ting Wong Publishers', '594 Chinatown Circle', '456-7891'),
		('Eat Mo Vejjies Inc.', '197 Vegan Way', '234-5678'),
		('Blue Wave & Co.', '462 Ocean Blvd.', '912-3456'),
		('Fluffy Tales Publishers', '378 Rodent Way', '789-1234'),
		('Blue Yarn & Co.', '756 String St.', '567-8912'),
		('Mermaid Inc.', '843 Shimmer Rd.', '345-6789'),
		('PB & Jam Publishers', '491 Sandwich St.', '987-6543'),
		('Bumpkin Butte Inc.', '791 Guinea Circle', '219-8765'),
		('Fashionably Late Enterprises', '619 Times Square', '432-1987'),
		('Hot Fudge Sunday & Co.', '285 Three Scoops Blvd.', '654-3219'),
		('Nida Moe Inc.', '739 John Deere Way', '876-5432'),
		('The Shining Publishers', '392 Terror Trail.', '198-7654'),
		('Dalmation & Co.', '135 Puppy Place', '321-9876'),
		('Platinum Gold Inc.', '947 Balayage Blvd.', '543-2198'),
		('Spice n Rice Publishers', '465 Jasmine Rice Way', '765-4321'),
		('Trail Mix & Co.', '650 Granola Circle', '159-7532'),
		('Hot Diggity Dawg Publishers', '379 Bratwurst Blvd.', '357-9512')
	;

	INSERT INTO tbl_book
		(book_title, publisher_name)
		VALUES
		('The Lost Tribe', 'Indiana Jones Inc.'),
		('The Dog That Meowed', 'Raining Cats & Dogs Inc.'),
		('Under The Stars', 'Seymore Clearly & Co.'),
		('Bowl O Noodle', 'Sum Ting Wong Publishers'),
		('The Grocery Girl', 'Eat Mo Vejjies Inc.'),
		('Beach Vibes', 'Blue Wave & Co.'),
		('A Pawsome Adventure', 'Fluffy Tales Publishers'),
		('The Cone of Shame', 'Blue Yarn & Co.'),
		('Unda Da Sea', 'Mermaid Inc.'),
		('I Am Bread', 'PB & Jam Publishers'),
		('This Little Piggie', 'Bumpkin Butte Inc.'),
		('Where Has The Time Gone', 'Fashionably Late Enterprises'),
		('Junk Food Junkie', 'Hot Fudge Sunday & Co.'),
		('A Day In The Park', 'Nida Moe Inc.'),
		('Dude Drop', 'The Shining Publishers'),
		('The Dog Called Spots', 'Dalmation & Co.'),
		('Blondies', 'Platinum Gold Inc.'),
		('Cooking Indian Food', 'Spice n Rice Publishers'),
		('Off The Beaten Path', 'Trail Mix & Co.'),
		('The Way of the Weiner', 'Hot Diggity Dawg Publishers')
	;

	INSERT INTO tbl_libraryBranch 
		(branch_name, branch_address)
		VALUES
		('Sharpstown', '582 Pointy Point'),
		('Central', '764 Middle Place'),
		('Uptown', '195 Funk Way'),
		('Downtown', '345 Homeless St.')
	;

	INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES
		('Sally Smith', '584 Circle Dr.', '111-1212'),
		('Mark Gonzales', '212 Robin Court', '222-2323'),
		('Dylan Cauldwell', '9712 Listra Ave.', '333-3434'),
		('Myla Beckensacck', '10021 Rivertown Dr.', '444-4545'),
		('Collin Riley', '8582 S. Burnside Rd.', '555-5656'),
		('Celia Goo', '4267 E. Olive St.', '667-6767'),
		('Ruby Bennett', '6980 Roundtop Lane', '777-7878'),
		('Kyle Burgess', '5221 S. Commerce St.', '888-8989'),
		('Pat Platypus', '185 Fruit Bat Lane', '999-9191')
	;

	INSERT INTO tbl_bookAuthors
		(book_id, author_name)
		VALUES
		(1, 'Addison Aboriginee'),
		(2, 'Stephen King'),
		(3, 'Randy Cisco'),
		(4, 'Skye Foggy'),
		(5, 'Sam Cooke'),
		(6, 'Sandy C. Shelly'),
		(7, 'Clifford Red'),
		(8, 'Mishka Sulks'),
		(9, 'Sebastian Crabbe'),
		(10, 'Plenti Carbo'),
		(11, 'Ima Diva'),
		(12, 'Neva Early'),
		(13, 'Chip N. Dip'),
		(14, 'Reed Wacker'),
		(15, 'Stephen King'),
		(16, 'C. Spot Run'),
		(17, 'Lori Elle'),
		(18, 'Ginger Curry'),
		(19, 'Yu Gett Lohst'),
		(20, 'Oscar Meyer')
	;

	INSERT INTO tbl_bookLoans 
		(book_id, branch_id, card_no, date_out, due_date)
		VALUES
		(10, 1, 1, '2018-03-25', '2018-04-08'),
		(10, 2, 4, '2018-03-31', '2018-04-14'),
		(10, 2, 5, '2018-03-23', '2018-04-06'),
		(3, 2, 5, '2018-03-23', '2018-04-06'),
		(4, 2, 5, '2018-03-23', '2018-04-06'),
		(19, 2, 5, '2018-03-23', '2018-04-06'),
		(8, 2, 5, '2018-03-23', '2018-04-06'),
		(7, 2, 5, '2018-03-23', '2018-04-06'),
		(13, 2, 5, '2018-03-23', '2018-04-06'),
		(1, 3, 7, '2018-04-04', '2018-04-18'),
		(5, 3, 7, '2018-04-04', '2018-04-18'),
		(16, 3, 7, '2018-04-04', '2018-04-18'),
		(18, 3, 7, '2018-04-04', '2018-04-18'),
		(8, 3, 7, '2018-04-04', '2018-04-18'),
		(3, 3, 7, '2018-04-04', '2018-04-18'),
		(9, 3, 7, '2018-04-04', '2018-04-18'),
		(7, 3, 7, '2018-04-04', '2018-04-18'),
		(2, 4, 3, '2018-04-01', '2018-04-15'),
		(15, 4, 3, '2018-04-01', '2018-04-15'),
		(8, 4, 3, '2018-04-01', '2018-04-15'),
		(12, 4, 3, '2018-04-01', '2018-04-15'),
		(1, 1, 2, '2018-03-25', '2018-04-08'),
		(12, 1, 2, '2018-03-30', '2018-04-13'),
		(10, 1, 2, '2018-03-30', '2018-04-13'),
		(3, 4, 6, '2018-04-05', '2018-04-19'),
		(1, 4, 6, '2018-04-05', '2018-04-19'),
		(9, 4, 6, '2018-04-05', '2018-04-19'),
		(11, 4, 6, '2018-04-05', '2018-04-19'),
		(16, 4, 6, '2018-04-05', '2018-04-19'),
		(2, 4, 6, '2018-04-05', '2018-04-19'),
		(8, 4, 6, '2018-04-05', '2018-04-19'),
		(17, 4, 6, '2018-04-05', '2018-04-19'),
		(1, 1, 8, '2018-04-02', '2018-04-16'),
		(17, 1, 8, '2018-04-02', '2018-04-16'),
		(15, 1, 8, '2018-04-02', '2018-04-16'),
		(2, 1, 8, '2018-04-02', '2018-04-16'),
		(14, 1, 8, '2018-04-02', '2018-04-16'),
		(7, 1, 8, '2018-04-02', '2018-04-16'),
		(3, 1, 8, '2018-04-02', '2018-04-16'),
		(9, 1, 8, '2018-04-02', '2018-04-16'),
		(19, 1, 8, '2018-04-02', '2018-04-16'),
		(12, 1, 8, '2018-04-02', '2018-04-16'),
		(16, 1, 1, '2018-04-01', '2018-04-15'),
		(14, 1, 1, '2018-04-01', '2018-04-15'),
		(11, 1, 1, '2018-04-01', '2018-04-15'),
		(1, 1, 1, '2018-04-01', '2018-04-15'),
		(4, 2, 4, '2018-03-31', '2018-04-14'),
		(8, 2, 4, '2018-03-31', '2018-04-14'),
		(6, 2, 4, '2018-03-31', '2018-04-14'),
		(18, 2, 4, '2018-03-31', '2018-04-14')
	;

	INSERT INTO tbl_bookCopies 
		(book_id, branch_id, no_of_copies)
		VALUES
		(1, 1, 3),
		(1, 2, 1),
		(1, 4, 1),
		(2, 1, 2),
		(2, 2, 1),
		(2, 4, 2),
		(3, 1, 2),
		(3, 2, 1),
		(3, 3, 3),
		(3, 4, 2),
		(4, 2, 3),
		(5, 1, 2),
		(5, 3, 2),
		(6, 2, 2),
		(7, 1, 2),
		(7, 2, 1),
		(7, 3, 3),
		(8, 1, 2),
		(8, 2, 2),
		(8, 3, 1),
		(8, 4, 2),
		(9, 1, 2),
		(9, 3, 2),
		(9, 4, 2),
		(10, 1, 2),
		(10, 2, 2),
		(10, 3, 1),
		(11, 1, 1),
		(11, 4, 2),
		(12, 1, 2),
		(12, 2, 2),
		(12, 4, 1),
		(13, 2, 3),
		(14, 1, 2),
		(14, 4, 1),
		(15, 1, 2),
		(15, 3, 1),
		(15, 4, 2),
		(16, 1, 2),
		(16, 3, 2),
		(16, 4, 3),
		(17, 1, 3),
		(17, 2, 1),
		(17, 4, 2),
		(18, 2, 1),
		(18, 3, 2),
		(19, 1, 2),
		(19, 2, 1),
		(19, 3, 2),
		(20, 1, 2),
		(20, 4, 3)
	;


	SELECT tbl_bookCopies.no_of_copies, tbl_libraryBranch.branch_name, tbl_book.book_title FROM tbl_bookCopies INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id INNER JOIN tbl_book ON tbl_book.book_id = tbl_bookCopies.book_id WHERE tbl_bookCopies.book_id = 1 AND tbl_libraryBranch.branch_name = 'Sharpstown';

	SELECT tbl_bookCopies.no_of_copies, tbl_libraryBranch.branch_name, tbl_book.book_title FROM tbl_bookCopies INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id INNER JOIN tbl_book ON tbl_book.book_id = tbl_bookCopies.book_id WHERE tbl_book.book_title = 'The Lost Tribe';

	SELECT tbl_borrower.borrower_name FROM tbl_borrower WHERE NOT EXISTS (SELECT * FROM tbl_bookLoans WHERE tbl_borrower.card_no = tbl_bookLoans.card_no);

	SELECT tbl_book.book_title, tbl_borrower.borrower_name, tbl_borrower.borrower_address, tbl_libraryBranch.branch_name FROM tbl_book INNER JOIN tbl_bookLoans ON tbl_book.book_id = tbl_bookLoans.book_id INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_bookLoans.card_no INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookLoans.branch_id WHERE tbl_libraryBranch.branch_name = 'Sharpstown' AND tbl_bookLoans.due_date = '2018-04-08';

	SELECT tbl_libraryBranch.branch_name, COUNT(tbl_bookLoans.branch_id)
	FROM tbl_libraryBranch JOIN tbl_bookLoans ON tbl_libraryBranch.branch_id = tbl_bookLoans.branch_id
	GROUP BY tbl_libraryBranch.branch_name;

	SELECT tbl_borrower.borrower_name, tbl_borrower.borrower_address, COUNT(tbl_bookLoans.card_no) 
	FROM tbl_borrower JOIN tbl_bookLoans ON tbl_borrower.card_no = tbl_bookLoans.card_no 
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address
	HAVING COUNT(tbl_bookLoans.card_no) > 5 ORDER BY tbl_borrower.borrower_name; 

	SELECT tbl_book.book_title, tbl_bookCopies.no_of_copies, tbl_bookAuthors.author_name, tbl_libraryBranch.branch_name FROM tbl_book INNER JOIN tbl_bookCopies ON tbl_book.book_id = tbl_bookCopies.book_id INNER JOIN tbl_bookAuthors ON tbl_bookCopies.book_id = tbl_bookAuthors.book_id INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.branch_id = tbl_bookCopies.branch_id WHERE tbl_bookAuthors.author_name = 'Stephen King' AND tbl_libraryBranch.branch_name = 'Central';
	
	


END