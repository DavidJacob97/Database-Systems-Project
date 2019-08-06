CREATE TABLE IF NOT EXISTS members
(
	member_id char(9) NOT NULL,
	name varchar(32) default NULL,
	surname varchar(32) default NULL,
	email varchar(32) default NULL,
	renewal_date date default NULL,
	PRIMARY KEY (member_id), UNIQUE KEY (email)
);

INSERT INTO members (member_id, name, surname, email, renewal_date) VALUES
('122456789','Rand','McNally','bigmac@email.com','2020-12-10'),
('111123432','Meekus','McNally','bigmeek@emailerz.com','2018-06-01'),
('987657893','Brint','Brintson','brint@brint.brint','2019-01-02'),
('223344553','Agnes','Jones','ajones@gmail.com','2020-06-28'),
('666555444','Amanda','Hugnkys','amanda@gmail.com','2019-08-22'), 
('333444555','Harry','Bolsagne','harryb@emailerz.com','2018-11-08'), 
('123446789','Reggie','Wickstaff','boiledRegg@eircom.net','2022-04-19'); 



CREATE TABLE IF NOT EXISTS items
(
	isbn char(13) NOT NULL,
	cat char(11) default NULL,
	publisher varchar(32) default NULL,
	PRIMARY KEY (isbn)
);

INSERT INTO items (isbn, cat, publisher) VALUES
('1234567890987', 'Fiction', 'Penguin'),
('0983849573625', 'Fiction', 'Penguin'),
('4766392094666', 'Fiction', 'Yearling'),
('6774493838373', 'Fiction', 'Yearling'),
('1227737292838', 'Fiction', 'Yearling'),
('3853656373737', 'Fiction', 'Pan Books'),
('7564892928277', 'Non-Fiction', 'BookCorp'),
('0273645252538', 'Non-Fiction', 'Toast Merchants'),
('4766337262623', 'Non-Fiction', 'Yearling'),
('2933733838373', 'Non-Fiction', 'Shin Woo Publishing'),
('2344222442838', 'Non-Fiction', 'Big House'),
('3822333774673', 'Non-Fiction', 'Steve Allen Books'),
('1111848474744', 'Journal', 'Bryce Education'),
('8483883747418', 'Journal', 'TGIF Publishing'),
('4765678554673', 'Journal', 'Black Box'),
('2309857261512', 'Journal', 'Bryce Education'),
('2987783767322', 'Journal', 'Big House'),
('3822333237376', 'Journal', 'Steve Allen Academic Offerings');


CREATE TABLE IF NOT EXISTS fiction
(
	isbn char(13) NOT NULL,
	title varchar(32) default NULL,
	author varchar(32) default NULL,
	publisher varchar (32) default NULL,
	year_pub year default NULL,
	PRIMARY KEY (isbn)
);

INSERT INTO fiction (isbn, title, author, publisher, year_pub) VALUES
('1234567890987', 'Moby Dick', 'Herman Melville', 'Penguin', '1998'),
('0983849573625', 'The Three Musketeers', 'Alexandre Dumas', 'Penguin', '2006'),
('4766392094666', 'The Northern Lights', 'Phillip Pullman', 'Yearling', '1995'),
('6774493838373', 'The Sublte Knife', 'Phillip Pullman', 'Yearling', '1997'),
('1227737292838', 'The Amber Spyglass', 'Phillip Pullman', 'Yearling', '2000'),
('3853656373737', 'Hithchiker''s Guide To The Galaxy', 'Douglas Adams', 'Pan Books', '1979');



CREATE TABLE IF NOT EXISTS non_fiction
(
	isbn char(13) NOT NULL,
	title varchar(32) default NULL,
	author varchar(32) default NULL,
	publisher varchar (32) default NULL,
	year_pub year default NULL,
	PRIMARY KEY (isbn)
);

INSERT INTO non_fiction (isbn, title, author, publisher, year_pub) VALUES
('7564892928277', 'SQL For Dummies', 'Hernan Valdez', 'BookCorp', '2016'),
('0273645252538', 'How To Make Toast', 'Barry Feldman', 'Toast Merchants', '2014'),
('4766337262623', 'Non-Fiction Explained', 'Nancy Cartwright', 'Yearling', '1985'),
('2933733838373', 'The Art Of Oragami', 'Mikasa Ackerman', 'Shin Woo Publishing', '2007'),
('2344222442838', 'Databases 101', 'Sum Yung Guy', 'Big House', '2000'),
('3822333774673', 'Dating Steve Allen', 'Steve Allen', 'Steve Allen Books', '1999');



CREATE TABLE IF NOT EXISTS journals
(
	isbn char(13) NOT NULL,
	title varchar(32) default NULL,
	author varchar(32) default NULL,
	publisher varchar (32) default NULL,
	year_pub year default NULL,
	discipline varchar(32) default NULL,
	PRIMARY KEY (isbn)
);

INSERT INTO journals (isbn, title, author, publisher, year_pub, discipline) VALUES
('1111848474744', 'A Study On Data Structures', 'Rita Wittingly', 'Bryce Education', '2016', 'Computer Science'),
('8483883747418', 'Compression Techniques. A Study', 'Dennis Ryman', 'TGIF Publishing', '2014', 'Music Production'),
('4765678554673', 'The Lifecycle Of The Common Crow', 'Nancy Cartwright', 'Black Box', '1985', 'Biology'),
('2309857261512', 'Software Development Techniques', 'Mara Alani', 'Bryce Education', '2007', 'Computer Science'),
('2987783767322', 'Game Localisation Strategy', 'B.B. Cooper', 'Big House', '2001', 'Game Development'),
('3822333237376', 'Steve Alan. A Study', 'Steve Allen', 'Steve Allen Academic Offerings', '1989', 'Anatomy');

CREATE TABLE IF NOT EXISTS loans
(
	loan_id char(5),
	member_id char(9),
	isbn char(13),
	date_out date NOT NULL,
	date_due date,
	PRIMARY KEY(loan_id)
);

INSERT INTO loans (loan_id, member_id, isbn, date_out, date_due) VALUES
('12345', '223344553', '4765678554673', '2018-06-06', '2018-06-27'),
('23456', '111123432', '1111848474744', '2018-11-07', '2018-11-28'),
('34567', '333444555', '3822333237376', '2018-11-07', '2018-11-28'),
('00443', '666555444', '6774493838373', '2018-11-23', '2018-12-14'),
('00444', '666555444', '4766337262623', '2018-11-23', '2018-12-14'),
('00445', '987657893', '0983849573625', '2018-11-23', '2018-12-14'),
('00446', '987657893', '7564892928277', '2018-11-23', '2018-12-14'),
('00447', '223344553', '2933733838373', '2018-11-24', '2018-12-15');

CREATE INDEX items_cat_indx
ON items(cat);

CREATE INDEX loans_isbn_indx
ON loans(isbn);

ALTER TABLE members ENGINE = InnoDB;
ALTER TABLE items ENGINE = InnoDB;
ALTER TABLE fiction ENGINE = InnoDB;
ALTER TABLE non_fiction ENGINE = InnoDB;
ALTER TABLE journals ENGINE = InnoDB;
ALTER TABLE loans ENGINE = InnoDB;

ALTER TABLE loans ADD FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE;
ALTER TABLE loans ADD FOREIGN KEY (isbn) REFERENCES items(isbn) ON DELETE CASCADE;