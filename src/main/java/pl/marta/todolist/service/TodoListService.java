package pl.marta.todolist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pl.marta.todolist.model.TodoList;
import pl.marta.todolist.repository.TodoListRepository;

@Service
public class TodoListService {

    private final TodoListRepository todoListRepository;

    public TodoListService(TodoListRepository todoListRepository) {
        this.todoListRepository = todoListRepository;
    }

    public void addTodoList(String name) {
        TodoList todoList = new TodoList();
        todoList.setName(name);
        todoListRepository.save(todoList);
    }

    public void deleteTodoList(int todoListId) {
        todoListRepository.deleteById(todoListId);
    }

    public TodoList findTodoList(int todoListId) {
        return todoListRepository.findById(todoListId)
                .orElse(null);
    }

    public List<TodoList> getAllTodoLists() {
        return todoListRepository.findAll();
    }
}
