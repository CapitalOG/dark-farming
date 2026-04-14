CREATE TABLE IF NOT EXISTS `bcc_farming` (
    `plant_id` INT(40) NOT NULL AUTO_INCREMENT,
    `plant_coords` LONGTEXT NOT NULL,
    `plant_type` VARCHAR(40) NOT NULL,
    `plant_watered` CHAR(6) NOT NULL DEFAULT 'false',
    `time_left` VARCHAR(100) NOT NULL,
    `plant_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `plant_owner` INT(40) NOT NULL,
    PRIMARY KEY (`plant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `desc`)
VALUES
    ('wateringcan', 'Water Jug', 10, 1, 'item_standard', 1, 'A bucket of clean water.'),
    ('wateringcan_empty', 'Empty Watering Jug', 10, 1, 'item_standard', 1, 'An empty water bucket.'),
    ('wateringcan_dirtywater', 'Dirty Water Jug', 10, 1, 'item_standard', 1, 'A bucket filled with dirty water.'),
    ('fertilizer1', 'Fertilizer Grade C', 10, 1, 'item_standard', 1, 'Low grade fertilizer.'),
    ('fertilizer2', 'Fertilizer Grade B', 10, 1, 'item_standard', 1, 'Mid grade fertilizer.'),
    ('fertilizer3', 'Fertilizer Grade A', 10, 1, 'item_standard', 1, 'High grade fertilizer.'),
    ('soil', 'Soil', 10, 1, 'item_standard', 1, 'High grade soil.'),
    ('hoe', 'Garden Hoe', 10, 1, 'item_standard', 1, 'A gardening tool with a thin metal blade.'),
    -- Packaging supplies
    ('plastic_baggie', 'Plastic Baggie', 100, 1, 'item_standard', 0, 'A small plastic baggie used for packaging.'),
    -- Wet buds (harvested directly from weed plants)
    ('wet_buds',        'Wet Buds',        100, 1, 'item_standard', 1, 'Freshly harvested weed buds. Needs to be dried.'),
    ('wet_purple_buds', 'Wet Purple Buds', 100, 1, 'item_standard', 1, 'Freshly harvested purple weed buds. Needs to be dried.'),
    ('wet_kalka_buds',  'Wet Kalka Buds',  100, 1, 'item_standard', 1, 'Freshly harvested kalka weed buds. Needs to be dried.'),
    -- Dried buds (after drying process)
    ('buds',        'Buds',        100, 1, 'item_standard', 1, 'Dried weed buds ready to be packaged.'),
    ('purple_buds', 'Purple Buds', 100, 1, 'item_standard', 1, 'Dried purple weed buds ready to be packaged.'),
    ('kalka_buds',  'Kalka Buds',  100, 1, 'item_standard', 1, 'Dried kalka weed buds ready to be packaged.'),
    -- Packaged bags (single)
    ('weed_bag',        'Weed Bag',        100, 1, 'item_standard', 0, 'A single-serving bag of weed.'),
    ('purple_weed_bag', 'Purple Weed Bag', 100, 1, 'item_standard', 0, 'A single-serving bag of purple weed.'),
    ('kalka_weed_bag',  'Kalka Weed Bag',  100, 1, 'item_standard', 0, 'A single-serving bag of kalka weed.'),
    -- Packaged bags (bulk x10)
    ('weed_bag_bulk',        'Weed Bulk Bag',        100, 1, 'item_standard', 0, 'A bulk bag containing 10 servings of weed.'),
    ('purple_weed_bag_bulk', 'Purple Weed Bulk Bag', 100, 1, 'item_standard', 0, 'A bulk bag containing 10 servings of purple weed.'),
    ('kalka_weed_bag_bulk',  'Kalka Weed Bulk Bag',  100, 1, 'item_standard', 0, 'A bulk bag containing 10 servings of kalka weed.')
ON DUPLICATE KEY UPDATE
    `item` = VALUES(`item`),
    `label` = VALUES(`label`),
    `limit` = VALUES(`limit`),
    `can_remove` = VALUES(`can_remove`),
    `type` = VALUES(`type`),
    `usable` = VALUES(`usable`),
    `desc` = VALUES(`desc`);
