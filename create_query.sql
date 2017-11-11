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
INSERT INTO artists VALUES ('Mildred And The Mice', 'MAM', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/mildred-and-the-mice.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/mildred-and-the-mice.jpg', 'Blue-Series Artist', 1);
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
INSERT INTO artists VALUES ('Rachelle Garniez', 'RG', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/rachelle-garniez.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/rachelle-garniez.jpg', 'Blue-Series Artist', 0);

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
