/* ALL QUERIES PERFORMED IN MYSQL */

/* Create Tables */
create table Branch(
  branchName varchar(30) primary key,
  addressID int(4) NOT NULL references Address,
  phoneNo varchar(15) NOT NULL,
  managerID char(10) not null references Staff,
  managerSalary int(7) not null,
  constraint checkSalary check(managerSalary > 0)
);

create table Author(
  authorID char(6) primary key,
  firstName varchar(25) not null,
  lastName varchar(25) not null,
  dateOfBirth date not null,
  placeOfBirth varchar(50)
);

create table Book(
  ISBN char(17) primary key,
  title varchar(100) not null,
  yearPublished int(4),
  pages int(5),
  constraint checkPages check(pages > 0)
);

create table BookInvolvement(
  ISBN char(17) references Book,
  authorID char(6) references Author,
  primary key(ISBN, authorID)
);

create table BookCopy(
  id int(6) primary key,
  ISBN char(17) not null references Book,
  branchName varchar(30) not null references Branch,
  available char(1),
  constraint checkAvailable check(available = "Y" || availabel = "N")
);

create table Catalogue(
  branchName varchar(30) not null references Branch,
  ISBN char(17) not null references Book,
  primary key(branchName, ISBN)
);

create table Fine(
  fineID char(6) primary key,
  memberID char(10) not null references Member,
  branchName varchar(30) not null references Branch,
  copyID int(6) references bookcopy,
  fineAmount float(11, 2) not null,
  finedOnDate date not null,
  fineDueDate date not null
);

create table Loan(
  loanID int auto_increment primary key,
  loanDate datetime not null,
  dueDate date not null,
  copyID int(2) not null references BookCopy,
  memberID char(10) not null references Member,
  branchName varchar(30) not null references Branch,
  returned char(1) not null,
  constraint checkReturned check(returned = "Y" || returned = "N")
);

create table Member(
  memberID char(10) primary key,
  firstName varchar(25) not null,
  lastName varchar(25) not null,
  dateOfBirth date not null,
  sex char(1) not null,
  emailAddress varchar(50) not null,
  addressID int(4) not null references Address
);

create table MemberPhone(
  phoneNo varchar(15) not null,
  memberID char(10) not null references Member,
  primary key(phoneNo, memberID)
);

create table Address(
  addressID int(4) primary key,
  streetName varchar(50) not null,
  houseNo int(4) not null,
  city varchar(50) not null,
  postCode varchar(7) not null,
  county varchar(25),
  country varchar(25)
);

create table Staff(
  staffID char(10) primary key,
  firstName varchar(25) not null,
  lastName varchar(25) not null,
  dateOfBirth date not null,
  sex char(1) not null,
  emailAddress varchar(20) not null,
  addressID int(4) not null references Address,
  branchName varchar(30) not null references Branch,
  constraint checkSex check(sex = "M" || sex = "F")
);

create table Librarian(
  staffID char(10) primary key references Staff,
  hourlyRate float(4, 2),
  constraint checkRate check(hourlyRate > 0.0)
);


/* Insert addresses */
insert into Address values(
  "1000",
  "Stocker Road",
  52,
  "Exeter",
  "EX4 4JX",
  "Devon",
  "UK"
);

insert into Address values(
  "1001",
  "Magdalen Drive",
  23,
  "Derby",
  "DE2 3SU",
  "Derbyshire",
  "UK"
);


insert into Address values(
  "1002",
  "Mumford Drive",
  13,
  "Ashbourne",
  "DE6 1BJ",
  "Derbyshire",
  "UK"
);

insert into Address values(
  "1003",
  "Rotary Way",
  18,
  "Colchester",
  "CO3 3LG",
  "Essex",
  "UK"
);

insert into Address values(
  "1004",
  "Clifton Drive",
  174,
  "Blackpool",
  "FY4 1RT",
  "Lancashire",
  "UK"
);


insert into Address values(
  "1005",
  "Grove Road",
  17,
  "Sutton",
  "SM1 9DL",
  "Greater London",
  "UK"
);


insert into Address values(
  "1006",
  "St Annes Road",
  28,
  "Exeter",
  "EX1 2QD",
  "Devon",
  "UK"
);


insert into Address values(
  "1007",
  "Pennsylvania Road",
  120,
  "Exeter",
  "EX4 6DQ",
  "Devon",
  "UK"
);


