/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pi.services;

import javax.mail.PasswordAuthentication;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import pi.entities.Departement;
import pi.entities.Enseignant;
import pi.entities.Utilisateur;
import pi.gui.FXMLDocumentController;
import pi.tools.MyConnection;

/**
 *
 * @author pc
 */
public class DepartementCRUD {
        private Connection cnx;
    private PreparedStatement ste;
    private ResultSet rs ; 

public DepartementCRUD () {
        cnx = MyConnection.getInstance().getConnection();
    }
 public void ajoutDepartement(Departement d){
       String req ="INSERT INTO departement (nom_departement,chef_departement)"+"values (?,?)";
        try {
            ste = cnx.prepareStatement(req);
            ste.setString(1,d.getNom());
            ste.setString(2, d.getNom_chef());
            
       
           ste.executeUpdate();
            System.out.println("Departement ajoutée");
            
        } catch (SQLException ex) {
            System.out.println("Probléme");
            System.out.println(ex.getMessage());
            
        }
}
 public void supprimerDepartement(Departement d) {
        String req="DELETE FROM  departement WHERE nom_departement=?";
         
        try {
            ste=cnx.prepareStatement(req);
            ste.setString(1,d.getNom());
            
            
            ste.executeUpdate();
            System.out.println("deaprtement supprimé");
        } catch (SQLException ex) {
            System.out.println("Probléme");
            System.out.println(ex.getMessage());
            
        }
}
  public ObservableList<Departement> afficherdepartement() throws SQLException{
      ObservableList<Departement> ls = FXCollections.observableArrayList();
      String req =" select id_departement,nom_departement,chef_departement from departement" ;
      ste= cnx.prepareStatement(req);
      rs=ste.executeQuery();
      while(rs.next())
      {
          Departement de = new  Departement();
          de.setId(rs.getInt("id_departement"));
          de.setNom(rs.getString("nom_departement"));
          de.setNom_chef(rs.getString("chef_departement"));
          ls.add(de);
      }
      return ls;
      
      
  }
  public List<String> affichernomdep() throws SQLException{
      List<String> ls =new ArrayList<String>();
      String req =" select nom_departement from departement" ;
      ste= cnx.prepareStatement(req);
      rs=ste.executeQuery();
      while(rs.next())
      {
          ls.add(rs.getString("nom_departement"));
      }
      return ls;
      
      
  }
  public List<String> afficherusrnmens() throws SQLException {
      List<String> ls =new ArrayList<>();
      String req ="select user_name from user where role='enseignant'";
      ste=cnx.prepareStatement(req);
      rs=ste.executeQuery();
      while (rs.next())
      {
          ls.add(rs.getString("user_name"));
      }
      return ls ;
          
  }
  public ObservableList<Utilisateur> ensinfo() throws SQLException{
       
            ObservableList<Enseignant> ensinf =FXCollections.observableArrayList();
            ObservableList<Utilisateur> ensinf1 =FXCollections.observableArrayList();
            
            String req ="select * from enseignant where nom_departement = 'informatique'";
            ste=cnx.prepareStatement(req);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Enseignant e =new  Enseignant();
              e.setId_user(rs.getInt("id_user"));
              e.setNom_departement(rs.getString("nom_departement"));
              e.setId_matiere(rs.getInt("id_matiere"));
              ensinf.add(e);
                System.out.println(ensinf);
            }   
            for(int i=0;i<ensinf.size();i++)
            {
            String req2 ="select * from user where id_user="+ensinf.get(i).getId_user()+";";
            ste=cnx.prepareStatement(req2);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Utilisateur u =new  Utilisateur();
              u.setId_user(rs.getInt("id_user"));
              u.setNom(rs.getString("nom"));
              u.setPrenom(rs.getString("prenom"));
              ensinf1.add(u);
                System.out.println(ensinf1);
            } 
            }

            return ensinf1;

            
        } 
public ObservableList<Utilisateur> enselec() throws SQLException{
       
            ObservableList<Enseignant> ensinf =FXCollections.observableArrayList();
            ObservableList<Utilisateur> ensinf1 =FXCollections.observableArrayList();
            
            String req ="select * from enseignant where nom_departement = 'electromecanique'";
            ste=cnx.prepareStatement(req);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Enseignant e =new  Enseignant();
              e.setId_user(rs.getInt("id_user"));
              e.setNom_departement(rs.getString("nom_departement"));
              e.setId_matiere(rs.getInt("id_matiere"));
              ensinf.add(e);
            }   
            
            for(int i=0;i<ensinf.size();i++)
            {
            String req2 ="select * from user where id_user="+ensinf.get(i).getId_user()+"";
              
            ste=cnx.prepareStatement(req2);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Utilisateur u =new  Utilisateur();
              u.setId_user(rs.getInt("id_user"));
              u.setNom(rs.getString("nom"));
              u.setPrenom(rs.getString("prenom"));
              
              ensinf1.add(u);
            }   
            }
            return ensinf1;
            
        } 

