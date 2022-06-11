USE test_vista;

SELECT COUNT('МРТ за 2020 год') 
FROM action 
	INNER JOIN actiontype ON 
		action.action_type = actiontype.id 
	WHERE 
		actiontype.name = 'МРТ' AND action.beg_date BETWEEN '2020-01-01' and '2020-12-31';
