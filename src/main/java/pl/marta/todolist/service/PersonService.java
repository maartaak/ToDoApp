package pl.marta.todolist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pl.marta.todolist.model.Person;
import pl.marta.todolist.repository.PersonRepository;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public void addPerson(String name) {
        Person person = new Person();
        person.setName(name);
        personRepository.save(person);
    }

    public void deletePerson(int personId) {
        personRepository.deleteById(personId);
    }

    public Person findPerson(int personId) {
        return personRepository.findById(personId)
                .orElse(null);
    }

    public List<Person> getAllPersons() {
        return personRepository.findAll();
    }
}
