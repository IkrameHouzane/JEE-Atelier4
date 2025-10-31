package ma.fstt.services;

import ma.fstt.entities.Etudiant;
import jakarta.ejb.Remote;  // ✅ CHANGER ICI
import java.util.List;

@Remote
public interface EtudiantServiceRemote {
    Etudiant createEtudiant(Etudiant etudiant);
    Etudiant updateEtudiant(Etudiant etudiant);
    void deleteEtudiant(Long id);
    Etudiant findEtudiantById(Long id);
    List<Etudiant> findAllEtudiants();
    Etudiant findEtudiantByCne(String cne);
    List<Etudiant> findEtudiantsByNiveau(String niveau);
}
