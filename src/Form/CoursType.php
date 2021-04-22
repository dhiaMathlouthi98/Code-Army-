<?php

namespace App\Form;
use App\Entity\Etudiant;
use App\Entity\Matiere;
use Symfony\Component\Form\Extension\Core\Type\TextType;

use App\Entity\Cours;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Classe;

class CoursType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('matiere',EntityType::class,['class' => Matiere::class, 'choice_label' => function ($matiere) {
                return $matiere->getNomMatiere();
            }, 'label' => 'Matiere'])

            ->add('classe',EntityType::class,['class' => Classe::class, 'choice_label' => function ($classe) {
                return $classe->getNomClasse();
            }, 'label' => 'Classe'])

        ->add('nomcours', TextType::class, array('label' => 'Nom du cours'))
            ->add('brochure', FileType::class, array('label' => 'Brochure (PDF file)'))
            // ...
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Cours::class,
        ]);
    }
}
