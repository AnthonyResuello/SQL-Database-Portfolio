

/* R2    1. Populate the database with a pre-defined list of at least SIX skills. */

-- Dummy Data used from File 1 (DDL) --

INSERT INTO skills (skill_id, skill_name, skill_type)
VALUES
(1, 'Java', 'Backend'),
(2, 'JUnit', 'Testing'),
(3, 'JavaScript', 'Frontend'),
(4, 'React', 'Frontend'),
(5, 'SQL', 'Database'),
(6, 'Python', 'Backend'),



/* R2   2. Create TWO pool members, each associated with at least TWO skills from the predefined list.*/

-- Dummy Data used from File 1 (DDL) --

INSERT INTO pool_members (pool_member_id, first_name, last_name, email, phone_number, work_address, home_address)
VALUES
(1, 'Lloyd', 'Hardy', 'lloyd@email.com', '0113-245-4863', 'Wantage Rd,Newbury, UK', '95 Church Rd, Crystal Palace, UK'),
(2, 'Olivia', 'Barton', 'olivia@email.com', '0800-093-5478', '12-18 Cambridge St, Sheffield, UK', 'Rawcliffe Rd, Goole, UK'),
INSERT INTO pool_member_skills (pool_member_id, skill_id, experience_level)
VALUES
(1, 1, 'Expert'),
(1, 3, 'Intermediate'),
(1, 5, 'Expert'),
(2, 4, 'Intermediate'),
(2, 3, 'Expert'),




/* R2   3. Populate the database with TWO client records. */

-- Dummy Data used from File 1 (DDL)--

INSERT INTO clients (client_id, organisation_name, contact_first_name, contact_last_name, email, address, preferred_contact_method) VALUES
(1, 'Apple', 'Simon', 'Cooper', 'simoncooper@apple.com', '96 Station Road, Lancaster, UK', 'email'),
(2, 'Google', 'Sally', 'Hope', 'sallyhope@gmail.com', '456 Broadway, London, UK', 'post'),





/* R2   4. Create ONE project that requires TWO of the pre-defined skills to complete. */

-- Dummy Data used from File 1 (DDL)-- 

INSERT INTO projects (project_id, title, start_date, end_date, budget, description, phase_id, client_id)
VALUES
(1, 'Project 1', '2022-01-01', '2022-06-30', 4720.50, 'Website Design', 1, 1),

-- Project 1 requires two skills --
INSERT INTO project_skills (project_id, skill_id)
VALUES 
(1, 1),
(1, 3),



/* R2   5. Query the database to receive a list of pool members that match the project’s requirements, and assign them to the project. */

SELECT pool_members.*
FROM pool_members
JOIN pool_member_skills ON pool_members.pool_member_id = pool_member_skills.pool_member_id
JOIN skills ON pool_member_skills.skill_id = skills.skill_id
WHERE skills.skill_name IN ('Java', 'React') AND pool_member_skills.experience_level = 'Expert';

INSERT INTO project_pool_members (project_id, pool_member_id) 
VALUES (4, 1);




--- Reports for the project management team ---

/* R2 6.  Demonstrate your design’s strengths by including additional SELECT statements to generate different reports for the project management team. */


/* List of all Pool Members Skills */
SELECT pool_members.first_name, pool_members.last_name, skills.skill_name, skills.skill_type, pool_member_skills.experience_level
FROM pool_members
INNER JOIN pool_member_skills ON pool_members.pool_member_id = pool_member_skills.pool_member_id
INNER JOIN skills ON skills.skill_id = pool_member_skills.skill_id;


/* List of all projects and their phases */
SELECT projects.project_id, projects.title, project_phases.phase_name
FROM projects
INNER JOIN project_phases ON projects.phase_id = project_phases.phase_id;


/* List of all pool members assigned to a specific project */
SELECT pool_members.first_name, pool_members.last_name
FROM pool_members
INNER JOIN project_pool_members ON pool_members.pool_member_id = project_pool_members.pool_member_id
WHERE project_pool_members.project_id = 1;


/* List of all pool members who are experts in SQL */
SELECT pool_members.first_name, pool_members.last_name 
FROM pool_members
INNER JOIN pool_member_skills ON pool_members.pool_member_id = pool_member_skills.pool_member_id
INNER JOIN skills ON pool_member_skills.skill_id = skills.skill_id
WHERE skills.skill_name = 'SQL';


/* List of projects with their corresponding client */
SELECT projects.title, clients.organisation_name
FROM projects
INNER JOIN clients ON projects.client_id = clients.client_id;


/* List of pool members that are assigned to  certain projects */
SELECT projects.title, pool_members.first_name, pool_members.last_name
FROM projects
INNER JOIN project_pool_members ON projects.project_id = project_pool_members.project_id
INNER JOIN pool_members ON project_pool_members.pool_member_id = pool_members.pool_member_id;


/* Updates the budget of a certain project */
UPDATE projects
SET budget = 8560.20
WHERE project_id = 2;


/* Updates the experience level of a pool member for a specific skill */ 
UPDATE pool_member_skills
SET experience_level = 'Expert'
WHERE pool_member_id = 3
AND skill_id = 2;


/* Updates the work adrees of a pool member */
UPDATE pool_members
SET work_address = ' 27 Robert Street, Manchester, UK'
WHERE pool_member_id = 5;