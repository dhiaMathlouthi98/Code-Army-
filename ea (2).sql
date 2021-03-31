-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 31 mars 2021 à 20:32
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ea`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `assiduite`
--

CREATE TABLE `assiduite` (
  `id_assiduite` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nom_classe` varchar(30) NOT NULL,
  `nbr_etudiant` int(11) NOT NULL,
  `nom_salle` varchar(30) NOT NULL,
  `id_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `conn`
--

CREATE TABLE `conn` (
  `id_user` int(11) NOT NULL,
  `img` longblob DEFAULT NULL,
  `etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cour`
--

CREATE TABLE `cour` (
  `id_cours` int(11) NOT NULL,
  `nom_cour` varchar(30) NOT NULL,
  `id_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `dem_conv`
--

CREATE TABLE `dem_conv` (
  `id_conv` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `etat_demande` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id_departement` varchar(30) NOT NULL,
  `nom_departement` varchar(30) NOT NULL,
  `chef_departement` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `emplois_dt`
--

CREATE TABLE `emplois_dt` (
  `id_emp` int(11) NOT NULL,
  `semaine` date NOT NULL,
  `emplois` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_matiere` int(11) DEFAULT NULL,
  `nom_departement` varchar(30) DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ens_classe`
--

CREATE TABLE `ens_classe` (
  `id_classe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `niveau` varchar(30) NOT NULL,
  `specialite` varchar(30) NOT NULL,
  `id_stage` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL,
  `nom_evenement` varchar(30) NOT NULL,
  `date_evenement` date NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `etat` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nbr_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_evenement`, `nom_evenement`, `date_evenement`, `responsable`, `description`, `etat`, `id_user`, `nbr_place`) VALUES
(25, 'event', '2021-03-02', 'dsq', 'dsfsd', 'aprouvée', 1, 13),
(26, 'bbbb', '2021-03-12', 'sdfsdsqqs', 'sdfsdf', 'aprouvée', 1, 11),
(28, 'fe', '2021-03-11', 'fea', 'fae', 'aprouvée', 1, 2),
(29, 'yyhj', '2021-03-10', 'jhjfk', 'hglk', 'Non aprouvée', 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `nom_matiere` varchar(30) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `volume_h` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id_note` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id` int(11) NOT NULL,
  `idevent` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`id`, `idevent`, `iduser`) VALUES
(6, 28, 1);

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE `resultat` (
  `id_res` int(11) NOT NULL,
  `moy` float NOT NULL,
  `ment` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `id_stage` int(11) NOT NULL,
  `societe` varchar(50) NOT NULL,
  `Email_Société` varchar(50) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `type_stage` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `role` varchar(30) NOT NULL,
  `Mdp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `nom`, `prenom`, `email`, `date_de_naissance`, `role`, `Mdp`) VALUES
(1, 'jhbjh', 'jiiu', 'ihi', 'wael.amri1@esprit.tn', '2021-03-11', '_hijhkj', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `assiduite`
--
ALTER TABLE `assiduite`
  ADD PRIMARY KEY (`id_assiduite`),
  ADD KEY `fk_assiduite_user` (`id_user`),
  ADD KEY `fk_assiduite_matiere` (`id_matiere`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD UNIQUE KEY `nom_classe` (`nom_classe`),
  ADD KEY `fk_classe_emploi_dt` (`id_emp`);

--
-- Index pour la table `conn`
--
ALTER TABLE `conn`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `cour`
--
ALTER TABLE `cour`
  ADD PRIMARY KEY (`id_cours`),
  ADD KEY `fk_cour_matiere` (`id_matiere`);

--
-- Index pour la table `dem_conv`
--
ALTER TABLE `dem_conv`
  ADD PRIMARY KEY (`id_conv`),
  ADD UNIQUE KEY `email` (`email`,`id_user`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_departement`),
  ADD UNIQUE KEY `nom_departement` (`nom_departement`),
  ADD UNIQUE KEY `chef_departement` (`chef_departement`);

--
-- Index pour la table `emplois_dt`
--
ALTER TABLE `emplois_dt`
  ADD PRIMARY KEY (`id_emp`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nom_departement` (`nom_departement`),
  ADD KEY `fk_enseignant_matiere` (`id_matiere`);

--
-- Index pour la table `ens_classe`
--
ALTER TABLE `ens_classe`
  ADD PRIMARY KEY (`id_classe`,`id_user`),
  ADD KEY `fk_ens_classe_enseignant` (`id_user`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_etudiant_stage` (`id_stage`),
  ADD KEY `fk_etudiant_emplois_dt` (`id_emp`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_evenement`),
  ADD KEY `fk_evenement_user` (`id_user`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `fk_note_matiere` (`id_matiere`),
  ADD KEY `fk_note_etudiant` (`id_user`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `fk_resultat_etudiant` (`id_user`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id_stage`),
  ADD UNIQUE KEY `Email_Société` (`Email_Société`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cour`
--
ALTER TABLE `cour`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dem_conv`
--
ALTER TABLE `dem_conv`
  MODIFY `id_conv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emplois_dt`
--
ALTER TABLE `emplois_dt`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `id_stage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `assiduite`
--
ALTER TABLE `assiduite`
  ADD CONSTRAINT `fk_assiduite_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assiduite_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_classe_emploi_dt` FOREIGN KEY (`id_emp`) REFERENCES `emplois_dt` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `conn`
--
ALTER TABLE `conn`
  ADD CONSTRAINT `idfk` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `cour`
--
ALTER TABLE `cour`
  ADD CONSTRAINT `fk_cour_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `fk_enseignant_departement` FOREIGN KEY (`nom_departement`) REFERENCES `departement` (`id_departement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enseignant_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enseignant_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ens_classe`
--
ALTER TABLE `ens_classe`
  ADD CONSTRAINT `fk_ens_classe_classe` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ens_classe_enseignant` FOREIGN KEY (`id_user`) REFERENCES `enseignant` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_etudiant_emplois_dt` FOREIGN KEY (`id_emp`) REFERENCES `emplois_dt` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_etudiant_stage` FOREIGN KEY (`id_stage`) REFERENCES `stage` (`id_stage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_etudiant_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fk_evenement_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_note_etudiant` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_note_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `fk_resultat_etudiant` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
