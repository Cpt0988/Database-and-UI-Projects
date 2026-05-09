CREATE DATABASE Project1;

USE Project1;

CREATE TABLE students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(50) UNIQUE NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE departments(
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE professors(
  professor_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(50) UNIQUE NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses(
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(50) NOT NULL,
  professor_id INT,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  room_number VARCHAR(20) NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

CREATE TABLE enrollments(
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  grade VARCHAR(2),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE schedules(
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

alter table students
add column password varchar(255) not null;

select course_name from courses;