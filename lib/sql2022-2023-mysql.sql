-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 89.46.111.223:3306
-- Creato il: Gen 15, 2023 alle 21:33
-- Versione del server: 5.7.36-39-log
-- Versione PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `Sql1587258_5`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_CATEGORIE`
--

CREATE TABLE `UISP_CATEGORIE` (
  `ID` int(11) NOT NULL,
  `DESCRIZIONE` varchar(80) NOT NULL,
  `ANNO` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_CATEGORIE`
--

INSERT INTO `UISP_CATEGORIE` (`ID`, `DESCRIZIONE`, `ANNO`, `NOTE`) VALUES
(1, '2022-2023', 2023, 'Regolamento gare 2022-2023');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_CATEGORIE2`
--

CREATE TABLE `UISP_CATEGORIE2` (
  `ID` int(11) NOT NULL,
  `IDCATEGORIA` int(11) NOT NULL,
  `DESCRIZIONE` varchar(200) CHARACTER SET ascii NOT NULL,
  `ANNO1` int(11) NOT NULL,
  `ANNO2` int(11) NOT NULL,
  `KATA` int(11) NOT NULL,
  `KUMITE` int(11) NOT NULL,
  `PESOINIZIALE` int(11) NOT NULL,
  `PESOFINALE` int(11) NOT NULL,
  `CINTURADA` int(11) NOT NULL,
  `CINTURAA` int(11) NOT NULL,
  `SESSO` varchar(1) CHARACTER SET ascii NOT NULL,
  `NOTE` varchar(200) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `UISP_CATEGORIE2`
--

INSERT INTO `UISP_CATEGORIE2` (`ID`, `IDCATEGORIA`, `DESCRIZIONE`, `ANNO1`, `ANNO2`, `KATA`, `KUMITE`, `PESOINIZIALE`, `PESOFINALE`, `CINTURADA`, `CINTURAA`, `SESSO`, `NOTE`) VALUES
(1, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(2, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(3, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(4, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(5, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(6, 1, 'Fascia A', 2017, 2015, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(7, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(8, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(9, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(10, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 6, 6, 'M', 'Marrone'),
(11, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(12, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(13, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(14, 1, 'Fascia B', 2014, 2013, 1, 0, 0, 0, 6, 6, 'F', 'Marrone'),
(15, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(16, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(17, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(18, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 6, 7, 'M', 'Marrone/Nera'),
(19, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(20, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(21, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(22, 1, 'Fascia C', 2012, 2011, 1, 0, 0, 0, 6, 7, 'F', 'Marrone/Nera'),
(23, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(24, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(25, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(26, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 6, 7, 'M', 'Marrone/Nera'),
(27, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(28, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(29, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(30, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 1, 0, 0, 0, 6, 7, 'F', 'Marrone/Nera'),
(31, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(32, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(33, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(34, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 6, 6, 'M', 'Marrone'),
(35, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(36, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(37, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(38, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(39, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 6, 6, 'F', 'Marrone'),
(40, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(41, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(42, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(43, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(44, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 6, 6, 'M', 'Marrone'),
(45, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(46, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(47, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(48, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(49, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 6, 6, 'F', 'Marrone'),
(50, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(51, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(52, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(53, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(54, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 6, 6, 'M', 'Marrone'),
(55, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(56, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(57, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(58, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(59, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 6, 6, 'F', 'Marrone'),
(60, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(61, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 1, 1, 'M', 'Bianca'),
(62, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 2, 3, 'M', 'Gialla/Arancio'),
(63, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 4, 5, 'M', 'Verde/Blu'),
(64, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 6, 6, 'M', 'Marrone'),
(65, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(66, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 1, 1, 'F', 'Bianca'),
(67, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 2, 3, 'F', 'Gialla/Arancio'),
(68, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 4, 5, 'F', 'Verde/Blu'),
(69, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 6, 6, 'F', 'Marrone'),
(70, 1, 'Seniores kata dal 24mo al 38mo anno', 1999, 1985, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(71, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 1, 3, 'M', 'Bianca/Gialla/Arancio'),
(72, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 4, 6, 'M', 'Verde/Blu/Marrone'),
(73, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(74, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 1, 3, 'F', 'Bianca/Gialla/Arancio'),
(75, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 4, 6, 'F', 'Verde/Blu/Marrone'),
(76, 1, 'Amatori A dal 39mo al 50mo anno', 1984, 1973, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(77, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 1, 3, 'M', 'Bianca/Gialla/Arancio'),
(78, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 4, 6, 'M', 'Verde/Blu/Marrone'),
(79, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 7, 7, 'M', 'Nera'),
(80, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 1, 3, 'F', 'Bianca/Gialla/Arancio'),
(81, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 4, 6, 'F', 'Verde/Blu/Marrone'),
(82, 1, 'Amatori B dal 51mo anno', 1972, 1901, 1, 0, 0, 0, 7, 7, 'F', 'Nera'),
(83, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 0, 50, 4, 5, 'M', ''),
(84, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 50, 99, 4, 5, 'M', ''),
(85, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 0, 45, 4, 5, 'F', ''),
(86, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 45, 99, 4, 5, 'F', ''),
(87, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 0, 50, 6, 7, 'M', ''),
(88, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 50, 99, 6, 7, 'M', ''),
(89, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 0, 45, 6, 7, 'F', ''),
(90, 1, 'Esordienti dal 13mo al 14mo anno', 2010, 2009, 0, 1, 45, 99, 6, 7, 'F', ''),
(91, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 50, 65, 4, 5, 'M', ''),
(92, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 65, 99, 4, 5, 'M', ''),
(93, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 40, 99, 4, 5, 'F', ''),
(94, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 55, 65, 4, 5, 'M', ''),
(95, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 65, 99, 4, 5, 'M', ''),
(96, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 45, 99, 4, 5, 'F', ''),
(97, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 55, 70, 4, 5, 'M', ''),
(98, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 70, 99, 4, 5, 'M', ''),
(99, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 45, 99, 4, 5, 'F', ''),
(100, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 55, 70, 4, 5, 'M', ''),
(101, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 70, 99, 4, 5, 'M', ''),
(102, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 45, 99, 4, 5, 'F', ''),
(103, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 50, 65, 6, 6, 'M', ''),
(104, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 65, 99, 6, 6, 'M', ''),
(105, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 40, 99, 6, 6, 'F', ''),
(106, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 55, 65, 6, 6, 'M', ''),
(107, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 65, 99, 6, 6, 'M', ''),
(108, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 45, 99, 6, 6, 'F', ''),
(109, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 55, 65, 6, 6, 'M', ''),
(110, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 65, 75, 6, 6, 'M', ''),
(111, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 75, 99, 6, 6, 'M', ''),
(112, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 45, 55, 6, 6, 'F', ''),
(113, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 55, 99, 6, 6, 'F', ''),
(114, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 55, 65, 6, 6, 'M', ''),
(115, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 65, 75, 6, 6, 'M', ''),
(116, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 75, 99, 6, 6, 'M', ''),
(117, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 45, 55, 6, 6, 'F', ''),
(118, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 55, 99, 6, 6, 'F', ''),
(119, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 50, 65, 7, 7, 'M', ''),
(120, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 65, 99, 7, 7, 'M', ''),
(121, 1, 'Cadetti dal 15mo al 16mo anno', 2008, 2007, 0, 1, 40, 99, 7, 7, 'F', ''),
(122, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 55, 65, 7, 7, 'M', ''),
(123, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 65, 99, 7, 7, 'M', ''),
(124, 1, 'Speranze dal 17mo al 19mo anno', 2006, 2004, 0, 1, 45, 99, 7, 7, 'F', ''),
(125, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 55, 65, 7, 7, 'M', ''),
(126, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 65, 75, 7, 7, 'M', ''),
(127, 1, 'Juniores dal 20mo al 23mo anno', 2003, 2000, 0, 1, 75, 99, 7, 7, 'M', ''),
(128, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 55, 65, 7, 7, 'M', ''),
(129, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 65, 75, 7, 7, 'M', ''),
(130, 1, 'Seniores dal 24mo al 35mo anno', 1999, 1988, 0, 1, 75, 99, 7, 7, 'M', ''),
(131, 1, 'Juniores & Seniores dal 20mo al 35mo anno', 2003, 1988, 0, 1, 45, 55, 7, 7, 'F', ''),
(132, 1, 'Juniores & Seniores dal 20mo al 35mo anno', 2003, 1988, 0, 1, 55, 99, 7, 7, 'F', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_CINTURE`
--

