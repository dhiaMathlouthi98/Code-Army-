<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

class CategorieSearch
{

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Categorie")
     */
    public $Categorie;


    public function getCategory(): ?Categorie
    {
        return $this->Categorie;
    }

    public function setCategory(?Categorie $Categorie): self
    {
        $this->Categorie = $Categorie;

        return $this;
    }



}