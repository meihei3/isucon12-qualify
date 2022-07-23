DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

CREATE TABLE IF NOT EXISTS `visit_history_first_created_at` (
  `player_id` VARCHAR(255) NOT NULL,
  `tenant_id` BIGINT UNSIGNED NOT NULL,
  `competition_id` VARCHAR(255) NOT NULL,
  `min_created_at` BIGINT NOT NULL,
  PRIMARY KEY  (`tenant_id`, `competition_id`, `player_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;
DELETE FROM visit_history_first_created_at;

INSERT INTO visit_history_first_created_at (player_id, tenant_id, competition_id, min_created_at)
SELECT player_id, tenant_id, competition_id, MIN(created_at) AS min_created_at FROM visit_history GROUP BY player_id, tenant_id, competition_id;

-- DELETE FROM visit_history_first_created_at WHERE id > 200474;

DROP TABLE IF EXISTS competition;
CREATE TABLE IF NOT EXISTS competition (
  id VARCHAR(255) NOT NULL PRIMARY KEY,
  tenant_id BIGINT NOT NULL,
  title TEXT NOT NULL,
  finished_at BIGINT NULL,
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL,
  INDEX `tenant_id_idx` (`tenant_id`),
  INDEX `tenant_id_created_at_idx` (`tenant_id`, `created_at`)
);
