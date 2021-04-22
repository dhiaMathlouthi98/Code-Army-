<?php namespace App\Controller;
use App\Entity\Matiere;
use App\Form\ContactType;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Entity\Note;
use App\Form\NoteType;
use App\Entity\Etudiant;
use App\Entity\Classe;
use App\Entity\Cours;
use App\Entity\PropertySearch;
use App\Form\PropertySearchType;
use App\Form\CoursType;
use App\Form\EtudiantType;
use App\Form\ClasseType;
use App\Entity\ClasseSearch;
use App\Form\ClasseSearchType;
use App\Form\MatiereSearchType1;
use App\Entity\MatiereSearch1;

class IndexController extends AbstractController{

    /** *@Route("/enseignant",name="article_list") */
    public function homeEns(Request $request){

        return $this->render('notes/index.html.twig'); }

    /** *@Route("/etudiant",name="article_list1") */
    public function homeEtu(Request $request){

        return $this->render('notes/index2.html.twig'); }

    /** *@Route("/enseignant0",name="article_list0") */
    public function home(Request $request){
        $propertySearch = new PropertySearch();
        $form = $this->createForm(PropertySearchType::class,$propertySearch);
        $form->handleRequest($request);
        //initialement le tableau des articles est vide, //c.a.d on affiche les articles que lorsque l'utilisateur //clique sur le bouton rechercher
         $notes= [];
         if($form->isSubmitted() && $form->isValid()) {
             //on récupère le nom d'article tapé dans le formulaire

             $nom = $propertySearch->getNom();
             if ($nom!="")
                 //si on a fourni un nom d'article on affiche tous les articles ayant ce nom
                 $notes= $this->getDoctrine()->getRepository(Note::class)->ShowParClasse(1);
             else //si si aucun nom n'est fourni on affiche tous les articles
                 $notes= $this->getDoctrine()->getRepository(Note::class)->FindAll(); }
         return $this->render('notes/index.html.twig',[ 'form' =>$form->createView(), 'notes' => $notes]); }

    /** * @Route("/courss", name="cours_show") */
    public function showcours(Request $request) {
        $classeSearch = new ClasseSearch();
        $form = $this->createForm(ClasseSearchType::class,$classeSearch);
        $form->handleRequest($request);
        $cours= [];
        if($form->isSubmitted() && $form->isValid()) {
            $classe = $classeSearch->getClasse();
            if ($classe!="")
                $cours= $classe->getCours();
            else $cours= $this->getDoctrine()->getRepository(Cours::class)->FindAll(); }
        return $this->render('notes/cours.html.twig',['form' => $form->createView(),'cours' => $cours]); }


    /** * @Route("/coursetudiant", name="cours_show2") */
    public function showcours2(Request $request) {
        $matiereSearch = new MatiereSearch1();
        $form = $this->createForm(MatiereSearchType1::class,$matiereSearch);
        $form->handleRequest($request);
        $cours= [];
        if($form->isSubmitted() && $form->isValid()) {
            $matiere = $matiereSearch->getMatiere();
            if ($matiere!="")
                $cours= $matiere->getCours();
            else $cours= $this->getDoctrine()->getRepository(Cours::class)->FindAll(); }
        return $this->render('notes/cours2.html.twig',['form' => $form->createView(),'cours' => $cours]); }




    /** * @Route("/art_cat/", name="note_par_classe") * Method({"GET", "POST"}) */
    public function notesParClasse(Request $request) {
        $classeSearch = new ClasseSearch();
        $form = $this->createForm(ClasseSearchType::class,$classeSearch);
        $form->handleRequest($request);
        $notes= [];
        if($form->isSubmitted() && $form->isValid()) {
            $classe = $classeSearch->getClasse();
            if ($classe!="")
                $notes= $classe->getNotes();
            else $notes= $this->getDoctrine()->getRepository(Note::class)->FindAll(); }
        return $this->render('notes/notesParClasse.html.twig',['form' => $form->createView(),'notes' => $notes]); }


    /** * @Route("/art_cat2/", name="note_par_classe2") * Method({"GET", "POST"}) */
    public function notesParClasse2(Request $request) {
        $notes= $this->getDoctrine()->getRepository(Note::class)->OrderForEtudiant(10);
        return $this->render('notes/notesParClasse2.html.twig',['notes'=> $notes]);
        }




