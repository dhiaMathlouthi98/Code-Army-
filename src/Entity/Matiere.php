<?php

namespace App\Entity;

use App\Repository\MatiereRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
/**
 * @ORM\Entity(repositoryClass=MatiereRepository::class)
 */
class Matiere
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $nom_matiere;

    /**
     * @ORM\Column(type="integer")
     */
    private $coefficient;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $volume_h;

    /**
     * @ORM\OneToMany(targetEntity=Note::class, mappedBy="matiere")
     */
    private $matieres;

    /**
     * @ORM\OneToMany(targetEntity=Cours::class, mappedBy="matiere")
     */
    private $cours;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomMatiere(): ?string
    {
        return $this->nom_matiere;
    }

    public function setNomMatiere(string $nom_matiere): self
    {
        $this->nom_matiere = $nom_matiere;

        return $this;
    }

    public function getCoefficient(): ?int
    {
        return $this->coefficient;
    }

    public function setCoefficient(int $coefficient): self
    {
        $this->coefficient = $coefficient;

        return $this;
    }

    public function getVolumeH(): ?string
    {
        return $this->volume_h;
    }

    public function setVolumeH(string $volume_h): self
    {
        $this->volume_h = $volume_h;

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
            $cours->setMatiere($this);
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
