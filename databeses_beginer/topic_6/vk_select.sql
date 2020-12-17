SELECT * FROM users LIMIT 1;
SELECT * FROM users WHERE id = 1;
SELECT id, firstname, lastname FROM users WHERE id = 1;


SELECT id, firstname, lastname
FROM users WHERE firstname LIKE '%a%';

SELECT id, firstname, lastname
FROM users WHERE firstname NOT LIKE '%a%';

SELECT id, firstname, lastname
FROM users WHERE firstname LIKE '%a%' AND lastname LIKE '%a%';


SELECT * FROM profiles
WHERE birthday > '2010-01-01' AND birthday <= '2019-12-31';

SELECT * FROM profiles
WHERE birthday BETWEEN '2010-01-01' AND '2019-12-31';

SELECT * FROM profiles WHERE gender IN (1,2);
SELECT * FROM profiles WHERE user_id IN (2,12,35);
SELECT * FROM profiles WHERE user_id NOT IN (2,12,35);

SELECT DISTINCT gender FROM profiles;

SELECT * FROM users ORDER BY firstname;
SELECT * FROM users ORDER BY firstname DESC;
SELECT * FROM users ORDER BY firstname DESC, lastname;

SELECT * FROM users LIMIT 5;
SELECT * FROM users LIMIT 10, 5;
SELECT * FROM users LIMIT 5 OFFSET 10;

SELECT USER(); -- текущий пользователь MySQL
SELECT VERSION(); -- версия MySQL
SELECT UUID();

SELECT
  ROUND(), -- математическое округление, если значение >= .5, то увеличит +1
  CEILING(), -- в большую степень
  FLOOR() -- в меньшую степень

SELECT
  gender,
  IF(gender = 1, 'Мужской', 'Женский')
FROM profiles;

SELECT
  IFNULL(location, '-'),
  IF(location IS NULL, '-', location)
FROM profiles;

SELECT
  CASE gender
    WHEN 1 THEN 'Мужской'
    WHEN 2 THEN 'Женский'
    WHEN 3 THEN 'Неопр'
    ELSE 'Иное'
  END AS gender_rus
FROM profiles;

SELECT
  gender
FROM profiles
GROUP BY gender

SELECT
  gender,
  user_id,
  GROUP_CONCAT(user_id)
FROM profiles
GROUP BY gender

SELECT
  gender,
  user_id,
  ANY_VALUE(user_id)
FROM profiles
GROUP BY gender

SELECT
  gender,
  COUNT(user_id)
FROM profiles
GROUP BY gender

SELECT
  gender,
  COUNT(*)
FROM profiles
GROUP BY gender
WITH ROLLUP

SELECT
  gender,
  COUNT(*) AS cnt
FROM profiles
GROUP BY gender
HAVING cnt > 10


-- Данные пользователя
SELECT
  id,
  firstname,
  lastname,
  (SELECT location FROM profiles WHERE profiles.user_id = users.id) AS location,
  (SELECT `blob` FROM media WHERE media.id = users.photo_id) AS `blob`
FROM users;

-- Фотографии пользователя
SELECT
  *
FROM media
WHERE
  user_id = 21 AND
  media_type_id = (SELECT id FROM media_types WHERE name = 'img');

-- Кол-во фотографий пользователя
SELECT
  COUNT(*)
FROM media
WHERE
  user_id = 21 AND
  media_type_id = (SELECT id FROM media_types WHERE name = 'img');

-- Кол-во медиа всех типов
SELECT
  media_type_id,
  (SELECT name FROM media_types WHERE media_types.id = media.media_type_id) AS media_type_name,
  COUNT(*)
FROM media
GROUP BY media_type_id;

-- Кол-во медиа в каждом месяце (сезонность)
SELECT
  MONTHNAME(created_at) AS created_month,
  COUNT(*)
FROM media
GROUP BY created_month
ORDER BY MONTH(created_at);

-- Кол-во медиа у каждого пользователя
SELECT
  user_id,
  COUNT(*)
FROM media
GROUP BY user_id
ORDER BY COUNT(*) DESC;

-- Пользователи, которым меньше 14 лет
SELECT
  *,
  TIMESTAMPDIFF(YEAR, birthday, NOW())
FROM profiles
WHERE 
  TIMESTAMPDIFF(YEAR, birthday, NOW()) < 14;

-- Друзья пользователя (id = 7)
SELECT
  *
FROM friend_requests
WHERE
  `status` = 1 AND (from_user_id = 7 OR to_user_id = 7);

-- Медиа друзей пользователя (id = 7)
SELECT
  *
FROM media
WHERE
  user_id IN (SELECT to_user_id FROM friend_requests WHERE `status` = 1 AND from_user_id = 7) OR
  user_id IN (SELECT from_user_id FROM friend_requests WHERE `status` = 1 AND to_user_id = 7);

-- Лайки к медиа пользователя
SELECT
  id,
  (SELECT COUNT(*) FROM `like` WHERE `like`.media_id = media.id) AS cnt
FROM media
WHERE
  user_id = 1;

-- Кол-во сообщений пользователя
SELECT
  *
FROM messages
WHERE
  from_user_id = 4 OR to_user_id = 4