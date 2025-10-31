package ma.fstt.entities;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "suivies")
public class Suivie implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_suivie")
    private Long idSuivie;

    @Column(name = "note", nullable = false)
    private Double note;

    @Column(name = "date_examen", nullable = false)
    private LocalDate dateExamen;

    // Relation ManyToOne → Un étudiant a plusieurs suivies
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etudiant_id", nullable = false)
    private Etudiant etudiant;

    // Relation ManyToOne → Un module a plusieurs suivies
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "module_id", nullable = false)
    private Module module;

    // Constructeurs
    public Suivie() {}

    public Suivie(Long idSuivie, Double note, LocalDate dateExamen, Etudiant etudiant, Module module) {
        this.idSuivie = idSuivie;
        this.note = note;
        this.dateExamen = dateExamen;
        this.etudiant = etudiant;
        this.module = module;
    }

    // Getters et Setters
    public Long getIdSuivie() { return idSuivie; }
    public void setIdSuivie(Long idSuivie) { this.idSuivie = idSuivie; }

    public Double getNote() { return note; }
    public void setNote(Double note) { this.note = note; }

    public LocalDate getDateExamen() { return dateExamen; }
    public void setDateExamen(LocalDate dateExamen) { this.dateExamen = dateExamen; }

    public Etudiant getEtudiant() { return etudiant; }
    public void setEtudiant(Etudiant etudiant) { this.etudiant = etudiant; }

    public Module getModule() { return module; }
    public void setModule(Module module) { this.module = module; }

    @Override
    public String toString() {
        return "Suivie{" +
                "id=" + idSuivie +
                ", note=" + note +
                ", date=" + dateExamen +
                ", etudiant=" + (etudiant != null ? etudiant.getNom() + " " + etudiant.getPrenom() : "null") +
                ", module=" + (module != null ? module.getNomModule() : "null") +
                '}';
    }
}