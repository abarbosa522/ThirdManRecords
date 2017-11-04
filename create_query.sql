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
	vault bit not null,
	release_date date not null,
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

INSERT INTO records VALUES ('TMR001', 'The Dead Weather', 'Hang You From The Heavens', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidth200200-tmr001-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr001-cover-ab.jpg', 0, '18 April 2009', 'Default', 'http://thirdmanstore.com/the-dead-weather-hang-you-from-the-heavens-7-vinyl', 'https://open.spotify.com/album/1IfM56OTFYFa0ZrbiGW0JZ');

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