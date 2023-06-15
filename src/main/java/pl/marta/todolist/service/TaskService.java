package pl.marta.todolist.service;

import org.springframework.stereotype.Service;

import pl.marta.todolist.model.Person;
import pl.marta.todolist.model.Task;
import pl.marta.todolist.model.TaskStatus;
import pl.marta.todolist.model.TodoList;
import pl.marta.todolist.repository.TaskRepository;

@Service
public class TaskService {

    private final PersonService personService;
    private final TodoListService todoListService;
    private final TaskRepository taskRepository;

    public TaskService(PersonService personService, TodoListService todoListService, TaskRepository taskRepository) {
        this.personService = personService;
        this.todoListService = todoListService;
        this.taskRepository = taskRepository;
    }

    public Task findTask(int taskId) {
        return taskRepository.findById(taskId)
                .orElse(null);
    }

    public void addTask(String name, int personId, int todoListId) {
        Person person = personService.findPerson(personId);
        TodoList todoList = todoListService.findTodoList(todoListId);
        Task task = new Task();
        task.setName(name);
        task.setPerson(person);
        task.setTodoList(todoList);
        task.setStatus(TaskStatus.TODO);
        taskRepository.save(task);
    }

    public void updateTaskStatus(int taskId, String name, int personId, TaskStatus taskStatus) {
        Task task = taskRepository.findById(taskId)
                .orElse(null);
        Person person = personService.findPerson(personId);
        if (task != null) {
            task.setStatus(taskStatus);
            task.setName(name);
            task.setPerson(person);
            taskRepository.save(task);
        }
    }

    public void deleteTask(int taskId) {
        taskRepository.deleteById(taskId);
    }
}
