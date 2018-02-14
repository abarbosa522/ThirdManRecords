﻿DROP TABLE aliases;
DROP TABLE bandMembers;
DROP TABLE songCredits;
DROP TABLE recordCredits;
DROP TABLE songs;
DROP TABLE recordEditions;
DROP TABLE records;
DROP TABLE artists;

CREATE TABLE artists (
	name varchar(255) not null unique,
	description varchar(255) not null,
	picture varchar(255) not null,
	full_picture varchar(255) not null,
	type varchar(255) not null,
	band bit not null,
	primary key(name));

CREATE TABLE records (
	code varchar(255) not null unique,
	artist varchar(255) not null,
	title varchar(255) not null,
	diameter integer not null,
	cover varchar(255) not null,
	full_cover varchar(255) not null,
	vault integer not null,
	release_date varchar(255) not null,
	series varchar(255) not null,
	store_link varchar(255) not null,
	spotify_link varchar(255) not null,
	primary key(code),
	foreign key (artist) references artists(name));

CREATE TABLE recordEditions (
	code varchar(255) not null unique,
	record varchar(255) not null,
	edition varchar(255) not null,
	quantity varchar(255) not null,
	picture varchar(255) not null,
	primary key(code),
	foreign key (record) references records(code));

CREATE TABLE songs (
	code varchar(255) not null unique,
	record varchar(255) not null,
	title varchar(255) not null,
	track varchar(255) not null,
	primary key(code),
	foreign key (record) references records(code));

CREATE TABLE recordCredits (
	code varchar(255) not null unique,
	record varchar(255) not null,
	artist varchar(255) not null,
	role varchar(255) not null,
	primary key (code),
	foreign key (record) references records(code),
	foreign key (artist) references artists(name));

CREATE TABLE songCredits (
	code varchar(255) not null unique,
	song varchar(255) not null,
	artist varchar(255) not null,
	role varchar(255) not null,
	primary key (code),
	foreign key (song) references songs(code),
	foreign key (artist) references artists(name));

CREATE TABLE bandMembers (
	code varchar(255) not null unique,
	band varchar(255) not null,
	member varchar(255) not null,
	role varchar(255) not null,
	primary key (code),
	foreign key (band) references artists(name),
	foreign key (member) references artists(name));

CREATE TABLE aliases (
	code varchar(255) not null unique,
	artist varchar(255) not null,
	primary key (code),
	foreign key (artist) references artists(name));

