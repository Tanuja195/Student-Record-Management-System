package com.cdac;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cdac.Student;

@Repository
@Transactional
public class StudentDAO {

	@Autowired
    private DataSource dataSource;
	
	// Register student 
	public int registerStudent(Student s) throws SQLException {
		
		int row=0;
		
		Connection con = dataSource.getConnection();
	
		String sql = "Insert Into student(name, email, course) Values (?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);		//imp
		ps.setString(1, s.getName());
		ps.setString(2, s.getEmail());
		ps.setString(3, s.getCourse());
		
		row = ps.executeUpdate();  // ye execute hoga to affected row 1 agyegi
		
		if(ps != null)	
			ps.close();
		
		if(con != null)
			con.close();
		
		return row;
		
		
	}

	public List<Student> viewAllStudents() throws SQLException {
		
		ArrayList<Student> list = new ArrayList<>();
		
		
			Connection con = dataSource.getConnection();
			
			String sql = "Select * From student";
			PreparedStatement ps = con.prepareStatement(sql);
			
		 	ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setEmail(rs.getString("email"));
				s.setCourse(rs.getString("course"));
				
				list.add(s);
			}
			
		
			if(rs != null)
				rs.close();
			if(ps != null)
				ps.close();
			if(con !=null)
				con.close();
				
			return list;
	}
	
	public void deleteStudentData(int id) throws SQLException {
		
		Connection con = dataSource.getConnection();
		
		String q = "Delete From student Where id=?";
		PreparedStatement ps = con.prepareStatement(q);
		
		ps.setInt(1, id);
		ps.executeUpdate();			
		
	}


	public Student getStudentById(int id) throws SQLException {
		
		Connection con = dataSource.getConnection();
		
		String q = "Select * from student Where id=?";
		PreparedStatement ps = con.prepareStatement(q);
		
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		Student s = new Student();
		
		while(rs.next()) {
			
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setCourse(rs.getString("course"));
			
		}
		
		return s;
		
	}

	public void updateStudentData(Student s) throws SQLException {
		
		Connection con = dataSource.getConnection();
		
		String q ="Update student set name=?, email=?, course=? Where id=?";
		
		PreparedStatement ps = con.prepareStatement(q);
		
		ps.setString(1, s.getName());
		ps.setString(2, s.getEmail());
		ps.setString(3, s.getCourse());
		ps.setInt(4, s.getId());
		
		ps.executeUpdate();
	}

}
