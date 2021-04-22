<?php

namespace App\Controller;

use App\Entity\Stage;
use App\Form\StageType;
use App\Repository\StageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StageController extends AbstractController
{
    /**
     * @Route("/stage", name="stage")
     */
    public function index(): Response
    {
        return $this->render('stage/index.html.twig', [
            'controller_name' => 'StageController',
        ]);
    }


    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/AfficheStage",name="AfficheStage")
     */
    public function Affiche(){
        $repo=$this->getDoctrine()->getRepository(Stage::class) ;
        $stage=$repo->findAll();
        return $this->render('stage/affichestage.html.twig',['stage'=>$stage]);

    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/DeleteStage/{id}",name="ds")
     */

    public function delete($id,StageRepository $repository){
        $stage=$repository->find($id);
        $em = $this->getDoctrine()->getManager() ;
        $em -> remove($stage);
        $em -> flush();
        return $this->redirectToRoute("AfficheStage");

    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("stage/Add")
     */

    function Add(Request $request){
        $stage=new Stage() ;
        $form=$this->createForm(StageType::class,$stage);
        $form->add('Ajouter', SubmitType::class) ;
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em=$this->getDoctrine()->getManager();
            $em->persist($stage);
            $em->flush();
            return $this->redirectToRoute("AfficheStage");


        }

        return $this->render('stage/AddStage.html.twig',['form'=>$form->createView()]);


    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("stage/updateStage/{id}" , name="updateStage")
     */

    public function update(StageRepository $repository,$id,Request $request){
        $stage=$repository->find($id);
        $form=$this->createForm(StageType::class,$stage);
        $form->add('update',SubmitType::class) ;
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager() ;
            $em -> flush();
            return $this->redirectToRoute("AfficheStage");

        }
        return $this->render('stage/updateStage.html.twig',['form'=>$form->createView()]);

    }
}