CREATE TABLE `UISP_CINTURE` (
  `ID` int(11) NOT NULL,
  `DESCRIZIONE` varchar(80) NOT NULL,
  `NOTE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_CINTURE`
--

INSERT INTO `UISP_CINTURE` (`ID`, `DESCRIZIONE`, `NOTE`) VALUES
(1, 'Bianca', ''),
(2, 'Gialla', ''),
(3, 'Arancio', ''),
(4, 'Verde', ''),
(5, 'Blu', ''),
(6, 'Marrone', ''),
(7, 'Nera', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_GARE`
--

CREATE TABLE `UISP_GARE` (
  `ID` int(11) NOT NULL,
  `IDSOCIETA` int(11) NOT NULL,
  `DATA` date NOT NULL,
  `DESCRIZIONE` varchar(200) NOT NULL,
  `NOTE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_GARE`
--

INSERT INTO `UISP_GARE` (`ID`, `IDSOCIETA`, `DATA`, `DESCRIZIONE`, `NOTE`) VALUES
(1, 1, '2022-01-20', 'DD', 'NN'),
(2, 1, '2023-01-20', 'DD333', 'NN3333'),
(3, 1, '2023-02-01', 'Gara 3 gggggggggggggg', 'Gara 3 Note uuuuuuuuuuuuuuuuuuu'),
(4, 1, '2023-01-30', '30 Gennaio', 'note 30 gennaio'),
(5, 1, '2023-01-07', 'aaa', 'bbb'),
(6, 1, '2023-01-07', 'AAAAAAAAAAAAA', 'BBBBBBBBBBBBBBBB'),
(7, 1, '2023-01-07', 'aa', 'gg'),
(8, 1, '2023-01-31', 'ZZZZZZZZZZ', 'XXXXXXXXXXXXXX');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_GARE2`
--

CREATE TABLE `UISP_GARE2` (
  `ID` int(11) NOT NULL,
  `IDGARA` int(11) NOT NULL,
  `CFSOCIETA` varchar(20) NOT NULL,
  `SOCIETA` varchar(50) NOT NULL,
  `SOCIETA2` varchar(50) NOT NULL,
  `COGNOME` varchar(50) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `SESSO` varchar(1) NOT NULL,
  `CINTURA` varchar(20) NOT NULL,
  `IDCINTURA` int(11) NOT NULL,
  `ANNO` int(11) NOT NULL,
  `KATA` int(11) NOT NULL,
  `KUMITE` int(11) NOT NULL,
  `PESO` int(11) NOT NULL,
  `CF` varchar(20) NOT NULL,
  `NRTESSERA` varchar(30) NOT NULL,
  `NOTE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_GARE2`
--

INSERT INTO `UISP_GARE2` (`ID`, `IDGARA`, `CFSOCIETA`, `SOCIETA`, `SOCIETA2`, `COGNOME`, `NOME`, `SESSO`, `CINTURA`, `IDCINTURA`, `ANNO`, `KATA`, `KUMITE`, `PESO`, `CF`, `NRTESSERA`, `NOTE`) VALUES
(1, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'sorbelli', 'graziano', 'm', 'nera', 1, 1966, 1, 0, 0, 'srbgzn66a20e230f', '20220000001', ''),
(2, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'sorbelli', 'andrea', 'm', 'nera', 1, 1992, 1, 1, 80, 'srbgzn66a20e230XX', '20220000002', ''),
(3, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'sorbelli', 'luca', 'm', 'nera', 1, 1994, 1, 1, 70, 'srbgzn66a20e230YY', '20220000003', ''),
(4, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', 1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(5, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', 1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(6, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', 1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(7, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', -1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(8, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', -1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(9, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', -1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(10, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', -1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(11, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', -1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(12, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', -1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(13, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', -1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(14, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', -1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(15, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', -1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(16, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', -1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(17, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', -1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(18, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', -1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(19, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', -1, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(20, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', -1, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(21, 4, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', -1, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', ''),
(22, 3, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'GRAZIANO', 'M', 'NERA', 7, 1966, 1, 0, 0, 'SRBGZN66A20E230F', '20220000001', ''),
(23, 3, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'ANDREA', 'M', 'NERA', 7, 1992, 1, 1, 80, 'SRBGZN66A20E230XX', '20220000002', ''),
(24, 3, '12345678901', 'A.S.D. SKS SCUOLA KARATE SHOTOKAN', 'CASTIGLIONE OLONA', 'SORBELLI', 'LUCA', 'M', 'NERA', 7, 1994, 1, 1, 70, 'SRBGZN66A20E230YY', '20220000003', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_SOCIETA`
--

CREATE TABLE `UISP_SOCIETA` (
  `ID` int(11) NOT NULL,
  `RAGIONESOCIALE` varchar(200) NOT NULL,
  `N1` varchar(200) NOT NULL,
  `N2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_SOCIETA`
--

INSERT INTO `UISP_SOCIETA` (`ID`, `RAGIONESOCIALE`, `N1`, `N2`) VALUES
(1, 'NON ASSEGNATA', 'NOTE 1', 'NOTE 2');

-- --------------------------------------------------------

--
-- Struttura della tabella `UISP_UTENTI`
--

CREATE TABLE `UISP_UTENTI` (
  `ID` int(11) NOT NULL,
  `IDSOCIETA` int(11) NOT NULL,
  `LIVELLO` int(11) NOT NULL,
  `UTENTE` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `NOME` varchar(200) NOT NULL,
  `N1` varchar(200) NOT NULL,
  `N2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dump dei dati per la tabella `UISP_UTENTI`
--

INSERT INTO `UISP_UTENTI` (`ID`, `IDSOCIETA`, `LIVELLO`, `UTENTE`, `PASSWORD`, `NOME`, `N1`, `N2`) VALUES
(1, 1, 1, 'admin', '$2y$10$w435ZJAG/G4wbKCfHQhmxu3Cs9BDY3PQQWC4RmxPgduUZtHKiUdpq', 'Amministratore', 'PASSWORD=admin', 'Note 2');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `UISP_CATEGORIE`
--
ALTER TABLE `UISP_CATEGORIE`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `UISP_CATEGORIE2`
--
ALTER TABLE `UISP_CATEGORIE2`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idcategoria` (`IDCATEGORIA`),
  ADD KEY `cinturada` (`CINTURADA`),
  ADD KEY `cinturaa` (`CINTURAA`);

--
-- Indici per le tabelle `UISP_CINTURE`
--
ALTER TABLE `UISP_CINTURE`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `UISP_GARE`
--
ALTER TABLE `UISP_GARE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idsocieta` (`IDSOCIETA`);

--
-- Indici per le tabelle `UISP_GARE2`
--
ALTER TABLE `UISP_GARE2`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idgara` (`IDGARA`);

--
-- Indici per le tabelle `UISP_SOCIETA`
--
ALTER TABLE `UISP_SOCIETA`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `UISP_UTENTI`
--
ALTER TABLE `UISP_UTENTI`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `UISP_CATEGORIE`
--
ALTER TABLE `UISP_CATEGORIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `UISP_CATEGORIE2`
--
ALTER TABLE `UISP_CATEGORIE2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT per la tabella `UISP_CINTURE`
--
ALTER TABLE `UISP_CINTURE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `UISP_GARE`
--
ALTER TABLE `UISP_GARE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `UISP_GARE2`
--
ALTER TABLE `UISP_GARE2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `UISP_SOCIETA`
--
ALTER TABLE `UISP_SOCIETA`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `UISP_UTENTI`
--
ALTER TABLE `UISP_UTENTI`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `UISP_CATEGORIE2`
--
ALTER TABLE `UISP_CATEGORIE2`
  ADD CONSTRAINT `cinturaa` FOREIGN KEY (`CINTURAA`) REFERENCES `UISP_CINTURE` (`ID`),
  ADD CONSTRAINT `cinturada` FOREIGN KEY (`CINTURADA`) REFERENCES `UISP_CINTURE` (`ID`),
  ADD CONSTRAINT `idcategoria` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `UISP_CATEGORIE` (`ID`);

--
-- Limiti per la tabella `UISP_GARE`
--
ALTER TABLE `UISP_GARE`
  ADD CONSTRAINT `idsocieta` FOREIGN KEY (`IDSOCIETA`) REFERENCES `UISP_SOCIETA` (`ID`);

--
-- Limiti per la tabella `UISP_GARE2`
--
ALTER TABLE `UISP_GARE2`
  ADD CONSTRAINT `idgara` FOREIGN KEY (`IDGARA`) REFERENCES `UISP_GARE` (`ID`);
COMMIT;
