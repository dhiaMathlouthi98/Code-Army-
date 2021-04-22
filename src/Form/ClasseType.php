<?php

namespace App\Form;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

use App\Entity\Classe;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ClasseType extends AbstractType
{
    public $nom =7 ;
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('nom_classe', ChoiceType::class, [
            'choices'  => [
                'Maybe' => null,
                'Yes' => true,
                'No' => false,
            ],
        ]);

    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Classe::class,
        ]);
    }
}
