-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM
-- SQL DATABASE & ANALYTICS PROJECT
-- ============================================================
-- Database: hospital_management
-- Platform: MySQL
-- ============================================================
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;
-- ============================================================
-- SECTION 1: TABLE CREATION
-- ============================================================

CREATE TABLE IF NOT EXISTS hospitals (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    hospital_id INT,
    email VARCHAR(150),
    FOREIGN KEY (hospital_id)
        REFERENCES hospitals(hospital_id)
);

CREATE TABLE IF NOT EXISTS patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    address VARCHAR(255),
    phone VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    hospital_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (hospital_id)
        REFERENCES hospitals(hospital_id)
);

CREATE TABLE IF NOT EXISTS medications (
    medication_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication_id INT,
    prescribed_date DATE,
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id),
    FOREIGN KEY (medication_id)
        REFERENCES medications(medication_id)
);

CREATE TABLE IF NOT EXISTS rooms (
    room_id INT PRIMARY KEY,
    room_no VARCHAR(20) NOT NULL,
    department_id INT,
    capacity INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- ============================================================
-- SECTION 2: DATA INSERTION
-- ============================================================

-- ------------------------------------------------------------
-- 2.1 Hospitals
-- ------------------------------------------------------------

INSERT INTO hospitals (hospital_id, name, address, phone)
VALUES
(1, 'Green Valley Medical Center', '123 Elm St, Springfield', '555-123-4567'),
(2, 'Riverside General Hospital', '456 Oak Ave, Rivertown', '555-234-5678'),
(3, 'Cedar Grove Community Hospital', '789 Pine Rd, Cedarville', '555-345-6789'),
(4, 'Northwind Regional Medical Center', '321 Birch Blvd, Northwind', '555-456-7890'),
(5, 'Lakeside Healthcare Institute', '654 Maple Ln, Lakeside', '555-567-8901'),
(6, 'Harmony Hill Hospital', '987 Willow Way, Harmony', '555-678-9012'),
(7, 'Silver Oak Medical Center', '159 Aspen Ct, Silverton', '555-789-0123'),
(8, 'Maplewood General Hospital', '753 Cherry Dr, Maplewood', '555-890-1234'),
(9, 'Pinecrest Medical Pavilion', '852 Spruce Pl, Pinecrest', '555-901-2345'),
(10, 'Oceanview Health Center', '147 Palm Ave, Oceanview', '555-012-3456');

-- ------------------------------------------------------------
-- 2.2 Doctors
-- ------------------------------------------------------------

INSERT INTO doctors
    (doctor_id, name, specialty, hospital_id, email)
VALUES
(1, 'Emily Carter', 'Cardiology', 1, 'ecarter@greenvalley.com'),
(2, 'James Lin', 'Neurology', 2, 'jlin@riverside.com'),
(3, 'Aisha Ahmed', 'Pediatrics', 7, 'aahmed@cedargrove.com'),
(4, 'Daniel Wright', 'Orthopedics', 4, 'dwright@northwind.com'),
(5, 'Sophia Lee', 'Oncology', 6, 'slee@lakeside.com'),
(6, 'Michael Torres', 'Dermatology', 6, 'mtorres@harmonyhill.com'),
(7, 'Olivia Brooks', 'General Surgery', 7, 'obrooks@silveroak.com'),
(8, 'Henry Kim', 'Psychiatry', 9, 'hkim@maplewood.com'),
(9, 'Priya Nair', 'Gynecology', 8, 'pnair@pinecrest.com'),
(10, 'Robert Chan', 'Emergency Medicine', 2, 'rchan@oceanview.com'),
(11, 'Lisa Murphy', 'Cardiology', 1, 'lmurphy@greenvalley.com'),
(12, 'Jason Patel', 'Neurology', 10, 'jpatel@riverside.com'),
(13, 'Anna Gomez', 'Pediatrics', 5, 'agomez@cedargrove.com'),
(14, 'Kevin Yu', 'Orthopedics', 5, 'kyu@northwind.com'),
(15, 'Sara Khan', 'Pediatrics', 3, 'skhan@lakeside.com'),
(16, 'Marcus Hill', 'Dermatology', 6, 'mhill@harmonyhill.com'),
(17, 'Fiona Zhang', 'General Surgery', 3, 'fzhang@silveroak.com'),
(18, 'David Scott', 'Psychiatry', 8, 'dscott@maplewood.com'),
(19, 'Amira Said', 'Gynecology', 10, 'asaid@pinecrest.com'),
(20, 'Ethan Brown', 'Emergency Medicine', 1, 'ebrown@oceanview.com'),
(21, 'Rachel Singh', 'Cardiology', 9, 'rsingh@greenvalley.com'),
(22, 'Tom Baker', 'Neurology', 2, 'tbaker@riverside.com'),
(23, 'Zoe Nguyen', 'Pediatrics', 10, 'znguyen@cedargrove.com'),
(24, 'Leo Wilson', 'Orthopedics', 4, 'lwilson@northwind.com'),
(25, 'Nadia Bashir', 'Oncology', 1, 'nbashir@lakeside.com'),
(26, 'Chris Park', 'Cardiology', 6, 'cpark@harmonyhill.com'),
(27, 'Helen Rivera', 'General Surgery', 9, 'hrivera@silveroak.com'),
(28, 'Omar El-Sayed', 'Pediatrics', 10, 'oelsayed@maplewood.com'),
(29, 'Julia Moore', 'Gynecology', 8, 'jmoore@pinecrest.com'),
(30, 'Andre Dubois', 'Emergency Medicine', 7, 'adubois@oceanview.com');

-- ------------------------------------------------------------
-- 2.3 Patients
-- ------------------------------------------------------------

-- Patients 1-40
INSERT INTO patients
    (patient_id, name, dob, address, phone)
VALUES
(1, 'Norma Fisher', '1940-08-27', '6607 Sharp Common, Chadstad, UT 04351', '+1-718-549-4576x95978'),
(2, 'Jorge Sullivan', '1942-04-20', '35192 Aaron Shoals, Lake Adrianstad, UT 03731', '001-880-565-5803x91715'),
(3, 'Elizabeth Woods', '2012-11-19', 'USNS Villarreal, FPO AE 60013', '+1-708-481-0950'),
(4, 'Susan Wagner', '1938-03-25', '420 Michael Mountains Suite 485, New Victoria, CT 70392', '847-676-0375x20782'),
(5, 'Peter Montgomery', '1954-12-10', '2235 Joel Ferry, Nathanton, VI 17833', '+1-897-430-7992x97595'),
(6, 'Theodore Mcgrath', '1938-05-04', '12648 Yang Divide Suite 451, South Cynthia, SC 69865', '966.535.6433x43895'),
(7, 'Stephanie Collins', '1936-01-22', '65735 Farley Course Apt. 141, Port Jacqueline, MO 24799', '+1-359-925-3248x289'),
(8, 'Stephanie Sutton', '2010-08-22', '37582 Ford Route Apt. 734, Port Hollymouth, AL 29170', '632.595.9318x7346'),
(9, 'Brian Hamilton', '1964-06-08', '926 Davis Parks Apt. 864, North Josephton, AL 34130', '(665)600-3392x871'),
(10, 'Susan Levy', '1949-02-22', '1454 Caitlin Camp Apt. 448, Davidbury, MH 21938', '001-976-656-0105x249'),
(11, 'Sean Green', '1948-01-29', '8298 Amanda Loop Suite 447, Ashleyberg, GA 16661', '+1-267-753-1118'),
(12, 'Kimberly Smith', '1993-09-24', '9728 Gomez Mountains Suite 377, Trevorton, NV 39846', '001-591-693-0014x1962'),
(13, 'Jennifer Summers', '2021-11-09', '93057 Oneal Branch Apt. 160, Blaketown, KY 84436', '622-593-2234x7429'),
(14, 'April Snyder', '1980-02-18', '94316 Moran Lights, West Robert, MH 90609', '926-423-9058'),
(15, 'Dana Nguyen', '2015-10-13', '285 Jason Ferry Suite 566, Pricebury, WY 26216', '001-441-994-9302x39062'),
(16, 'Cheryl Bradley', '1979-11-26', '060 Cynthia Ways, West Brian, SC 89301', '+1-508-653-2757'),
(17, 'Walter Pratt', '1986-05-01', '184 Jenkins Center Suite 977, Janetborough, MA 35349', '+1-331-457-4589x43486'),
(18, 'Bobby Flores', '1995-10-03', '50402 Kristin Springs, New Randy, PW 29464', '(319)618-2726x4832'),
(19, 'Tasha Rodriguez', '2007-02-22', '191 Morris Motorway Suite 408, East Miguelborough, VI 69250', '456.280.5668x289'),
(20, 'Michelle Kelley', '2002-11-21', '4486 Olson Well, North Kevin, OH 09982', '897-389-6373x6118'),
(21, 'Kimberly Maynard', '2023-10-31', '706 Stevens Crest Apt. 131, South Nicole, IL 58256', '572.503.3319x66183'),
(22, 'Laurie Wallace', '2001-11-28', '602 Tracy Crossroad Suite 556, New Rachelside, WY 26870', '813.618.2938x9896'),
(23, 'Janice Johnston', '2016-03-15', '978 Nelson Brook Apt. 912, Wrightport, FM 96980', '+1-479-505-5303x73830'),
(24, 'Collin Lopez', '1953-03-26', 'Unit 0886 Box 0164, DPO AE 97138', '971.794.4654x191'),
(25, 'Mary Alvarez', '1982-11-14', '843 Calvin Inlet, Jesusfort, LA 76792', '+1-791-432-6307x428'),
(26, 'Peter Mcdowell', '1988-07-23', '855 Lisa Wells, Mooreburgh, NY 10522', '885-851-5334'),
(27, 'Sarah Villanueva', '2008-12-30', '9332 Kathleen Knoll, Lake Vernon, PW 14658', '(402)871-4283x9752'),
(28, 'Kimberly Myers', '1978-01-30', '957 Parker Forges, Lake Natasha, AS 97149', '331-722-7862x047'),
(29, 'Desiree Cain', '2005-11-16', '142 Warner View Suite 460, North Leslie, WA 33217', '+1-611-873-8009x1749'),
(30, 'Stephanie Lawrence', '1969-08-27', '345 Kevin Knolls Apt. 250, Burtontown, IA 06394', '(531)498-2730'),
(31, 'Lauren Hayes', '1987-06-17', '05623 Graham Knolls Suite 256, Smithview, ND 70144', '001-992-629-9211x414'),
(32, 'Whitney Stark', '2011-04-21', '91662 Vincent Road Apt. 153, East Sonya, AS 22631', '001-660-812-7055'),
(33, 'Angela Salazar', '2006-07-05', '169 Christine Mount, New Carolyn, KS 45098', '(204)633-1923x8375'),
(34, 'Mr. Ryan Sanchez', '1993-10-24', '07154 Stephen Parkways Suite 265, Lindafurt, AL 41233', '(598)682-5986x34174'),
(35, 'Autumn Robinson', '1934-09-14', '708 Villa Camp Suite 616, Tylertown, KY 97488', '001-941-552-7067x04896'),
(36, 'Faith Cabrera', '1951-01-22', 'Unit 4943 Box 8856, DPO AA 27891', '(604)816-4377'),
(37, 'Charles Wolfe', '1980-04-19', '98522 Mathis Viaduct Apt. 909, West Michael, SC 38960', '(397)242-0354'),
(38, 'Kenneth Kent', '1957-08-01', '620 Ashley Mills Apt. 507, Julieborough, CA 72443', '(745)893-5621x35772'),
(39, 'Melanie Johnson', '1940-08-03', 'USNV Dodson, FPO AE 69907', '(565)891-1872x10867'),
(40, 'Lisa Johnston', '2012-01-27', '188 Fischer Grove, Justinchester, WI 94599', '+1-216-404-9244x8185');

-- Patients 41-80
INSERT INTO patients
    (patient_id, name, dob, address, phone)
VALUES
(41, 'Jacob Hooper', '2019-07-20', '885 Lee Tunnel Suite 208, Port Donna, WY 74331', '9156573359'),
(42, 'Alex Woodward', '1961-12-08', '86930 Rice Estate Apt. 570, New Patricia, KY 24767', '+1-527-660-1015'),
(43, 'Caleb Clark', '1971-05-30', 'USCGC Miller, FPO AA 31530', '+1-218-541-1894'),
(44, 'Taylor Johnson', '2007-08-03', '132 Mclean Meadow Suite 446, Chelsealand, ME 04450', '227-822-7427'),
(45, 'Brian Green', '1940-04-14', '66660 Gomez Port Apt. 945, South Thomashaven, DC 05951', '5119416346'),
(46, 'Matthew Bell', '1992-05-16', '0131 Williams Ville Apt. 562, Richardberg, PA 19832', '+1-798-785-2609x6934'),
(47, 'Jonathan Williams', '1946-02-21', '022 Renee Squares Apt. 808, Herringstad, AS 77293', '674.554.2237x5057'),
(48, 'William Gonzalez', '1960-07-09', '243 Murphy Station, Kimberlyhaven, NH 20843', '4172823695'),
(49, 'Nicholas Massey', '2009-05-18', '209 Darlene Bypass Suite 137, Port Stephen, GA 93500', '867.675.0393x1721'),
(50, 'Caroline Chambers', '1939-09-06', '8081 Smith Trail, North Ronaldstad, OK 59690', '616.808.7503'),
(51, 'Amy Lowe', '1937-12-01', '512 Schaefer Falls Apt. 059, North Robert, AR 92099', '984.810.1566x634'),
(52, 'Gloria King', '1972-04-16', '92516 Scott Rapids Suite 497, Whitemouth, AS 35123', '+1-606-947-2666'),
(53, 'Jessica Thompson', '1978-12-12', '51105 Gregory Ridges Apt. 578, Alvarezton, ND 53183', '+1-954-969-2506'),
(54, 'Jason Carroll', '2012-05-20', '81155 Thomas Bypass Apt. 840, South Matthewside, UT 19753', '313-453-6095x2271'),
(55, 'Emily Howard', '1999-03-26', '395 Timothy Road, Williamsbury, SC 37407', '+1-603-220-8662x467'),
(56, 'Danielle Castro', '1995-04-21', '3267 Walter Dam, Cunninghamtown, GA 77001', '(872)211-7444'),
(57, 'Patrick Rogers', '1948-04-22', '220 Madison Pass Apt. 001, Port Eric, WY 50291', '001-645-571-0437'),
(58, 'Douglas Allen', '2023-06-27', '9532 Dixon Place Suite 126, Tammychester, MH 57653', '(216)400-1504x4000'),
(59, 'Heather Roberts', '1971-09-08', '63769 Mary Harbor Suite 809, Mcdowellview, AZ 80581', '+1-327-519-2082x111'),
(60, 'Travis Schultz', '1989-09-28', '180 Jennifer Burg Suite 661, Munozburgh, GA 45130', '376-411-7782'),
(61, 'Michelle Hughes', '1969-06-26', '481 Reed Road, Katiehaven, WV 07566', '(768)821-8083x165'),
(62, 'Matthew Smith', '1938-12-01', '95460 Arnold Bypass Suite 463, Dennisville, RI 47288', '239-212-9654x5850'),
(63, 'George Allen', '1977-01-23', '671 Kimberly Plains Apt. 223, East Anthony, DC 65125', '(643)622-1772'),
(64, 'Jamie Hutchinson', '1948-04-21', '516 Nolan Junctions Suite 826, Jimmyfurt, MI 51653', '(402)655-3187'),
(65, 'Jennifer Morales', '1937-08-09', 'USNV Oconnell, FPO AA 13308', '531-893-5614x68505'),
(66, 'Jennifer Bates', '1990-04-01', '09981 Caitlin Rapids, West Haleyburgh, MS 11691', '7688424041'),
(67, 'Jeremy Green', '1991-05-19', '57517 Silva Glen, Burnettbury, GA 74116', '9435245812'),
(68, 'Joseph Freeman', '1944-02-28', '202 Franklin Fords, Ericksonfurt, KS 03275', '001-299-416-4040'),
(69, 'Nicole Henson', '1984-02-09', '79061 Cook Parkways Suite 079, West Marissafort, OH 85040', '726-739-8308x37879'),
(70, 'Eric Owens PhD', '1965-11-19', '38524 Stephen Cliff Suite 696, West Timothyville, LA 18991', '(910)865-2736x903'),
(71, 'Robin Lopez', '1969-03-10', '02983 Antonio Lodge, Kleinville, NJ 73841', '001-462-326-6734x12904'),
(72, 'Miss Angela Swanson DVM', '2004-07-24', '03374 Walker Park Suite 851, West Ashleybury, WA 48669', '(842)964-8658'),
(73, 'Michael Stewart', '1978-10-24', 'USNS Hall, FPO AE 97807', '914.595.4446x980'),
(74, 'Mitchell Smith', '2013-12-31', '6921 Kelly Ways Suite 355, Ramirezfurt, WI 94134', '(746)900-6814x00768'),
(75, 'Kelsey Davis', '1989-08-05', 'Unit 1741 Box 7253, DPO AP 25003', '578.379.2909x53461'),
(76, 'Matthew Russo', '1976-09-23', 'USNV Porter, FPO AE 89774', '(697)927-5727'),
(77, 'William Garcia', '1991-08-05', '8799 Emma Parkway Suite 735, North Thomasfurt, MH 30303', '483-405-8468x91428'),
(78, 'Jennifer Miller', '1965-02-02', '90614 Jessica Fall Apt. 250, North Alan, ND 01091', '253-400-7719'),
(79, 'Jesse Sparks', '1945-11-14', '73089 Jones Fall, East Sarah, MS 62718', '+1-779-329-4145x2750'),
(80, 'Brandi Meyer', '1996-02-10', '60940 Padilla Views Suite 729, West Sierraville, KY 03663', '991-844-9520');

-- Patients 81-120
INSERT INTO patients
    (patient_id, name, dob, address, phone)
VALUES
(81, 'Hannah Wiggins', '1990-09-01', '3953 Romero Crest, Lake Rhondaville, NY 59180', '(531)664-7676x2636'),
(82, 'Albert Williams', '2005-08-27', '526 Bennett Port Suite 373, Timothychester, AK 59090', '427-955-4753'),
(83, 'Kristin Potts', '1946-02-14', '673 Allen Neck, Thomasmouth, LA 47683', '(953)772-1899'),
(84, 'Susan Williams', '2016-09-29', '134 Sophia Drives, Benjaminburgh, WI 61921', '(715)724-5116'),
(85, 'Meredith Rios', '2006-08-16', '7326 Kristin Unions, Pamhaven, ID 95387', '650-334-2282x7318'),
(86, 'Stephanie Bowman', '2017-03-15', '97939 Johnson Oval Suite 830, North Dennismouth, VI 88870', '3614677220'),
(87, 'Joshua Clark', '2013-03-18', '645 Jennings Estates, Angelastad, VT 57929', '+1-416-991-4199x1346'),
(88, 'Alexa Hernandez', '1995-12-22', '1231 Stephanie Lock Suite 835, North Richardland, PR 54546', '001-945-326-4221x385'),
(89, 'Richard Higgins', '2007-08-10', '302 Parker Plains Apt. 197, East Robertstad, ME 11473', '986-847-0252x73312'),
(90, 'Marc Williams', '1981-05-24', '098 Hernandez Green, New Sergiobury, MS 50840', '753-915-2339'),
(91, 'William Roberts', '2005-05-18', '94102 Sims Port Suite 187, Florestown, DE 57418', '397-684-4099x24388'),
(92, 'Joshua Carter', '1951-09-15', '01630 Baker Crescent, Kellyborough, WA 71505', '821.707.8889x986'),
(93, 'David Williams', '2005-01-27', '802 Weiss Route Suite 525, New Annaland, KS 75278', '+1-253-457-2807x201'),
(94, 'Joseph Jones', '1974-09-11', '270 Michael Point, East Heather, IN 52803', '001-710-854-3103x25689'),
(95, 'Gary Perry', '2002-10-12', '2458 Jason Village Suite 248, North Donnamouth, ME 93087', '860.493.9070'),
(96, 'Terry Wells', '1975-09-04', '19041 Jennifer Flats Suite 716, Martinezshire, NH 42985', '001-631-692-5447x58675'),
(97, 'Vanessa Cooper', '2005-09-29', '640 Mary Route, Charlesmouth, MD 72308', '885.465.6403x746'),
(98, 'Michael Simmons', '1941-06-18', '38249 Kristi Manor Suite 934, Reneeside, NM 59327', '(473)429-3148'),
(99, 'Nicholas Kline', '1938-09-13', '2803 Reyes Garden Apt. 412, South Alexis, WV 47971', '+1-471-473-6210x80119'),
(100, 'Lori Bennett', '2018-10-08', '374 Powell Mountains, East Jennahaven, MI 27038', '001-735-551-1672'),
(101, 'Margaret Jones', '1978-06-09', '2284 Howard Way, Schaeferburgh, IA 99887', '+1-439-497-9412x613'),
(102, 'Paul Brown', '2015-10-12', '384 Jennifer Turnpike, North Robert, MS 66761', '001-244-552-7581x160'),
(103, 'James Stone', '2019-09-18', '871 Melissa Place Apt. 103, Coleview, MT 45759', '863-256-9151x79743'),
(104, 'John Richards', '1994-09-02', '129 Joyce Walks Apt. 081, Wrightberg, PA 82666', '(752)918-4709x228'),
(105, 'Jenny Richardson', '1986-02-22', '92555 Shaw Spurs Suite 207, New Randy, NJ 40008', '001-616-747-4060x712'),
(106, 'Debbie Waters MD', '1954-02-13', '5596 Riley Square Suite 933, Robinsonhaven, GA 67302', '492-377-0952x6042'),
(107, 'Austin Boyer', '1943-02-04', '4647 Kristine Fields Suite 710, New Dakota, KS 00638', '(587)382-6528x59211'),
(108, 'Stephanie Hayes', '2008-06-05', '92594 Emily Shoals, North Cathyburgh, MP 41186', '673.906.5459'),
(109, 'Barbara Sanders', '2014-09-03', 'USNS Long, FPO AA 97276', '704.676.3708x96539'),
(110, 'Andrew Gould', '2004-10-30', '96102 Brittney Groves Suite 363, Jackburgh, NM 86758', '(624)431-5624'),
(111, 'Charles Gonzalez', '1997-07-19', '300 Merritt Bypass Apt. 816, Martinborough, VT 08557', '(701)926-6119x3813'),
(112, 'Joshua Hernandez', '1972-06-29', '4779 Adams Rue, South Lindaburgh, MH 14614', '+1-991-622-9990'),
(113, 'Victoria Hernandez MD', '1962-02-28', '762 Miranda Spur Apt. 912, Phillipsville, TX 56307', '480.971.0093'),
(114, 'Sherry Simpson', '1944-11-22', '588 Alan Rest, Port Stephanieville, MT 50971', '001-538-649-9125x80954'),
(115, 'Erica Jimenez', '1973-01-07', '52169 Brandon Loop Apt. 096, New Jessica, ME 53807', '6964515451'),
(116, 'Mr. Dakota Lynch II', '1985-08-16', '782 Dawn Radial, Port Christopher, NJ 38224', '(200)496-0636x974'),
(117, 'Victor Nolan', '2017-09-28', '0081 Danielle Drives, Port Kathleen, DC 15510', '001-497-581-0012x669'),
(118, 'Amanda Hernandez', '2018-11-26', 'USS Yang, FPO AA 19553', '+1-581-700-6642x6056'),
(119, 'Richard Kirby', '1972-02-03', '53475 Ruiz Pine, North Lesliefurt, WI 53362', '+1-530-567-8035x729'),
(120, 'Michelle Roman', '1943-08-12', '132 Poole Pass Suite 212, North Patrick, OK 15689', '8316455422');

-- ------------------------------------------------------------
-- 2.4 Appointments
-- ------------------------------------------------------------

-- Appointments 1-25
INSERT INTO appointments
    (appointment_id, patient_id, doctor_id, appointment_date, reason)
VALUES
(1, 41, 26, '2025-04-16', 'Follow-up'),
(2, 113, 6, '2025-06-14', 'Checkup'),
(3, 66, 11, '2025-07-25', 'Emergency'),
(4, 120, 14, '2025-03-12', 'Emergency'),
(5, 63, 27, '2025-01-17', 'Consultation'),
(6, 14, 2, '2025-04-30', 'Consultation'),
(7, 39, 4, '2025-03-26', 'Emergency'),
(8, 71, 26, '2025-03-25', 'Consultation'),
(9, 38, 5, '2025-01-12', 'Follow-up'),
(10, 91, 28, '2025-05-10', 'Checkup'),
(11, 16, 23, '2025-04-21', 'Emergency'),
(12, 71, 8, '2025-06-26', 'Checkup'),
(13, 43, 2, '2025-06-18', 'Consultation'),
(14, 105, 27, '2025-04-06', 'Checkup'),
(15, 119, 19, '2025-01-11', 'Consultation'),
(16, 70, 21, '2025-08-30', 'Follow-up'),
(17, 27, 30, '2025-02-20', 'Follow-up'),
(18, 103, 30, '2025-07-04', 'Emergency'),
(19, 78, 18, '2025-05-20', 'Consultation'),
(20, 71, 20, '2025-01-08', 'Consultation'),
(21, 76, 22, '2025-07-02', 'Consultation'),
(22, 37, 3, '2025-08-31', 'Follow-up'),
(23, 57, 1, '2025-02-07', 'Consultation'),
(24, 12, 4, '2025-06-28', 'Emergency'),
(25, 77, 21, '2025-05-23', 'Emergency');

-- Appointments 26-50
INSERT INTO appointments
    (appointment_id, patient_id, doctor_id, appointment_date, reason)
VALUES
(26, 103, 7, '2025-05-15', 'Checkup'),
(27, 50, 20, '2025-04-18', 'Checkup'),
(28, 41, 27, '2025-04-22', 'Follow-up'),
(29, 74, 19, '2025-02-12', 'Consultation'),
(30, 31, 4, '2025-03-31', 'Follow-up'),
(31, 38, 13, '2025-06-18', 'Follow-up'),
(32, 24, 3, '2025-07-31', 'Follow-up'),
(33, 25, 12, '2025-07-03', 'Emergency'),
(34, 106, 27, '2025-06-05', 'Emergency'),
(35, 24, 4, '2025-02-27', 'Emergency'),
(36, 5, 2, '2025-01-02', 'Checkup'),
(37, 79, 20, '2025-08-02', 'Emergency'),
(38, 85, 1, '2025-07-10', 'Emergency'),
(39, 34, 7, '2025-08-24', 'Checkup'),
(40, 61, 6, '2025-02-03', 'Follow-up'),
(41, 9, 23, '2025-08-31', 'Emergency'),
(42, 12, 4, '2025-03-24', 'Checkup'),
(43, 87, 16, '2025-05-21', 'Consultation'),
(44, 97, 7, '2025-01-05', 'Follow-up'),
(45, 17, 24, '2025-07-17', 'Emergency'),
(46, 113, 26, '2025-08-21', 'Emergency'),
(47, 20, 2, '2025-08-24', 'Checkup'),
(48, 119, 30, '2025-02-08', 'Checkup'),
(49, 5, 22, '2025-02-04', 'Emergency'),
(50, 108, 1, '2025-05-17', 'Consultation');

-- Appointments 51-75
INSERT INTO appointments
    (appointment_id, patient_id, doctor_id, appointment_date, reason)
VALUES
(51, 11, 18, '2025-04-12', 'Consultation'),
(52, 115, 14, '2025-01-05', 'Emergency'),
(53, 90, 20, '2025-03-13', 'Checkup'),
(54, 119, 4, '2025-07-13', 'Emergency'),
(55, 107, 27, '2025-07-10', 'Follow-up'),
(56, 70, 9, '2025-03-01', 'Checkup'),
(57, 88, 3, '2025-08-17', 'Follow-up'),
(58, 51, 8, '2025-04-02', 'Checkup'),
(59, 108, 3, '2025-07-11', 'Emergency'),
(60, 91, 21, '2025-03-27', 'Emergency'),
(61, 68, 10, '2025-09-03', 'Consultation'),
(62, 36, 12, '2025-06-18', 'Checkup'),
(63, 67, 14, '2025-04-03', 'Follow-up'),
(64, 104, 6, '2025-01-17', 'Checkup'),
(65, 31, 2, '2025-02-16', 'Checkup'),
(66, 109, 17, '2025-08-24', 'Checkup'),
(67, 28, 15, '2025-05-24', 'Follow-up'),
(68, 115, 2, '2025-07-19', 'Checkup'),
(69, 87, 20, '2025-02-22', 'Follow-up'),
(70, 76, 4, '2025-05-11', 'Consultation'),
(71, 106, 23, '2025-05-30', 'Consultation'),
(72, 54, 13, '2025-08-22', 'Follow-up'),
(73, 75, 7, '2025-05-06', 'Checkup'),
(74, 36, 9, '2025-08-19', 'Emergency'),
(75, 58, 12, '2025-03-21', 'Emergency');

-- Appointments 76-100
INSERT INTO appointments
    (appointment_id, patient_id, doctor_id, appointment_date, reason)
VALUES
(76, 64, 29, '2025-05-26', 'Checkup'),
(77, 85, 24, '2025-06-05', 'Checkup'),
(78, 83, 16, '2025-01-24', 'Consultation'),
(79, 90, 27, '2025-02-11', 'Emergency'),
(80, 118, 29, '2025-03-05', 'Checkup'),
(81, 102, 30, '2025-03-07', 'Consultation'),
(82, 46, 19, '2025-02-16', 'Follow-up'),
(83, 11, 6, '2025-04-15', 'Consultation'),
(84, 42, 23, '2025-01-25', 'Checkup'),
(85, 79, 22, '2025-02-07', 'Follow-up'),
(86, 15, 7, '2025-08-02', 'Consultation'),
(87, 63, 25, '2025-02-14', 'Checkup'),
(88, 76, 2, '2025-04-22', 'Checkup'),
(89, 81, 26, '2025-01-21', 'Checkup'),
(90, 43, 22, '2025-07-18', 'Follow-up'),
(91, 109, 6, '2025-03-08', 'Consultation'),
(92, 25, 28, '2025-06-14', 'Consultation'),
(93, 32, 6, '2025-07-24', 'Consultation'),
(94, 3, 11, '2025-04-14', 'Checkup'),
(95, 94, 17, '2025-02-21', 'Emergency'),
(96, 35, 9, '2025-02-09', 'Emergency'),
(97, 15, 4, '2025-04-25', 'Emergency'),
(98, 91, 20, '2025-05-29', 'Consultation'),
(99, 29, 30, '2025-06-14', 'Follow-up'),
(100, 48, 15, '2025-05-27', 'Follow-up');

-- ------------------------------------------------------------
-- 2.5 Departments
-- ------------------------------------------------------------

-- Departments 1-23
INSERT INTO departments
    (department_id, hospital_id, name)
VALUES
(1, 1, 'Cardiology'),
(2, 1, 'Radiology'),
(3, 1, 'Oncology'),
(4, 1, 'Pediatrics'),
(5, 1, 'General Surgery'),
(6, 1, 'Neurology'),
(7, 2, 'Cardiology'),
(8, 2, 'Radiology'),
(9, 2, 'Oncology'),
(10, 2, 'Pediatrics'),
(11, 2, 'General Surgery'),
(12, 3, 'Cardiology'),
(13, 3, 'Pediatrics'),
(14, 3, 'General Surgery'),
(15, 3, 'Neurology'),
(16, 4, 'Cardiology'),
(17, 4, 'Pediatrics'),
(18, 5, 'Cardiology'),
(19, 5, 'Radiology'),
(20, 5, 'Oncology'),
(21, 5, 'Pediatrics'),
(22, 5, 'General Surgery'),
(23, 5, 'Neurology');

-- Departments 24-45
INSERT INTO departments
    (department_id, hospital_id, name)
VALUES
(24, 6, 'Cardiology'),
(25, 6, 'Radiology'),
(26, 6, 'Oncology'),
(27, 6, 'Pediatrics'),
(28, 6, 'Neurology'),
(29, 7, 'Radiology'),
(30, 7, 'Pediatrics'),
(31, 7, 'General Surgery'),
(32, 7, 'Neurology'),
(33, 8, 'Cardiology'),
(34, 8, 'Radiology'),
(35, 8, 'Oncology'),
(36, 8, 'Pediatrics'),
(37, 8, 'General Surgery'),
(38, 8, 'Neurology'),
(39, 9, 'Radiology'),
(40, 9, 'Neurology'),
(41, 10, 'Cardiology'),
(42, 10, 'Radiology'),
(43, 10, 'Oncology'),
(44, 10, 'General Surgery'),
(45, 10, 'Neurology');

-- ------------------------------------------------------------
-- 2.6 Medications
-- ------------------------------------------------------------

-- Medications 1-31
INSERT INTO medications
    (medication_id, name, description)
VALUES
(1, 'Aspirin', 'Pain reliever and anti-inflammatory'),
(2, 'Ibuprofen', 'NSAID for pain and inflammation'),
(3, 'Paracetamol', 'Common painkiller and fever reducer'),
(4, 'Metformin', 'Used to treat type 2 diabetes'),
(5, 'Omeprazole', 'Reduces stomach acid'),
(6, 'Amoxicillin', 'Broad-spectrum antibiotic'),
(7, 'Ciprofloxacin', 'Antibiotic for bacterial infections'),
(8, 'Loratadine', 'Antihistamine for allergies'),
(9, 'Cetirizine', 'Antihistamine for hay fever'),
(10, 'Salbutamol', 'Inhaler for asthma relief'),
(11, 'Prednisone', 'Corticosteroid for inflammation'),
(12, 'Hydrochlorothiazide', 'Diuretic for high blood pressure'),
(13, 'Azithromycin', 'Antibiotic for respiratory infections'),
(14, 'Doxycycline', 'Antibiotic used for acne and infections'),
(15, 'Acetaminophen', 'Alternative name for paracetamol'),
(16, 'Clindamycin', 'Antibiotic for bacterial infections'),
(17, 'Ranitidine', 'Reduces stomach acid (withdrawn in some countries)'),
(18, 'Furosemide', 'Diuretic used in fluid retention'),
(19, 'Warfarin', 'Blood thinner to prevent clots'),
(20, 'Atorvastatin', 'Lowers cholesterol'),
(21, 'Lisinopril', 'ACE inhibitor for high blood pressure'),
(22, 'Amlodipine', 'Calcium channel blocker'),
(23, 'Metoprolol', 'Beta blocker for heart issues'),
(24, 'Losartan', 'Used for treating hypertension'),
(25, 'Nitroglycerin', 'Used to treat angina'),
(26, 'Digoxin', 'Used for heart failure'),
(27, 'Clopidogrel', 'Prevents blood clots'),
(28, 'Eplerenone', 'Aldosterone blocker for heart failure'),
(29, 'Verapamil', 'Calcium channel blocker'),
(30, 'Isosorbide Mononitrate', 'Relieves chest pain (angina)'),
(31, 'Aspirin (Low Dose)', 'Cardioprotective antiplatelet');

-- Medications 32-62
INSERT INTO medications
    (medication_id, name, description)
VALUES
(32, 'Simvastatin', 'Lowers cholesterol'),
(33, 'Gabapentin', 'Treats nerve pain and seizures'),
(34, 'Carbamazepine', 'Anticonvulsant for epilepsy'),
(35, 'Phenytoin', 'Controls seizures'),
(36, 'Levetiracetam', 'Antiepileptic medication'),
(37, 'Valproic Acid', 'Used to treat epilepsy and bipolar'),
(38, 'Topiramate', 'Prevents migraines and seizures'),
(39, 'Lamotrigine', 'Used for epilepsy and mood disorders'),
(40, 'Diazepam', 'Anti-anxiety and muscle relaxant'),
(41, 'Clonazepam', 'Used for panic disorders and seizures'),
(42, 'Amitriptyline', 'Antidepressant, also used for chronic pain'),
(43, 'Sumatriptan', 'Treats migraine headaches'),
(44, 'Zolpidem', 'Short-term treatment for insomnia'),
(45, 'Ropinirole', 'Used for Parkinson''s disease'),
(46, 'Donepezil', 'Treats Alzheimer''s disease'),
(47, 'Risperidone', 'Antipsychotic for schizophrenia'),
(48, 'Quetiapine', 'Mood stabilizer and antipsychotic'),
(49, 'Sertraline', 'SSRI antidepressant'),
(50, 'Citalopram', 'Antidepressant for anxiety and depression'),
(51, 'Fluoxetine', 'Common SSRI antidepressant'),
(52, 'Bupropion', 'Used for depression and quitting smoking'),
(53, 'Trazodone', 'Used for sleep and depression'),
(54, 'Naproxen', 'NSAID for pain relief'),
(55, 'Meloxicam', 'NSAID for arthritis'),
(56, 'Propranolol', 'Beta blocker for anxiety and heart issues'),
(57, 'Hydralazine', 'Vasodilator for hypertension'),
(58, 'Bisoprolol', 'Beta blocker for heart failure'),
(59, 'Desvenlafaxine', 'SNRI antidepressant'),
(60, 'Venlafaxine', 'SNRI for depression and anxiety'),
(61, 'Olanzapine', 'Antipsychotic medication'),
(62, 'Lithium', 'Mood stabilizer for bipolar disorder');

-- ------------------------------------------------------------
-- 2.7 Prescriptions
-- ------------------------------------------------------------

-- Prescriptions 1-26
INSERT INTO prescriptions
    (prescription_id, patient_id, doctor_id, medication_id, prescribed_date)
VALUES
(1, 49, 3, 32, '2025-03-02'),
(2, 76, 3, 44, '2025-01-01'),
(3, 38, 26, 59, '2025-02-03'),
(4, 2, 3, 57, '2025-04-20'),
(5, 18, 7, 21, '2025-08-30'),
(6, 20, 24, 54, '2025-05-22'),
(7, 35, 8, 32, '2025-09-01'),
(8, 43, 2, 32, '2025-07-29'),
(9, 44, 13, 41, '2025-09-05'),
(10, 102, 1, 43, '2025-03-14'),
(11, 48, 4, 56, '2025-06-21'),
(12, 92, 13, 13, '2025-04-18'),
(13, 12, 18, 35, '2025-08-05'),
(14, 44, 17, 40, '2025-06-02'),
(15, 100, 10, 60, '2025-04-11'),
(16, 80, 15, 15, '2025-08-23'),
(17, 5, 30, 1, '2025-07-29'),
(18, 6, 16, 22, '2025-05-03'),
(19, 35, 26, 46, '2025-04-16'),
(20, 21, 19, 62, '2025-04-11'),
(21, 20, 23, 48, '2025-04-11'),
(22, 75, 22, 58, '2025-03-19'),
(23, 38, 7, 21, '2025-02-11'),
(24, 47, 14, 53, '2025-07-26'),
(25, 51, 3, 21, '2025-01-31'),
(26, 71, 12, 3, '2025-06-05');

-- Prescriptions 27-52
INSERT INTO prescriptions
    (prescription_id, patient_id, doctor_id, medication_id, prescribed_date)
VALUES
(27, 17, 8, 34, '2025-02-09'),
(28, 38, 9, 10, '2025-08-05'),
(29, 15, 19, 56, '2025-02-26'),
(30, 62, 25, 17, '2025-02-01'),
(31, 94, 6, 39, '2025-01-05'),
(32, 31, 14, 51, '2025-08-14'),
(33, 120, 7, 10, '2025-07-16'),
(34, 7, 12, 54, '2025-03-20'),
(35, 40, 4, 25, '2025-08-04'),
(36, 23, 3, 38, '2025-05-07'),
(37, 110, 27, 19, '2025-02-24'),
(38, 67, 28, 46, '2025-05-22'),
(39, 94, 28, 46, '2025-01-08'),
(40, 10, 23, 52, '2025-06-23'),
(41, 39, 1, 31, '2025-03-09'),
(42, 52, 29, 5, '2025-04-04'),
(43, 107, 17, 52, '2025-08-03'),
(44, 43, 15, 6, '2025-06-05'),
(45, 39, 25, 34, '2025-08-27'),
(46, 54, 22, 56, '2025-02-26'),
(47, 14, 7, 59, '2025-01-02'),
(48, 13, 4, 3, '2025-08-01'),
(49, 72, 16, 5, '2025-06-01'),
(50, 117, 13, 15, '2025-02-03'),
(51, 62, 9, 9, '2025-03-05'),
(52, 61, 7, 3, '2025-08-24');

-- Prescriptions 53-77
INSERT INTO prescriptions
    (prescription_id, patient_id, doctor_id, medication_id, prescribed_date)
VALUES
(53, 44, 21, 20, '2025-05-24'),
(54, 108, 2, 1, '2025-05-18'),
(55, 103, 26, 49, '2025-07-11'),
(56, 104, 7, 55, '2025-08-13'),
(57, 44, 20, 29, '2025-04-08'),
(58, 16, 5, 22, '2025-07-25'),
(59, 62, 4, 56, '2025-08-05'),
(60, 15, 7, 11, '2025-08-26'),
(61, 90, 15, 52, '2025-04-30'),
(62, 64, 13, 10, '2025-08-11'),
(63, 55, 12, 56, '2025-07-25'),
(64, 5, 18, 42, '2025-04-27'),
(65, 39, 27, 30, '2025-06-28'),
(66, 43, 5, 62, '2025-02-03'),
(67, 95, 4, 24, '2025-07-05'),
(68, 88, 20, 33, '2025-04-09'),
(69, 115, 16, 25, '2025-07-26'),
(70, 20, 5, 58, '2025-03-27'),
(71, 118, 19, 34, '2025-07-18'),
(72, 22, 13, 33, '2025-03-14'),
(73, 81, 21, 3, '2025-05-05'),
(74, 73, 22, 37, '2025-04-09'),
(75, 49, 14, 6, '2025-09-06'),
(76, 104, 29, 44, '2025-03-02'),
(77, 82, 17, 51, '2025-07-29');

-- ------------------------------------------------------------
-- 2.8 Rooms
-- ------------------------------------------------------------

-- Rooms 1-23
INSERT INTO rooms
    (room_id, room_no, department_id, capacity)
VALUES
(1, '101A', 3, 2),
(2, '101B', 3, 1),
(3, '102', 5, 2),
(4, '103', 5, 4),
(5, '104', 7, 2),
(6, '105', 8, 1),
(7, '106', 8, 3),
(8, '201A', 9, 2),
(9, '201B', 9, 1),
(10, '202', 10, 2),
(11, '203', 10, 4),
(12, '204', 12, 2),
(13, '205', 13, 3),
(14, '301A', 13, 2),
(15, '301B', 13, 1),
(16, '302', 15, 2),
(17, '303', 15, 4),
(18, '304', 17, 2),
(19, '305', 17, 1),
(20, '306', 17, 3),
(21, '401A', 18, 2),
(22, '401B', 18, 1),
(23, '402', 18, 2);

-- Rooms 24-45
INSERT INTO rooms
    (room_id, room_no, department_id, capacity)
VALUES
(24, '403', 20, 4),
(25, '404', 21, 2),
(26, '405', 21, 1),
(27, '406', 21, 3),
(28, '501A', 23, 2),
(29, '501B', 23, 1),
(30, '502', 24, 2),
(31, '503', 25, 4),
(32, '504', 25, 2),
(33, '505', 26, 3),
(34, '601A', 27, 2),
(35, '601B', 27, 1),
(36, '602', 29, 2),
(37, '603', 29, 4),
(38, '604', 30, 2),
(39, '605', 31, 1),
(40, '606', 31, 3),
(41, '701A', 32, 2),
(42, '701B', 32, 1),
(43, '702', 32, 2),
(44, '703', 33, 4),
(45, '704', 35, 2);

-- ============================================================
-- SECTION 3: DATA VALIDATION
-- ============================================================

-- ------------------------------------------------------------
-- 3.1 Row Count Validation
-- ------------------------------------------------------------

SELECT 'hospitals' AS table_name, COUNT(*) AS row_count FROM hospitals
UNION ALL
SELECT 'doctors', COUNT(*) FROM doctors
UNION ALL
SELECT 'patients', COUNT(*) FROM patients
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments
UNION ALL
SELECT 'departments', COUNT(*) FROM departments
UNION ALL
SELECT 'medications', COUNT(*) FROM medications
UNION ALL
SELECT 'prescriptions', COUNT(*) FROM prescriptions
UNION ALL
SELECT 'rooms', COUNT(*) FROM rooms;

-- ------------------------------------------------------------
-- 3.2 Referential Integrity Validation
-- ------------------------------------------------------------

SELECT 'doctors -> hospitals' AS relationship,
       COUNT(*) AS orphan_rows
FROM doctors d
LEFT JOIN hospitals h
    ON d.hospital_id = h.hospital_id
WHERE h.hospital_id IS NULL

UNION ALL

SELECT 'appointments -> patients',
       COUNT(*)
FROM appointments a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL

UNION ALL

SELECT 'appointments -> doctors',
       COUNT(*)
FROM appointments a
LEFT JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL

UNION ALL

SELECT 'departments -> hospitals',
       COUNT(*)
FROM departments dep
LEFT JOIN hospitals h
    ON dep.hospital_id = h.hospital_id
WHERE h.hospital_id IS NULL

UNION ALL

SELECT 'prescriptions -> patients',
       COUNT(*)
FROM prescriptions pr
LEFT JOIN patients p
    ON pr.patient_id = p.patient_id
WHERE p.patient_id IS NULL

UNION ALL

SELECT 'prescriptions -> doctors',
       COUNT(*)
FROM prescriptions pr
LEFT JOIN doctors d
    ON pr.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL

UNION ALL

SELECT 'prescriptions -> medications',
       COUNT(*)
FROM prescriptions pr
LEFT JOIN medications m
    ON pr.medication_id = m.medication_id
WHERE m.medication_id IS NULL

UNION ALL

SELECT 'rooms -> departments',
       COUNT(*)
FROM rooms r
LEFT JOIN departments dep
    ON r.department_id = dep.department_id
WHERE dep.department_id IS NULL;

-- ------------------------------------------------------------
-- 3.3 Simple SELECT Checks
-- ------------------------------------------------------------

SELECT * FROM hospitals LIMIT 5;
SELECT * FROM doctors LIMIT 5;
SELECT * FROM patients LIMIT 5;
SELECT * FROM appointments LIMIT 5;
SELECT * FROM departments LIMIT 5;
SELECT * FROM medications LIMIT 5;
SELECT * FROM prescriptions LIMIT 5;
SELECT * FROM rooms LIMIT 5;

-- ============================================================
-- SECTION 4: REQUIRED ANALYTICAL QUERIES 1-10
-- ============================================================


-- ------------------------------------------------------------
-- Query 1: Find all patients born after the year 2000
-- ------------------------------------------------------------

SELECT
    patient_id,
    name,
    dob
FROM patients
WHERE dob >= '2001-01-01'
ORDER BY dob;


-- ------------------------------------------------------------
-- Query 2: Find all prescriptions for patient_id 5
-- ------------------------------------------------------------

SELECT
    prescription_id,
    patient_id,
    doctor_id,
    medication_id,
    prescribed_date
FROM prescriptions
WHERE patient_id = 5
ORDER BY prescribed_date;


-- ------------------------------------------------------------
-- Query 3: Number of appointments per month
-- ------------------------------------------------------------

SELECT
    DATE_FORMAT(appointment_date, '%Y-%m') AS appointment_month,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY DATE_FORMAT(appointment_date, '%Y-%m')
ORDER BY appointment_month;


-- ------------------------------------------------------------
-- Query 4: Medications related to pain or infection
-- ------------------------------------------------------------

SELECT
    medication_id,
    name,
    description
FROM medications
WHERE LOWER(description) LIKE '%pain%'
   OR LOWER(description) LIKE '%infection%'
ORDER BY medication_id;


-- ------------------------------------------------------------
-- Query 5: All doctors with their hospital name
-- ------------------------------------------------------------

SELECT
    d.doctor_id,
    d.name AS doctor_name,
    d.specialty,
    h.name AS hospital_name
FROM doctors d
JOIN hospitals h
    ON d.hospital_id = h.hospital_id
ORDER BY h.name, d.name;

-- ------------------------------------------------------------
-- Query 6: Patients with appointments in August 2025
-- ------------------------------------------------------------

SELECT
    p.name AS patient_name,
    p.phone,
    a.appointment_date
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
WHERE a.appointment_date >= '2025-08-01'
  AND a.appointment_date < '2025-09-01'
ORDER BY a.appointment_date, p.name;


-- ------------------------------------------------------------
-- Query 7: Rooms in Neurology departments
-- ------------------------------------------------------------

SELECT
    r.room_no,
    r.capacity
FROM rooms r
JOIN departments d
    ON r.department_id = d.department_id
WHERE d.name = 'Neurology'
ORDER BY r.room_no;


-- ------------------------------------------------------------
-- Query 8: Number of doctors per hospital
-- ------------------------------------------------------------

SELECT
    h.hospital_id,
    h.name AS hospital_name,
    COUNT(d.doctor_id) AS doctor_count
FROM hospitals h
LEFT JOIN doctors d
    ON h.hospital_id = d.hospital_id
GROUP BY h.hospital_id, h.name
ORDER BY doctor_count DESC, h.name;


-- ------------------------------------------------------------
-- Query 9: Patients with more than 3 appointments
-- ------------------------------------------------------------

SELECT
    p.patient_id,
    p.name,
    COUNT(a.appointment_id) AS appointment_count
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.name
HAVING COUNT(a.appointment_id) > 3
ORDER BY appointment_count DESC, p.name;


-- ------------------------------------------------------------
-- Query 10: Appointments with patient and doctor names
-- ------------------------------------------------------------

SELECT
    a.appointment_id,
    a.appointment_date,
    a.reason,
    p.name AS patient_name,
    d.name AS doctor_name
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date, a.appointment_id;

-- ============================================================
-- SECTION 5: ADVANCED ANALYTICAL QUERIES 11-18
-- ============================================================


-- ------------------------------------------------------------
-- Query 11: Emergency appointments with patient age group
-- ------------------------------------------------------------

SELECT
    p.name AS patient_name,
    p.dob,
    a.appointment_date,
    TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date) AS age_at_appointment,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date) <= 18
            THEN 'Pediatric'
        WHEN TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date)
             BETWEEN 19 AND 64
            THEN 'Adult'
        ELSE 'Geriatric'
    END AS age_group
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
WHERE a.reason = 'Emergency'
ORDER BY a.appointment_date, p.name;


