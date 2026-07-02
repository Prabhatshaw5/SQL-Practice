/*1.What are the names and teams of all batsmen who played in 2018?*/
SELECT Player,Team
FROM `ipl_analysis.2018_batsmen_new`;

/*2.Which teams are represented by all the batsmen from 2019?*/
SELECT DISTINCT Team
FROM `ipl_analysis.2019_batsmen`;

/*3.What are the total runs scored by all the batsmen in 2018?*/
SELECT SUM(Runs) as Totalruns
FROM `ipl_analysis.2018_batsmen_new`;

/*4.List the Chennai batsmen name and total number of matches played in 2019?*/
SELECT Player, Mat
FROM `ipl_analysis.2019_batsmen`
WHERE Team= "Chennai Super Kings";

/*Q5: Name the bowlers who took 4 wickets haul(s) in 2018.*/
SELECT Player, _4w
FROM `ipl_analysis.2018_bowlers`
WHERE _4w> 0;

/*Q6: List the names of teams and the bowlers from 2019*/
SELECT DISTINCT Team, Player
FROM `ipl_analysis.2019_bowlers_new`;

/*Q7. List the 2018 teams that played that had at least one bowler who took 4 wickets haul.*/
SELECT Distinct Team
FROM `ipl_analysis.2018_bowlers`
WHERE _4w=1;

/*8. List two bowlers who gave the least amount of runs across all teams in 2018. */
SELECT Player,Runs
FROM `ipl_analysis.2018_bowlers`
ORDER BY Runs asc
LIMIT 2;

/*9. Name two bowlers who took most number of wickets in 2018 */
SELECT Player,Wkts
FROM `ipl_analysis.2018_bowlers`
ORDER BY Wkts desc
limit 2;

/*10.*What are the names and teams of all Allrounders in the year 2018?*/
select bowl.Player,bowl.Team
FROM `ipl_analysis.2018_bowlers` as Bowl INNER JOIN `ipl_analysis.2018_batsmen_new` as bats on Bowl.Player = bats.Player;

/*11.Show the list of batsmen who played in 2018 as well in 2019.*/
SELECT newbats.Player, newbats.Team
FROM `ipl_analysis.2019_batsmen` as newbats INNER JOIN `ipl_analysis.2018_batsmen_new` as oldbats on newbats.Player=oldbats.Player;

/*12.How many batsmen were there in each team in 2019? */
SELECT Team, count(Player) as Totalcount
FROM `ipl_analysis.2019_batsmen`
GROUP BY Team;

/*13.Now show the data sorted by the number of batsmen in descending order.*/
SELECT Team, count(Player) as Totalcount
FROM `ipl_analysis.2019_batsmen`
GROUP BY Team
order by Totalcount DESC;

/* 14. How many bowlers were there in each team in 2018 who took at least one 4 wicket haul? 
-- Show the top 2 teams that had most number of such bowers*/
SELECT Team, COUNT(Player) as Totalcount 
FROM `ipl_analysis.2018_bowlers`
WHERE _4w>=1
GROUP BY Team
order by Totalcount DESC
LIMIT 2;

/*15./*What are the names of top 2 teams which consists of most number of bowlers in 2018?*/
SELECT Team, COUNT(Player) as Totalcount
FROM `ipl_analysis.2018_bowlers`
GROUP BY Team
ORDER BY Totalcount DESC
LIMIT 2;

/*16. Which bowlers took the most wickets in the 2018 season?*/
SELECT Player,Team,sum(Wkts) as Totalwkts
FROM `ipl_analysis.2018_bowlers`
GROUP BY Team,Player
ORDER BY Totalwkts DESC
Limit 1;

/*17. Which bowler took the most wickets in the 2018 season?*/
SELECT Player,Team,Wkts
FROM `ipl_analysis.2018_bowlers`
order by Wkts desc
limit 1;

/*18.Which batsmen scored the most runs in the 2018 season while maintaining an average strike rate of at least 130?*/
SELECT Player, sum(Runs) as Mostruns, Team
FROM `ipl_analysis.2018_batsmen_new`
WHERE S_R>= 130
GROUP BY Player, Team
ORDER BY Mostruns DESC;

/*19.Which bowlers took the most wickets in the 2018 season while maintaining an economy rate of less than 7 runs per over?*/
SELECT Player, sum(Wkts) as Mostwkts, Team,E_R
FROM `ipl_analysis.2018_bowlers`
WHERE E_R<7
GROUP BY Player,Team,E_R
ORDER BY Mostwkts DESC;

/*20. Which batsmen scored the most runs across both 2018 and 2019 seasons?*/
SELECT oldbats.Player, sum(oldbats.Runs+newbats.Runs) as Mostruns, oldbats.Team
FROM `ipl_analysis.2018_batsmen_new` as oldbats inner join `ipl_analysis.2019_batsmen` as newbats on oldbats.Player = newbats.Player
group by oldbats.Player, oldbats.Team
order by Mostruns DESC;

/*21. Which batsmen has hit the maximum number of boundaries in 2018, combining 4s and 6s?*/
SELECT Player, Team, SUM(_4s+_6s) as Maxboundaries
FROM `ipl_analysis.2018_batsmen_new`
GROUP BY Player,Team
order by Maxboundaries DESC;

/*22. Name the bowlers who have got 4 wickets haul in 2019.*/
SELECT Player,Team
FROM `ipl_analysis.2019_bowlers_new`
WHERE _4w=1;

/*23. Name 5 such bowlers who bowled the least number of overs in 2018.*/
SELECT Player,Team
FROM `ipl_analysis.2018_bowlers`
ORDER BY Overs ASC
LIMIT 5;

/*24. Which team scored the maximum number of runs in 2019?*/
SELECT Team
FROM `ipl_analysis.2019_batsmen`
ORDER BY Runs DESC;

/*25.Name the Batsmen who has hit maximum half centuries, both the years combined*/
SELECT Player, SUM(_50s) as Total50s, Team
FROM 
(
SELECT Player,_50s, Team
FROM `ipl_analysis.2018_batsmen_new` union all 
SELECT Player, _50s, Team
FROM `ipl_analysis.2019_batsmen` 
)
GROUP BY Player, Team
ORDER BY Total50s DESC
LIMIT 1;


