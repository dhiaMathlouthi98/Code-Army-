<?php


namespace App\Entity;
use Symfony\Component\Form\FormTypeInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class FindProperty
{
    private $nom;

    private $prenom;

    private $usern;

    public function getNom(): ?string
    {
        return $this->nom;
    }
    public function setNom(string $nom): self
    {
        $this->nom = $nom;
        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;
        return $this;
    }

    public function getUsern(): ?string
    {
        return $this->usern;
    }


    public function setUsern(string $usern): self
    {
        $this->usern = $usern;
        return $this;
    }


}