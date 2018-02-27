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
	description varchar(2000) not null,
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
INSERT INTO artists VALUES ('The Dead Weather', 'Born as a one-off collaboration between friends and tour mates, The Dead Weather has since evolved into one of the most vital and provocative bands in contemporary rock ''n'' roll. Together Jack White, Alison Mosshart, Dean Fertita, and Jack Lawrence have created a dark magic all their own, a heavy brew of melding heavy riffs, thick beats, and blues snarl with raw soul power and unrelenting sexual energy.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImage200200-the-dead-weather.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/the-dead-weather.jpg', 'TMR Artist', 1);
INSERT INTO artists VALUES ('Jack White', 'Born the youngest of ten children, raised in Southwest Detroit and a resident of Nashville since 2005, Jack White is one of the most prolific and renowned artists of the past fifteen years.\nWhen the White Stripes started in 1997, no one, least of all Jack, ever expected that a red-and-white two-piece band would take hold in the mainstream world. With the release of 2001’s White Blood Cells, the band was thrust on magazine covers and captivated audiences through worldwide touring. “Fell in Love With a Girl” served as the band’s breakthrough hit and its accompanying Michel Gondry Lego clip was chosen by Pitchfork Media as the #1 music video of the 2000’s.\nHe has also had success in other bands and as a solo artist. On April 24, 2012, White released his debut solo album, Blunderbuss. His second studio album, Lazaretto, was released on June 10, 2014. Both received wide commercial and critical acclaim.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/jack-white.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/jack-white.jpg', 'TMR Artist', 0);
INSERT INTO artists VALUES ('Alison Mosshart', 'Alison Nicole Mosshart started her musical career in 1995 with the Florida punk rock band Discount. She then co-founded The Kills with British guitarist Jamie Hince in 2000 in London. In The Kills'' first album, Mosshart was known by her stage name "VV" and Hince was known as "Hotel".\nIn early 2009, she joined the supergroup The Dead Weather, formed by Jack White, along with Jack Lawrence and Dean Fertita. With that band, her stage name is "Baby Ruthless".', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Alison_Nicole_Mosshart.jpg', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Alison_Nicole_Mosshart.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Dean Fertita', 'Dean Anthony Fertita is best known as a member of the hard rock band Queens of the Stone Age, and as the guitarist and keyboardist for The Dead Weather.\nFertita was the lead singer and guitarist of The Waxwings from the band''s formation in 1997 to its breakup in 2005. Fertita then moved on to collaborate with Brendan Benson, playing keyboards and guitar on Benson''s solo releases and as a touring keyboard player for The Raconteurs. In 2007, Fertita joined Queens of the Stone Age to replace the late Natasha Shneider on keyboards and occasionally guitar on some songs. In 2009, Fertita released his debut album as a solo artist.\nIn 2015, Fertita collaborated with his Queens of the Stone Age bandmate Josh Homme in recording Iggy Pop''s studio album, Post Pop Depression.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG/800px-14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG/800px-14-06-07_RiP_Queens_of_the_Stone_Age_Troy_van_Leeuwen_1.JPG', 'Other', 0);
INSERT INTO artists VALUES ('Jack Lawrence', '"Little" Jack Lawrence currently plays bass guitar in The Raconteurs, The Greenhornes, The Dead Weather and City and Colour as well as the autoharp and banjo in Blanche. He also guested on the theme song to the 2008 Bond film Quantum of Solace entitled "Another Way To Die", playing bass guitar and baritone guitar. Most recently, Lawrence contributed to the soundtrack of the Spike Jonze film "Where the Wild Things Are". He is uncredited but is one of the members of Karen O''s backup band for the album "Karen O and the Kids". He is also participated in Wanda Jackson''s album, "The Party Ain''t Over", which was produced by Jack White. Lawrence is currently on tour with City and Colour.', 'https://upload.wikimedia.org/wikipedia/commons/4/41/Jack_Lawrence%2C_Stockholm.jpg', 'https://upload.wikimedia.org/wikipedia/commons/4/41/Jack_Lawrence%2C_Stockholm.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Gary Numan', 'Gary Anthony James Webb was born in Hammersmith, West London. He first entered the music industry as lead singer of the new wave band Tubeway Army. After releasing two albums with the band, Numan released his debut solo album The Pleasure Principle in 1979.\nWith number-one singles "Are ''Friends'' Electric?" and "Cars", Numan achieved his peak of mainstream popularity in the late 1970s and early 1980s. His signature sound consists of heavy synthesiser hooks fed through guitar effects pedals, and he is considered a pioneer of commercial electronic music. Numan is also known for his distinctive voice and androgynous "android" persona.[', 'https://i.pinimg.com/736x/86/4d/7b/864d7baf2e6871c1f49cb79c4006bade--gary-numan-army.jpg', 'https://i.pinimg.com/736x/86/4d/7b/864d7baf2e6871c1f49cb79c4006bade--gary-numan-army.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Rob Jones', 'Rob Jones is responsible for the packaging design and layout of most records released at Third Man.', 'https://img.discogs.com/M93181wNV-MjaHniNbfT0aSjRMw=/500x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-235339-1276197773.jpeg.jpg', 'https://img.discogs.com/M93181wNV-MjaHniNbfT0aSjRMw=/500x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-235339-1276197773.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('George Ingram', 'George Ingram is the master engineer at Third Man.', 'https://img.discogs.com/91QYdd6luPvgFo5O5MAObjLsWaM=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-925545-1488028207-8887.jpeg.jpg', 'https://img.discogs.com/91QYdd6luPvgFo5O5MAObjLsWaM=/600x400/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-925545-1488028207-8887.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('David Swanson', 'David James Swanson is an American Photographer, born in Washington, D.C. a Pisces in 1981.\nAt 16, he picked up his first 35mm film camera. A few years later he was taught the black and white darkroom process while attending Grand Rapids Community College and got a job working as a Photo Lab Technician. During his days of education, Swanson photographed the music scene he was involved in. In 2007 he went to work as a commercial photographer in New York City.\nSwanson has photographed a wide variety of subjects over the years including musicians, fashion, advertising, sporting events, portraits and weddings. Recently, spending a year touring with Jack White, documenting his 2014 Lazaretto Tour.\nIn addition to photography Swanson is a musician. His band Whirlwind Heat has toured the world many times over, released more than a dozen published works. He is currently writing and recording for a new project.\nSwanson has done some video work as well. Directing and camera operating on many commercials, music videos and documentary movies.', 'http://jtw.up.seesaa.net/image/people_Swanson_1.jpg', 'http://jtw.up.seesaa.net/image/people_Swanson_1.jpg', 'Other', 0);

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
INSERT INTO artists VALUES ('The White Stripes', 'Here’s some facts you may or may not know about the White Stripes:\n- They are quite possibly the youngest band to have opened for both the Rolling Stones and the Pretty Things\n- They have appeared on the Late Late Show with Craig Kilborn, the Daily Show with John Stewart, the Late Show with David Letterman, Charlie Rose, Late Night with Conan O’Brien and Detroit PBS Backstage Pass.\n- They have released two films, both of which feature the words “under” and “lights” in the title.\n- They are almost certainly the only band to have ever played shows with Loretta Lynn, the Stooges, Porter Wagoner, Whirlwind Heat and Sleater-Kinney.\n- All six of their albums have at least one song with the word “little” in the title. They have performed in Iqaluit, Canada; Talinn, Estonia and Toledo, Ohio.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/the-white-stripes.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/the-white-stripes.jpg', 'TMR Artist', 1);
INSERT INTO artists VALUES ('Kevin Gray', 'Kevin Gray is a mastering and cutting engineer.', 'https://img.discogs.com/HoU2XHHcK5pbnBP5_VYl_ecQOic=/fit-in/342x368/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-312098-1419799369-3322.jpeg.jpg', 'https://img.discogs.com/HoU2XHHcK5pbnBP5_VYl_ecQOic=/fit-in/342x368/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-312098-1419799369-3322.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Steve Hoffman', 'Steve Hoffman is an audio engineer from Los Angeles, California, who is specialized in remastering sound recordings on compact disc and vinyl record.', 'https://img.discogs.com/JtupsLKh_FxjH4VCr0G8eGwFuW0=/fit-in/500x712/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-359096-1319395656.jpeg.jpg', 'https://img.discogs.com/JtupsLKh_FxjH4VCr0G8eGwFuW0=/fit-in/500x712/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-359096-1319395656.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Joe Chiccarelli', 'Born in Boston, producer Joe Chiccarelli got his first taste of the studio through a cousin who owned Boston''s Fleetwood Studio. Chiccarelli moved west in the late ''70s where he scored an assistant engineer gig at L.A.''s Cherokee Studios. As often happens within the studio world, Chiccarelli caught his break when he happened to be at the right place at the right time (or the wrong place at the wrong time, depending on who you ask). As Cherokee''s resident flack, Chiccarelli was assigned to assist difficult clients such as Frank Zappa, who was known for moodiness, being demanding, and keeping late hours. When Zappa''s main engineer got held up and couldn''t make it to the studio, Zappa upgraded Chiccarelli from assistant to engineer. The album Sheik Yerbouti was a giant step forward for the young studio man, and from there Chiccarelli went on to engineer several other Zappa discs, such as Joe''s Garage and Baby Snakes, as well as produce groups like Oingo Boingo and the American Music Club.', 'https://img.discogs.com/_Q4nOHfzBlC_cHnz8blhImibRNU=/333x343/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-147534-1406111038-4460.jpeg.jpg', 'https://img.discogs.com/_Q4nOHfzBlC_cHnz8blhImibRNU=/333x343/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-147534-1406111038-4460.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Lowell Reynolds', 'Recording engineer at Blackbird Studio, Nashville, TN.', 'https://pbs.twimg.com/profile_images/1649566380/Octoberfest3.jpg', 'https://pbs.twimg.com/profile_images/1649566380/Octoberfest3.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Meg White', 'Megan Martha White is an American drummer and occasional singer known for her work with Jack White in the Detroit rock duo The White Stripes. On an impulse, she played on Jack''s drums in 1997. The two decided to form a band and began performing two months later, calling themselves The White Stripes because of their last name and Meg''s affinity for peppermint candy. The band quickly became a Detroit underground favorite, before reaching national, then international fame. White has been nominated for various awards as a part of the White Stripes, and has received four Grammy Awards.\nHer drumming style has been called "primal" for its simplicity, and drew both praise and criticism from fans and critics. Her musical influences are wide and varied, with Bob Dylan being her favorite artist.\nWhile on tour in support for The White Stripes'' sixth studio album, Icky Thump, White suffered a bout of acute anxiety, and the remaining dates of the tour were cancelled. After a few public appearances, and a hiatus from recording, The White Stripes announced in February 2011 that they would be disbanding. White has not been active in the music industry since.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Meg_White_1.jpg/220px-Meg_White_1.jpg', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Meg_White_1.jpg/220px-Meg_White_1.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Autumn De Wilde', 'Autumn De Wilde was born in October 21st 1970 in Woodstock, New York, and is a photographer and director best known for her portraiture and photography of musicians.\nShe is the daughter of photographer Jerry de Wilde.', 'https://img.discogs.com/0vUTNBg2YPZqhJTLdvz099I1fF4=/600x439/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-545845-1318185469.jpeg.jpg', 'https://img.discogs.com/0vUTNBg2YPZqhJTLdvz099I1fF4=/600x439/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-545845-1318185469.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Regulo Aldama', 'Regulo Aldama is a trumpet player.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Corky Robbins', 'Corky Robbins was the stage name of Margaret Johnson Bosworth, a graduate of the College-Conservatory of Music (University of Cincinnati) who was apparently a popular performer on the radio and in nightclubs. In addition, she composed and performed as a duo with Johnny Bosworth. Together they recorded one other single for OKeh Records ["I Won''t Believe It" / "Oh How I Love You"] and were featured on two songs by Lucky Millinder & His Orchestra, "Loaded with Love" and "When I Gave You My Love". In 1955, Nat King Cole recorded the Corky Robbins-penned "Don''t Hurt the Girl" as a b-side to "My One Sin (In Life)". Later, as Margaret Johnson Bosworth, she composed a 45-minute work for children''s chorus, narrator, and solo baritone that premiered at the Cincinnati May Festival in 1960.\n"Whispering Winds" and "Conquest" were two of her most successful compositions. The later was covered by The White Stripes.', 'https://img.discogs.com/VGAuGfK0qKxLWKihR3_ZdvhZBKc=/333x627/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-831222-1448217909-4802.jpeg.jpg', 'https://img.discogs.com/VGAuGfK0qKxLWKihR3_ZdvhZBKc=/333x627/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-831222-1448217909-4802.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Jim Drury', 'Jim Drury plays the bagpipes.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR002', 'The White Stripes', 'Icky Thump', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr002-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr002-cover-ab.jpg', 1, '29 August 2009', 'Vault', 'Not Available', 'https://open.spotify.com/embed?uri=spotify:album:77dc8fS3O8FaQjhbNASpgM');

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
INSERT INTO artists VALUES ('Mildred And The Mice', 'A teenage goth from Mammoth Cave, Kentucky. A single chord and single minded lyrics about murdering mice coupled with the greatest scream ever committed to wax = teen punk garage classic.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/mildred-and-the-mice.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/mildred-and-the-mice.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('Tail', 'Tail is the mouse that plays the bass in the band "Mildred And The Mice".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Trap', 'Tail is the mouse that plays the drums in the band "Mildred And The Mice".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Mildred', 'The frontperson of the band "Mildred And The Mice". This mysterious teenager plays the guitar and is best known for her screaming capabilities.', 'https://img.discogs.com/JdywZaLjgGrTG7FsRMhUdggEbG4=/453x600/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2527841-1323379773.jpeg.jpg', 'https://img.discogs.com/JdywZaLjgGrTG7FsRMhUdggEbG4=/453x600/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-2527841-1323379773.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Squeak', 'Tail is the mouse that plays the guitar in the band "Mildred And The Mice".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Eric Cohn', 'Eric Cohn is a master engineer.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Vance Powell', 'Vance Powell is an American-four time Grammy Award winning record producer, engineer and mixer. His credits include Chris Stapleton, Jack White, Tyler Bryant & The Shakedown, The Raconteurs, The Dead Weather, The White Stripes, Arctic Monkeys, Wolfmother, Seasick Steve, Black Prairie, The Revivalists, Tinariwen, JEFF the Brotherhood, Daniel Ellsworth & The Great Lakes, and Martina McBride, among many others.', 'https://cps-static.rovicorp.com/3/JPG_400/MI0003/760/MI0003760698.jpg?partner=allrovi.com', 'https://cps-static.rovicorp.com/3/JPG_400/MI0003/760/MI0003760698.jpg?partner=allrovi.com', 'Other', 0);

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
INSERT INTO artists VALUES ('Rachelle Garniez', 'New York’s Rachelle Garniez is a haunting and poetic singer with an incredible vocal dynamic range and fingers that are at home both on the accordion and the piano.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/rachelle-garniez.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/rachelle-garniez.jpg', 'Blue Series Artist', 0);

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
INSERT INTO artists VALUES ('Joshua V. Smith', 'Engineer at Jack White''s studio Third Man Records. Originally from Kernersville, North Carolina. He moved to Nashville in 2006, where he became an assistant at Sputnik Sound, first under Mitch Dane and then Vance Powell.', 'http://www1.pictures.zimbio.com/gi/Joshua+V+Smith+md6iPkM5LJvm.jpg', 'http://www1.pictures.zimbio.com/gi/Joshua+V+Smith+md6iPkM5LJvm.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Wes Garland', 'Wes started working at Nashville Record Productions in 2006 and learned disc cutting from George Ingram. Since that time, he has worked on many reissue projects from Sony to Sundazed and has mastered the majority of Third Man Records catalog.', 'https://img.discogs.com/mLHXM6UXtDLCeH9NLM9pwMcjbUU=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2135761-1488028248-3878.jpeg.jpg', 'https://img.discogs.com/mLHXM6UXtDLCeH9NLM9pwMcjbUU=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2135761-1488028248-3878.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Van Morrison', 'Sir George Ivan Morrison is a Northern Irish singer-songwriter, instrumentalist and producer.\nKnown as "Van the Man", Morrison started his professional career when, as a teenager in the late 1950s, he played a variety of instruments including guitar, harmonica, keyboards and saxophone for various Irish showbands, covering the popular hits of that time. He rose to prominence in the mid-1960s as the lead singer of the Northern Irish R&B band Them, with whom he recorded the garage band classic "Gloria". His solo career began under the pop-hit oriented guidance of Bert Berns with the release of the hit single "Brown Eyed Girl" in 1967. After Berns'' death, Warner Bros. Records bought out his contract and allowed him three sessions to record Astral Weeks.\n"Moondance" established Morrison as a major artist and he built on his reputation throughout the 1970s with a series of acclaimed albums and live performances. He continues to record and tour, producing albums and live performances that sell well and are generally warmly received, sometimes collaborating with other artists, such as Georgie Fame and The Chieftains.\nMuch of Morrison''s music is structured around the conventions of soul music and R&B, such as the popular singles "Brown Eyed Girl", "Jackie Wilson Said (I''m in Heaven When You Smile)", "Domino" and "Wild Night".', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Van_morrison%2C_slieve_donard_2015.jpg', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Van_morrison%2C_slieve_donard_2015.jpg', 'Other', 0);

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
INSERT INTO artists VALUES ('Bob Dylan', 'Bob Dylan is an American singer-songwriter, author, and painter, who has been an influential figure in popular music and culture for more than five decades. Much of his most celebrated work dates from the 1960s, when he became a reluctant "voice of a generation" with songs such as "Blowin'' in the Wind" and "The Times They Are a-Changin''" that became anthems for the Civil Rights Movement and anti-war movement. In 1965, he controversially abandoned his early fan-base in the American folk music revival, recording a six-minute single, "Like a Rolling Stone", which enlarged the scope of popular music.\nDylan''s lyrics incorporate a wide range of political, social, philosophical, and literary influences. They defied existing pop-music conventions and appealed to the burgeoning counterculture. Initially inspired by the performances of Little Richard and the songwriting of Woody Guthrie, Robert Johnson, and Hank Williams, Dylan has amplified and personalized musical genres. In his recording career, Dylan has explored many of the traditions in American song—from folk, blues, and country to gospel, and rock and roll, and from rockabilly to English, Scottish, and Irish folk music, embracing even jazz and the Great American Songbook. Dylan performs on guitar, keyboards, and harmonica. Backed by a changing lineup of musicians, he has toured steadily since the late 1980s on what has been dubbed "the Never Ending Tour". His accomplishments as a recording artist and performer have been central to his career, but his songwriting is considered his greatest contribution.', 'https://tcjewfolk.com/wp-content/uploads//2017/09/bobdylan.jpg', 'https://tcjewfolk.com/wp-content/uploads//2017/09/bobdylan.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Philip J. Harvey', 'Engineer', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Ian Montone', 'Manager for various rock bands and founder of Monotone, Inc.', 'http://memberdata.s3.amazonaws.com/hi/hitsdd/photos/hitsdd_photo_gal__photo_1866442886.png', 'http://memberdata.s3.amazonaws.com/hi/hitsdd/photos/hitsdd_photo_gal__photo_1866442886.png', 'Other', 0);

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
INSERT INTO artists VALUES ('Dex Romweber Duo', 'Consists of Dex and Sara Romweber.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/dex-romweber-duo.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/dex-romweber-duo.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('Miles Johnson', 'Miles Johnson is the head designer of Third Man Records.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Sara Romweber', 'Sara Romweber is half of the Dex Romweber Duo and Dex Romweber''s older sister.', 'https://img.discogs.com/9i2PPEmxHTej4MT3mzSe6ThA6Yc=/600x399/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-749330-1359165979-4313.jpeg.jpg', 'https://img.discogs.com/9i2PPEmxHTej4MT3mzSe6ThA6Yc=/600x399/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-749330-1359165979-4313.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Brett Steele', 'Manager and founder of Steele Management.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Dexter Romweber', 'John Michael Dexter "Dex" Romweber is an American rockabilly/roots rock musician (primarily playing electric guitar) from Chapel Hill, North Carolina. Dex is best known as one-half of the seminal two-piece Flat Duo Jets. He currently fronts the Dex Romweber Duo with his older sister Sara Romweber.', 'https://img.discogs.com/j2iUhRpglaaQiav32EPK1xrTeaQ=/212x300/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-474212-1399044096-4740.jpeg.jpg', 'https://img.discogs.com/j2iUhRpglaaQiav32EPK1xrTeaQ=/212x300/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-474212-1399044096-4740.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Geechie Wiley', 'Geeshie Wiley was an American country blues singer and guitar player who may have been born Lillie Mae Scott. She recorded six songs for Paramount Records, issued on three records in 1930 and 1931. According to the blues historian Don Kent, Wiley "may well have been the rural South''s greatest female blues singer and musician".', 'https://img.discogs.com/Bn9GMTSdICbQvBhxBI_iB0nYRQQ=/335x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-516937-1511503864-2123.jpeg.jpg', 'https://img.discogs.com/Bn9GMTSdICbQvBhxBI_iB0nYRQQ=/335x380/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-516937-1511503864-2123.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Jo McCaughey', 'The official photographer of Third Man Records.', 'https://scontent.cdninstagram.com/vp/28446e60d01fc6786ddbc85fdde627a4/5ADCBE36/t51.2885-15/s640x640/sh0.08/e35/24332539_558513601207614_1666874763173167104_n.jpg', 'https://scontent.cdninstagram.com/vp/28446e60d01fc6786ddbc85fdde627a4/5ADCBE36/t51.2885-15/s640x640/sh0.08/e35/24332539_558513601207614_1666874763173167104_n.jpg', 'Other', 0);

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
INSERT INTO recordCredits VALUES ('TMR009-ORGAN', 'TMR009', 'Dexter Romweber', 'Organ');

INSERT INTO songCredits VALUES ('TMR009-A-WRITER', 'TMR009-A', 'Dexter Romweber', 'Writer');
INSERT INTO songCredits VALUES ('TMR009-B-WRITER', 'TMR009-B', 'Geechie Wiley', 'Writer');

INSERT INTO bandMembers VALUES ('DEXROMWEBERDUO-DEXTERROMWEBER', 'Dex Romweber Duo', 'Dexter Romweber', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('DEXROMWEBERDUO-SARAROMWEBER', 'Dex Romweber Duo', 'Sara Romweber', 'Drums');

/* TMR010 */
INSERT INTO artists VALUES ('Bobby Liebling', 'The only constant member, and vocalist, of the band "Pentagram".', 'https://img.discogs.com/vJYbUCL2nT2-ivlNU2BoRMaRNhI=/430x286/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-568439-1334566082.png.jpg', 'https://img.discogs.com/vJYbUCL2nT2-ivlNU2BoRMaRNhI=/430x286/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-568439-1334566082.png.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Arthur Keith Evans', 'Bassist of the band "Downliners Sect".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Michael O''Donnell', 'Michael O''Donnell, widely known as Don Craine, is the main vocalist and guitarist of the band "Downliners Sect".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR010', 'The Dead Weather', 'Forever My Queen', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr010-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr010-cover-ab.jpg', 1, '29 August 2009', 'Vault', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR010-BLACK', 'TMR010', 'Black', 'Undisclosed', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR010-black-ab.jpg');

INSERT INTO songs VALUES ('TMR010-A', 'TMR010', 'Forever My Queen', 'A');
INSERT INTO songs VALUES ('TMR010-B', 'TMR010', 'Outside', 'B');

INSERT INTO songCredits VALUES ('TMR010-A-WRITER', 'TMR010-A', 'Bobby Liebling', 'Writer');
INSERT INTO songCredits VALUES ('TMR010-B-WRITER1', 'TMR010-B', 'Arthur Keith Evans', 'Writer');
INSERT INTO songCredits VALUES ('TMR010-B-WRITER2', 'TMR010-B', 'Michael O''Donnell', 'Writer');

/* TMR011 */
INSERT INTO artists VALUES ('Dan Sartain', 'Dan Sartain started out in 2001 self-producing and self-releasing his first two albums, "Crimson Guard" and "Romance in Stereo", before moving to Swami Records for the groundbreaking "Dan Sartain vs. The Serpientes" and "Join Dan Sartain". He’s been called the no-wave Johnny Cash, and although it’s a title with a lot of flash, it’s also somewhat misleading. Comparisons to Johnny Cash are inevitably futile. But what Dan is is another vital link in the rock and roll visionary chain stretching from Rufus Thomas to Glenn Danzig to O.D.B. He’s a fiercely independent romantic like no other.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/dan-sartain.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/dan-sartain.jpg', 'Blue Series Artist', 0);
INSERT INTO artists VALUES ('Matt Patton', 'Matt Patton is the bassist of Dan Sartain and is also part of the Drive-By Truckers and The Dexateens.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Adam Renshaw', 'Adam Renshaw is the drummer of Dan Sartain and is part of The Forty-Fives.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

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
INSERT INTO artists VALUES ('Transit', 'Transit is a band whose membership is composed entirely of employees of the Nashville Metro Transit Authority. They are part of a long-standing folk tradition of people coming together to make something beautiful out of a shared external circumstance. From the Detroit Sanitary Worker’s Band or the American Watch Company Band, there is deep history of music that reflects employee’s shared experiences and brings them to the wider attention of the public at large.', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/_resampled/CroppedImageWzE3NSwxNzVd/transit.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/ArtistPhotos/transit.jpg', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('John Scott Martin', 'Bassist of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Jason D. Waters', 'Drummer of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dasilva', 'Guitar player of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dunn Jr.', 'Organ player and writer of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('David Reedy', 'Vocalist (rapper) and writer of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Sax', 'Saxophone player of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Cynthia Whitehead', 'Vocalist of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Dianne Hill', 'Vocalist of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('James Dunn Sr.', 'Vocalist and writer of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Priscilla Barcous', 'Vocalist of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Vileta Phillips', 'Vocalist of the band "Transit".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

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

/* TMR013 */	
INSERT INTO artists VALUES ('Joel Dougherty', 'Joel Dougherty was the lead sound mixer of the movie "It Might Get Loud".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Tim LeBlanc', 'Tim LeBlanc was the assistant sound mixer of the movie "It Might Get Loud".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Skip Lievsay', 'Skip Lievsay worked as a sound mixer in the movie "It Might Get Loud".', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Davis Guggenheim', 'Philip Davis Guggenheim is an American film and television director and producer. His credits include NYPD Blue, ER, 24, Alias, The Shield, Deadwood, and the documentaries An Inconvenient Truth, The Road We''ve Traveled, Waiting for ''Superman'' and He Named Me Malala. Since 2006, Guggenheim is the only filmmaker to release three different documentaries that were ranked within the top 100 highest-grossing documentaries of all time (An Inconvenient Truth, It Might Get Loud, and Waiting for "Superman").', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR013', 'Jack White', 'Fly Farm Blues', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr013-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr013-cover-ab.jpg', 0, '24 August 2009', 'Default', 'https://thirdmanstore.com/jack-white-fly-farm-blues-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:4JPyNPhqpmCqYcTd1ulC2k');

INSERT INTO recordEditions VALUES ('TMR013-BLACK', 'TMR013', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr013-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR013-TRI-COLOR', 'TMR013', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr013-tricolor-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR013-GLOW', 'TMR013', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR013-A', 'TMR013', 'Fly Farm Blues', 'A');

INSERT INTO recordCredits VALUES ('TMR013-DESIGN', 'TMR013', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR013-MIXING1', 'TMR013', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR013-MIXING2', 'TMR013', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR013-MIXING3', 'TMR013', 'Joel Dougherty', 'Mixing (For Film)');
INSERT INTO recordCredits VALUES ('TMR013-MIXING4', 'TMR013', 'Tim LeBlanc', 'Mixing (For Film)');
INSERT INTO recordCredits VALUES ('TMR013-MIXING5', 'TMR013', 'Skip Lievsay', 'Mixing (For Film)');
INSERT INTO recordCredits VALUES ('TMR013-PHOTOGRAPHY', 'TMR013', 'Davis Guggenheim', 'Mixing (For Film)');
INSERT INTO recordCredits VALUES ('TMR013-PRODUCING', 'TMR013', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR013-WRITING', 'TMR013', 'Jack White', 'Writing');
INSERT INTO recordCredits VALUES ('TMR013-PERFORMING', 'TMR013', 'Jack White', 'Performing');
INSERT INTO recordCredits VALUES ('TMR013-RECORDING', 'TMR013', 'Jack White', 'Recording');

/* TMR014 */
INSERT INTO artists VALUES ('The Raconteurs', 'The Raconteurs, also known as The Saboteurs in Australia, is an American rock supergroup that was formed in Detroit, Michigan, featuring four musicians associated with earlier musical projects: Jack White (The White Stripes, The Dead Weather and solo), Brendan Benson (solo), Jack Lawrence (The Greenhornes, Blanche and The Dead Weather), and Patrick Keeler (The Greenhornes).', 'https://thirdmanstore.com/pub/media/catalog/category/The-Raconteurs_mm.png', 'https://thirdmanstore.com/pub/media/catalog/category/The-Raconteurs_mm.png', 'TMR Artist', 1);
INSERT INTO artists VALUES ('Brendan Benson', 'Described by Clash Music as “one of America’s best songwriters”, Brendan Benson has consistently unfurled unparalleled melodies and lyrics in his acclaimed career. Over twenty years in, he’s still wowing folks and “Half a Boy, Half a Man” is a powerful dollop of power chords wrapped into a tale of split personalities. Backed with an astute cover of Jules Shear’s “Big Kid Face” from his 1989 album “The Third Party” in which Benson helps shine a light on this oft-overlooked but seminal songwriter. “Half a Boy (and Half a Man) was one of the last songs to be recorded in my Nashville based recording studio before it was completely demolished and made into a parking lot, but it is a personal comeback for me,” says Benson of the new songs, “I’ve been producing and co-writing so much that I kinda lost sight of myself. Making this album has brought me home again.”\nBest known as half of the songwriting team at the heart of the Raconteurs (along with Jack White) Brendan Benson’s career has never slowed across six solo albums, two Raconteurs full-lengths, countless collaborations and placements and a seat as one of the most respected and reliable writer, performers, producer, engineer and musical jack-of-all-trades. Despite his long history in the label family, this is the first time Benson will have a release on Third Man Records as a solo artist.', 'http://sodajerker.com/wp-content/uploads/2012/11/brendanbenson.jpg', 'http://sodajerker.com/wp-content/uploads/2012/11/brendanbenson.jpg', 'TMR Artist', 0);
INSERT INTO artists VALUES ('Patrick Keeler', 'Patrick Keeler is an American rock music drummer from Cincinnati, who is best known for playing in The Greenhornes, The Raconteurs and The Afghan Whigs. He plays with both traditional and matched grips.', 'https://artists.ludwig-musser.com/application/files/7314/9134/1369/keeler_patrick_1.jpg', 'https://artists.ludwig-musser.com/application/files/7314/9134/1369/keeler_patrick_1.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Adam Hill', 'Assistant mixing engineer.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('John Hampton', 'Mixing engineer.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Vlado Meller', 'Vlado Meller is an american mastering engineer of Slovak origin. Meller began his career at Columbia Studios in New York in 1969, continuing to work there after Sony Music took CBS over in the 1980s and becoming an integral part of the Sony Music Studios, New York City operation until its closure in 2007. From 2007 to 2011, Meller held the position of senior mastering engineer at Universal Mastering Studios-East in New York, overseeing all of the studios'' projects in the city. He currently lives and works in Charleston, S.C. He is a two-time Grammy Award winner and ten-time nominee.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Matthew Kettle', 'Studio recorder.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Aleksey Shirokov', 'Typographer.', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR014', 'The Raconteurs', 'Broken Boy Soldiers', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr014-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr014-cover-ab.jpg', 0, '17 April 2010', 'Default', 'https://thirdmanstore.com/broken-boy-soldiers', 'https://open.spotify.com/embed?uri=spotify:album:0ftyDJlAoBMmICs2MHvVZR');

INSERT INTO recordEditions VALUES ('TMR014-BLACK', 'TMR014', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr014-black-1ab.jpg');
INSERT INTO recordEditions VALUES ('TMR014-COPPER', 'TMR014', 'Copper', '300', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR014-colored-ab.jpg');

INSERT INTO songs VALUES ('TMR014-A1', 'TMR014', 'Steady, As She Goes', 'A1');
INSERT INTO songs VALUES ('TMR014-A2', 'TMR014', 'Hands', 'A2');
INSERT INTO songs VALUES ('TMR014-A3', 'TMR014', 'Broken Boy Soldier', 'A3');
INSERT INTO songs VALUES ('TMR014-A4', 'TMR014', 'Intimate Secretary', 'A4');
INSERT INTO songs VALUES ('TMR014-A5', 'TMR014', 'Together', 'A5');
INSERT INTO songs VALUES ('TMR014-B1', 'TMR014', 'Level', 'B1');
INSERT INTO songs VALUES ('TMR014-B2', 'TMR014', 'Store Bought Bones', 'B2');
INSERT INTO songs VALUES ('TMR014-B3', 'TMR014', 'Yellow Sun', 'B3');
INSERT INTO songs VALUES ('TMR014-B4', 'TMR014', 'Call It A Day', 'B4');
INSERT INTO songs VALUES ('TMR014-B5', 'TMR014', 'Blue Veins', 'B5');

INSERT INTO recordCredits VALUES ('TMR014-BASS', 'TMR014', 'Jack Lawrence', 'Bass');
INSERT INTO recordCredits VALUES ('TMR014-DESGIN', 'TMR014', 'Patrick Keeler', 'Design');
INSERT INTO recordCredits VALUES ('TMR014-DRUMS', 'TMR014', 'Patrick Keeler', 'Drums');
INSERT INTO recordCredits VALUES ('TMR014-ENGINEERING1', 'TMR014', 'Adam Hill', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR014-ENGINEERING2', 'TMR014', 'John Hampton', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR014-MANAGEMENT', 'TMR014', 'Ian Montone', 'Management');
INSERT INTO recordCredits VALUES ('TMR014-MASTERING', 'TMR014', 'Vlado Meller', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR014-MIXING', 'TMR014', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR014-PHOTOGRAPHY', 'TMR014', 'Autumn De Wilde', 'Photography');
INSERT INTO recordCredits VALUES ('TMR014-PRODUCING1', 'TMR014', 'Brendan Benson', 'Producing');
INSERT INTO recordCredits VALUES ('TMR014-PRODUCING2', 'TMR014', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR014-RECORDING1', 'TMR014', 'Brendan Benson', 'Recording');
INSERT INTO recordCredits VALUES ('TMR014-RECORDING2', 'TMR014', 'Matthew Kettle', 'Recording');
INSERT INTO recordCredits VALUES ('TMR014-TYPOGRAPHY', 'TMR014', 'Aleksey Shirokov', 'Typography');
INSERT INTO recordCredits VALUES ('TMR014-VOCALS1', 'TMR014', 'Brendan Benson', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR014-GUITAR1', 'TMR014', 'Brendan Benson', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR014-KEYBOARDS', 'TMR014', 'Brendan Benson', 'Keyboards');
INSERT INTO recordCredits VALUES ('TMR014-VOCALS2', 'TMR014', 'Jack White', 'Vocals');
INSERT INTO recordCredits VALUES ('TMR014-GUITAR2', 'TMR014', 'Jack White', 'Guitar');
INSERT INTO recordCredits VALUES ('TMR014-SYNTHESIZER', 'TMR014', 'Jack White', 'Synthesizer');
INSERT INTO recordCredits VALUES ('TMR014-WRITING1', 'TMR014', 'Brendan Benson', 'Writing');
INSERT INTO recordCredits VALUES ('TMR014-WRITING2', 'TMR014', 'Jack White', 'Writing');

INSERT INTO bandMembers VALUES ('THERACONTEURS-JACKWHITE', 'The Raconteurs', 'Jack White', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('THERACONTEURS-BRENDANBENSON', 'The Raconteurs', 'Brendan Benson', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('THERACONTEURS-JACKLAWRENCE', 'The Raconteurs', 'Jack Lawrence', 'Bass');
INSERT INTO bandMembers VALUES ('THERACONTEURS-PARTICKKEELER', 'The Raconteurs', 'Patrick Keeler', 'Drums');

/* TMR015 */
INSERT INTO artists VALUES ('Andrew Mendelson', 'AM', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Daniel Bacigalupi', 'DB', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('John Baldwin', 'JB', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Natthanphol Abhigantaphand', 'NA', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Shelley Anderson', 'SA', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Pepe Guizar', 'PG', 'https://img.discogs.com/K82Fh6vTiUEYpu2c6WzFP_WCV8E=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-933911-1365940525-4335.jpeg.jpg', 'https://img.discogs.com/K82Fh6vTiUEYpu2c6WzFP_WCV8E=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-933911-1365940525-4335.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Dolly Parton', 'DP', 'https://img.discogs.com/B4nz-B7K8t-45TtAZ8wnWnKLQSw=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-39776-1392411962-6171.jpeg.jpg', 'https://img.discogs.com/B4nz-B7K8t-45TtAZ8wnWnKLQSw=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-39776-1392411962-6171.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Burt Bacharach And Hal David', 'BBAHD', 'https://img.discogs.com/p34eyvhv5bDgavL04wM0kl3kXCs=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-142502-1254149945.jpeg.jpg', 'https://img.discogs.com/p34eyvhv5bDgavL04wM0kl3kXCs=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-142502-1254149945.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR015', 'The White Stripes', 'Under Great White Northern Lights', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr015-standalone-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr015-standalone-ab.jpg', 0, '16 March 2010', 'Default', 'https://thirdmanstore.com/under-great-white-northern-lights-double-lp', 'https://open.spotify.com/embed?uri=spotify:album:3ceMHqU0n0gNEEBUKLNH2B');

INSERT INTO recordEditions VALUES ('TMR015-BLACK', 'TMR015', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr015-black-1ab.jpg');

INSERT INTO songs VALUES ('TMR015-A1', 'TMR015', 'Let''s Shake Hands', 'A1');
INSERT INTO songs VALUES ('TMR015-A2', 'TMR015', 'Black Math', 'A2');
INSERT INTO songs VALUES ('TMR015-A3', 'TMR015', 'Little Ghost', 'A3');
INSERT INTO songs VALUES ('TMR015-A4', 'TMR015', 'Blue Orchid', 'A4');
INSERT INTO songs VALUES ('TMR015-A5', 'TMR015', 'The Union Forever', 'A5');
INSERT INTO songs VALUES ('TMR015-B1', 'TMR015', 'Ball And Biscuit', 'B1');
INSERT INTO songs VALUES ('TMR015-B2', 'TMR015', 'Icky Thump', 'B2');
INSERT INTO songs VALUES ('TMR015-B3', 'TMR015', 'I''m Slowly Turning Into You', 'B3');
INSERT INTO songs VALUES ('TMR015-C1', 'TMR015', 'Jolene', 'C1');
INSERT INTO songs VALUES ('TMR015-C2', 'TMR015', '300 M.P.H. Torrential Outpour Blues', 'C2');
INSERT INTO songs VALUES ('TMR015-C3', 'TMR015', 'We Are Going To Be Friends', 'C3');
INSERT INTO songs VALUES ('TMR015-C4', 'TMR015', 'I Just Don''t Know What To Do With Myself', 'C4');
INSERT INTO songs VALUES ('TMR015-D1', 'TMR015', 'Prickly Thorn, But Sweetly Worn', 'D1');
INSERT INTO songs VALUES ('TMR015-D2', 'TMR015', 'Fell In Love With A Girl', 'D2');
INSERT INTO songs VALUES ('TMR015-D3', 'TMR015', 'When I Hear My Name', 'D3');
INSERT INTO songs VALUES ('TMR015-D4', 'TMR015', 'Seven Nation Army', 'D4');

INSERT INTO recordCredits VALUES ('TMR015-DESIGN1', 'TMR015', 'Rob Jones', 'Design');
INSERT INTO recordCredits VALUES ('TMR015-LAYOUT1', 'TMR015', 'Rob Jones', 'Layout');
INSERT INTO recordCredits VALUES ('TMR015-DESIGN2', 'TMR015', 'Jack White', 'Design');
INSERT INTO recordCredits VALUES ('TMR015-LAYOUT2', 'TMR015', 'Jack White', 'Layout');
INSERT INTO recordCredits VALUES ('TMR015-MANAGEMENT', 'TMR015', 'Ian Montone', 'Management');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING1', 'TMR015', 'Andrew Mendelson', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING2', 'TMR015', 'Daniel Bacigalupi', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING3', 'TMR015', 'John Baldwin', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING4', 'TMR015', 'Natthanphol Abhigantaphand', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING5', 'TMR015', 'Shelley Anderson', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MASTERING6', 'TMR015', 'Wes Garland', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR015-MIXING1', 'TMR015', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR015-MIXING2', 'TMR015', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR015-MIXING3', 'TMR015', 'Lowell Reynolds', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR015-PERFORMING1', 'TMR015', 'Jack White', 'Performing');
INSERT INTO recordCredits VALUES ('TMR015-PERFORMING2', 'TMR015', 'Meg White', 'Performing');
INSERT INTO recordCredits VALUES ('TMR015-PHOTOGRAPHY', 'TMR015', 'Autumn De Wilde', 'Photography');
INSERT INTO recordCredits VALUES ('TMR015-PRODUCING', 'TMR015', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR015-REDCORDING', 'TMR015', 'Philip J. Harvey', 'Recording');
INSERT INTO recordCredits VALUES ('TMR015-WRITING', 'TMR015', 'Jack White', 'Writing');

INSERT INTO songCredits VALUES ('TMR015-A5-WRITER', 'TMR015-A5', 'Pepe Guizar', 'Writer');
INSERT INTO songCredits VALUES ('TMR015-C1-WRITER', 'TMR015-C1', 'Dolly Parton', 'Writer');
INSERT INTO songCredits VALUES ('TMR015-C4-WRITER', 'TMR015-C4', 'Burt Bacharach And Hal David', 'Writer');

/* TMR0016 */
INSERT INTO artists VALUES ('Bob Ludwig', 'BL', 'https://img.discogs.com/HyxDpkjODl6BsU_1GouxA9SvBB4=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-271098-1445854232-4849.jpeg.jpg', 'https://img.discogs.com/HyxDpkjODl6BsU_1GouxA9SvBB4=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-271098-1445854232-4849.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Bob Markley', 'BM', 'https://img.discogs.com/CEBWz0QnirQ7n60Phrf-MW5flXo=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-324385-1504370944-7248.jpeg.jpg', 'https://img.discogs.com/CEBWz0QnirQ7n60Phrf-MW5flXo=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-324385-1504370944-7248.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Ronald Morgan', 'RM', 'https://img.discogs.com/fzu-jABvrbB1b_66x9dCwtifRfg=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1037192-1504370696-4178.jpeg.jpg', 'https://img.discogs.com/fzu-jABvrbB1b_66x9dCwtifRfg=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1037192-1504370696-4178.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR016', 'The Dead Weather', 'I Cut Like A Buffalo', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr016-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr016-cover-ab.jpg', 0, '26 October 2009', 'Default', 'https://thirdmanstore.com/the-dead-weather-i-cut-like-a-buffalo-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:5JYABBoexcK2gotg9YfsP1');

INSERT INTO recordEditions VALUES ('TMR016-BLACK', 'TMR016', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr016-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR016-GLOW', 'TMR016', 'Glow', '100', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/TMR-glow7inch-abfull.jpg');

INSERT INTO songs VALUES ('TMR016-A', 'TMR016', 'I Cut Like A Buffalo', 'A');
INSERT INTO songs VALUES ('TMR016-B', 'TMR016', 'A Child Of A Few Hours Is Burning To Death', 'B');

INSERT INTO recordCredits VALUES ('TMR016-DESIGN1', 'TMR016', 'Rob Jones', 'Design');
INSERT INTO recordCredits VALUES ('TMR016-DESIGN2', 'TMR016', 'Jack White', 'Design');
INSERT INTO recordCredits VALUES ('TMR016-ENGINEERING1', 'TMR016', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR016-ENGINEERING2', 'TMR016', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR016-LACQUERCUT1', 'TMR016', 'George Ingram', 'Lacquer Cut');
INSERT INTO recordCredits VALUES ('TMR016-LACQUERCUT2', 'TMR016', 'Wes Garland', 'Lacquer Cut');
INSERT INTO recordCredits VALUES ('TMR016-MIXING1', 'TMR016', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR016-MIXING2', 'TMR016', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR016-PHOTOGRAPHY', 'TMR016', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR016-PRODUCING', 'TMR016', 'Jack White', 'Producing');

INSERT INTO songCredits VALUES ('TMR016-A-MASTERING', 'TMR016-A', 'Bob Ludwig', 'Mastering');
INSERT INTO songCredits VALUES ('TMR016-A-WRITER', 'TMR016-A', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR016-B-MASTERING', 'TMR016-B', 'Andrew Mendelson', 'Mastering');
INSERT INTO songCredits VALUES ('TMR016-B-WRITER1', 'TMR016-B', 'Bob Markley', 'Writer');
INSERT INTO songCredits VALUES ('TMR016-B-WRITER2', 'TMR016-B', 'Ronald Morgan', 'Writer');

/* TMR017 */
INSERT INTO artists VALUES ('Terry Gilkyson', 'TG', 'https://img.discogs.com/WRjt_MCgc56VGjkjlwie60Az4YA=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-369576-1265728656.jpeg.jpg', 'https://img.discogs.com/WRjt_MCgc56VGjkjlwie60Az4YA=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-369576-1265728656.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR017', 'The White Stripes', 'Let''s Shake Hands', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr017-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr017-cover-ab.jpg', 1, '21 December 2009', 'Vault', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR017-BLACK', 'TMR017', 'Black', 'Undisclosed', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr017-cover-ab.jpg');

INSERT INTO songs VALUES ('TMR017-A', 'TMR017', 'Let''s Shake Hands (Alternate Take)', 'A');
INSERT INTO songs VALUES ('TMR017-B', 'TMR017', 'Look Me Over Closely', 'B');

INSERT INTO recordCredits VALUES ('TMR017-LACQUERCUT', 'TMR017', 'Wes Garland', 'Lacquer Cut');

INSERT INTO songCredits VALUES ('TMR017-A-WRITER', 'TMR017-A', 'Jack White', 'Writer');
INSERT INTO songCredits VALUES ('TMR017-B-WRITER', 'TMR017-B', 'Terry Gilkyson', 'Writer');

/* TMR018 */
INSERT INTO artists VALUES ('Charley Jordan', 'CJ', 'https://img.discogs.com/bM4jF9bu-63I2zVsO3_AkNaF36M=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-666103-1291752221.png.jpg', 'https://img.discogs.com/bM4jF9bu-63I2zVsO3_AkNaF36M=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-666103-1291752221.png.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Terry Reid', 'TR', 'https://img.discogs.com/W_C0RkIlMJfGkMp6xg1T9mXqBFc=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-288874-1506567857-3688.jpeg.jpg', 'https://img.discogs.com/W_C0RkIlMJfGkMp6xg1T9mXqBFc=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-288874-1506567857-3688.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Chester Burnett', 'CB', 'https://img.discogs.com/IDOAjtwVx-wfXY8zpmqXlDyU5QE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-682348-1198727770.jpeg.jpg', 'https://img.discogs.com/IDOAjtwVx-wfXY8zpmqXlDyU5QE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-682348-1198727770.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Willie Dixon', 'WD', 'https://img.discogs.com/ytwPwZ_C_PyESWXGlShGjEDFztQ=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-166684-1516295579-4746.jpeg.jpg', 'https://img.discogs.com/ytwPwZ_C_PyESWXGlShGjEDFztQ=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-166684-1516295579-4746.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR018', 'The Raconteurs', 'Live In London', 12, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr018-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr018-cover-ab.jpg', 1, '21 December 2009', 'Vault', 'Not Available', 'Not Available');

INSERT INTO recordEditions VALUES ('TMR018-BLACK', 'TMR018', 'Black', 'Undisclosed', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr018-black-1ab.jpg');

INSERT INTO songs VALUES ('TMR018-A1', 'TMR018', 'Intro', 'A1');
INSERT INTO songs VALUES ('TMR018-A2', 'TMR018', 'Consoler Of The Lonely', 'A2');
INSERT INTO songs VALUES ('TMR018-A3', 'TMR018', 'The Switch And The Spur', 'A3');
INSERT INTO songs VALUES ('TMR018-A4', 'TMR018', 'You Don''t Understand Me', 'A4');
INSERT INTO songs VALUES ('TMR018-A5', 'TMR018', 'Top Yourself', 'A5');
INSERT INTO songs VALUES ('TMR018-B1', 'TMR018', 'Old Enough', 'B1');
INSERT INTO songs VALUES ('TMR018-B2', 'TMR018', 'Hold Up', 'B2');
INSERT INTO songs VALUES ('TMR018-B3', 'TMR018', 'Keep It Clean', 'B3');
INSERT INTO songs VALUES ('TMR018-B4', 'TMR018', 'Level', 'B4');
INSERT INTO songs VALUES ('TMR018-B5', 'TMR018', 'Steady As She Goes', 'B5');
INSERT INTO songs VALUES ('TMR018-C1', 'TMR018', 'Rich Kid Blues', 'C1');
INSERT INTO songs VALUES ('TMR018-C2', 'TMR018', 'Blue Veins', 'C2');
INSERT INTO songs VALUES ('TMR018-C3', 'TMR018', 'Many Shades Of Black', 'C3');
INSERT INTO songs VALUES ('TMR018-D1', 'TMR018', 'Little Red Rooster', 'D1');
INSERT INTO songs VALUES ('TMR018-D2', 'TMR018', 'Intimate Secretary', 'D2');
INSERT INTO songs VALUES ('TMR018-D3', 'TMR018', 'Salute Your Solution', 'D3');
INSERT INTO songs VALUES ('TMR018-D4', 'TMR018', 'Carolina Drama', 'D4');

INSERT INTO recordCredits VALUES ('TMR018-ARTDIRECTION', 'TMR018', 'Patrick Keeler', 'Art Direction');
INSERT INTO recordCredits VALUES ('TMR018-ENGINEERING', 'TMR018', 'Philip J. Harvey', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR018-LAYOUT', 'TMR018', 'Miles Johnson', 'Layout');
INSERT INTO recordCredits VALUES ('TMR018-MASTERING', 'TMR018', 'Wes Garland', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR018-MIXING', 'TMR018', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR018-PHOTOGRAPHY', 'TMR018', 'Autumn De Wilde', 'Photography');

INSERT INTO songCredits VALUES ('TMR018-A2-WRITER', 'TMR018-A2', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-A3-WRITER', 'TMR018-A3', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-A4-WRITER', 'TMR018-A4', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-A5-WRITER', 'TMR018-A5', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-B1-WRITER', 'TMR018-B1', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-B2-WRITER', 'TMR018-B2', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-B3-WRITER', 'TMR018-B3', 'Charley Jordan', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-B4-WRITER', 'TMR018-B4', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-B5-WRITER', 'TMR018-B5', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-C1-WRITER', 'TMR018-C1', 'Terry Reid', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-C2-WRITER', 'TMR018-C2', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-C3-WRITER', 'TMR018-C3', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-D1-WRITER1', 'TMR018-D1', 'Chester Burnett', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-D1-WRITER2', 'TMR018-D1', 'Willie Dixon', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-D2-WRITER', 'TMR018-D2', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-D3-WRITER', 'TMR018-D3', 'The Raconteurs', 'Writer');
INSERT INTO songCredits VALUES ('TMR018-D4-WRITER', 'TMR018-D4', 'The Raconteurs', 'Writer');

/* TMR019 */
/* COMING SOON */

/* TMR020 */
INSERT INTO artists VALUES ('Carl Sagan', 'CS', 'https://img.discogs.com/qMLdAtV76DYpHyaEiXo29Vgen84=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1622298-1258592093.jpeg.jpg', 'https://img.discogs.com/qMLdAtV76DYpHyaEiXo29Vgen84=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1622298-1258592093.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Stephen Hawking', 'SH', 'https://img.discogs.com/ikCfr5i3O2mOkcsnwaoLjwDgt2Q=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-513542-1258592347.jpeg.jpg', 'https://img.discogs.com/ikCfr5i3O2mOkcsnwaoLjwDgt2Q=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-513542-1258592347.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('John Boswell', 'JB', 'https://img.discogs.com/KurARwH3TaWP3W6qaRqkO63CGls=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1623411-1295917859.jpeg.jpg', 'https://img.discogs.com/KurARwH3TaWP3W6qaRqkO63CGls=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1623411-1295917859.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR020', 'Carl Sagan', 'A Glorious Dawn', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr020-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr020-cover-ab.jpg', 0, '9 November 2009', 'Default', 'https://thirdmanstore.com/carl-sagan-a-glorious-dawn-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:4eLoJw7WGTBZxziLK0EApA');

INSERT INTO recordEditions VALUES ('TMR020-BLACK', 'TMR020', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr020-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR020-COSMOS', 'TMR020', 'Cosmos', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr020-cosmos-ab.jpg');

INSERT INTO songs VALUES ('TMR020-A', 'TMR020', 'A Glorious Dawn', 'A');

INSERT INTO recordCredits VALUES ('TMR020-VOICE1', 'TMR020', 'Carl Sagan', 'Voice');
INSERT INTO recordCredits VALUES ('TMR020-VOICE2', 'TMR020', 'Stephen Hawking', 'Voice');
INSERT INTO recordCredits VALUES ('TMR020-WRITER', 'TMR020', 'John Boswell', 'Writer');
INSERT INTO recordCredits VALUES ('TMR020-ELECTRONICS', 'TMR020', 'John Boswell', 'Electronics');

/* TMR021 */
INSERT INTO artists VALUES ('The Smoke Fairies', 'TSF', 'https://lh3.googleusercontent.com/-Y2BkmIxKOac/U0vXagZd46I/AAAAAAAAAI0/mlbZoIvMKM4V8yx12rdKUGBoaLlpAevAwCHMYBhgL/s768/Smoke%2BFairies%2BNEW%2BNINE%2BFINAL.JPG', 'https://lh3.googleusercontent.com/-Y2BkmIxKOac/U0vXagZd46I/AAAAAAAAAI0/mlbZoIvMKM4V8yx12rdKUGBoaLlpAevAwCHMYBhgL/s768/Smoke%2BFairies%2BNEW%2BNINE%2BFINAL.JPG', 'Blue Series Artist', 1);
INSERT INTO artists VALUES ('Jessica Davies', 'JD', 'https://img.discogs.com/OKECEva352ORbWWqmPOPh3BoZHE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898262-1312471471.jpeg.jpg', 'https://img.discogs.com/OKECEva352ORbWWqmPOPh3BoZHE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898262-1312471471.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Katherine Blamire', 'KB', 'https://img.discogs.com/WGBPT8e0251QAseD4mc79LQ-Gys=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898264-1312470985.jpeg.jpg', 'https://img.discogs.com/WGBPT8e0251QAseD4mc79LQ-Gys=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898264-1312470985.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Shelby Oneal', 'SO', 'https://img.discogs.com/WGBPT8e0251QAseD4mc79LQ-Gys=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898264-1312470985.jpeg.jpg', 'https://img.discogs.com/WGBPT8e0251QAseD4mc79LQ-Gys=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1898264-1312470985.jpeg.jpg', 'Other', 0);
INSERT INTO artists VALUES ('Corey Younts', 'CY', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);

INSERT INTO records VALUES ('TMR021', 'The Smoke Fairies', 'Gas Town', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr021-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr021-cover-ab.jpg', 0, '8 December 2009', 'Blue Series', 'https://thirdmanstore.com/smoke-fairies-gastown-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:5vuAvVWEnStSe0u3zt7grh');

INSERT INTO recordEditions VALUES ('TMR021-BLACK', 'TMR021', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr021-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR021-TRI-COLOR', 'TMR021', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr021-tricolor-ab.jpg');

INSERT INTO songs VALUES ('TMR021-A', 'TMR021', 'Gastown', 'A');
INSERT INTO songs VALUES ('TMR021-B', 'TMR021', 'River Song', 'B');

INSERT INTO recordCredits VALUES ('TMR021-DESIGN1', 'TMR021', 'Jack White', 'Design');
INSERT INTO recordCredits VALUES ('TMR021-DESIGN2', 'TMR021', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR021-ENGINEERING1', 'TMR021', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR021-ENGINEERING2', 'TMR021', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR021-MASTERING', 'TMR021', 'Wes Garland', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR021-MIXING1', 'TMR021', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR021-MIXING2', 'TMR021', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR021-PERFORMING1', 'TMR021', 'Jessica Davies', 'Performing');
INSERT INTO recordCredits VALUES ('TMR021-PERFORMING2', 'TMR021', 'Katherine Blamire', 'Performing');
INSERT INTO recordCredits VALUES ('TMR021-PHOTOGRAPHY', 'TMR021', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR021-PRODUCING', 'TMR021', 'Jack White', 'Producing');
INSERT INTO recordCredits VALUES ('TMR021-WRITING', 'TMR021', 'The Smoke Fairies', 'Writing');

INSERT INTO songCredits VALUES ('TMR021-A-BASS', 'TMR021-A', 'Jack Lawrence', 'Bass');
INSERT INTO songCredits VALUES ('TMR021-A-DRUMS', 'TMR021-A', 'Jack White', 'Drums');
INSERT INTO songCredits VALUES ('TMR021-A-GUITAR1', 'TMR021-A', 'Jessica Davies', 'Guitar');
INSERT INTO songCredits VALUES ('TMR021-A-VOCALS1', 'TMR021-A', 'Jessica Davies', 'Vocals');
INSERT INTO songCredits VALUES ('TMR021-A-GUITAR2', 'TMR021-A', 'Katherine Blamire', 'Guitar');
INSERT INTO songCredits VALUES ('TMR021-A-VOCALS2', 'TMR021-A', 'Katherine Blamire', 'Vocals');
INSERT INTO songCredits VALUES ('TMR021-B-DRUMS1', 'TMR021-B', 'Shelby Oneal', 'Drums');
INSERT INTO songCredits VALUES ('TMR021-B-GUITAR1', 'TMR021-B', 'Jessica Davies', 'Guitar');
INSERT INTO songCredits VALUES ('TMR021-B-VOCALS1', 'TMR021-B', 'Jessica Davies', 'Vocals');
INSERT INTO songCredits VALUES ('TMR021-B-GUITAR2', 'TMR021-B', 'Katherine Blamire', 'Guitar');
INSERT INTO songCredits VALUES ('TMR021-B-VOCALS2', 'TMR021-B', 'Katherine Blamire', 'Vocals');
INSERT INTO songCredits VALUES ('TMR021-B-PIANO', 'TMR021-B', 'Corey Younts', 'Piano');
INSERT INTO songCredits VALUES ('TMR021-B-CLAVINET', 'TMR021-B', 'Corey Younts', 'Clavinet');
INSERT INTO songCredits VALUES ('TMR021-B-TIMPANI', 'TMR021-B', 'Jack White', 'Timpani');
INSERT INTO songCredits VALUES ('TMR021-B-ELECTRICGUITAR', 'TMR021-B', 'Jack White', 'Electric Guitar');
INSERT INTO songCredits VALUES ('TMR021-B-DRUMS2', 'TMR021-B', 'Jack White', 'Drums');

INSERT INTO bandMembers VALUES ('THESMOKEFAIRIES-JESSICADAVIES', 'The Smoke Fairies', 'Jessica Davies', 'Guitar and Vocals');
INSERT INTO bandMembers VALUES ('THESMOKEFAIRIES-KATHERINEBLAMIRE', 'The Smoke Fairies', 'Katherine Blamire', 'Guitar and Vocals');

/* TMR022 */
INSERT INTO artists VALUES ('BP Fallon', 'BPF', 'https://img.discogs.com/lZds_3OuAwNSiYzN7ba1dyDO8bA=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1653255-1461238854-5989.jpeg.jpg', 'https://img.discogs.com/lZds_3OuAwNSiYzN7ba1dyDO8bA=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-1653255-1461238854-5989.jpeg.jpg', 'Green Series Artist', 0);
INSERT INTO artists VALUES ('Society Red', 'SR', 'https://s.discogs.com/images/default-release.png', 'https://s.discogs.com/images/default-release.png', 'Other', 0);
INSERT INTO artists VALUES ('Aaron Lee Tasjan', 'ALT', 'https://img.discogs.com/vPbBRRUb5VyHBnGj4we4kPsl2Nw=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2976110-1459726544-7565.jpeg.jpg', 'https://img.discogs.com/vPbBRRUb5VyHBnGj4we4kPsl2Nw=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/A-2976110-1459726544-7565.jpeg.jpg', 'Other', 0);

INSERT INTO records VALUES ('TMR022', 'BP Fallon', 'Fame #9', 7, 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/_resampled/SetWidthWzIwMCwyMDBd/tmr022-cover-a.jpg', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr022-cover-ab.jpg', 0, '8 December 2009', 'Green Series', 'https://thirdmanstore.com/bp-fallon-fame-9-7-vinyl', 'https://open.spotify.com/embed?uri=spotify:album:3mvCiIBrdOewarrX2PvjYj');

INSERT INTO recordEditions VALUES ('TMR022-BLACK', 'TMR022', 'Black', 'Unlimited', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr022-black-ab.jpg');
INSERT INTO recordEditions VALUES ('TMR022-TRI-COLOR', 'TMR022', 'Tri-Color', '150', 'https://d3mjk82f332v2.cloudfront.net/assets/CatalogPhotos/tmr022-tricolor-ab.jpg');

INSERT INTO songs VALUES ('TMR022-A', 'TMR022', 'Fame #9', 'A');
INSERT INTO songs VALUES ('TMR022-B1', 'TMR022', 'BP Fallon Interview', 'B1');
INSERT INTO songs VALUES ('TMR022-B2', 'TMR022', 'I Believe In Elvis Presley', 'B2');

INSERT INTO recordCredits VALUES ('TMR022-DESIGN1', 'TMR022', 'Jack White', 'Design');
INSERT INTO recordCredits VALUES ('TMR022-DESIGN2', 'TMR022', 'Miles Johnson', 'Design');
INSERT INTO recordCredits VALUES ('TMR022-ENGINEERING1', 'TMR022', 'Vance Powell', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR022-ENGINEERING2', 'TMR022', 'Joshua V. Smith', 'Engineering');
INSERT INTO recordCredits VALUES ('TMR022-LAYOUT', 'TMR022', 'Miles Johnson', 'Layout');
INSERT INTO recordCredits VALUES ('TMR022-MASTERING', 'TMR022', 'Wes Garland', 'Mastering');
INSERT INTO recordCredits VALUES ('TMR022-MIXING1', 'TMR022', 'Jack White', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR022-MIXING2', 'TMR022', 'Vance Powell', 'Mixing');
INSERT INTO recordCredits VALUES ('TMR022-PHOTOGRAPHY', 'TMR022', 'Jo McCaughey', 'Photography');
INSERT INTO recordCredits VALUES ('TMR022-PRODUCING', 'TMR022', 'Jack White', 'Producing');

INSERT INTO songCredits VALUES ('TMR022-A-WRITER', 'TMR022-A', 'BP Fallon', 'Writer');
INSERT INTO songCredits VALUES ('TMR022-A-VOCALS', 'TMR022-A', 'BP Fallon', 'Vocals');
INSERT INTO songCredits VALUES ('TMR022-B1-INTERVIEWEE', 'TMR022-B1', 'BP Fallon', 'Interviewee');
INSERT INTO songCredits VALUES ('TMR022-B1-INTERVIEWER', 'TMR022-B1', 'Jack White', 'Interviewer');
INSERT INTO songCredits VALUES ('TMR022-B2-BASS', 'TMR022-B2', 'Society Red', 'Bass');
INSERT INTO songCredits VALUES ('TMR022-B2-GUITAR1', 'TMR022-B2', 'Society Red', 'Guitar');
INSERT INTO songCredits VALUES ('TMR022-B2-DRUMS', 'TMR022-B2', 'Patrick Keeler', 'Drums');
INSERT INTO songCredits VALUES ('TMR022-B2-GUITAR2', 'TMR022-B2', 'Jack White', 'Guitar');
INSERT INTO songCredits VALUES ('TMR022-B2-VOCALS', 'TMR022-B2', 'BP Fallon', 'Vocals');
INSERT INTO songCredits VALUES ('TMR022-B2-WRITER1', 'TMR022-B2', 'Aaron Lee Tasjan', 'Writer');
INSERT INTO songCredits VALUES ('TMR022-B2-WRITER2', 'TMR022-B2', 'BP Fallon', 'Writer');