    /** * @Route("/note/save") */
    public function save() {
        $entityManager = $this->getDoctrine()->getManager();
        $note = new Note();
        $note->setNote();
        $entityManager->persist($note);
        $entityManager->flush();
        return new Response('Note enregisté avec id '.$note->getId());
    }

    /** * @Route("/note/new", name="new_note") * Method({"GET", "POST"}) */
    public function new(Request $request) {
        $note = new Note();
        $form = $this->createForm(NoteType::class,$note);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            $note = $form->getData();
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($note);
            $entityManager->flush();
            return $this->redirectToRoute('article_list'); }
        return $this->render('notes/new.html.twig',['form' => $form->createView()]); }

    /** * @Route("/notes/{id}", name="article_show") */
    public function show($id) {
        $note = $this->getDoctrine()->getRepository(Note::class) ->find($id);
        return $this->render('notes/show.html.twig', array('note' => $note));
    }




    /** * @Route("/notes/edit/{id}", name="edit_note") * Method({"GET", "POST"}) */
    public function edit(Request $request, $id) {
        $note = new Note();
        $note = $this->getDoctrine()->getRepository(Note::class)->find($id);
        $form = $this->createForm(NoteType::class,$note);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->flush();
            return $this->redirectToRoute('article_list'); }
        return $this->render('notes/edit.html.twig', ['form' => $form->createView()]); }



    /** * @Route("/notes/delete/{id}",name="delete_notes") * @Method({"DELETE"})
     */

    public function delete(Request $request, $id) {
        $note = $this->getDoctrine()->getRepository(Note::class)->find($id);
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($note); $entityManager->flush();
        $response = new Response(); $response->send();
        return $this->redirectToRoute('article_list'); }







    /** * @Route("/etudiant/newEtu", name="new_etudiant") * Method({"GET", "POST"}) */
    public function newEtudiant(Request $request) {
        $etudiant = new Etudiant();
        $form = $this->createForm(EtudiantType::class,$etudiant);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) { $etudiant = $form->getData();
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($etudiant); $entityManager->flush();
            return $this->redirectToRoute('article_list');

        }
        return $this->render('notes/etudiant.html.twig',['form'=> $form->createView()]); }

    /** * @Route("/cours/newcours", name="new_cours") * Method({"GET", "POST"}) */
    public function newCours(Request $request) {

        $cours = new Cours();
        $form = $this->createForm(CoursType::class,$cours);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) { $cours = $form->getData();
            $entityManager = $this->getDoctrine()->getManager();
            $file = $cours->getBrochure() ;
            $fileName = md5(uniqid()).'.'.$file->getExtension() ;
            $file->move(
                $this->getParameter('brochures_directory') ,
                $fileName
            );
            $cours->setBrochure($fileName) ;
            $entityManager->persist($cours);
            $entityManager->flush();
            $s = $cours->getClasse() ;
            $i = $s->id ;
            $students[] = $this->getDoctrine()->getRepository(Etudiant::class)->OrderForEmail($i);

                return $this->redirectToRoute('contact1',['mail'=>'hamza.beizig@esprit.tn']);

        }
        return $this->render('notes/newcours.html.twig',['cours'=>$cours,'form'=> $form->createView()]); }


    /** * @Route("/note/Gestion", name="gestion_note")  * Method({"GET", "POST"}) */
    public function gestionNote(Request $request) {
        $classes= $this->getDoctrine()->getRepository(Classe::class)->findAll();
        $notes= $this->getDoctrine()->getRepository(Note::class)->findAll();
        $classe = new Classe();
        $form = $this->createForm(ClasseType::class,$classe);
        $form->handleRequest($request);
        dump($classe);
        echo ($classe.getNomClasse()) ;
        if( isset($_POST['secteur']) && $_POST['secteur']!='default' )
        {

            echo "Vous avez choisi <b>".$_POST['secteur']."</b>";

        }
        return $this->render('classe/index.html.twig',['form'=> $form->createView(),'classes'=> $classes]);}



    /**
     * @Route("/contact1/{mail}", name="contact1")
     */
    public function sendmail(Request $request, \Swift_Mailer $mailer,String $mail): Response
    {

            $message = (new \Swift_Message('Nouveau support de cours'))
                ->setFrom('exellenceacademy.cours@gmail.com')
                ->setTo($mail)
                ->setBody(
                    "Vous avez reçu un nouveau cours !!! Vous pouvez le consulter sur votre espace personnel","text/html");
            $mailer->send($message);
            $this->addFlash('message', 'le message a ete bien envoyée');

        return $this->render('emails/contact1.html.twig');
    }

}