

/* PROJECT 2: Filtering data based on exaples of potential asks related to social media. Working with fake Instagram data set as per practise excercise from MySQL Udemy course by Colt Steele. 

	TOOL:MySQL Workbench 8.0 
	VERSION 8.0.30 build 2054668 CE (64 bits)

	DATE: October 2022

######################################################################################################################################## */

/*	 WORKING ON INSTAGRAM DATA SET

-- ASK 1) We want to reward our users who have been around the longest. Find the 5 oldest users.
-- SOLUTION 1:*/

SELECT username, created_at 
FROM users
ORDER BY created_at ASC
LIMIT 5;

/* ASK 2) What day of the week do most users register on? We need to figure out when to schedule an ad campgain.
 SOLUTION 2: */

select 
count(*) as total, 
dayname(created_at) as dayName
from users
GROUP by dayName
order by total DESC
limit 2
;

/* ASK 3) We want to target our inactive users with an email campaign. Find the users who have never posted a photo.
 SOLUTION 3: */

SELECT 
users.username,
photos.id
FROM users
	LEFT JOIN photos
	ON users.id = photos.user_id 
WHERE photos.id IS NULL;

/* ASK 4) We're running a new contest to see who can get the most likes on a single photo. WHO WON?!
 SOLUTION 4: */

SELECT 
users.username,
likes.photo_id,
count(*) as likes
from likes
join photos
on likes.photo_id = photos.id
join users
on users.id = photos.user_id
group by likes.photo_id
order by likes DESC
limit 1;

/* ASK 5) Our Investors want to know... How many times does the average user post?
 SOLUTION 5: */

SELECT
(SELECT count(*) from photos)/
(SELECT count(*) from users);

/* ASK 6) A brand wants to know which hashtags to use in a post. What are the top 5 most commonly used hashtags?
 SOLUTION 6: */

SELECT 
tag_name,
count(*) AS total
from photo_tags
join tags
on photo_tags.tag_id = tags.id
group by tag_id
order by total DESC
limit 5;

/* ASK 7) We have a small problem with bots on our site... Find users who have liked every single photo on the site.
 SOLUTION 7:*/

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos)







