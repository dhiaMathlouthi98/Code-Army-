<?php

namespace App\Form;
use App\Entity\Etudiant;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

use App\Entity\Note;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NoteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
            ->add('note')

            ->add('etudiant',EntityType::class,['class' => Etudiant::class, 'choice_label' => function ($etudiant) {
                return $etudiant->getPrenomNom();
            },'disabled'=>'true', 'label' => 'Etudiant']);}



    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Note::class,

        ]);
    }
}
