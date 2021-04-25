<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210421141954 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE dem_convention ADD user_name VARCHAR(30) NOT NULL, ADD date DATE NOT NULL');}

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE dem_convention DROP FOREIGN KEY FK_6C7159B479F37AE5');
        $this->addSql('ALTER TABLE dem_convention DROP user_name, DROP date');
        $this->addSql('ALTER TABLE dem_convention ADD CONSTRAINT FK_6C7159B479F37AE5 FOREIGN KEY (id_user_id) REFERENCES user (id_user)');
        $this->addSql('ALTER TABLE user MODIFY id INT NOT NULL');
        $this->addSql('ALTER TABLE user DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE user CHANGE id id_user INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE user ADD PRIMARY KEY (id_user)');
    }
}
