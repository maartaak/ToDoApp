package pl.marta.todolist.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pl.marta.todolist.model.Person;
import pl.marta.todolist.service.PersonService;

@Controller
@RequestMapping("/person")
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping("/list")
    String getAllPersons(Model model) {
        List<Person> persons = personService.getAllPersons();
        model.addAttribute("persons", persons);
        return "person-list";
    }

    @GetMapping("/creator")
    String getPersonCreator() {
        return "person-creator";
    }

    @PostMapping("/add")
    public String addNewPerson(@RequestParam String name, Model model) {
        personService.addPerson(name);
        List<Person> persons = personService.getAllPersons();
        model.addAttribute("persons", persons);
        return "person-list";
    }

    @PostMapping("/delete")
    public String deletePerson(@RequestParam int personId, Model model) {
        personService.deletePerson(personId);
        List<Person> persons = personService.getAllPersons();
        model.addAttribute("persons", persons);
        return "person-list";
    }
}