-- ------------------------------------------------------------
-- Query 12: Departments of Green Valley Medical Center
-- ------------------------------------------------------------

SELECT
    d.department_id,
    d.name AS department_name
FROM departments d
JOIN hospitals h
    ON d.hospital_id = h.hospital_id
WHERE h.name = 'Green Valley Medical Center'
ORDER BY d.department_id;


-- ------------------------------------------------------------
-- Query 13: Patients who have never had a prescription
-- ------------------------------------------------------------

SELECT
    p.patient_id,
    p.name,
    p.dob,
    p.address,
    p.phone
FROM patients p
LEFT JOIN prescriptions pr
    ON p.patient_id = pr.patient_id
WHERE pr.prescription_id IS NULL
ORDER BY p.patient_id;


-- ------------------------------------------------------------
-- Query 14: Patients with appointments in more than one hospital
-- ------------------------------------------------------------

SELECT
    p.patient_id,
    p.name,
    p.address,
    p.phone,
    COUNT(DISTINCT d.hospital_id) AS hospitals_visited
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY
    p.patient_id,
    p.name,
    p.address,
    p.phone
HAVING COUNT(DISTINCT d.hospital_id) > 1
ORDER BY hospitals_visited DESC, p.name;

-- ------------------------------------------------------------
-- Query 15: Latest appointment for each patient
-- ------------------------------------------------------------

