<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210419151451 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE categorie (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(30) NOT NULL, description_c VARCHAR(30) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE societe_p (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(30) NOT NULL, email VARCHAR(30) NOT NULL, numero_tel INT NOT NULL, domaine VARCHAR(30) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE stage (id INT AUTO_INCREMENT NOT NULL, societe_id INT NOT NULL, email_societe VARCHAR(30) NOT NULL, pays VARCHAR(30) NOT NULL, date_debut DATETIME NOT NULL, date_fin DATETIME NOT NULL, type_stage VARCHAR(30) NOT NULL, INDEX IDX_C27C9369FCF77503 (societe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE stage ADD CONSTRAINT FK_C27C9369FCF77503 FOREIGN KEY (societe_id) REFERENCES societe_p (id)');
        $this->addSql('ALTER TABLE evenement ADD categorie_id INT NOT NULL');
        $this->addSql('ALTER TABLE evenement ADD CONSTRAINT FK_B26681EBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('CREATE INDEX IDX_B26681EBCF5E72D ON evenement (categorie_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE evenement DROP FOREIGN KEY FK_B26681EBCF5E72D');
        $this->addSql('ALTER TABLE stage DROP FOREIGN KEY FK_C27C9369FCF77503');
        $this->addSql('DROP TABLE categorie');
        $this->addSql('DROP TABLE societe_p');
        $this->addSql('DROP TABLE stage');
        $this->addSql('DROP INDEX IDX_B26681EBCF5E72D ON evenement');
        $this->addSql('ALTER TABLE evenement DROP categorie_id');
    }
}
