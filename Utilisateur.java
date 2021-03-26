/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pi.entities;

import java.sql.Date;



/**
 *
 * @author 21655
 */
public class Utilisateur {
    protected int id_user ; 
    protected String user_name ; 
    protected String nom ; 
    protected String prenom ;
    protected String email ; 
    protected Date date_de_naissance ;
    protected String role ; 

    public Utilisateur(int id_user, String user_name, String nom, String prenom, String email, Date date_de_naissance, String role) {
        this.id_user = id_user;
        this.user_name = user_name;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.date_de_naissance = date_de_naissance;
        this.role = role;
    }

    public Utilisateur() {
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate_de_naissance() {
        return date_de_naissance;
    }

    public void setDate_de_naissance(Date date_de_naissance) {
        this.date_de_naissance = date_de_naissance;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Utilisateur{" + "id_user=" + id_user + ", user_name=" + user_name + ", nom=" + nom + ", prenom=" + prenom + ", email=" + email + ", date_de_naissance=" + date_de_naissance + ", role=" + role + '}';
    }
    
    
    
}
