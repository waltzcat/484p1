CREATE VIEW VIEW_USER_INFORMATION AS
SELECT u.user_id , u.first_name, u.last_name,u.year_of_birth,u.month_of_birth,u.day_of_birth,u.gender,
hc.city_name, hc.state_name, hc.country_name,
cc.city_name, cc.state_name, cc.country_name,
pg.institution, e.program_year,pg.concentration,pg.degree
FROM users u
LEFT JOIN user_hometown_city uhc ON u.user_id = uhc.user_id
INNER JOIN cities hc ON uhc.hometown_city_id = hc.city_id
LEFT JOIN user_current_city ucc ON u.user_id = ucc.user_id
INNER JOIN cities cc ON ucc.current_city_id = cc.city_id
LEFT JOIN education e ON u.user_id = e.user_id
INNER JOIN programs pg ON e.program_id = pg.program_id 


CREATE VIEW VIEW_ARE_FRIENDS AS
SELECT f.user1_id, f.user2_id
FROM friends f


CREATE VIEW VIEW_PHOTO_INFORMATION AS
SELECT alb.album_id, alb.album_owner_id, alb.cover_photo_id, alb.album_name, alb.album_created_time, alb.album_modified_time, alb.album_link, alb.album_visibility,
p.photo_id, p.photo_caption, p.photo_created_time, p.photo_modified_time, p.photo_link
FROM albums alb
INNER JOIN photos p ON alb.album_id = p.album_id


CREATE VIEW VIEW_TAG_INFORMATION AS
SELECT t.tag_photo_id, t.tag_subject_id, t.tag_created_time, t.tag_x, t.tag_y
FROM tags t


CREATE VIEW VIEW_EVENT_INFORMATION AS
SELECT ue.event_id, ue.event_creator_id, ue.event_name, ue.event_tagline, ue.event_description, ue.event_host, ue.event_type, ue.event_subtype, ue.event_location,
c.city_name, c.state_name, c.country_name, ue.event_start_time, ue.event_end_time
FROM user_events ue
LEFT JOIN cities c ON ue.event_city_id = c.city_id