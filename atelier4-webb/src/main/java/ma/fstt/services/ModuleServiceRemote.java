package ma.fstt.services;

import ma.fstt.entities.Module;
import jakarta.ejb.Remote;  // ✅ CHANGER ICI
import java.util.List;

@Remote
public interface ModuleServiceRemote {
    Module createModule(Module module);
    Module updateModule(Module module);
    void deleteModule(Long id);
    Module findModuleById(Long id);
    List<Module> findAllModules();
    Module findModuleByCode(String codeModule);
}