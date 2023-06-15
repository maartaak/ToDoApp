package pl.marta.todolist.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pl.marta.todolist.model.TodoList;
import pl.marta.todolist.service.TodoListService;

@Controller
@RequestMapping("/todolist")
public class TodoListController {

    private final TodoListService todoListService;

    public TodoListController(TodoListService todoListService) {
        this.todoListService = todoListService;
    }

    @GetMapping("/list")
    public String getAllTodoLists(Model model) {
        List<TodoList> todoLists = todoListService.getAllTodoLists();
        model.addAttribute("todoLists", todoLists);
        return "todolist-list";
    }

    @GetMapping("/creator")
    String getTodoListCreator() {
        return "todolist-creator";
    }

    @PostMapping("/add")
    public String addNewTodoList(@RequestParam String name, Model model) {
        todoListService.addTodoList(name);
        List<TodoList> todoLists = todoListService.getAllTodoLists();
        model.addAttribute("todoLists", todoLists);
        return "todolist-list";
    }

    @GetMapping("/editor")
    public String getTodoListEditor(@RequestParam int todoListId, Model model) {
        TodoList todoList = todoListService.findTodoList(todoListId);
        model.addAttribute("todoList", todoList);
        return "todolist-editor";
    }

    @PostMapping("/delete")
    public String deleteTodoList(@RequestParam int todoListId, Model model) {
        todoListService.deleteTodoList(todoListId);
        List<TodoList> todoLists = todoListService.getAllTodoLists();
        model.addAttribute("todoLists", todoLists);
        return "todolist-list";
    }
}
