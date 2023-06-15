package pl.marta.todolist.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.marta.todolist.model.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer> {

}
