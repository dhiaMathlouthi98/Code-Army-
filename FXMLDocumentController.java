/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pi.gui;

import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import pi.entities.Departement;
import pi.entities.Utilisateur;
import pi.services.DepartementCRUD;

/**
 *
 * @author ASUS
 */
public class FXMLDocumentController implements Initializable {
    
    @FXML
    private Label label;
    @FXML
    private Label label1;
    @FXML
    private Button btn_ut;
    @FXML
    private Button btn_emp;
    @FXML
    private Button btn_res;
    @FXML
    private Button btn_eve;
    @FXML
    private Button btn_st;
    @FXML
    private Button btn_dec;
    @FXML
    private Button btn_dep;
    @FXML
    private Tab tab1;
    @FXML
    private TextField txt_nomd;
    @FXML
    private TableView<Departement> tv1;
    @FXML
    private TableColumn<Departement, Integer> cl_id;
    @FXML
    private TableColumn<Departement, String> cl_nom;
    @FXML
    private Button btnA;
    @FXML
    private Button btnS;
    @FXML
    private Tab tab2;
    @FXML
    private Tab tab3;
     DepartementCRUD d = new DepartementCRUD();
     String zero="";
    @FXML
    private ComboBox<String> cmbx_dep;
    @FXML
    private ComboBox<String> cmbx_ens;
    @FXML
    private TableColumn<Utilisateur, Integer> cl_id1;
    @FXML
    private TableColumn<Utilisateur, String> cl_nom1;
    @FXML
    private TableColumn<Utilisateur, String> cl_pre1;
    @FXML
    private Button btnaff;
    @FXML
    private TableView<Utilisateur> tv2;
    @FXML
    private RadioButton rd1;
    @FXML
    private Label lbl1;
    @FXML
    private Label lbl2;
    @FXML
    private RadioButton rd2;
    @FXML
    private ComboBox<String> cmbx_ens1;
    @FXML
    private ToggleGroup Mygroup;
    @FXML
    private ComboBox<String> cmbx_dep1;
      private Connection cnx;
    private PreparedStatement ste;
    private ResultSet rs ; 
    @FXML
    private TableColumn<Departement, String> cl_chef;
    private void handleButtonAction(ActionEvent event) {
        System.out.println("You clicked me!");
        label.setText("Hello World!");
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        afficherdep();
        getSelected();
        afficherdep1();
        afficherens();
//     lbl1.setVisible(false);
        lbl2.setVisible(false);
//        cmbx_ens.setVisible(false);
        cmbx_ens1.setVisible(false);
    }    

    @FXML
    private void AjouterDep(ActionEvent event) {

  String rnom = txt_nomd.getText();
       
        Departement d = new Departement(1,rnom,"");
        DepartementCRUD dec =new DepartementCRUD();
        dec.ajoutDepartement(d);
        afficherdep();
        txt_nomd.setText(zero);
        updatedep1();
            }

    @FXML
    private void suppressiondep(ActionEvent event) {
         Departement de = tv1.getSelectionModel().getSelectedItem();
        String rnom = de.getNom();
        Departement d =new Departement(1,rnom,"");
        
        DepartementCRUD dec =new DepartementCRUD();
        dec.supprimerDepartement(d);
        afficherdep();
        txt_nomd.setText(zero);
        updatedep1();
        
    }
     public void afficherdep(){
       
        try {
            
            ObservableList<Departement> ls1=d.afficherdepartement();
            
            cl_id.setCellValueFactory(new PropertyValueFactory<>("id"));
            cl_nom.setCellValueFactory(new PropertyValueFactory<>("nom"));
            cl_chef.setCellValueFactory(new PropertyValueFactory<>("nom_chef"));
            
            tv1.setItems(ls1);
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
     public void getSelected(){
        
        tv1.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                Departement de = tv1.getSelectionModel().getSelectedItem();

              
            }
        });
        
    }
 
     public void afficherdep1()
    {
    try {
            List<String> idens = d.affichernomdep();
            cmbx_dep.getItems().addAll(idens);
            cmbx_dep1.getItems().addAll(idens);
            
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      public void updatedep1(){
        try {
            cmbx_dep.getItems().clear();
            cmbx_dep1.getItems().clear();
            List<String> idens1= d.affichernomdep();
            cmbx_dep.getItems().addAll(idens1);
            cmbx_dep1.getItems().addAll(idens1);
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
      public void afficherens()
    {
    try {
            List<String> ens = d.afficherusrnmens();
            cmbx_ens.getItems().addAll(ens);
            cmbx_ens1.getItems().addAll(ens);
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @FXML
       public void afichcombo(ActionEvent event) throws SQLException{
        String o = cmbx_dep1.getValue();
        switch (o) {
            case "informatique":
                afficherensinfo();
                break;
            case "electromecanique":
                afficherenselec();
                break;
            case "genicivile":
                afficherensgen();
                break;
            default:
                break;
        }
        
    }
       public void afficherensinfo(){
       
        try {
            
            ObservableList<Utilisateur> ensinf1=d.ensinfo();
            System.out.println(ensinf1);
            cl_id1.setCellValueFactory(new PropertyValueFactory<>("id_user"));
//                                    System.out.println(cl_id1.get);

            cl_nom1.setCellValueFactory(new  PropertyValueFactory<>("nom"));
            cl_pre1.setCellValueFactory(new PropertyValueFactory<>("prenom"));
            tv2.setItems(ensinf1);

        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
       public void afficherenselec() {
        try {
            ObservableList<Utilisateur> infens1=d.enselec();
            System.out.println(infens1);
            
            
            cl_nom1.setCellValueFactory(new PropertyValueFactory<>("nom"));
            cl_pre1.setCellValueFactory(new PropertyValueFactory<>("prenom"));
            cl_id1.setCellValueFactory(new PropertyValueFactory<>("id_user"));
           if(infens1!= null)
               tv2.setItems(infens1);
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        public void afficherensgen(){
          try {
            ObservableList<Utilisateur> infens1=d.ensgenie();
             
            cl_nom1.setCellValueFactory(new PropertyValueFactory<>("nom"));
        cl_pre1.setCellValueFactory(new PropertyValueFactory<>("prenom"));
         cl_id1.setCellValueFactory(new PropertyValueFactory<>("id_user"));
        tv2.setItems(infens1);
        } catch (SQLException ex) {
            Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @FXML
        public void radioSelect (ActionEvent event){
           
        String o = "";
       if (rd1.isSelected()){
           lbl2.setVisible(true);
           cmbx_ens1.setVisible(true);
           lbl1.setVisible(false);
           cmbx_ens.setVisible(false);
           
       }
       else if ( rd2.isSelected()){
           lbl1.setVisible(true);
           cmbx_ens.setVisible(true);
           lbl2.setVisible(false);
           cmbx_ens1.setVisible(false);
       }
        
    
        }
 @ FXML 
   private void affecter (ActionEvent event ){
       if (rd1.isSelected())
          
       {
            d.affecterchef(cmbx_ens1.getValue(),cmbx_dep.getValue());
            afficherdep();
            
       }
       else if (rd2.isSelected())
               {
                   d.affecterens(cmbx_ens.getValue(),cmbx_dep.getValue());
                 
           
               }
        }
   @FXML 
   private void supprimer ( ActionEvent event){
       if(rd1.isSelected())
       {
           d.supprimerchef(cmbx_dep.getValue());
           afficherdep();
       }
       else if ( rd2.isSelected())
       {
           d.supprimerens(cmbx_ens.getValue());
           
       }
   }
   
  
   
}
