<?php

namespace App\Entity;

use App\Repository\ClasseRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
/**
 * @ORM\Entity(repositoryClass=ClasseRepository::class)
 */
class Classe
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    public $id;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $nom_classe;

    /**
     * @ORM\Column(type="integer")
     */
    private $nbr_etudiant;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $nom_salle;

    /**
     * @ORM\OneToMany(targetEntity=Note::class, mappedBy="classe")
     */
    private $notes;

    /**
     * @ORM\OneToMany(targetEntity=Etudiant::class, mappedBy="classe")
     */
    private $etudiants;

    /**
     * @ORM\OneToMany(targetEntity=Cours::class, mappedBy="classe")
     */
    private $cours;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomClasse(): ?string
    {
        return $this->nom_classe;
    }

    public function setNomClasse(string $nom_classe): self
    {
        $this->nom_classe = $nom_classe;

        return $this;
    }

    public function getNbrEtudiant(): ?int
    {
        return $this->nbr_etudiant;
    }

    public function setNbrEtudiant(int $nbr_etudiant): self
    {
        $this->nbr_etudiant = $nbr_etudiant;

        return $this;
    }

    public function getNomSalle(): ?string
    {
        return $this->nom_salle;
    }

    public function setNomSalle(string $nom_salle): self
    {
        $this->nom_salle = $nom_salle;

        return $this;
    }

    /**
     * @return Collection|Note[]
     */
    public function getNotes(): Collection
    {
        return $this->notes;
    }

    public function addNote(Note $note): self
    {
        if (!$this->notes->contains($note)) {
            $this->notes[] = $note;
            $note->setNote($this);
        }

        return $this;
    }

    public function removeNote(Note $note): self
    {
        if ($this->notes->removeElement($note)) {
            // set the owning side to null (unless already changed)
            if ($note->getNote() === $this) {
                $note->setNote(null);
            }
        }

        return $this;
    }


    /**
     * @return Collection|Etudiant[]
     */
    public function getEtudiants(): Collection
    {
        return $this->etudiants;
    }

    public function addEtudiant(Etudiant $etudiant): self
    {
        if (!$this->etudiants->contains($etudiant)) {
            $this->etudiants[] = $etudiant;
            $etudiant->setEtudiant($this);
        }

        return $this;
    }

    public function removeEtudiant(Etudiant $etudiant): self
    {
        if ($this->etudiants->removeElement($etudiant)) {
            // set the owning side to null (unless already changed)
            if ($etudiant->getEtudiant() === $this) {
                $etudiant->setEtudiant(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Cours[]
     */
    public function getCours(): Collection
    {
        return $this->cours;
    }

    public function addCours(Cours $cours): self
    {
        if (!$this->cours->contains($cours)) {
            $this->cours[] = $cours;
            $cours->setCours($this);
        }

        return $this;
    }

    public function removeCours(Cours $cours): self
    {
        if ($this->cours->removeElement($cours)) {
            // set the owning side to null (unless already changed)
            if ($cours->getCours() === $this) {
                $cours->setCours(null);
            }
        }

        return $this;
    }
}
