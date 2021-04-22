<?php

namespace App\Controller;

use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request, \Swift_Mailer $mailer): Response
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $contact = $form->getData() ;

        $message = (new \Swift_Message('Hello Email'))
            ->setFrom('exellenceacademy.cours@gmail.com')
            ->setTo('hamza.beizig@esprit.tn')
            ->setBody(
                $this->renderView(
                // templates/hello/email.txt.twig
                    'emails/contact.html.twig',
                    ['contact' => $contact]
                ),'text/html'
            )
        ;
            $mailer->send($message);
             $this->addFlash('message','le message a ete bien envoyée');


        }
            return $this->render('contact/index.html.twig', [
            'contactForm' => $form->createView()
        ]);

    }
}
