<?php

namespace App\Controller;

use App\Entity\Evenement;
use App\Entity\PropertySearch;
use App\Form\EvenementFormType;
use App\Form\PropertySearchType;
use App\Repository\EvenementRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Participation;

class EvenementsController extends AbstractController
{
    /**
     * @Route("/evenement", name="evenement")
     */
    public function index(): Response
    {
        return $this->render('evenement/index.html.twig', [
            'controller_name' => 'EvenementController',
        ]);
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/Affiche",name="Affiche")
     */
    public function Affiche(Request $request){
        $propertySearch = new PropertySearch();
        $form = $this->createForm(PropertySearchType::class,$propertySearch);
        $form->handleRequest($request);
        //initialement le tableau des articles est vide,
        //c.a.d on affiche les articles que lorsque l'utilisateur clique sur le bouton rechercher
        $articles= [];

        if($form->isSubmitted() && $form->isValid()) {
            //on récupère le nom d'article tapé dans le formulaire
            $nom = $propertySearch->getNom();
            $articles = $this->getDoctrine()->getRepository(Evenement::class)->findBy(['nom_evenement' => $nom]);
        } else

                $articles= $this->getDoctrine()->getRepository(Evenement::class)->findAll();



        return  $this->render('evenement/affiche.html.twig',[ 'form' =>$form->createView(), 'evenement' => $articles]);

    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("evenement/Add")
     */

    function Add(Request $request){
        $evenement=new Evenement() ;
        $form=$this->createForm(EvenementFormType::class,$evenement);
        $form->add('Ajouter',SubmitType::class) ;
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em=$this->getDoctrine()->getManager();
            $em->persist($evenement);
            $em->flush();
            return $this->redirectToRoute("Affiche");


        }

        return $this->render('evenement/Add.html.twig',['form'=>$form->createView()]);


    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/Delete/{id_evenement}",name="d")
     */

    public function delete($id_evenement,EvenementRepository $repository){
        $evenement=$repository->find($id_evenement);
        $em = $this->getDoctrine()->getManager() ;
        $em -> remove($evenement);
        $em -> flush();
        return $this->redirectToRoute("Affiche");

    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("evenement/update/{id_evenement}" , name="update")
     */

    public function update(EvenementRepository $repository,$id_evenement,Request $request){
        $evenement=$repository->find($id_evenement);
        $form=$this->createForm(EvenementFormType::class,$evenement);
        $form->add('update',SubmitType::class) ;
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager() ;
            $em -> flush();
            return $this->redirectToRoute("Affiche");

        }
        return $this->render('evenement/update.html.twig',['form'=>$form->createView()]);

    }
    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("evenement/Participer/{id_event}/{nbrplace}/{nom_event}" , name="participer")
     */

    function Participer(Request $request, EvenementRepository $repository, $id_event,$nbrplace,$nom_event){
        $participation=new Participation() ;
        $participation->setIdEvent($id_event) ;
        $participation->setIdUser(2) ;
        $participation->setNomEvenement($nom_event);
        $evenement=$repository->find($id_event);
        $evenement->setNbrPlace($nbrplace) ;
        $em=$this->getDoctrine()->getManager();
        $em->persist($participation);
        $em->persist($evenement);
        $em->flush();
        return $this->redirectToRoute("Affiche");


    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/evenement/participation",name="participation")
     */
    public function AfficheP(){
        $repo=$this->getDoctrine()->getRepository(Participation::class) ;
        $participation=$repo->findAll();
        return $this->render('evenement/affichep.html.twig',['participation'=>$participation]);

    }
}