WITH ranked_appointments AS (
    SELECT
        a.appointment_id,
        a.patient_id,
        a.doctor_id,
        a.appointment_date,
        a.reason,
        ROW_NUMBER() OVER (
            PARTITION BY a.patient_id
            ORDER BY a.appointment_date DESC, a.appointment_id DESC
        ) AS rn
    FROM appointments a
)

SELECT
    p.patient_id,
    p.name AS patient_name,
    ra.appointment_id,
    ra.appointment_date,
    ra.reason
FROM ranked_appointments ra
JOIN patients p
    ON ra.patient_id = p.patient_id
WHERE ra.rn = 1
ORDER BY p.patient_id;


-- ------------------------------------------------------------
-- Query 16: 3rd most frequently prescribed medication(s)
-- ------------------------------------------------------------

WITH medication_counts AS (
    SELECT
        m.medication_id,
        m.name,
        COUNT(pr.prescription_id) AS prescription_count
    FROM medications m
    JOIN prescriptions pr
        ON m.medication_id = pr.medication_id
    GROUP BY m.medication_id, m.name
),
ranked_medications AS (
    SELECT
        medication_id,
        name,
        prescription_count,
        DENSE_RANK() OVER (
            ORDER BY prescription_count DESC
        ) AS frequency_rank
    FROM medication_counts
)

