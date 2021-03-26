/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pi.entities;

/**
 *
 * @author 21655
 */
public class Enseignant extends Utilisateur {
    private int id_user ;
    private String nom_departement ;
    private int id_matiere ;

    public Enseignant(int id_user, String nom_departement, int id_matiere) {
        this.id_user = id_user;
        this.nom_departement = nom_departement;
        this.id_matiere = id_matiere;
    }

    public Enseignant() {
    }

    @Override
    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getNom_departement() {
        return nom_departement;
    }

    public void setNom_departement(String nom_departement) {
        this.nom_departement = nom_departement;
    }

    public int getId_matiere() {
        return id_matiere;
    }

    public void setId_matiere(int id_matiere) {
        this.id_matiere = id_matiere;
    }

    @Override
    public String toString() {
        return "Enseignant{" + "id_user=" + id_user + ", nom_departement=" + nom_departement + ", id_matiere=" + id_matiere + '}';
    }
    
    
}
