-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 02 avr. 2021 à 09:27
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
-- Base de données : `ea1`
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
  `id_user` int(11) NOT NULL,
  `valeur` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `assiduite`
--

INSERT INTO `assiduite` (`id_assiduite`, `id_matiere`, `date`, `id_user`, `valeur`) VALUES
(3, 2, '2021-04-01', 4, 'A'),
(4, 2, '2021-04-01', 5, 'A'),
(5, 2, '2021-04-01', 6, 'P');

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

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom_classe`, `nbr_etudiant`, `nom_salle`, `id_emp`) VALUES
(1, '3A1', 20, 'G0-1', 1),
(2, '3A5', 25, 'G1-1', 1);

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
  `cours` longblob NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `nom_cours` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cour`
--

INSERT INTO `cour` (`id_cours`, `cours`, `id_matiere`, `nom_cours`, `id_user`, `id_classe`) VALUES
INSERT INTO `cour` (`id_cours`, `cours`, `id_matiere`, `nom_cours`, `id_user`, `id_classe`) VALUES

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
  `etat_demande` varchar(100) NOT NULL DEFAULT 'en attente',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dem_conv`
--

INSERT INTO `dem_conv` (`id_conv`, `user_name`, `nom`, `prenom`, `email`, `etat_demande`, `id_user`) VALUES
(3, '', '', '', '', 'en attente', 0),
(4, '', '', '', '', 'en attente', 15),
(7, '', '', '', '', 'en attente', 11);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL,
  `nom_departement` varchar(30) NOT NULL,
  `chef_departement` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id_departement`, `nom_departement`, `chef_departement`) VALUES
(1, 'informatique', 'null');

-- --------------------------------------------------------

--
-- Structure de la table `emplois_dt`
--