SELECT
    medication_id,
    name,
    prescription_count
FROM ranked_medications
WHERE frequency_rank = 3
ORDER BY name;


-- ------------------------------------------------------------
-- Query 17: Hospital(s) with the lowest doctor count
-- ------------------------------------------------------------

WITH doctor_counts AS (
    SELECT
        h.hospital_id,
        h.name AS hospital_name,
        COUNT(d.doctor_id) AS doctor_count
    FROM hospitals h
    LEFT JOIN doctors d
        ON h.hospital_id = d.hospital_id
    GROUP BY h.hospital_id, h.name
),
ranked_hospitals AS (
    SELECT
        hospital_id,
        hospital_name,
        doctor_count,
        DENSE_RANK() OVER (
            ORDER BY doctor_count ASC
        ) AS doctor_rank
    FROM doctor_counts
)

SELECT
    hospital_id,
    hospital_name,
    doctor_count
FROM ranked_hospitals
WHERE doctor_rank = 1
ORDER BY hospital_name;


-- ------------------------------------------------------------
-- Query 18: Department with second-largest room capacity
--            in each hospital
-- ------------------------------------------------------------

WITH department_capacity AS (
    SELECT
        h.hospital_id,
        h.name AS hospital_name,
        d.department_id,
        d.name AS department_name,
        SUM(r.capacity) AS total_room_capacity
    FROM hospitals h
    JOIN departments d
        ON h.hospital_id = d.hospital_id
    JOIN rooms r
        ON d.department_id = r.department_id
    GROUP BY
        h.hospital_id,
        h.name,
        d.department_id,
        d.name
),
ranked_departments AS (
    SELECT
        hospital_id,
        hospital_name,
        department_id,
        department_name,
        total_room_capacity,
        DENSE_RANK() OVER (
            PARTITION BY hospital_id
            ORDER BY total_room_capacity DESC
        ) AS capacity_rank
    FROM department_capacity
)