public ObservableList<Utilisateur> ensgenie() throws SQLException{
       
            ObservableList<Enseignant> ensinf =FXCollections.observableArrayList();
            ObservableList<Utilisateur> ensinf1 =FXCollections.observableArrayList();
            
            String req ="select * from enseignant where nom_departement = 'genicivile'";
            ste=cnx.prepareStatement(req);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Enseignant e =new  Enseignant();
              
              e.setId_user(rs.getInt("id_user"));
              e.setNom_departement(rs.getString("nom_departement"));
              e.setId_matiere(rs.getInt("id_matiere"));
              ensinf.add(e);
            }   
            for(int i=0;i<ensinf.size();i++)
            {
            String req2 ="select * from user where id_user="+ensinf.get(i).getId_user()+";";
            ste=cnx.prepareStatement(req2);
            rs=ste.executeQuery();
            while(rs.next())
            {
              Utilisateur u =new  Utilisateur();
              u.setId_user(rs.getInt("id_user"));
              u.setNom(rs.getString("nom"));
              u.setPrenom(rs.getString("prenom"));
              
              ensinf1.add(u);
            }   
            }
            return ensinf1;
            
        }  
public void affecterchef(String ens,String dep){
            try {
                String email = "";
                
                String req1 =" select  email from user  where user_name='"+ens+"'";
                
                ste=cnx.prepareStatement(req1);
                
                
                rs=ste.executeQuery();
                
                
                while ( rs.next()){
                    
                    email=rs.getString("email");
                    
                }
                
                try {
                    sendMails(dep,email );
                } catch (Exception ex) {
                    Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                String req = " update departement set chef_departement='"+ens+"' where nom_departement ='"+dep+"'";
                
                ste=cnx.prepareStatement(req);
                
                
                ste.executeUpdate();
                
                
                System.out.println("chef affecté");
            } catch (SQLException ex) {
                Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
            }
        
 
   }
public void affecterens(String ens,String dep){
        try {
            String id = "";
            String email = "";
            String req1 = "select id_user,email from user where user_name = '"+ens+"'";
            ste=cnx.prepareStatement(req1);
            rs=ste.executeQuery();
              while(rs.next())
            {
                             id=rs.getString("id_user");
                             email=rs.getString("email");

            } 
            try {
               sendMail(dep,email);
           } catch (Exception ex) {
               Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
           }

                
            
            String req = " update enseignant set nom_departement='"+dep+"' where id_user ='"+id+"'";
            ste=cnx.prepareStatement(req);
            ste.executeUpdate();
            System.out.println("ensei affecté");
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
       
   }
public void supprimerens(String ens ){
            try {
     
                String s="";
                String req =" select id_user from user where user_name='"+ens+"' ";
                ste=cnx.prepareStatement(req);
                rs=ste.executeQuery();
                while ( rs.next())
                {
                    s=rs.getString("id_user");
                 
                }
                String req2 =" update enseignant set nom_departement='' where id_user='"+s+"'";
                ste=cnx.prepareStatement(req2);
                ste.executeUpdate();
                System.out.println("ensei supprimé");
            } catch (SQLException ex) {
                Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
            }
}
public void supprimerchef(String dep ){
            try {
                String req =" update departement set chef_departement ='' where nom_departement='"+dep+"' ";
                ste=cnx.prepareStatement(req);
                ste.executeUpdate();
                System.out.println("chef supprimé");
            } catch (SQLException ex) {
                Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
            }
    
}
public static void sendMail(String dep ,String recepient ) throws Exception {
    System.out.println("Preparting to send email ");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth","true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    
    String myAccountEmail ="excellenceacademy878@gmail.com";
    String password ="freefire1234";
    
    Session session = Session.getInstance(properties, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(myAccountEmail, password);

        }
      
});
    Message message = prepareMessage(dep, session,myAccountEmail, recepient);
    Transport.send(message);
    System.out.println("Message sent sccessfully");
    
}
private static Message prepareMessage(String dep, Session session, String myAccountEmail, String recepient) throws MessagingException{
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(myAccountEmail));
                message.setRecipient(Message.RecipientType.TO, new  InternetAddress(recepient));
                message.setSubject("Excellence Academy");
                message.setText("Vous etes affectés au departement "+dep+" ");
                return message;
            } catch (AddressException ex) {
                Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
            }
    return null ;
}
  public static void sendMails(String dep ,String recepient ) throws Exception {
    System.out.println("Preparting to send email ");
    Properties properties = new Properties();
    properties.put("mail.smtp.auth","true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    
    String myAccountEmail ="excellenceacademy878@gmail.com";
    String password ="freefire1234";
    
    Session session = Session.getInstance(properties, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(myAccountEmail, password);

        }
      
});
    Message message = prepareMessage1(dep,session,myAccountEmail,recepient);
    Transport.send(message);
    System.out.println("Message sent sccessfully");
    
} 
  private static Message prepareMessage1(String dep,Session session,String myAccountEmail,String recepient) throws MessagingException{
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(myAccountEmail));
                message.setRecipient(Message.RecipientType.TO, new  InternetAddress(recepient));
                message.setSubject("Excellence Academy");
                message.setText("Vous etes affectés comme chef au departement"+dep+" ");
                return message;
            } catch (AddressException ex) {
                Logger.getLogger(DepartementCRUD.class.getName()).log(Level.SEVERE, null, ex);
            }
    return null ;
}
}
