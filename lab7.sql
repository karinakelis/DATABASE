CREATE INDEX idx_countries_name ON countries (name);

CREATE INDEX idx_employees_name_surname ON employees (name, surname);

CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

CREATE INDEX idx_employees_name_substring ON employees (substring(name FROM 1 FOR 4));

CREATE INDEX idx_departments_budget ON departments (budget);
CREATE INDEX idx_employees_salary ON employees (salary);
CREATE INDEX idx_employees_department_id ON employees (department_id);
CREATE INDEX idx_departments_department_id ON departments (department_id);
