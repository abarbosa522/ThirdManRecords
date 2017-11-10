DROP TABLE aliases;
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
INSERT INTO artists VALUES ('Mildred And The Mice', 'MAM', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/mildred-and-the-mice.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/mildred-and-the-mice.jpg', 'TMR Artist', 1);
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