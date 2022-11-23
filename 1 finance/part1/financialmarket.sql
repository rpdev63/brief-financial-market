-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 23 nov. 2022 à 10:30
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `financialmarket`
--
CREATE DATABASE IF NOT EXISTS financialmarket;
use financialmarket;
-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `nom` varchar(200) NOT NULL,
  `style` varchar(100) DEFAULT NULL,
  `chef` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`nom`, `style`, `chef`) VALUES
('equipe1', 'market making', 'leonardo'),
('equipe2', 'arbitrage', 'michaelgelo'),
('equipe3', 'trading de volatilite', 'raphael'),
('equipe4', 'trading de haute frequence', 'donatello'),
('equipe5', 'arbitrage statistique', 'Smith'),
('equipe6', 'arbitrage statistique', 'Smith'),
('equipe7', 'strategie fond de fond', 'Ray');

-- --------------------------------------------------------

--
-- Structure de la table `trader`
--

DROP TABLE IF EXISTS `trader`;
CREATE TABLE IF NOT EXISTS `trader` (
  `nom` varchar(200) NOT NULL,
  `classe_actif` varchar(50) NOT NULL,
  `anneeExperience` tinyint(4) NOT NULL,
  `nomEquipe` varchar(200) NOT NULL,
  PRIMARY KEY (`nom`),
  KEY `nomEquipe` (`nomEquipe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `trader`
--

INSERT INTO `trader` (`nom`, `classe_actif`, `anneeExperience`, `nomEquipe`) VALUES
('Yannick', 'fixed income', 10, 'equipe1'),
('Patrick', 'action', 10, 'equipe1'),
('Cedrick', 'commodities', 10, 'equipe1'),
('Jordan', 'change', 2, 'equipe2'),
('Gaelle', 'exotic', 4, 'equipe3'),
('Georges', 'CDS', 20, 'equipe6');

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `nom` varchar(200) NOT NULL,
  `nomEquipe` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lieu` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`nom`, `nomEquipe`, `date`, `lieu`, `prix`) VALUES
('AXA SA', 'equipe1', '2021-06-15 00:00:00', 'PARIS', 26),
('TotalEnergies', 'equipe2', '2004-09-03 00:00:00', 'PARIS', 57),
('Apple Inc', 'equipe1', '2014-09-05 00:00:00', 'USA', 150),
('Dubai Elec', 'equipe3', '2020-11-22 00:00:00', 'DUBAI', 1),
('Amazon', 'equipe3', '2010-07-12 00:00:00', 'USA', 100),
('Naspers', 'equipe2', '1997-08-16 00:00:00', 'SOUTH AFRICA', 120),
('PetroChina', 'equipe5', '2019-04-20 00:00:00', 'HONK HONG', 10),
('ETF Vanguard', 'equipe7', '2015-02-22 00:00:00', 'LA', 200),
('Dassault Aviation', 'equipe6', '2016-01-01 00:00:00', 'PARIS', 140);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
