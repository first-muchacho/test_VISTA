USE test_vista;

SELECT COUNT('МРТ за 2020 год'), client.gender
FROM action 
	INNER JOIN actiontype ON 
		action.action_type = actiontype.id
	INNER JOIN client INNER JOIN event ON 
		client.id = event.client_id AND action.event_id = event.id
	WHERE 
		actiontype.name = 'МРТ' AND action.beg_date BETWEEN '2020-01-01' and '2020-12-31'
GROUP BY
	client.gender;
