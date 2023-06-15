package pl.marta.todolist.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pl.marta.todolist.model.Person;
import pl.marta.todolist.model.Task;
import pl.marta.todolist.model.TaskStatus;
import pl.marta.todolist.model.TodoList;
import pl.marta.todolist.service.PersonService;
import pl.marta.todolist.service.TaskService;
import pl.marta.todolist.service.TodoListService;

@Controller
@RequestMapping("/task")
public class TaskController {

    private final TaskService taskService;
    private final PersonService personService;
    private final TodoListService todoListService;

    public TaskController(TaskService taskService, PersonService personService, TodoListService todoListService) {
        this.taskService = taskService;
        this.personService = personService;
        this.todoListService = todoListService;
    }

    @GetMapping("/creator")
    public String getTaskCreator(@RequestParam int todoListId, Model model) {
        List<Person> persons = personService.getAllPersons();
        TodoList todoList = todoListService.findTodoList(todoListId);

        model.addAttribute("persons", persons);
        model.addAttribute("todoList", todoList);
        return "task-creator";
    }

    @PostMapping("/add")
    public String addNewTask(@RequestParam String name, @RequestParam int personId, @RequestParam int todoListId, Model model) {
        taskService.addTask(name, personId, todoListId);
        TodoList todoList = todoListService.findTodoList(todoListId);
        model.addAttribute("todoList", todoList);
        return "todolist-editor";
    }

    @GetMapping("/edit")
    public String addNewTask(@RequestParam int taskId, @RequestParam int todoListId, Model model) {
        Task task = taskService.findTask(taskId);
        List<Person> persons = personService.getAllPersons();
        model.addAttribute("task", task);
        model.addAttribute("todoListId", todoListId);
        model.addAttribute("persons", persons);
        return "task-edit";
    }

    @PostMapping("/delete")
    public String deleteTask(@RequestParam int taskId, @RequestParam int todoListId, Model model) {
        taskService.deleteTask(taskId);
        TodoList todoList = todoListService.findTodoList(todoListId);
        model.addAttribute("todoList", todoList);
        return "todolist-editor";
    }

    @PostMapping("/update")
    public String updateTask(@RequestParam int taskId, @RequestParam String name, @RequestParam int personId, @RequestParam TaskStatus taskStatus,
                             @RequestParam int todoListId, Model model) {
        taskService.updateTaskStatus(taskId, name, personId, taskStatus);
        TodoList todoList = todoListService.findTodoList(todoListId);
        model.addAttribute("todoList", todoList);
        return "todolist-editor";
    }
}
