<?php

namespace App\Entity;
use Symfony\Component\Validator\Constraints as Assert;
use App\Repository\NoteRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=NoteRepository::class)
 */
class Note
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     *  @Assert\Range( * min = 0, * max = 20,
     * minMessage = "Le note d'un etudiant doit ne peut pas etre inferieur à {{ min }} ",
     * maxMessage = "Le note d'un etudiant doit ne peut pas etre superieur à {{ max }} " * )
     */
      public  $noteControleContinue;
    /**
     *  @Assert\Range( * min = 0, * max = 20,
     * minMessage = "Le note d'un etudiant doit ne peut pas etre inferieur à {{ min }} ",
     * maxMessage = "Le note d'un etudiant doit ne peut pas etre superieur à {{ max }} " * )
     */
      public  $noteExamen;


    /**
     * @ORM\Column(type="integer", nullable=true)
     *  @Assert\Range( * min = 0, * max = 20,
     * minMessage = "Le note d'un etudiant doit ne peut pas etre inferieur à {{ min }} ",
     * maxMessage = "Le note d'un etudiant doit ne peut pas etre superieur à {{ max }} " * )
     */
    private $note;

    /**
     * @ORM\ManyToOne(targetEntity=Etudiant::class, inversedBy="notes")
     */
    private $etudiant;

    /**
     * @ORM\ManyToOne(targetEntity=Classe::class, inversedBy="notes")
     */
    private $classe;

    /**
     * @ORM\ManyToOne(targetEntity=Matiere::class, inversedBy="notes")
     */
    private $matiere;



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNote(): ?int
    {
        return $this->note;
    }

    public function setNote(?int $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getEtudiant(): ?Etudiant
    {
        return $this->etudiant;
    }

    public function setEtudiant(?Etudiant $etudiant): self
    {
        $this->etudiant = $etudiant;

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


    public function calcul(  ): self
    {
        $a = $this->noteControleContinue;
        $b = $this->noteExamen;
        $this->note = $a+$b;
        return $this;
    }
    public function getCal(): ?string
    {
        $this->calcul();
        return $this->note;
    }
}