/* TMR001 */
INSERT INTO artists VALUES ('The Dead Weather', 'TDW', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImage200200-the-dead-weather.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/the-dead-weather.jpg', 'TMR Artist', 1);
INSERT INTO artists VALUES ('Jack White', 'JW', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/jack-white.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/jack-white.jpg', 'TMR Artist', 0);
INSERT INTO artists VALUES ('Alison Mosshart', 'AM', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Alison_Nicole_Mosshart.jpg', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Alison_Nicole_Mosshart.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Dean Fertita', 'DF', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG/800px-14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG/800px-14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG', 'Other', 0);
INSERT INTO artists VALUES ('Jack Lawrence', 'JL', 'https://upload.wikimedia.org/wikipedia/commons/4/41/Jack_Lawrence%2C_Stockholm.jpg', 'https://upload.wikimedia.org/wikipedia/commons/4/41/Jack_Lawrence%2C_Stockholm.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Gary Numan', 'GN', 'https://i.pinimg.com/736x/86/4d/7b/864d7baf2e6871c1f49cb79c4006bade--gary-numan-army.jpg', 'https://i.pinimg.com/736x/86/4d/7b/864d7baf2e6871c1f49cb79c4006bade--gary-numan-army.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Rob Jones', 'RJ', 'https://img.discogs.com/M93181wNV-MjaHniNbfT0aSjRMw=/500x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-235339-1276197773.jpeg.jpg', 'https://img.discogs.com/M93181wNV-MjaHniNbfT0aSjRMw=/500x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-235339-1276197773.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('George Ingram', 'GI', 'https://img.discogs.com/91QYdd6luPvgFo5O5MAObjLsWaM=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-925545-1488028207-8887.jpeg.jpg', 'https://img.discogs.com/91QYdd6luPvgFo5O5MAObjLsWaM=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-925545-1488028207-8887.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('David Swanson', 'DS', 'http://jtw.up.seesaa.net/image/people_Swanson_1.jpg', 'http://jtw.up.seesaa.net/image/people_Swanson_1.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR001', 'The Dead Weather', 'Hang You From The Heavens', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidth200200-tmr001-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr001-cover-ab.jpg', 0, '18 April 2009', 'Default', 'http://thirdmanstore.com/the-dead-weather-hang-you-from-the-heavens-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:1IfM56OTFYFa0ZrbiGW0JZ');

INSERT INTO recordEditions VALUES ('TMR001-BLACK', 'TMR001', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR001-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR001-GLOW', 'TMR001', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');
INSERT INTO recordEditions VALUES ('TMR001-TRI-COLOR', 'TMR001', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR001-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR001-TEST', 'TMR001', 'Test Pressing Black', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr001-tp-full.jpeg');

INSERT INTO songs VALUES ('TMR001-A', 'TMR001', 'Hang You From The Heavens', 'A');
INSERT INTO songs VALUES ('TMR001-B', 'TMR001', 'Are ''Friends'' Electric?', 'B');

INSERT INTO recordCredits VALUES ('TMR001-BASS', 'TMR001', 'Jack Lawrence', 'Bass');
INSERT INTO recordCredits VALUES ('TMR001-DESIGN', 'TMR001', 'Rob Jones', 'Packaging Design');
INSERT INTO recordCredits VALUES ('TMR001-DRUMS', 'TMR001', 'Jack White', 'Drums');
INSERT INTO recordCredits VALUES ('TMR001-GUITAR', 'TMR001', 'Dean Fertita', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR001-MASTERING', 'TMR001', 'George Ingram', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR001-PHOTOGRAPHY', 'TMR001', 'David Swanson', 'Photography');
INSERT INTO recordCredits VALUES ('TMR001-PRODUCING', 'TMR001', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR001-MIXING', 'TMR001', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR001-VOCALS', 'TMR001', 'Alison Mosshart', 'Vocals');

INSERT INTO songCredits VALUES ('TMR001-A-WRITER1', 'TMR001-A', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR001-A-WRITER2', 'TMR001-A', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR001-B-GUITAR', 'TMR001-B', 'Jack White', 'Guitar');
INSERT INTO songCredits VALUES ('TMR001-B-ORGAN1', 'TMR001-B', 'Dean Fertita', 'Organ');
INSERT INTO songCredits VALUES ('TMR001-B-ORGAN2', 'TMR001-B', 'Jack Lawrence', 'Organ');
INSERT INTO songCredits VALUES ('TMR001-B-WRITER', 'TMR001-B', 'Gary Numan', 'Writer');

INSERT INTO bandMembers VALUES ('THEDEADWEATHER-JACKWHITE', 'The Dead Weather', 'Jack White', 'Drums');
INSERT INTO bandMembers VALUES ('THEDEADWEATHER-ALISONMOSSHART', 'The Dead Weather', 'Alison Mosshart', 'Vocals');
INSERT INTO bandMembers VALUES ('THEDEADWEATHER-JACKLAWRENCE', 'The Dead Weather', 'Jack Lawrence', 'Bass');
INSERT INTO bandMembers VALUES ('THEDEADWEATHER-DEANFERTITA', 'The Dead Weather', 'Dean Fertita', 'Guitar');

/* TMR002 */
INSERT INTO artists VALUES ('The White Stripes', 'TWS', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/the-white-stripes.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/the-white-stripes.jpg', 'TMR Artist', 1);
INSERT INTO artists VALUES ('Kevin Gray', 'KG', 'https://img.discogs.com/HoU2XHHcK5pbnBP5_VYl_ecQOic=/fit-in/342x368/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-312098-1419799369-3322.jpeg.jpg', 'https://img.discogs.com/HoU2XHHcK5pbnBP5_VYl_ecQOic=/fit-in/342x368/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-312098-1419799369-3322.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Steve Hoffman', 'SH', 'https://img.discogs.com/JtupsLKh_FxjH4VCr0G8eGwFuW0=/fit-in/500x712/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-359096-1319395656.jpeg.jpg', 'https://img.discogs.com/JtupsLKh_FxjH4VCr0G8eGwFuW0=/fit-in/500x712/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-359096-1319395656.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Joe Chiccarelli', 'JC', 'https://img.discogs.com/_Q4nOHfzBlC_cHnz8blhImibRNU=/333x343/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-147534-1406111038-4460.jpeg.jpg', 'https://img.discogs.com/_Q4nOHfzBlC_cHnz8blhImibRNU=/333x343/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-147534-1406111038-4460.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Lowell Reynolds', 'LR', 'https://pbs.twimg.com/profile_images/1649566380/Octoberfest3.jpg', 'https://pbs.twimg.com/profile_images/1649566380/Octoberfest3.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Meg White', 'MW', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Meg_White_1.jpg/220px-Meg_White_1.jpg', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Meg_White_1.jpg/220px-Meg_White_1.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Autumn De Wilde', 'ADW', 'https://img.discogs.com/0vUTNBg2YPZqhJTLdvz099I1fF4=/600x439/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-545845-1318185469.jpeg.jpg', 'https://img.discogs.com/0vUTNBg2YPZqhJTLdvz099I1fF4=/600x439/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-545845-1318185469.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Regulo Aldama', 'RA', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Corky Robbins', 'CR', 'https://img.discogs.com/VGAuGfK0qKxLWKihR3_ZdvhZBKc=/333x627/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-831222-1448217909-4802.jpeg.jpg', 'https://img.discogs.com/VGAuGfK0qKxLWKihR3_ZdvhZBKc=/333x627/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-831222-1448217909-4802.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Jim Drury', 'JD', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR002', 'The White Stripes', 'Icky Thump', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr002-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr002-cover-ab.jpg', 1, '29 August 2009', 'Default', 'Not Available', 'https://open.spotify.com/embed?uri=spotify:album:77dc8fS3O8FaQjhbNASpgM');

INSERT INTO recordEditions VALUES ('TMR002-BLACK', 'TMR002', 'Black', 'Undisclosed', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr002-black-1ab.jpg');

INSERT INTO songs VALUES ('TMR002-A1', 'TMR002', 'Icky Thump', 'A1');
INSERT INTO songs VALUES ('TMR002-A2', 'TMR002', 'You Don''t Know What Love Is (You Just Do As You''re Told)', 'A2');
INSERT INTO songs VALUES ('TMR002-A3', 'TMR002', '300 M.P.H. Torrential Outpour Blues', 'A3');
INSERT INTO songs VALUES ('TMR002-B4', 'TMR002', 'Conquest', 'B4');
INSERT INTO songs VALUES ('TMR002-B5', 'TMR002', 'Bone Broke', 'B5');
INSERT INTO songs VALUES ('TMR002-B6', 'TMR002', 'Prickly Thorn, But Sweetly Worn', 'B6');
INSERT INTO songs VALUES ('TMR002-B7', 'TMR002', 'St. Andrew (This Battle Is In The Air)', 'B7');
INSERT INTO songs VALUES ('TMR002-C8', 'TMR002', 'Little Cream Soda', 'C8');
INSERT INTO songs VALUES ('TMR002-C9', 'TMR002', 'Rag And Bone', 'C9');
INSERT INTO songs VALUES ('TMR002-C10', 'TMR002', 'I''m Slowly Turning Into You', 'C10');
INSERT INTO songs VALUES ('TMR002-D11', 'TMR002', 'A Martyr For My Love For You', 'D11');
INSERT INTO songs VALUES ('TMR002-D12', 'TMR002', 'Catch Hell Blues', 'D12');
INSERT INTO songs VALUES ('TMR002-D13', 'TMR002', 'Effect And Cause', 'D13');

INSERT INTO recordCredits VALUES ('TMR002-DESIGN1', 'TMR002', 'Rob Jones', 'Design');
INSERT INTO recordCredits VALUES ('TMR002-LAYOUT1', 'TMR002', 'Rob Jones', 'Layout');
INSERT INTO recordCredits VALUES ('TMR002-DESIGN2', 'TMR002', 'Jack White', 'Design');
INSERT INTO recordCredits VALUES ('TMR002-LAYOUT2', 'TMR002', 'Jack White', 'Layout');
INSERT INTO recordCredits VALUES ('TMR002-MASTERING1', 'TMR002', 'Kevin Gray', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR002-MASTERING2', 'TMR002', 'Steve Hoffman', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR002-MIXING1', 'TMR002', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR002-MIXING2', 'TMR002', 'Joe Chiccarelli', 'Design');
INSERT INTO recordCredits VALUES ('TMR002-PHOTOGRAPHY', 'TMR002', 'Autumn De Wilde', 'Photography');
INSERT INTO recordCredits VALUES ('TMR002-PRODUCING', 'TMR002', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR002-RECORDING1', 'TMR002', 'Joe Chiccarelli', 'Recording');
INSERT INTO recordCredits VALUES ('TMR002-RECORDING2', 'TMR002', 'Lowell Reynolds', 'Recording');
INSERT INTO recordCredits VALUES ('TMR002-VOCALS1', 'TMR002', 'Jack White', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR002-VOCALS2', 'TMR002', 'Meg White', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR002-WRITING', 'TMR002', 'Jack White', 'Writing');
INSERT INTO recordCredits VALUES ('TMR002-DRUMS', 'TMR002', 'Meg White', 'Drums');
INSERT INTO recordCredits VALUES ('TMR002-GUITAR', 'TMR002', 'Jack White', 'Guitar');

INSERT INTO songCredits VALUES ('TMR002-B4-TRUMPET', 'TMR002-B4', 'Regulo Aldama', 'Trumpet');
INSERT INTO songCredits VALUES ('TMR002-B4-WRITER', 'TMR002-B4', 'Corky Robbins', 'Writer');
INSERT INTO songCredits VALUES ('TMR002-B6-BAGPIPES', 'TMR002-B6', 'Jim Drury', 'Bagpipes');
INSERT INTO songCredits VALUES ('TMR002-B7-BAGPIPES', 'TMR002-B7', 'Jim Drury', 'Bagpipes');

INSERT INTO bandMembers VALUES ('THEWHITESTRIPES-JACKWHITE', 'The White Stripes', 'Jack White', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('THEWHITESTRIPES-MEGWHITE', 'The White Stripes', 'Meg White', 'Drums');

/* TMR003 */
INSERT INTO artists VALUES ('Mildred And The Mice', 'MAM', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/mildred-and-the-mice.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/mildred-and-the-mice.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('Tail', 'T', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Trap', 'T', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Mildred', 'M', 'https://img.discogs.com/JdywZaLjgGrTG7FsRMhUdggEbG4=/453x600/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2527841-1323379773.jpeg.jpg', 'https://img.discogs.com/JdywZaLjgGrTG7FsRMhUdggEbG4=/453x600/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2527841-1323379773.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Squeak', 'S', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Eric Cohn', 'EC', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Vance Powell', 'VP', 'https://cps-static.rovicorp.com/3/JPG_400/MI0003/760/MI0003760698.jpg?partner=allrovi.com', 'https://cps-static.rovicorp.com/3/JPG_400/MI0003/760/MI0003760698.jpg?partner=allrovi.com', 'Other', 0);

INSERT INTO records VALUES ('TMR003', 'Mildred And The Mice', 'I Like My Mice (Dead)', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr003-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr003-cover-ab.jpg', 0, '25 May 2009', 'Blue Series', 'https://thirdmanstore.com/third-man-studios/mildred-and-the-mice-i-like-my-mice-dead-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:42Jpam8qxC4x4MEBw8AElS');

INSERT INTO recordEditions VALUES ('TMR003-BLACK', 'TMR003', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr003-label-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR003-TRI-COLOR', 'TMR003', 'Tri-Color', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr003-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR003-GLOW', 'TMR003', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR003-A', 'TMR003', 'I Like My Mice (Dead)', 'A');
INSERT INTO songs VALUES ('TMR003-B', 'TMR003', 'Spider Bite', 'B');

INSERT INTO recordCredits VALUES ('TMR003-BASS', 'TMR003', 'Tail', 'Bass');
INSERT INTO recordCredits VALUES ('TMR003-DRUMS', 'TMR003', 'Trap', 'Drums');
INSERT INTO recordCredits VALUES ('TMR003-ENGINEERING', 'TMR003', 'Jack White', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR003-GUITAR1', 'TMR003', 'Mildred', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR003-GUITAR2', 'TMR003', 'Squeak', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR003-MASTERING', 'TMR003', 'Eric Cohn', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR003-MIXING1', 'TMR003', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR003-MIXING2', 'TMR003', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR003-PRODUCING', 'TMR003', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR003-VOCALS', 'TMR003', 'Mildred', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR003-WRITING', 'TMR003', 'Mildred', 'Writing');

INSERT INTO bandMembers VALUES ('MILDREDANDTHEMICE-MILDRED', 'Mildred And The Mice', 'Mildred', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('MILDREDANDTHEMICE-TAIL', 'Mildred And The Mice', 'Tail', 'Bass');
INSERT INTO bandMembers VALUES ('MILDREDANDTHEMICE-TRAP', 'Mildred And The Mice', 'Trap', 'Drums');
INSERT INTO bandMembers VALUES ('MILDREDANDTHEMICE-SQUEAK', 'Mildred And The Mice', 'Squeak', 'Guitar');

/* TMR004 */
INSERT INTO artists VALUES ('Rachelle Garniez', 'RG', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/rachelle-garniez.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/rachelle-garniez.jpg', 'Blue Series Artist', 0);

INSERT INTO records VALUES ('TMR004', 'Rachelle Garniez', 'My House Of Peace', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr004-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr004-cover-ab.jpg', 0, '25 May 2009', 'Blue Series', 'https://thirdmanstore.com/rachelle-garniez-my-house-of-peace-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:47OeiRK1qGkqS5VK9XmFBI');

INSERT INTO recordEditions VALUES ('TMR004-BLACK', 'TMR004', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR004-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR004-TRI-COLOR', 'TMR004', 'Tri-Color', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR004-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR004-GLOW', 'TMR004', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR004-A', 'TMR004', 'My House Of Peace', 'A');

INSERT INTO recordCredits VALUES ('TMR004-BASS', 'TMR004', 'Jack Lawrence', 'Bass');
INSERT INTO recordCredits VALUES ('TMR004-DRUMS', 'TMR004', 'Jack White', 'Drums');
INSERT INTO recordCredits VALUES ('TMR004-ENGINEERING1', 'TMR004', 'Jack White', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR004-ENGINEERING2', 'TMR004', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR004-MIXING1', 'TMR004', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR004-MIXING2', 'TMR004', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR004-ORGAN', 'TMR004', 'Rachelle Garniez', 'Organ');
INSERT INTO recordCredits VALUES ('TMR004-PIANO', 'TMR004', 'Rachelle Garniez', 'Piano');
INSERT INTO recordCredits VALUES ('TMR004-PRODUCING', 'TMR004', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR004-VOCALS', 'TMR004', 'Rachelle Garniez', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR004-WRITING', 'TMR004', 'Rachelle Garniez', 'Writing');

/* TMR005 */
INSERT INTO records VALUES ('TMR005', 'The Dead Weather', 'I Cut Like A Buffalo', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/TMR005-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR005-ab.jpg', 0, '2009', 'Default', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR005-TRI-COLOR', 'TMR005', 'Tri-Color', '300', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR005-tricolor-ab.jpg');

INSERT INTO songs VALUES ('TMR005-A', 'TMR005', 'I Cut Like A Buffalo', 'A');

/* TMR006 */
INSERT INTO records VALUES ('TMR006', 'The Dead Weather', 'I Cut Like A Buffalo', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/TMR006-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR006-a.jpg', 0, '2009', 'Default', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR006-BLACK', 'TMR006', 'Black', '500', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr006-black-a.jpg');

INSERT INTO songs VALUES ('TMR006-A', 'TMR006', 'I Cut Like A Buffalo', 'A');

/* TMR007 */
INSERT INTO artists VALUES ('Joshua V. Smith', 'JVS', 'http://www1.pictures.zimbio.com/gi/Joshua+V+Smith+md6iPkM5LJvm.jpg', 'http://www1.pictures.zimbio.com/gi/Joshua+V+Smith+md6iPkM5LJvm.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Wes Garland', 'WG', 'https://img.discogs.com/mLHXM6UXtDLCeH9NLM9pwMcjbUU=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2135761-1488028248-3878.jpeg.jpg', 'https://img.discogs.com/mLHXM6UXtDLCeH9NLM9pwMcjbUU=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2135761-1488028248-3878.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Van Morrison', 'VM', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Van_morrison%2C_slieve_donard_2015.jpg', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Van_morrison%2C_slieve_donard_2015.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR007', 'The Dead Weather', 'Treat Me Like Your Mother', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr007-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr007-cover-ab.jpg', 0, '25 May 2009', 'Default', 'https://thirdmanstore.com/the-dead-weather-treat-me-like-your-mother-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:3IiRDuYtLQ1WpAeO9jwm3k');

INSERT INTO recordEditions VALUES ('TMR007-BLACK', 'TMR007', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr007-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR007-TRI-COLOR', 'TMR007', 'Tri-Color', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr007-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR007-GLOW', 'TMR007', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR007-A', 'TMR007', 'Treat Me Like Your Mother', 'A');
INSERT INTO songs VALUES ('TMR007-B', 'TMR007', 'You Just Can''t Win', 'B');

INSERT INTO recordCredits VALUES ('TMR007-DESIGN', 'TMR007', 'Rob Jones', 'Packaging Design');
INSERT INTO recordCredits VALUES ('TMR007-ENGINEERING1', 'TMR007', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR007-ENGINEERING2', 'TMR007', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR007-LACQUERCUT', 'TMR007', 'Wes Garland', 'Lacquer Cut');
INSERT INTO recordCredits VALUES ('TMR007-MIXING1', 'TMR007', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR007-MIXING2', 'TMR007', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR007-PHOTOGRAPHY', 'TMR007', 'David Swanson', 'Photography');
INSERT INTO recordCredits VALUES ('TMR007-PRODUCING', 'TMR007', 'Jack White', 'Producing');

INSERT INTO songCredits VALUES ('TMR007-A-WRITER1', 'TMR007-A', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR007-A-WRITER2', 'TMR007-A', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR007-A-WRITER3', 'TMR007-A', 'Jack Lawrence', 'Writer');
INSERT INTO songCredits VALUES ('TMR007-A-WRITER4', 'TMR007-A', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR007-B-WRITER1', 'TMR007-B', 'Van Morrison', 'Writer');

/* TMR008 */
INSERT INTO artists VALUES ('Bob Dylan', 'BD', 'https://tcjewfolk.com/wp-content/uploads//2017/09/bobdylan.jpg', 'https://tcjewfolk.com/wp-content/uploads//2017/09/bobdylan.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Philip J. Harvey', 'PJH', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Ian Montone', 'IM', 'http://memberdata.s3.amazonaws.com/hi/hitsdd/photos/hitsdd_photo_gal__photo_1866442886.png', 'http://memberdata.s3.amazonaws.com/hi/hitsdd/photos/hitsdd_photo_gal__photo_1866442886.png', 'Other', 0);

INSERT INTO records VALUES ('TMR008', 'The Dead Weather', 'Horehound', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr008-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr008-cover-ab.jpg', 0, '14 July 2009', 'Default', 'https://thirdmanstore.com/the-dead-weather-horehound-12-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:1nxECUyuIZF5JCrO9Xo2jO');

INSERT INTO recordEditions VALUES ('TMR008-BLACK', 'TMR008', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr008-black-1ab.jpg');
INSERT INTO recordEditions VALUES ('TMR008-SPLIT-COLOR', 'TMR008', 'Split-Color', '300', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR008-colored-ab.jpg');

INSERT INTO songs VALUES ('TMR008-A1', 'TMR008', '60 Feet Tall', 'A1');
INSERT INTO songs VALUES ('TMR008-A2', 'TMR008', 'Hang You From The Heavens', 'A2');
INSERT INTO songs VALUES ('TMR008-A3', 'TMR008', 'I Cut Like A Buffalo', 'A3');
INSERT INTO songs VALUES ('TMR008-A4', 'TMR008', 'So Far From Your Weapon', 'A4');
INSERT INTO songs VALUES ('TMR008-B1', 'TMR008', 'Treat Me Like Your Mother', 'B1');
INSERT INTO songs VALUES ('TMR008-B2', 'TMR008', 'Rocking Horse', 'B2');
INSERT INTO songs VALUES ('TMR008-B3', 'TMR008', 'New Pony', 'B3');
INSERT INTO songs VALUES ('TMR008-C1', 'TMR008', 'Bone House', 'C1');
INSERT INTO songs VALUES ('TMR008-C2', 'TMR008', '3 Birds', 'C2');
INSERT INTO songs VALUES ('TMR008-C3', 'TMR008', 'No Hassle Night', 'C3');
INSERT INTO songs VALUES ('TMR008-C4', 'TMR008', 'Will There Be Enough Water?', 'C4');

INSERT INTO recordCredits VALUES ('TMR008-BASS', 'TMR008', 'Jack Lawrence', 'Bass');
INSERT INTO recordCredits VALUES ('TMR008-BACKINGVOCALS1', 'TMR008', 'Jack Lawrence', 'Backing Vocals');
INSERT INTO recordCredits VALUES ('TMR008-DESIGN', 'TMR008', 'Rob Jones', 'Packaging Design');
INSERT INTO recordCredits VALUES ('TMR008-DRUMS', 'TMR008', 'Jack White', 'Drums');
INSERT INTO recordCredits VALUES ('TMR008-VOCALS1', 'TMR008', 'Jack White', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR008-ENGINEERING1', 'TMR008', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR008-ENGINEERING2', 'TMR008', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR008-GUITAR', 'TMR008', 'Dean Fertita', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR008-PIANO', 'TMR008', 'Dean Fertita', 'Piano');
INSERT INTO recordCredits VALUES ('TMR008-ORGAN', 'TMR008', 'Dean Fertita', 'Organ');
INSERT INTO recordCredits VALUES ('TMR008-SYNTH', 'TMR008', 'Dean Fertita', 'Synth');
INSERT INTO recordCredits VALUES ('TMR008-BACKINGVOCALS2', 'TMR008', 'Dean Fertita', 'Backing Vocals');
INSERT INTO recordCredits VALUES ('TMR008-LACQUERCUT', 'TMR008', 'Wes Garland', 'Lacquer Cut');
INSERT INTO recordCredits VALUES ('TMR008-MANAGEMENT', 'TMR008', 'Ian Montone', 'Management');
INSERT INTO recordCredits VALUES ('TMR008-MIXING1', 'TMR008', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR008-MIXING2', 'TMR008', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR008-PHOTOGRAPHY', 'TMR008', 'David Swanson', 'Photography');
INSERT INTO recordCredits VALUES ('TMR008-PRODUCING', 'TMR008', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR008-VOCALS2', 'TMR008', 'Alison Mosshart', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR008-PERCURSSION', 'TMR008', 'Alison Mosshart', 'Percurssion');

INSERT INTO songCredits VALUES ('TMR008-A1-WRITER1', 'TMR008-A1', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-A1-WRITER2', 'TMR008-A1', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-A2-WRITER1', 'TMR008-A2', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-A2-WRITER2', 'TMR008-A2', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-A3-GUITAR', 'TMR008-A3', 'Alison Mosshart', 'Guitar');
INSERT INTO songCredits VALUES ('TMR008-A3-WRITER', 'TMR008-A3', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-A4-WRITER', 'TMR008-A4', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B1-WRITER1', 'TMR008-B1', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B1-WRITER2', 'TMR008-B1', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B1-WRITER3', 'TMR008-B1', 'Jack Lawrence', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B1-WRITER4', 'TMR008-B1', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B2-BASS', 'TMR008-B2', 'Dean Fertita', 'Bass');
INSERT INTO songCredits VALUES ('TMR008-B2-GUITAR', 'TMR008-B2', 'Jack Lawrence', 'Guitar');
INSERT INTO songCredits VALUES ('TMR008-B2-WRITER1', 'TMR008-B2', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B2-WRITER2', 'TMR008-B2', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-B3-WRITER', 'TMR008-B3', 'Bob Dylan', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C1-WRITER1', 'TMR008-C1', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C1-WRITER2', 'TMR008-C1', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C1-WRITER3', 'TMR008-C1', 'Jack Lawrence', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C1-WRITER4', 'TMR008-C1', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C2-GUITAR', 'TMR008-C2', 'Alison Mosshart', 'Guitar');
INSERT INTO songCredits VALUES ('TMR008-C2-WRITER1', 'TMR008-C2', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C2-WRITER2', 'TMR008-C2', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C2-WRITER3', 'TMR008-C2', 'Jack Lawrence', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C2-WRITER4', 'TMR008-C2', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C3-WRITER1', 'TMR008-C3', 'Alison Mosshart', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C3-WRITER2', 'TMR008-C3', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C4-ACOUSTICGUITAR', 'TMR008-C4', 'Jack White', 'Acoustic Guitar');
INSERT INTO songCredits VALUES ('TMR008-C3-DRUMS', 'TMR008-C4', 'Jack Lawrence', 'Drums');
INSERT INTO songCredits VALUES ('TMR008-C3-ENGINEERING', 'TMR008-C4', 'Philip J. Harvey', 'Engineering');
INSERT INTO songCredits VALUES ('TMR008-C4-WRITER1', 'TMR008-C4', 'Dean Fertita', 'Writer');
INSERT INTO songCredits VALUES ('TMR008-C4-WRITER2', 'TMR008-C4', 'Jack White', 'Writer');

/* TMR009 */
INSERT INTO artists VALUES ('Dex Romweber Duo', 'DRD', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/dex-romweber-duo.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/dex-romweber-duo.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('Miles Johnson', 'MJ', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Sara Romweber', 'SR', 'https://img.discogs.com/9i2PPEmxHTej4MT3mzSe6ThA6Yc=/600x399/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-749330-1359165979-4313.jpeg.jpg', 'https://img.discogs.com/9i2PPEmxHTej4MT3mzSe6ThA6Yc=/600x399/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-749330-1359165979-4313.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Brett Steele', 'BS', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Dexter Romweber', 'DR', 'https://img.discogs.com/j2iUhRpglaaQiav32EPK1xrTeaQ=/212x300/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-474212-1399044096-4740.jpeg.jpg', 'https://img.discogs.com/j2iUhRpglaaQiav32EPK1xrTeaQ=/212x300/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-474212-1399044096-4740.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Geechie Wiley', 'GW', 'https://img.discogs.com/Bn9GMTSdICbQvBhxBI_iB0nYRQQ=/335x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-516937-1511503864-2123.jpeg.jpg', 'https://img.discogs.com/Bn9GMTSdICbQvBhxBI_iB0nYRQQ=/335x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-516937-1511503864-2123.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Jo McCaughey', 'JM', 'https://scontent.cdninstagram.com/vp/28446e60d01fc6786ddbc85fdde627a4/5ADCBE36/t51.2885-15/s640x640/sh0.08/e35/24332539_558513601207614_1666874763173167104_n.jpg', 'https://scontent.cdninstagram.com/vp/28446e60d01fc6786ddbc85fdde627a4/5ADCBE36/t51.2885-15/s640x640/sh0.08/e35/24332539_558513601207614_1666874763173167104_n.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR009', 'Dex Romweber Duo', 'The Wind Did Move', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr009-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr009-cover-ab.jpg', 0, '9 June 2009', 'Blue Series', 'https://thirdmanstore.com/dex-romweber-duo-the-wind-did-move-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:7ECnXzo9s38W9SVg48Xqil');

INSERT INTO recordEditions VALUES ('TMR009-BLACK', 'TMR009', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr009-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR009-GLOW', 'TMR009', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');
INSERT INTO recordEditions VALUES ('TMR009-TRI-COLOR', 'TMR009', 'Tri-Color', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr009-tricolor-ab.jpg');

INSERT INTO songs VALUES ('TMR009-A', 'TMR009', 'The Wind Did Move', 'A');
INSERT INTO songs VALUES ('TMR009-B', 'TMR009', 'Last Kind Words Blues', 'B');

INSERT INTO recordCredits VALUES ('TMR009-DESIGN', 'TMR009', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR009-DRUMS', 'TMR009', 'Sara Romweber', 'Drums');
INSERT INTO recordCredits VALUES ('TMR009-ENGINEERING1', 'TMR009', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR009-ENGINEERING2', 'TMR009', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR009-MANAGEMENT', 'TMR009', 'Brett Steele', 'Management');
INSERT INTO recordCredits VALUES ('TMR009-MASTERING', 'TMR009', 'Wes Garland', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR009-MIXING1', 'TMR009', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR009-MIXING2', 'TMR009', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR009-PHOTOGRAPHY', 'TMR009', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR009-PRODUCING', 'TMR009', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR009-VOCALS1', 'TMR009', 'Jack White', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR009-GUITAR1', 'TMR009', 'Jack White', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR009-BASS', 'TMR009', 'Jack White', 'Bass');
INSERT INTO recordCredits VALUES ('TMR009-SAW', 'TMR009', 'Jack White', 'Saw');
INSERT INTO recordCredits VALUES ('TMR009-VOCALS2', 'TMR009', 'Dexter Romweber', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR009-GUITAR2', 'TMR009', 'Dexter Romweber', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR009-PIANO', 'TMR009', 'Dexter Romweber', 'Piano');
INSERT INTO recordCredits VALUES ('TMR009-Organ', 'TMR009', 'Dexter Romweber', 'Orgam');

INSERT INTO songCredits VALUES ('TMR009-A-WRITER', 'TMR009-A', 'Dexter Romweber', 'Writer');
INSERT INTO songCredits VALUES ('TMR009-B-WRITER', 'TMR009-B', 'Geechie Wiley', 'Writer');

INSERT INTO bandMembers VALUES ('DEXROMWEBERDUO-DEXTERROMWEBER', 'Dex Romweber Duo', 'Dexter Romweber', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('DEXROMWEBERDUO-SARAROMWEBER', 'Dex Romweber Duo', 'Sara Romweber', 'Drums');

/* TMR010 */
INSERT INTO artists VALUES ('Bobby Liebling', 'BL', 'https://img.discogs.com/vJYbUCL2nT2-ivlNU2BoRMaRNhI=/430x286/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-568439-1334566082.png.jpg', 'https://img.discogs.com/vJYbUCL2nT2-ivlNU2BoRMaRNhI=/430x286/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-568439-1334566082.png.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Arthur Keith Evans', 'AKE', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Michael O''Donnell', 'MO', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR010', 'The Dead Weather', 'Forever My Queen', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr010-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr010-cover-ab.jpg', 1, '29 August 2009', 'Vault', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR010-BLACK', 'TMR010', 'Black', 'Undisclosed', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR010-black-ab.jpg');

INSERT INTO songs VALUES ('TMR010-A', 'TMR010', 'Forever My Queen', 'A');
INSERT INTO songs VALUES ('TMR010-B', 'TMR010', 'Outside', 'B');

INSERT INTO songCredits VALUES ('TMR010-A-WRITER', 'TMR010-A', 'Bobby Liebling', 'Writer');
INSERT INTO songCredits VALUES ('TMR010-B-WRITER1', 'TMR010-B', 'Arthur Keith Evans', 'Writer');
INSERT INTO songCredits VALUES ('TMR010-B-WRITER2', 'TMR010-B', 'Michael O''Donnell', 'Writer');

/* TMR011 */
INSERT INTO artists VALUES ('Dan Sartain', 'DS', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/dan-sartain.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/dan-sartain.jpg', 'Blue Series Artist', 0);
INSERT INTO artists VALUES ('Matt Patton', 'MP', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Adam Renshaw', 'AR', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR011', 'Dan Sartain', 'Bohemian Grove', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr011-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr011-cover-ab.jpg', 0, '2009', 'Blue Series', 'https://thirdmanstore.com/dan-sartain-bohemian-grove-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:4nJ3FL85Fma3cDWd1IiLMz');

INSERT INTO recordEditions VALUES ('TMR011-BLACK', 'TMR011', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr011-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR011-TRI-COLOR', 'TMR011', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr011-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR011-GLOW', 'TMR011', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR011-A', 'TMR011', 'Bohemian Grove', 'A');
INSERT INTO songs VALUES ('TMR011-B', 'TMR011', 'Atheist Funeral', 'B');

INSERT INTO recordCredits VALUES ('TMR011-BASS', 'TMR011', 'Matt Patton', 'Bass');
INSERT INTO recordCredits VALUES ('TMR011-DESIGN', 'TMR011', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR011-DRUMS', 'TMR011', 'Adam Renshaw', 'Drums');
INSERT INTO recordCredits VALUES ('TMR011-ENGINEERING1', 'TMR011', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR011-ENGINEERING2', 'TMR011', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR011-MIXING1', 'TMR011', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR011-PHOTOGRAPHY', 'TMR011', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR011-PIANO', 'TMR011', 'Jack White', 'Piano');
INSERT INTO recordCredits VALUES ('TMR011-MIXING2', 'TMR011', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR011-PRODUCING', 'TMR011', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR011-VOCALS', 'TMR011', 'Dan Sartain', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR011-GUITAR', 'TMR011', 'Dan Sartain', 'Guitar');

INSERT INTO songCredits VALUES ('TMR011-A-WRITER', 'TMR011-A', 'Dan Sartain', 'Writer');
INSERT INTO songCredits VALUES ('TMR011-B-WRITER', 'TMR011-B', 'Dan Sartain', 'Writer');

/* TMR012 */
INSERT INTO artists VALUES ('Transit', 'T', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/transit.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/transit.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('John Scott Martin', 'JSM', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Jason D. Waters', 'JDW', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dasilva', 'JD', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dunn Jr.', 'JDJ', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('David Reedy', 'DR', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Sax', 'S', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Cynthia Whitehead', 'CW', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Dianne Hill', 'DH', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dunn Sr.', 'JDS', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Priscilla Barcous', 'PB', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Vileta Phillips', 'VP', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR012', 'Transit', 'C''mon And Ride', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr012-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr012-cover-ab.jpg', 0, '12 August 2009', 'Blue Series', 'https://thirdmanstore.com/transit-c-mon-and-ride-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:7J2zDIyWroAmDppwt1GWso');

INSERT INTO recordEditions VALUES ('TMR012-BLACK', 'TMR012', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr012-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR012-TRI-COLOR', 'TMR012', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr012-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR012-GLOW', 'TMR012', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR012-A', 'TMR012', 'C''mon And Ride', 'A');
INSERT INTO songs VALUES ('TMR012-B', 'TMR012', 'After Party', 'B');

INSERT INTO recordCredits VALUES ('TMR012-DESIGN', 'TMR012', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR012-ENGINEERING1', 'TMR012', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR012-ENGINEERING2', 'TMR012', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR012-MIXING1', 'TMR012', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR012-MIXING2', 'TMR012', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR012-BASS', 'TMR012', 'John Scott Martin', 'Bass');
INSERT INTO recordCredits VALUES ('TMR012-DRUMS', 'TMR012', 'Jason D. Waters', 'Drums');
INSERT INTO recordCredits VALUES ('TMR012-GUITAR', 'TMR012', 'James Dasilva', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR012-KEYBOARDS', 'TMR012', 'James Dunn Jr.', 'Keyboards');
INSERT INTO recordCredits VALUES ('TMR012-ORGAN', 'TMR012', 'James Dunn Jr.', 'Organ');
INSERT INTO recordCredits VALUES ('TMR012-RAP', 'TMR012', 'David Reedy', 'Rap');
INSERT INTO recordCredits VALUES ('TMR012-SAXOPHONE', 'TMR012', 'Sax', 'Saxophone');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS1', 'TMR012', 'Cynthia Whitehead', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS2', 'TMR012', 'Dianne Hill', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS3', 'TMR012', 'James Dunn Sr.', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS4', 'TMR012', 'John Scott Martin', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS5', 'TMR012', 'Priscilla Barcous', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-VOCALS6', 'TMR012', 'Vileta Phillips', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR012-PHOTOGRAPHY', 'TMR012', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR012-PRODUCING', 'TMR012', 'Jack White', 'Producing');

INSERT INTO songCredits VALUES ('TMR012-A-WRITER', 'TMR012-A', 'James Dunn Sr.', 'Writer');
INSERT INTO songCredits VALUES ('TMR012-B-WRITER1', 'TMR012-B', 'James Dunn Sr.', 'Writer');
INSERT INTO songCredits VALUES ('TMR012-B-WRITER2', 'TMR012-B', 'David Reedy', 'Writer');

INSERT INTO bandMembers VALUES ('TRANSIT-JOHNSCOTTMARTIN', 'Transit', 'John Scott Martin', 'Bass and Vocals');
INSERT INTO bandMembers VALUES ('TRANSIT-JASONDWATERS', 'Transit', 'Jason D. Waters', 'Drums');
INSERT INTO bandMembers VALUES ('TRANSIT-JAMESDASILVA', 'Transit', 'James Dasilva', 'Guitar');
INSERT INTO bandMembers VALUES ('TRANSIT-JAMESDUNNJR', 'Transit', 'James Dunn Jr.', 'Keyboards and Organ');
INSERT INTO bandMembers VALUES ('TRANSIT-DAVIDREEDY', 'Transit', 'David Reedy', 'Rap and Writing');
INSERT INTO bandMembers VALUES ('TRANSIT-SAX', 'Transit', 'Sax', 'Saxophone');
INSERT INTO bandMembers VALUES ('TRANSIT-CYNTHIAWHITEHEAD', 'Transit', 'Cynthia Whitehead', 'Vocals');
INSERT INTO bandMembers VALUES ('TRANSIT-DIANNEHILL', 'Transit', 'Dianne Hill', 'Vocals');
INSERT INTO bandMembers VALUES ('TRANSIT-JAMESDUNNSR', 'Transit', 'James Dunn Sr.', 'Vocals and Writing');
INSERT INTO bandMembers VALUES ('TRANSIT-PRISCILLABARCOUS', 'Transit', 'Priscilla Barcous', 'Vocals');
INSERT INTO bandMembers VALUES ('TRANSIT-VILETAPHILLIPS', 'Transit', 'Vileta Phillips', 'Vocals');