SELECT
    hospital_name,
    department_name,
    total_room_capacity
FROM ranked_departments
WHERE capacity_rank = 2
ORDER BY hospital_name, department_name;

-- ============================================================
-- SECTION 6: BONUS ANALYSIS
-- ============================================================


-- ------------------------------------------------------------
-- Bonus Query 1: Most Common Appointment Reasons
-- ------------------------------------------------------------

SELECT
    reason,
    COUNT(*) AS total_appointments,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM appointments),
        2
    ) AS percentage
FROM appointments
GROUP BY reason
ORDER BY total_appointments DESC;


-- ------------------------------------------------------------
-- Bonus Query 2: Average Room Capacity per Hospital
-- ------------------------------------------------------------

SELECT
    h.hospital_id,
    h.name AS hospital_name,
    COUNT(r.room_id) AS total_rooms,
    SUM(r.capacity) AS total_capacity,
    ROUND(AVG(r.capacity), 2) AS average_room_capacity
FROM hospitals h
JOIN departments d
    ON h.hospital_id = d.hospital_id
JOIN rooms r
    ON d.department_id = r.department_id
GROUP BY h.hospital_id, h.name
ORDER BY average_room_capacity DESC;

-- ------------------------------------------------------------
-- Bonus Query 3: Month-over-Month Appointment Trend
-- ------------------------------------------------------------

