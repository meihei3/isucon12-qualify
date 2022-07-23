DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

-- CREATE TABLE IF NOT EXISTS `visit_history_first_created_at` (
--   `id` BIGINT NOT NULL AUTO_INCREMENT,
--   `player_id` VARCHAR(255) NOT NULL,
--   `tenant_id` BIGINT UNSIGNED NOT NULL,
--   `competition_id` VARCHAR(255) NOT NULL,
--   `min_created_at` BIGINT NOT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `for_min_created_at_idx` (`tenant_id`, `competition_id`, `player_id`)
-- ) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;
-- DELETE FROM visit_history_first_created_at WHERE id > 200474;

-- INSERT INTO visit_history_first_created_at (player_id, tenant_id, competition_id, min_created_at)
-- SELECT player_id, tenant_id, competition_id, MIN(created_at) AS min_created_at FROM visit_history GROUP BY player_id, tenant_id, competition_id;

DELETE FROM visit_history_first_created_at WHERE id > 200474;
