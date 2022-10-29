

*/ PROJECT 3: Creating VIEWS. Working with fake Instagram data set as per practise excercise from MySQL Udemy course by Colt Steele. 

	TOOL:MySQL Workbench 8.0 
	VERSION 8.0.30 build 2054668 CE (64 bits)

	DATE: October 2022

######################################################################################################################### */

*/ VIEW 1) IMAGES_WITH_TAGS - view that will show all photos with related tags. First, checking if the view 'IMAGES_WITH_TAGS' already exists. */


DROP VIEW IF EXISTS images_with_tags;


CREATE VIEW images_with_tags AS
SELECT photos.id, image_url, tag_name FROM photos
LEFT JOIN photo_tags ON photo_tags.photo_id = photos.id
LEFT JOIN tags ON tags.id = photo_tags.tag_id ; 

-- Later on this View can be used to filter ex.: 
-- 1) all tags for different photos, without repeating the above code:

SELECT id, image_url, tag_name 
FROM images_with_tags 
WHERE  id = 1 
ORDER BY tag_name ;

SELECT id, image_url, tag_name 
FROM images_with_tags 
WHERE  id = 6 
ORDER BY tag_name ;

-- 2) all photos that was tagged with different tag, without repeating the above code:

SELECT id, image_url, tag_name 
FROM images_with_tags 
WHERE  tag_name = 'fun';

SELECT id, image_url, tag_name 
FROM images_with_tags 
WHERE  tag_name = 'lol';

-- (...)

*/ VIEW 2) LIKES_PER_USER - view that will show all users with photos they published & likes they got. First, checking if the view 'LIKES_PER_USER' already exists. */


DROP VIEW IF EXISTS users_with_likes;

CREATE VIEW users_with_likes AS
SELECT DISTINCT users.id, users.username, likes.photo_id FROM users
LEFT JOIN photos ON users.id = photos.user_id
LEFT JOIN likes ON photos.id = likes.photo_id;

-- Later on this View can be used to get for example how many likes a users got:


SELECT id, username, COUNT(photo_id)
FROM users_with_likes 
group by username
order by id ;