insert into Address values(
  "1008",
  "Church Road",
  22,
  "Exeter",
  "EX2 9AZ",
  "Devon",
  "UK"
);



/*Insert authors */
insert into Author values(
  "794195",
  "George",
  "Orwell",
  "1903-06-25",
  "India"
);


insert into Author values(
  "411159",
  "Joss",
  "Sheldon",
  "1982-04-07",
  "UK"
);


insert into Author values(
  "446419",
  "Robert",
  "Lafore",
  "1938-03-28",
  NULL
);


insert into Author values(
  "584926",
  "Dennis",
  "Ritchie",
  "1941-09-09",
  "USA"
);

insert into Author values(
  "465098",
  "Brian",
  "Kernighan",
  "1942-01-01",
  "Canada"
);

insert into Author values(
  "814700",
  "Hans",
  "Morgenthau",
  "1902-02-17",
  "Germany"
);

insert into Author values(
  "670113",
  "Kenneth",
  "Waltz",
  "1924-06-08",
  "USA"
);


insert into Author values(
  "828767",
  "John",
  "Mearsheimer",
  "1947-12-14",
  "USA"
);


insert into Author values(
  "137896",
  "Mark",
  "Twain",
  "1835-11-30",
  "USA"
);


insert into Author values(
  "341368",
  "Harper",
  "Lee",
  "1926-04-28",
  "USA"
);


insert into Author values(
  "222644",
  "William",
  "Golding",
  "1911-09-19",
  "UK"
);


insert into Author values(
  "583616",
  "John",
  "Tolkien",
  "1892-01-03",
  "UK"
);



insert into Author values(
  "110799",
  "Paul",
  "Stewart",
  "1955-06-04",
  "UK"
);

insert into Author values(
  "188956",
  "Chris",
  "Riddell",
  "1962-04-13",
  "UK"
);

insert into Author values(
  "881385",
  "Markus",
  "Heitz",
  "1971-10-10",
  "Germany"
);

insert into Author values(
  "752723",
  "Henry",
  "Kissinger",
  "1923-05-27",
  "USA"
);



insert into Author values(
  "349482",
  "Mark",
  "Lee",
  "1956-10-12",
  "USA"
);


insert into Author values(
  "094839",
  "Jane",
  "Austen",
  "1775-12-16",
  "UK"
);

/* Insert books */
insert into Book values(
  "978-0-14139-304-9",
  "1984",
  1950,
  336
);



insert into Book values(
  "978-1-97951-217-6",
  "Animal Farm",
  2017,
  542
);


insert into Book values(
  "978-0-67232-453-6",
  "Data Structures & Algorithms In Java",
  2002,
  794
);


insert into Book values(
  "978-0-13110-362-7",
  "The C Programming Language",
  1988,
  274
);


insert into Book values(
  "978-0-07289-539-1",
  "Politics Among Nations",
  2005,
  752
);


insert into Book values(
  "978-0-23112-537-6",
  "Man, the State, and War: A Theoretical Analysis",
  2001,
  282
);



insert into Book values(
  "978-0-39334-927-6",
  "The Tragedy of Great Power Politics",
  2014,
  592
);


insert into Book values(
  "978-1-97322-161-6",
  "Adventures of Huckleberry Finn (Illustrations)",
  2017,
  295
);

insert into Book values(
  "978-1-78475-263-7",
  "To Kill A Mockingbird",
  2015,
  320
);


insert into Book values(
  "978-0-57119-147-5",
  "Lord of the Flies",
  1997,
  225
);

insert into Book values(
  "978-0-26110-325-2",
  "The Lord of The Rings",
  1995,
  1178
);



insert into Book values(
  "978-0-55256-966-8",
  "The Edge Chronicles: Midnight Over Sanctaphrax",
  2014,
  448
);

insert into Book values(
  "978-1-84149-572-9",
  "The Dwarves: 1",
  2009,
  752
);


insert into Book values(
  "978-1-84149-573-6",
  "The War Of The Dwarves",
  2010,
  752
);


insert into Book values(
  "978-0-14197-900-7",
  "World Order: Reflections on the Character of Nations and the Course of History",
  2015,
  432
);

insert into Book values(
  "978-1-97636-511-9",
  "Money Power Love: A Novel",
  2017,
  298
);


insert into Book values(
  "978-0-31218-695-1",
  "The Lost Tribe",
  1998,
  279
);

