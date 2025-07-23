CREATE TABLE departments(
department_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

INSERT INTO departments (name)
VALUES 
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name,department_id)
VALUES
('田中太郎',1),
('田中二郎',1),
('田中三郎',1),
('田中四郎',2),
('田中五郎',2),
('田中六郎',2),
('田中七郎',2),
('田中八郎',3),
('田中九郎',4),
('田中十郎',5);

INSERT INTO reports (person_id,content)
VALUES
(7,'今日はとても晴れです'),
(8,'今日は曇っていました'),
(9,'今日はとても楽しかった'),
(10,'今日はとてもたくさん寝た'),
(11,'今日はいっぱい食べた'),
(12,'今日はたくさん運動をした'),
(13,'今日は何もしていなかった'),
(14,'今日はすごく眠かった'),
(15,'今日も一日頑張った'),
(16,'今日はとても大変だった');

UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 5;
UPDATE people SET department_id = 5 WHERE person_id = 6;

select name,age from people
WHERE gender = 1
ORDER BY age DESC;

-- テーブル名`people`の中にあるカラム名`department_id`が１の値の`name`,`email`,`age`を昇順で表示する。

select name from people
WHERE (gender = '2' AND age BETWEEN 20 AND 29)
OR (gender = '1' AND age BETWEEN 40 AND 49);

select age from people
WHERE (department_id = 1)
ORDER BY age;

select AVG(age) AS average_age FROM people
WHERE department_id = 2
AND gender = '2';

select p.name,p.department_id,r.content
FROM people p JOIN reports r ON p.person_id = r.person_id;

select p.name
FROM people p LEFT OUTER JOIN reports r USING (person_id)
WHERE content IS NULL;

