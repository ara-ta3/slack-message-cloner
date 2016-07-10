CREATE TABLE `messages` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `reply_to` int(11) DEFAULT NULL,
    `type` varchar(32) NOT NULL,
    `channel` varchar(32) NOT NULL,
    `user` varchar(32) NOT NULL,
    `text` TEXT NOT NULL,
    `ts` FLOAT(18,6) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`,`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