WITH monthly_appointments AS (
    SELECT
        DATE_FORMAT(appointment_date, '%Y-%m') AS month,
        COUNT(*) AS total_appointments
    FROM appointments
    GROUP BY DATE_FORMAT(appointment_date, '%Y-%m')
)

SELECT
    month,
    total_appointments,
    total_appointments
        - LAG(total_appointments) OVER (ORDER BY month)
        AS change_from_previous_month
FROM monthly_appointments
ORDER BY month;


-- ------------------------------------------------------------
-- Bonus Query 4: Top Hospital(s) by Medical Specialty
-- ------------------------------------------------------------

WITH specialty_counts AS (
    SELECT
        d.specialty,
        h.hospital_id,
        h.name AS hospital_name,
        COUNT(d.doctor_id) AS specialist_count
    FROM doctors d
    JOIN hospitals h
        ON d.hospital_id = h.hospital_id
    GROUP BY
        d.specialty,
        h.hospital_id,
        h.name
),
ranked_specialties AS (
    SELECT
        specialty,
        hospital_name,
        specialist_count,
        DENSE_RANK() OVER (
            PARTITION BY specialty
            ORDER BY specialist_count DESC
        ) AS specialty_rank
    FROM specialty_counts
)

SELECT
    specialty,
    hospital_name,
    specialist_count
FROM ranked_specialties
WHERE specialty_rank = 1
ORDER BY specialty, hospital_name;


-- ============================================================
-- END OF HOSPITAL MANAGEMENT SYSTEM PROJECT
-- ============================================================