insert into Book values(
  "978-1-85326-000-1",
  "Pride and Prejudice",
  1992,
  392
);


/* Insert BookInvolvement */
insert into BookInvolvement values(
  "978-0-14139-304-9",
  "794195"
);


insert into BookInvolvement values(
  "978-1-97951-217-6",
  "794195"
);


insert into BookInvolvement values(
  "978-0-67232-453-6",
  "446419"
);

insert into BookInvolvement values(
  "978-0-13110-362-7",
  "584926"
);

insert into BookInvolvement values(
  "978-0-13110-362-7",
  "465098"
);


insert into BookInvolvement values(
  "978-0-07289-539-1",
  "814700"
);

insert into BookInvolvement values(
  "978-0-23112-537-6",
  "670113"
);


insert into BookInvolvement values(
  "978-0-39334-927-6",
  "828767"
);


insert into BookInvolvement values(
  "978-1-97322-161-6",
  "137896"
);

insert into BookInvolvement values(
  "978-1-78475-263-7",
  "341368"
);


insert into BookInvolvement values(
  "978-0-57119-147-5",
  "222644"
);


insert into BookInvolvement values(
  "978-0-26110-325-2",
  "583616"
);


insert into BookInvolvement values(
  "978-0-55256-966-8",
  "110799"
);


insert into BookInvolvement values(
  "978-0-55256-966-8",
  "188956"
);


insert into BookInvolvement values(
  "978-1-84149-572-9",
  "881385"
);


insert into BookInvolvement values(
  "978-1-84149-573-6",
  "881385"
);


insert into BookInvolvement values(
  "978-0-14197-900-7",
  "752723"
);


insert into BookInvolvement values(
  "978-1-97636-511-9",
  "411159"
);



insert into BookInvolvement values(
  "978-0-31218-695-1",
  "349482"
);



insert into BookInvolvement values(
  "978-1-85326-000-1",
  "094839"
);


/* Insert bookcopy */
insert into BookCopy values(
  1,
  "978-0-07289-539-1",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  2,
  "978-0-07289-539-1",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  3,
  "978-0-07289-539-1",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  0,
  "978-0-07289-539-1",
  "St Thomas Library",
  "Y"
);

insert into BookCopy values(
  4,
  "978-0-07289-539-1",
  "St Thomas Library",
  "Y"
);


insert into BookCopy values(
  5,
  "978-0-14139-304-9",
  "St Thomas Library",
  "Y"
);


insert into BookCopy values(
  6,
  "978-0-14139-304-9",
  "St Thomas Library",
  "Y"
);


insert into BookCopy values(
  7,
  "978-0-14139-304-9",
  "St Thomas Library",
  "Y"
);



insert into BookCopy values(
  8,
  "978-0-14139-304-9",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  9,
  "978-0-14139-304-9",
  "Exeter Library",
  "Y"
);

insert into BookCopy values(
  10,
  "978-0-14139-304-9",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  11,
  "978-1-97951-217-6",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  12,
  "978-1-97951-217-6",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  18,
  "978-1-97951-217-6",
  "St Thomas Library",
  "Y"
);

insert into BookCopy values(
  19,
  "978-1-97951-217-6",
  "St Thomas Library",
  "Y"
);


insert into BookCopy values(
  13,
  "978-0-31218-695-1",
  "St Thomas Library",
  "Y"
);

insert into BookCopy values(
  20,
  "978-0-31218-695-1",
  "St Thomas Library",
  "Y"
);


insert into BookCopy values(
  14,
  "978-0-13110-362-7",
  "Exeter Library",
  "Y"
);


insert into BookCopy values(
  15,
  "978-1-85326-000-1",
  "Exeter Library",
  "Y"
);

insert into BookCopy values(
  16,
  "978-1-85326-000-1",
  "St Thomas Library",
  "Y"
);

insert into BookCopy values(
  17,
  "978-1-85326-000-1",
  "St Thomas Library",
  "Y"
);

/* Insert Branch */
insert into Branch values(
  "Exeter Library",
  "1000",
  "01392 723867",
  "0000000001",
  70000
);


insert into Branch values(
  "St Thomas Library",
  "1008",
  "01392 252783",
  "0000000002",
  65000
);


/* Insert members */
insert into Member values(
  "0000000001",
  "Ian",
  "Cooper",
  "1993-10-09",
  "M",
  "iancooper@gmail.com",
  "1001"

);



