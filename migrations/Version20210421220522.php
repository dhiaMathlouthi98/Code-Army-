<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210421220522 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs

        $this->addSql('ALTER TABLE dem_convention ADD etat VARCHAR(30) DEFAULT NULL, CHANGE date date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL');}



    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE dem_convention DROP etat, CHANGE date date DATETIME DEFAULT CURRENT_TIMESTAMP');
        $this->addSql('ALTER TABLE dem_convention ADD CONSTRAINT FK_6C7159B472433D06 FOREIGN KEY (id_stage_id) REFERENCES stage (id)');
        $this->addSql('ALTER TABLE dem_convention ADD CONSTRAINT FK_6C7159B479F37AE5 FOREIGN KEY (id_user_id) REFERENCES user (id_user)');
        $this->addSql('ALTER TABLE dem_convention ADD CONSTRAINT fk_username FOREIGN KEY (user_name) REFERENCES user (user_name) ON UPDATE CASCADE ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_6C7159B479F37AE5 ON dem_convention (id_user_id)');
        $this->addSql('CREATE INDEX user_name ON dem_convention (user_name)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_6C7159B472433D06 ON dem_convention (id_stage_id)');
        $this->addSql('ALTER TABLE user MODIFY id INT NOT NULL');
        $this->addSql('ALTER TABLE user DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE user CHANGE id id_user INT AUTO_INCREMENT NOT NULL');
        $this->addSql('CREATE INDEX user_name ON user (user_name)');
        $this->addSql('ALTER TABLE user ADD PRIMARY KEY (id_user)');
    }
}