CREATE TABLE `emplois_dt` (
  `id_emp` int(11) NOT NULL,
  `semaine` date DEFAULT NULL,
  `emplois` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emplois_dt`
--

INSERT INTO `emplois_dt` (`id_emp`, `semaine`, `emplois`) VALUES
(1, '2021-03-14', 0x255044462d312e340a25e2e3cfd30a332030206f626a0a3c3c2f46696c7465722f466c6174654465636f64652f4c656e677468203633323e3e73747265616d0a789cad56cb6edb3010bceb2bf6e81ec4904b91a27c8b513746d11c8218bd0b352b28a8d5c48f16f0d7972bda402c3ee00015209bf0eeccec2cb984df8ac5ba901a0cd7b0de141c4ac96971f74500bad5cf823354bc3130fdde75c56cb97dfdf5bb87cd110e76fbba874feb1747d1b9979fd984f16c0802896db61cf6b6ef867638c01cc66761fb53df751dacdaeda93d798e6bfcec737bb02e1f398a92572517f03f9efb61b0168e43ffc7eef6fda1ed77d66bdcb90f8c160270dbcf58d16ab92e9e8ab7f145f8ea020fae9d0afe16c63009bad6a091550ad0b5d316cfe7a0509cd56a0c9b9a557212466998a89361898a69cfcd5c1593a014cca4a92bd1304c53fbaa353f572d74ac6a171675452ad7f1735d84a6ba26c1735d29b057aeaaacb20be794099d564e81bdb2eb434ed98573ca844e2ba7c05ed98d4d4ed98573ca844e2ba7c0a3b26a744e99c219e5119d544e82bdb2c99e300ae7944dee8445c04f74050aa0e115d0706a7ae3e678fbfed6a2e976c3fc2e51281c372048e5cd6acedd15409069726d287926f86a2e79c889151f273be024806bc715e725f9c289abb95021a7c49a0ec20d8ea494e3a908d525957bad7e49bea82b321d725628c60b25e45454ee35e725f9c2a9c974c8e9b748e384f1db71d8f4919e72c34c2c5fde0b28e1419422d9b40013c93492612cd5d1d7c4cf4b8cf4c57ba8f404f4d8ee721e82fc1b3c0498b48718bdf11e4444c07b90d39d7db4bb1f3b9bb31140e442910c9698b41160d23642fa1b6c886a027ab1c7b807644247f2f3226717012aede28302a30bd59809e8bb1d36a9cd188d8490fcc1f5464254d2c84705bc11331da7e7769bb511006eb211a0223798ff4b944cfd071d1449010a656e6473747265616d0a656e646f626a0a352030206f626a0a3c3c2f436f6e74656e74732033203020522f547970652f506167652f5265736f75726365733c3c2f50726f63536574205b2f504446202f54657874202f496d61676542202f496d61676543202f496d616765495d2f466f6e743c3c2f46312031203020522f46322032203020523e3e3e3e2f506172656e742034203020522f4d65646961426f785b30203020353935203834325d3e3e0a656e646f626a0a312030206f626a0a3c3c2f537562747970652f54797065312f547970652f466f6e742f42617365466f6e742f436f75726965722d426f6c642f456e636f64696e672f57696e416e7369456e636f64696e673e3e0a656e646f626a0a322030206f626a0a3c3c2f537562747970652f54797065312f547970652f466f6e742f42617365466f6e742f48656c7665746963612f456e636f64696e672f57696e416e7369456e636f64696e673e3e0a656e646f626a0a342030206f626a0a3c3c2f4b6964735b35203020525d2f547970652f50616765732f436f756e7420313e3e0a656e646f626a0a362030206f626a0a3c3c2f547970652f436174616c6f672f50616765732034203020523e3e0a656e646f626a0a372030206f626a0a3c3c2f4d6f644461746528443a32303231303430313233323235302b303127303027292f4372656174696f6e4461746528443a32303231303430313233323235302b303127303027292f50726f6475636572286954657874ae20352e342e3020a9323030302d323031322031543358542042564241205c284147504c2d76657273696f6e5c29293e3e0a656e646f626a0a787265660a3020380a303030303030303030302036353533352066200a30303030303030383830203030303030206e200a30303030303030393731203030303030206e200a30303030303030303135203030303030206e200a30303030303031303539203030303030206e200a30303030303030373134203030303030206e200a30303030303031313130203030303030206e200a30303030303031313535203030303030206e200a747261696c65720a3c3c2f496e666f2037203020522f4944205b3c39313539666634383265633466393831333861643262383233326261323165343e3c65623663393337386530313433623033373639353633393863316161393737633e5d2f526f6f742036203020522f53697a6520383e3e0a2569546578742d352e342e300a7374617274787265660a313330380a2525454f460a);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_matiere` int(11) DEFAULT NULL,
  `nom_departement` varchar(30) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_emp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_matiere`, `nom_departement`, `id_user`, `id_emp`) VALUES
(2, 'informatique', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ens_classe`
--

CREATE TABLE `ens_classe` (
  `id_classe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ens_classe`
--

INSERT INTO `ens_classe` (`id_classe`, `id_user`) VALUES
(1, 7),
(2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `niveau` varchar(30) NOT NULL,
  `specialite` varchar(30) NOT NULL,
  `id_stage` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_emp` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`niveau`, `specialite`, `id_stage`, `id_user`, `id_emp`, `id_classe`) VALUES
('3', 'GL', 1, 4, 1, 1),
('3', 'GL', 1, 5, 1, 1),
('3', 'GL', 2, 6, 1, 2);

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
(30, 'gljhqdkr', '2021-04-07', 'jshgsg', 'nsbg', 'Non aprouvée', 1, 22),
(31, 'clubsante', '2021-04-09', 'dhia', 'jfjkdg', 'aprouvée', 1, 0),
(32, 'dfhdh', '2021-04-16', 'vsfhdqnd', 'qdfhbdbh', 'Non aprouvée', 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `nom_matiere` varchar(30) NOT NULL,
  `coefficient` varchar(10) NOT NULL,
  `volume_h` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nom_matiere`, `coefficient`, `volume_h`) VALUES
(1, 'info', '7', '42'),
(2, 'mathematique', '3.5', '48h'),
(4, 'SGBD', '2', '21h');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id_note` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `note`, `id_matiere`, `id_user`) VALUES
(1, 0, 2, 4),
(2, NULL, 2, 5),
(3, NULL, 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id` int(11) NOT NULL,
  `idevent` int(11) NOT NULL,
  `iduser` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`id`, `idevent`, `iduser`) VALUES
(7, 31, 'aprouvée'),
(8, 31, 'aprouvée'),
(9, 31, 'aprouvée');

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
-- Structure de la table `reunion`
--

CREATE TABLE `reunion` (
  `id_reunion` int(11) NOT NULL,
  `date` date NOT NULL,
  `nom_departement` varchar(30) NOT NULL,
  `matiere` varchar(30) NOT NULL,
  `objectif` varchar(200) NOT NULL,
  `horaire` varchar(30) NOT NULL
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

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id_stage`, `societe`, `Email_Société`, `pays`, `date_debut`, `date_fin`, `type_stage`) VALUES
(1, 'jszdkg', 'hjsfs@nsgs.tn', 'jsgdv', '2021-03-31', '2021-05-01', 'shgfjsdq'),
(2, 'khalil', 'mohamedkhalil.guedria@esprit.tn', 'tunisie', '2021-04-01', '2021-04-16', 'pfe');

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
(1, 'Mathlouthi Dhia', 'Mathlouthi', 'Dhia', 'dhia.mathlouthi@esprit.tn', '1998-06-05', 'Administrateur', 'freefire1234'),
(2, 'a', 'dhia ', 'mathlouthi ', 'dfjdsk@', '2021-04-05', 'Enseignant', 'a'),
(3, 'Amri Wael', 'Amri', 'Wael', 'mohamedkhalil.guedria@esprit.t', '2021-03-31', 'Etudiant', '123456789'),
(4, 'etudiant1', 'Ghali', 'Salem', 'hamzahamzabeizig@gmail.com', '1991-10-08', 'Etudiant', '123456789'),
(5, 'etudiant2', 'Ahmed', 'Kadri ', 'ahmedkadri@gmail.com', '2021-04-09', 'Etudiant', '123456789'),
(6, 'etudiant3', 'Rami', 'Khalil', 'rami.khalilll@gmail.com', '1991-04-17', 'Etudiant', '123456789'),
(7, 'beizighamza', 'Beizig ', 'Hamza', 'hamza.esprit@gmail.com', '1998-04-15', 'Enseignant', '123456789'),
(8, 'ae', 'admin', 'enseignant', 'adminenseignant', '1991-10-08', 'ADMIN', 'ae');

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
  ADD KEY `fk_cour_matiere` (`id_matiere`),
  ADD KEY `fkclalss` (`id_classe`),
  ADD KEY `iduseerfk` (`id_user`);

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
  ADD KEY `fk_enseignant_matiere` (`id_matiere`),
  ADD KEY `idmatiererefk` (`id_emp`);

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
  ADD KEY `fk_etudiant_emplois_dt` (`id_emp`),
  ADD KEY `flidclass` (`id_classe`);

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
-- Index pour la table `reunion`
--
ALTER TABLE `reunion`
  ADD PRIMARY KEY (`id_reunion`);

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
-- AUTO_INCREMENT pour la table `assiduite`
--
ALTER TABLE `assiduite`
  MODIFY `id_assiduite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cour`
--
ALTER TABLE `cour`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `dem_conv`
--
ALTER TABLE `dem_conv`
  MODIFY `id_conv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `emplois_dt`
--
ALTER TABLE `emplois_dt`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `resultat`
--
ALTER TABLE `resultat`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reunion`
--
ALTER TABLE `reunion`
  MODIFY `id_reunion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `id_stage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `fkclalss` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iduseerfk` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `depfk` FOREIGN KEY (`nom_departement`) REFERENCES `departement` (`nom_departement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enseignant_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idemploifk` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idmatiererefk` FOREIGN KEY (`id_emp`) REFERENCES `emplois_dt` (`id_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_etudiant_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flidclass` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `fk_resultat_etudiant` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;