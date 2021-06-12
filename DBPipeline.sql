CREATE TABLE t(registration_dttm datetime, id int, first_name varchar(50), last_name varchar(50), email varchar(50), gender varchar(50), 
ip_address varchar(50),
 cc bigint, country varchar(50), birthdate date, salary float, title varchar(50), comments varchar(50));

 
CREATE PIPELINE `par`
AS LOAD DATA S3 's3://demobucket-11/example.parquet'
BATCH_INTERVAL 2500
ENABLE OUT_OF_ORDER OPTIMIZATION
INTO TABLE `t`
FORMAT Parquet
(
    `t`.`registration_dttm` <- `registration_dttm`,
    `t`.`id` <- `id`,
    `t`.`first_name` <- `first_name`,
    `t`.`last_name` <- `last_name`,
    `t`.`email` <- `email`,
    `t`.`gender` <- `gender`,
    `t`.`ip_address` <- `ip_address`,
    `t`.`cc` <- `cc`,
    `t`.`country` <- `country`,
    `t`.`birthdate` <- `birthdate`,
    `t`.`salary` <- `salary`,
    `t`.`title` <- `title`,
    `t`.`comments` <- `comments`
)
