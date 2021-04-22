<?php

namespace App\Entity;
use Symfony\Component\Validator\Constraints as Assert;

use App\Repository\CoursRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CoursRepository::class)
 */
class Cours
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    public $id;

    /**
     * @ORM\Column(type="string")
     *
     * @Assert\NotBlank(message="Please, upload the product brochure as a PDF file.")
     * @Assert\File(mimeTypes={ "application/pdf" })
     */
    private $brochure;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $nomcours;

    /**
     * @ORM\ManyToOne(targetEntity=Classe::class, inversedBy="cours")
     */
    private $classe;

    /**
     * @ORM\ManyToOne(targetEntity=Matiere::class, inversedBy="cours")
     */
    private $matiere;

    public function getBrochure()
    {
        return $this->brochure;
    }

    public function setBrochure($brochure)
    {
        $this->brochure = $brochure;

        return $this;
    }

    public function getNomcours()
    {
        return $this->nomcours;
    }

    public function setNomcours($nomcours)
    {
        $this->nomcours = $nomcours;

        return $this;
    }
    public function getClasse(): ?Classe
    {
        return $this->classe;
    }

    public function setClasse(?Classe $classe): self
    {
        $this->classe = $classe;

        return $this;
    }

    public function getMatiere(): ?Matiere
    {
        return $this->matiere;
    }

    public function setMatiere(?Matiere $matiere): self
    {
        $this->matiere = $matiere;

        return $this;
    }



}
