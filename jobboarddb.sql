-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 août 2022 à 09:29
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jobboarddb`
--

-- --------------------------------------------------------

--
-- Structure de la table `contrats`
--

CREATE TABLE `contrats` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contrats`
--

INSERT INTO `contrats` (`id`, `nom`) VALUES
(2, 'Contrat à durée déterminée (CDD).\r'),
(3, 'Contrat à durée indéterminée (CDI).\r'),
(4, 'Contrat de travail temporaire.\r'),
(5, 'Contrat de travail intermittent.\r'),
(6, 'Contrat d\'apprentissage.\r'),
(7, 'Contrat de professionnalisation.\r'),
(8, 'Contrat unique d\'insertion (CUI).\r'),
(9, 'Contrats conclus avec un groupement d\'employeurs.\r'),
(10, 'Contrat de travail en portage salarial à durée déterminée ou indéterminée.\r');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `nom`) VALUES
(1, 'SubSkill'),
(4, 'CEA'),
(6, 'Test'),
(7, 'Torrent');

-- --------------------------------------------------------

--
-- Structure de la table `metiers`
--

CREATE TABLE `metiers` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `metiers`
--

INSERT INTO `metiers` (`id`, `nom`) VALUES
(5, 'Acheteur\r'),
(6, 'Administrateur de base de données\r'),
(7, 'Agent de sûreté aéroportuaire\r'),
(8, 'Agent de transit\r'),
(9, 'Agent d\'entretien\r'),
(10, 'Agent funéraire\r'),
(11, 'Agent immobilier\r'),
(12, 'Agent de police\r'),
(13, 'Agent de presse\r'),
(14, 'Agent de sécurité\r'),
(15, 'Agent de surveillance de la voie publique (ASVP)\r'),
(16, 'Agronome\r'),
(17, 'Ambulancier\r'),
(18, 'Analyste financier\r'),
(19, 'Analyste programmeur\r'),
(20, 'Analyste Web\r'),
(21, 'Architecte\r'),
(22, 'Architecte paysagiste\r'),
(23, 'Architecte en système d\'information\r'),
(24, 'Archiviste\r'),
(25, 'Assistant administratif et financier\r'),
(26, 'Assistant bibliothécaire\r'),
(27, 'Assistant d\'éducation\r'),
(28, 'Assistant dentaire\r'),
(29, 'Assistant marketing\r'),
(30, 'Assistant paie et administration\r'),
(31, 'Assistant RH\r'),
(32, 'Assureur\r'),
(33, 'Audioprothésiste\r'),
(34, 'Auditeur financier\r'),
(35, 'Auxiliaire de puériculture\r'),
(36, 'Auxiliaire de vie sociale\r'),
(37, 'Avocat\r'),
(38, 'Bibliothécaire\r'),
(39, 'Biologiste\r'),
(40, 'Chargé de communication\r'),
(41, 'Chargé de recrutement\r'),
(42, 'Charpentier\r'),
(43, 'Chauffeur de taxi\r'),
(44, 'Chefs de chantier\r'),
(45, 'Chef de projet\r'),
(46, 'Chef de projet marketing\r'),
(47, 'Chef d\'établissement\r'),
(48, 'Chiropracteur\r'),
(49, 'Chirurgien orthopédiste\r'),
(50, 'Coiffeur\r'),
(51, 'Commis de cuisine\r'),
(52, 'Comptable\r'),
(53, 'Concepteur de jeux vidéos\r'),
(54, 'Concepteur-rédacteur\r'),
(55, 'Conducteur de grue\r'),
(56, 'Conducteur de train\r'),
(57, 'Conseiller\r'),
(58, 'Conseiller d\'orientation\r'),
(59, 'Conseiller en insertion professionnelle\r'),
(60, 'Consultant bien-être\r'),
(61, 'Consultant en informatique\r'),
(62, 'Contrôleur (trains)\r'),
(63, 'Contrôleur aérien\r'),
(64, 'Contrôleur de gestion\r'),
(65, 'Contrôleur financier\r'),
(66, 'Courtier en assurance\r'),
(67, 'Cuisinier\r'),
(68, 'Décorateur d\'intérieur\r'),
(69, 'Dentiste\r'),
(70, 'Designer industriel\r'),
(71, 'Développeur informatique\r'),
(72, 'Diacre\r'),
(73, 'Diététicien\r'),
(74, 'Directeur artistique\r'),
(75, 'Directeur des ventes\r'),
(76, 'Directeur financier\r'),
(77, 'Directeur RH\r'),
(78, 'Économiste\r'),
(79, 'Éducateur de jeunes\r'),
(80, 'Éleveur\r'),
(81, 'Employé de banque\r'),
(82, 'Enseignant\r'),
(83, 'Ergothérapeute\r'),
(84, 'Esthéticienne\r'),
(85, 'Fleuriste\r'),
(86, 'Gardien\r'),
(87, 'Géomètre\r'),
(88, 'Gestionnaire immobilier\r'),
(89, 'Hôtesse de l\'air\r'),
(90, 'Huissier\r'),
(91, 'Illustrateur\r'),
(92, 'Infirmière\r'),
(93, 'Ingénieur civil\r'),
(94, 'Ingénieur électronicien\r'),
(95, 'Ingénieur du BTP\r'),
(96, 'Inspecteur de l\'action sanitaire et sociale\r'),
(97, 'Jardinier\r'),
(98, 'Jardinier paysagiste\r'),
(99, 'Journaliste\r'),
(100, 'Juge\r'),
(101, 'Kinésithérapeute\r'),
(102, 'Linguiste\r'),
(103, 'Machiniste\r'),
(104, 'Magasinier\r'),
(105, 'Maître d\'hôtel\r'),
(106, 'Manipulateur radio\r'),
(107, 'Masseur\r'),
(108, 'Mécanicien aéronautique\r'),
(109, 'Médecin\r'),
(110, 'Moniteur d\'auto-école\r'),
(111, 'Monteur électricien\r'),
(112, 'Nutritionniste\r'),
(113, 'Officier\r'),
(114, 'Opérateur de production\r'),
(115, 'Opérateur d\'usinage sur commande numérique (UCN)\r'),
(116, 'Opticien\r'),
(117, 'Orthophoniste\r'),
(118, 'Personal Trainer\r'),
(119, 'Pharmacien\r'),
(120, 'Photographe\r'),
(121, 'Physicien\r'),
(122, 'Physicien médical\r'),
(123, 'Pilote\r'),
(124, 'Politicien\r'),
(125, 'Pompier\r'),
(126, 'Poseur de sol (solier)\r'),
(127, 'Prêtre\r'),
(128, 'Procureur\r'),
(129, 'Professeur des écoles\r'),
(130, 'Professeur d\'éducation physique (EPS)\r'),
(131, 'Professeur de français langue étrangère\r'),
(132, 'Professeur des universités\r'),
(133, 'Psychologue\r'),
(134, 'Réceptionniste\r'),
(135, 'Réceptionniste d\'hôtel\r'),
(136, 'Responsable communication\r'),
(137, 'Responsable grands comptes\r'),
(138, 'Responsable service clientèle\r'),
(139, 'Sages-femmes\r'),
(140, 'Secrétaire médicale\r'),
(141, 'Serveur\r'),
(142, 'Skipper\r'),
(143, 'Soldat\r'),
(144, 'Soudeur\r'),
(145, 'Statisticien\r'),
(146, 'Surveillant pénitentiaire\r'),
(147, 'Technicien alarme intrusion\r'),
(148, 'Technicien d\'analyses biomédicales\r'),
(149, 'Technicien de maintenance informatique\r'),
(150, 'Technicien d\'exploitation\r'),
(151, 'Téléconseiller\r'),
(152, 'Test manager\r'),
(153, 'Travailleur social\r'),
(154, 'Urbaniste\r'),
(155, 'Vendeur\r'),
(156, 'Vétérinaire\r'),
(157, 'Webmaster');

