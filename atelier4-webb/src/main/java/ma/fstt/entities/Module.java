package ma.fstt.entities;

import jakarta.persistence.*;  // <--- AJOUTE ÇA
import java.io.Serializable;

@Entity
@Table(name = "modules")  // Optionnel, mais propre
public class Module implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_module")
    private Long idModule;

    @Column(name = "nom_module")
    private String nomModule;

    @Column(name = "code_module", unique = true)
    private String codeModule;

    @Column(name = "coefficient")
    private Double coefficient;

    @Column(name = "description")
    private String description;

    // Constructeurs
    public Module() {}

    public Module(Long idModule, String nomModule, String codeModule, Double coefficient, String description) {
        this.idModule = idModule;
        this.nomModule = nomModule;
        this.codeModule = codeModule;
        this.coefficient = coefficient;
        this.description = description;
    }

    // Getters et Setters
    public Long getIdModule() { return idModule; }
    public void setIdModule(Long idModule) { this.idModule = idModule; }

    public String getNomModule() { return nomModule; }
    public void setNomModule(String nomModule) { this.nomModule = nomModule; }

    public String getCodeModule() { return codeModule; }
    public void setCodeModule(String codeModule) { this.codeModule = codeModule; }

    public Double getCoefficient() { return coefficient; }
    public void setCoefficient(Double coefficient) { this.coefficient = coefficient; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    @Override
    public String toString() {
        return "Module{" +
                "id=" + idModule +
                ", nom='" + nomModule + '\'' +
                ", code='" + codeModule + '\'' +
                ", coeff=" + coefficient +
                '}';
    }
}