package com.cdac;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cdac.StudentDAO;
import com.cdac.Student;

@Controller
public class StudentController {

    @Autowired
    private StudentDAO studentDAO;

    // Register form ----------------------------
    
    @GetMapping("/register")		// get mapping me vahi lenge jo jsp ki file ka nam  hain
    public String showForm() {
        return "register";
    }


    //Registration --------------------------------------
    
    @PostMapping("/registerStudent")
    public String register(@ModelAttribute Student student) throws SQLException {
        studentDAO.registerStudent(student);
        return "redirect:/viewStudent";
    }

    // view data -------------------------------------
    
    @GetMapping("/viewStudent")
    public String viewStudents(Model model) throws SQLException 
    {
        List<Student> students = studentDAO.viewAllStudents();
        model.addAttribute("students", students);
        return "viewStudent";
    }
    

    // Delete --------------------------------------
    
    @PostMapping("/delete")
    public String deleteStudentData(@RequestParam("id") int id) throws SQLException {
    	
    	studentDAO.deleteStudentData(id);
		return "redirect:/viewStudent";
    	
    }
    
    //Edit form --------------------------------------
    
    @GetMapping("/edit")
    public String editForm(@RequestParam("id") int id, Model model) throws SQLException {
		
    	Student stud = studentDAO.getStudentById(id);
    	model.addAttribute("student", stud);
    	return "editData";
    }
    
    @PostMapping("/update")
    public String updateData(@ModelAttribute Student s) throws SQLException {
    	
    	studentDAO.updateStudentData(s);
    	return "redirect:/viewStudent";
    }
    
    
    
//    DELETE / INSERT / UPDATE ke baad hamesha redirect: use karna chahiye.
}
