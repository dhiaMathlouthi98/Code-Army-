<?php

namespace App\Controller;

use App\Entity\DemConvention;
use App\Entity\Stage;
use App\Form\StageType;
use App\Repository\DemConventionRepository;
use App\Repository\StageRepository;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class StageController extends AbstractController
{
    public  $nb=1 ;

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
     * @route("/",name="AfficheStage")
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

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/etudiant/stage",name="affichestageetudiant")
     */
    public function AfficheStageE(){
        $repo=$this->getDoctrine()->getRepository(Stage::class) ;
        $stage=$repo->findAll();
        return $this->render('stage/affichestageetudiant.html.twig',['stage'=>$stage]);

    }



    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("stage/convention/{id}" , name="demanderC")
     */

    function DemanderC (Request $request, $id){
        if ($this->nb!=0){
        $DemandeC=new DemConvention() ;
        $DemandeC->setIdUser(2) ;
        $DemandeC->setIdStage($id) ;
        $DemandeC->setUserName("khalil");
        $DemandeC->setEtat("en attente");
        $DemandeC->setDate( new \DateTime('now'));
        $em=$this->getDoctrine()->getManager();
        $em->persist($DemandeC);
        $em->flush();
        $this->nb--;
        return $this->redirectToRoute("affichestageetudiant");

        echo '<script type="text/javascript">alert("message sent")</script>' ;
        } else {
            echo "<script>alert(\"vous avez deja envoyé une demande\")</script>";

        }
    }
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/convention",name="affichec")
     */
    public function AfficheConv(){
        $repo=$this->getDoctrine()->getRepository(DemConvention::class) ;
        $conv=$repo->findBy(['etat' => 'en attente']);
        return $this->render('stage/affichec.html.twig',['conv'=>$conv]);

    }


    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/refuserconv/{id_conv}",name="ref")
     */

    public function Refuser(DemConventionRepository $repository,$id_conv ,Request $request ,\Swift_Mailer $mailer){
        $conv=$repository->find($id_conv);
        $conv->setEtat("refusée");
        $em = $this->getDoctrine()->getManager() ;
        $em -> persist($conv);
        $em -> flush();
        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('excellenceacademy878@gmail.com')
            ->setTo('khalil-guedria@hotmail.com')
            ->setBody('You should see me from the profiler!')
        ;

        $mailer->send($message);

        $response = new Response();
        $response->send() ;
        return $this->redirectToRoute("affichec");
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @route("/accepterconv/{id_conv}",name="acc")
     */

    public function Accepter(DemConventionRepository $repository,$id_conv,Request $request){
        $conv=$repository->find($id_conv);
        $conv->setEtat("acceptée");
        $em = $this->getDoctrine()->getManager() ;
        $em -> persist($conv);
        $em -> flush();
        return $this->redirectToRoute("affichec");


    }
}
