package pl.marta.todolist.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.marta.todolist.model.TodoList;

@Repository
public interface TodoListRepository extends JpaRepository<TodoList, Integer> {

}