insert into Member values(
  "0000000002",
  "Margaret",
  "Cooper",
  "1991-02-22",
  "F",
  "margcooper@gmail.com",
  "1001"

);


insert into Member values(
  "0000000003",
  "Ewan",
  "O' Reilly",
  "1974-05-13",
  "M",
  "ewanOreilly@hotmail.com",
  "1005"
);


insert into Member values(
  "0000000004",
  "David",
  "Wakeling",
  "1978-02-17",
  "M",
  "davidWakeling@exter.ac.uk",
  "1007"
);






/* Insert staff */
insert into Staff values(
  "0000000001",
  "Lisa",
  "Turner",
  "1980-07-10",
  "F",
  "lisaTurner@gmail.com",
  "1006",
  "Exeter Library"
);


insert into staff values(
  "0000000002",
  "Micheal",
  "Smith",
  "1989-09-28",
  "M",
  "m.smith@hotmail.com",
  "1005",
  "St Thomas Library"
);



insert into Staff values(
  "0000000003",
  "Martin",
  "Fairman",
  "1959.-02-28",
  "M",
  "martinF@gmail.com",
  "1003",
  "Exeter Library"

);



insert into Staff values(
  "0000000004",
  "Natasha",
  "Romanov",
  "1986-07-01",
  "F",
  "nat.romanove@kgb.com",
  "1001",
  "St Thomas Library"
);

/* Insert librarian */
insert into Librarian values(
  "0000000003",
  12.50
);

insert into Librarian values(
  "0000000004",
  12.50
);


/* Insert loans */
insert into Loan values (
  null,
  now(),
  "2017-11-23",
  1,
  "0000000001",
  (select branchName from BookCopy where id = 1),
  "N"
);

update bookcopy set available = "N"
  where id = 1;


insert into Loan values (
  null,
  now(),
  "2017-11-23",
  12,
  "0000000001",
  (select branchName from BookCopy where id = 12),
  "N"
);

update bookcopy set available = "N"
  where id = 12;

insert into Loan values (
  null,
  now(),
  "2017-11-25",
  13,
  "0000000001",
  (select branchName from BookCopy where id = 13),
  "N"
);

update bookcopy set available = "N"
  where id = 13;


insert into Loan values (
  null,
  "2016-03-01",
  "2016-05-01",
  8,
  "0000000001",
  (select branchName from BookCopy where id = 8),
  "N"
);

update bookcopy set available = "N"
  where id = 8;


insert into Loan values(
  null,
  '2016-10-24 10:00:00',
  "2016-12-24",
  14,
  "0000000002",
  (select branchName from BookCopy where id = 14),
  "N"
);

update bookcopy set available = "N"
  where id = 14;


insert into Loan values(
  null,
  now(),
  "2017-11-25",
  5,
  "0000000002",
  (select branchName from BookCopy where id = 5),
  "N"
);

update bookcopy set available = "N" where id = 5;


insert into Loan values(
  null,
  "2017-08-02 10:45:58",
  "2017-10-02",
  16,
  "0000000001",
  (select branchName from BookCopy where id = 16),
  "N"
);

update bookcopy set available = "N" where id = 16;


insert into Loan values(
  null,
  "2017-05-29 17:01:24",
  "2017-07-29",
  0,
  "0000000001",
  (select branchName from bookcopy where id = 0),
  "N"
);

update bookcopy set available = "N" where id = 0;



insert into Loan values(
  null,
  "2016-09-09 13:13:13",
  "2016-10-09",
  17,
  "0000000004",
  (select branchName from bookcopy where id = 17),
  "Y"
);




/*Insert fines */
insert into Fine values(
  "012345",
  "0000000001",
  (select branchName from bookcopy where id = 16),
  16,
  12.50,
  (select dueDate from loan where copyID = 16),
  date_add((select dueDate from loan where copyID = 16), interval 30 day)
);

insert into Fine values(
  "123456",
  "0000000001",
  (select branchName from bookcopy where id = 0),
  0,
  20.00,
  (select dueDate from loan where copyID = 0),
  date_add((select dueDate from loan where copyID = 0), interval 30 day)
);


insert into Fine values(
  "123457",
  "0000000001",
  (select branchName from bookcopy where id = 8),
  8,
  200.00,
  (select dueDate from loan where copyID = 8),
  date_add((select dueDate from loan where copyID = 8), interval 30 day)
);