-- --------------------------------------------------------

--
-- Structure de la table `offres`
--

CREATE TABLE `offres` (
  `date_pub` date NOT NULL DEFAULT current_timestamp(),
  `date_mod` date NOT NULL DEFAULT current_timestamp(),
  `reference` int(11) NOT NULL,
  `intitule` varchar(300) NOT NULL,
  `ville_id` int(11) NOT NULL,
  `contrat_id` int(11) NOT NULL,
  `metier_id` int(11) NOT NULL,
  `entreprise_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `offres`
--

INSERT INTO `offres` (`date_pub`, `date_mod`, `reference`, `intitule`, `ville_id`, `contrat_id`, `metier_id`, `entreprise_id`, `description`) VALUES
('2022-08-20', '2022-08-20', 3, 'test', 10, 5, 5, 1, 'test test'),
('2022-08-20', '2022-08-20', 4, 'developpeur', 42, 5, 21, 1, 'i'),
('2022-08-20', '2022-08-22', 5, 'D', 49, 6, 33, 1, 'b'),
('2022-08-20', '2022-08-20', 6, 'K', 20, 5, 36, 1, 'P'),
('2022-08-20', '2022-08-20', 7, 'q', 46, 5, 25, 1, 'P'),
('2022-08-20', '2022-08-20', 8, 'i', 34, 3, 24, 1, 'G'),
('2022-08-20', '2022-08-20', 9, '0', 50, 4, 29, 1, 'G'),
('2022-08-20', '2022-08-20', 10, 'm', 29, 2, 32, 1, '8'),
('2022-08-20', '2022-08-20', 11, 'O', 46, 2, 39, 1, 'p'),
('2022-08-20', '2022-08-20', 12, 'G', 34, 2, 28, 1, 'V'),
('2022-08-20', '2022-08-20', 13, '5', 49, 4, 21, 1, 'O'),
('2022-08-20', '2022-08-20', 14, 'u', 40, 2, 42, 1, 's'),
('2022-08-20', '2022-08-20', 15, '6', 29, 5, 48, 1, 'm'),
('2022-08-20', '2022-08-20', 16, '4', 46, 4, 23, 1, 'M'),
('2022-08-20', '2022-08-20', 17, 'F', 38, 4, 41, 1, 'L'),
('2022-08-20', '2022-08-20', 18, 'h', 28, 3, 21, 1, 'i'),
('2022-08-20', '2022-08-20', 19, 'q', 28, 2, 50, 1, 'V'),
('2022-08-20', '2022-08-20', 20, 'U', 47, 6, 32, 1, 'g'),
('2022-08-20', '2022-08-20', 21, 'e', 20, 6, 24, 1, 'x'),
('2022-08-20', '2022-08-20', 22, '1', 35, 6, 21, 1, '1'),
('2022-08-20', '2022-08-20', 23, 'g', 29, 2, 39, 1, '0'),
('2022-08-20', '2022-08-20', 24, '6', 34, 4, 28, 1, 'Y'),
('2022-08-20', '2022-08-20', 25, 'H', 22, 2, 32, 1, 'X'),
('2022-08-20', '2022-08-20', 26, '1', 36, 2, 38, 1, 'G'),
('2022-08-20', '2022-08-20', 27, 'i', 39, 3, 40, 1, 'C'),
('2022-08-20', '2022-08-20', 28, '4', 20, 2, 31, 1, 'V'),
('2022-08-20', '2022-08-20', 29, '6', 44, 2, 37, 1, '8'),
('2022-08-20', '2022-08-20', 30, 'M', 30, 4, 47, 1, 'I'),
('2022-08-20', '2022-08-20', 32, 'K', 42, 4, 50, 1, 'h'),
('2022-08-20', '2022-08-20', 33, 'Z', 32, 6, 40, 1, '2'),
('2022-08-20', '2022-08-20', 34, '1', 5, 5, 5, 1, '10');

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

CREATE TABLE `villes` (
  `id` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`id`, `Nom`) VALUES
(1, 'Paris\r'),
(2, 'Marseille\r'),
(3, 'Lyon\r'),
(4, 'Toulouse\r'),
(5, 'Nice\r'),
(6, 'Nantes\r'),
(7, 'Strasbourg\r'),
(8, 'Montpellier\r'),
(9, 'Bordeaux\r'),
(10, 'Lille\r'),
(11, 'Rennes\r'),
(12, 'Reims\r'),
(13, 'Le Havre\r'),
(14, 'Saint-Étienne\r'),
(15, 'Toulon\r'),
(16, 'Grenoble\r'),
(17, 'Angers\r'),
(18, 'Dijon\r'),
(19, 'Brest\r'),
(20, 'Le Mans\r'),
(21, 'Nîmes\r'),
(22, 'Aix-en-Provence\r'),
(23, 'Clermont-Ferrand\r'),
(24, 'Tours\r'),
(25, 'Amiens\r'),
(26, 'Limoges\r'),
(27, 'Villeurbanne\r'),
(28, 'Metz\r'),
(29, 'Besançon\r'),
(30, 'Perpignan\r'),
(31, 'Orléans\r'),
(32, 'Caen\r'),
(33, 'Mulhouse\r'),
(34, 'Boulogne-Billancourt\r'),
(35, 'Rouen\r'),
(36, 'Nancy\r'),
(37, 'Argenteuil\r'),
(38, 'Montreuil\r'),
(39, 'Saint-Denis\r'),
(40, 'Roubaix\r'),
(41, 'Avignon\r'),
(42, 'Tourcoing\r'),
(43, 'Poitiers\r'),
(44, 'Nanterre\r'),
(45, 'Créteil\r'),
(46, 'Versailles\r'),
(47, 'Pau\r'),
(48, 'Courbevoie\r'),
(49, 'Vitry-sur-Seine\r'),
(50, 'Asnières-sur-Seine\r'),
(51, 'Colombes\r'),
(52, 'Aulnay-sous-Bois\r'),
(53, 'La Rochelle\r'),
(54, 'Rueil-Malmaison\r'),
(55, 'Antibes\r'),
(56, 'Saint-Maur-des-Fossés\r'),
(57, 'Calais\r'),
(58, 'Champigny-sur-Marne\r'),
(59, 'Aubervilliers\r'),
(60, 'Béziers\r'),
(61, 'Bourges\r'),
(62, 'Cannes\r'),
(63, 'Saint-Nazaire\r'),
(64, 'Dunkerque\r'),
(65, 'Quimper\r'),
(66, 'Valence\r'),
(67, 'Colmar\r'),
(68, 'Drancy\r'),
(69, 'Mérignac\r'),
(70, 'Ajaccio\r'),
(71, 'Levallois-Perret\r'),
(72, 'Troyes\r'),
(73, 'Neuilly-sur-Seine\r'),
(74, 'Issy-les-Moulineaux\r'),
(75, 'Villeneuve-d\'Ascq\r'),
(76, 'Noisy-le-Grand\r'),
(77, 'Antony\r'),
(78, 'Niort\r'),
(79, 'Lorient\r'),
(80, 'Sarcelles\r'),
(81, 'Chambéry\r'),
(82, 'Saint-Quentin\r'),
(83, 'Pessac\r'),
(84, 'Vénissieux\r'),
(85, 'Cergy\r'),
(86, 'La Seyne-sur-Mer\r'),
(87, 'Clichy\r'),
(88, 'Beauvais\r'),
(89, 'Cholet\r'),
(90, 'Hyères\r'),
(91, 'Ivry-sur-Seine\r'),
(92, 'Montauban\r'),
(93, 'Vannes\r'),
(94, 'La Roche-sur-Yon\r'),
(95, 'Charleville-Mézières\r'),
(96, 'Pantin\r'),
(97, 'Laval\r'),
(98, 'Maisons-Alfort\r'),
(99, 'Bondy\r'),
(100, 'Évry');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contrats`
--
ALTER TABLE `contrats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `metiers`
--
ALTER TABLE `metiers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offres`
--
ALTER TABLE `offres`
  ADD PRIMARY KEY (`reference`);

--
-- Index pour la table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contrats`
--
ALTER TABLE `contrats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `metiers`
--
ALTER TABLE `metiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT pour la table `offres`
--
ALTER TABLE `offres`
  MODIFY `reference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `villes`
--
ALTER TABLE `villes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
