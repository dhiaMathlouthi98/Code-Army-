<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210421132931 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE dem_convention (id INT AUTO_INCREMENT NOT NULL, id_stage_id INT NOT NULL, UNIQUE INDEX UNIQ_6C7159B472433D06 (id_stage_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE dem_convention ADD CONSTRAINT FK_6C7159B472433D06 FOREIGN KEY (id_stage_id) REFERENCES stage (id)');
        $this->addSql('ALTER TABLE user MODIFY id_user INT NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE dem_convention_user DROP FOREIGN KEY FK_1F8F6E62E86D3427');
        $this->addSql('DROP TABLE dem_convention');
        $this->addSql('DROP TABLE dem_convention_user');
        $this->addSql('ALTER TABLE user MODIFY id INT NOT NULL');
        $this->addSql('ALTER TABLE user DROP PRIMARY KEY');
        $this->addSql('ALTER TABLE user CHANGE id id_user INT AUTO_INCREMENT NOT NULL');
        $this->addSql('ALTER TABLE user ADD PRIMARY KEY (id_user)');
    }
}
