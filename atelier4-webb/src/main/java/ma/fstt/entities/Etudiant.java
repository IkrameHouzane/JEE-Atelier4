package ma.fstt.entities;

import jakarta.persistence.*;  // <--- AJOUTE ÇA
import java.io.Serializable;

@Entity
@Table(name = "etudiants")  // Optionnel, mais propre
public class Etudiant implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_etudiant")
    private Long idEtudiant;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "cne", unique = true)
    private String cne;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "niveau")
    private String niveau;

    // Constructeurs
    public Etudiant() {}

    public Etudiant(Long idEtudiant, String nom, String prenom, String cne, String adresse, String niveau) {
        this.idEtudiant = idEtudiant;
        this.nom = nom;
        this.prenom = prenom;
        this.cne = cne;
        this.adresse = adresse;
        this.niveau = niveau;
    }

    // Getters et Setters
    public Long getIdEtudiant() { return idEtudiant; }
    public void setIdEtudiant(Long idEtudiant) { this.idEtudiant = idEtudiant; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getCne() { return cne; }
    public void setCne(String cne) { this.cne = cne; }

    public String getAdresse() { return adresse; }
    public void setAdresse(String adresse) { this.adresse = adresse; }

    public String getNiveau() { return niveau; }
    public void setNiveau(String niveau) { this.niveau = niveau; }

    @Override
    public String toString() {
        return "Etudiant{" +
                "id=" + idEtudiant +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", cne='" + cne + '\'' +
                '}';
    }
}