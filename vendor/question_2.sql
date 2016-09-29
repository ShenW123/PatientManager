SELECT * FROM patients
WHERE last_name LIKE '%mit%';

SELECT * FROM patients p
WHERE p.id NOT IN 
	(
    SELECT e.patient_id
	FROM encounters e
	WHERE e.discharged_at IS NULL
	);

SELECT * FROM patients
WHERE patients.id IN 
	(
	SELECT encounters.patient_id FROM encounters 
	WHERE NOT (admitted_at < '2014-07-05' OR admitted_at > '2014-08-19')
	);



