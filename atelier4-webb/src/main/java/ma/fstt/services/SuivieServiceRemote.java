package ma.fstt.services;

import ma.fstt.entities.Suivie;
import jakarta.ejb.Remote;  // ✅ CHANGER ICI
import java.util.List;

@Remote
public interface SuivieServiceRemote {
    Suivie createSuivie(Suivie suivie);
    Suivie updateSuivie(Suivie suivie);
    void deleteSuivie(Long id);
    Suivie findSuivieById(Long id);
    List<Suivie> findAllSuivies();
    List<Suivie> findSuiviesByEtudiant(Long etudiantId);
    List<Suivie> findSuiviesByModule(Long moduleId);
    Double calculerMoyenneEtudiant(Long etudiantId);
}
