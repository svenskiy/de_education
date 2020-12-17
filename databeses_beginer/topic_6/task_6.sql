-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- Посмотрим пользователя, c которым больше всего общались
SELECT
    to_users_id,
    COUNT(to_users_id)
FROM vk.messages
GROUP BY to_users_id
ORDER BY COUNT(from_users_id);

-- Выберем пользователя с id = 91
-- Просмотрев всю таблицу, я не нашел больше 2-х сообщений от одного пользователя. Я добавил запись через INSERT
-- INSERT INTO messages VALUES(DEFAULT, 70, 91, 'Hello World', NOW());
SELECT 
from_users_id, 
COUNT(from_users_id) as c
FROM vk.messages 
WHERE to_users_id = 91 
GROUP BY from_users_id
ORDER BY c DESC LIMIT 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT
  users_id,
  TIMESTAMPDIFF(YEAR, birthday, NOW()) as old,
  (SELECT COUNT(messages_id)+COUNT(media_id)+COUNT(posts_id) FROM vk.likes WHERE vk.likes.users_id = vk.profiles.users_id) as likes_cnt
FROM vk.profiles
ORDER BY old LIMIT 10;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT
    gender,
    group_concat(users_id) as user_l,
    (SELECT COUNT(messages_id)+COUNT(media_id)+COUNT(posts_id) FROM vk.likes WHERE vk.likes.users_id IN (user_l)) as likes_cnt
FROM vk.profiles
GROUP BY gender;
-- Этот запрос не работает, так-как предполагал использование сформированного массива в IN. Так нельзя.
    
