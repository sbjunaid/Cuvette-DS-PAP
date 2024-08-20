
select career_aspiration, avg(math_Score) as average_math_score from studentscores 
group by career_aspiration order by average_math_score desc;


select career_aspiration,avg(english_score) as average_english_score from studentscores
group by career_Aspiration having avg(english_score)>75;


select first_name,last_name,math_Score from studentscores 
where math_score > (select avg(math_score) from studentscores);


select first_name,last_name,career_Aspiration,physics_score,
rank() over (partition by career_aspiration order by physics_score desc) as rank
from studentscores;


select concat(first_name,' ',last_name) as full_name,email from studentscores
where email like '%academy%';


select career_aspiration,floor(min(chemistry_score)) as lowest_score,ceil(max(chemistry_score)) 
as highest_score,round(avg(chemistry_score), 2) as average_score from 
studentscores group by career_aspiration;


select career_aspiration, avg(history_score) as average_score from studentscores
group by career_aspiration having count(*) >= 5 and avg(history_score) > 85;


select id,first_name,last_name,biology_score,chemistry_score
from studentscores where biology_score > (select avg(biology_score) from studentscores) and 
chemistry_score > (select avg(chemistry_score) from studentscores);


select id,first_name,last_name, round((absence_days / (select sum(absence_days) from students) * 100), 2) AS percentage
from studentscores order by percentage DESC;


select id,first_name,last_name,
    (case when math_score > 80 then 1 else 0 end +
     case when history_score > 80 then 1 else 0 end +
     case when physics_score > 80 then 1 else 0 end +
     case when cgemistry_score > 80 then 1 else 0 end +
     case when biology_score > 80 then 1 else 0 end +
     case when english_score > 80 then 1 else 0 end) as subjects_above_80
from studentscores having subjects_above_80 >= 3;


