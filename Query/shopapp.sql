/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : shopapp

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 23/06/2024 21:43:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (3, 'Cây 12');
INSERT INTO `categories` VALUES (4, 'Cây Bonsai');
INSERT INTO `categories` VALUES (2, 'Cây cảnh mini');
INSERT INTO `categories` VALUES (5, 'Cây nội thất');
INSERT INTO `categories` VALUES (6, 'Phụ kiện 12');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_conditions
-- ----------------------------
DROP TABLE IF EXISTS `coupon_conditions`;
CREATE TABLE `coupon_conditions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `operator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `discount_amount` decimal(5, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupon_id`(`coupon_id` ASC) USING BTREE,
  CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_conditions
-- ----------------------------
INSERT INTO `coupon_conditions` VALUES (1, 1, 'minimum_amount', '>', '100', 10.00);
INSERT INTO `coupon_conditions` VALUES (2, 1, 'applicable_date', 'BETWEEN', '2023-12-25', 5.00);
INSERT INTO `coupon_conditions` VALUES (3, 2, 'minimum_amount', '>', '200', 20.00);

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'HEAVEN', 1);
INSERT INTO `coupons` VALUES (2, 'DISCOUNT20', 1);

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `checksum` int NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '0', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2024-06-04 03:46:58', 0, 1);
INSERT INTO `flyway_schema_history` VALUES (2, '1', 'alter some tables', 'SQL', 'V1__alter_some_tables.sql', 670188877, 'root', '2024-06-04 03:46:59', 1344, 1);
INSERT INTO `flyway_schema_history` VALUES (3, '2', 'change tokens', 'SQL', 'V2__change_tokens.sql', 1468721430, 'root', '2024-06-04 22:35:45', 41, 1);
INSERT INTO `flyway_schema_history` VALUES (4, '3', 'refresh tokens', 'SQL', 'V3__refresh_tokens.sql', 1847335528, 'root', '2024-06-05 21:51:47', 66, 1);
INSERT INTO `flyway_schema_history` VALUES (5, '4', 'create comments table', 'SQL', 'V4__create_comments_table.sql', 1503638598, 'root', '2024-06-11 00:15:56', 59, 1);
INSERT INTO `flyway_schema_history` VALUES (6, '5', 'create coupon table', 'SQL', 'V5__create_coupon_table.sql', -503047314, 'root', '2024-06-11 23:47:03', 169, 1);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `number_of_products` int NULL DEFAULT 1,
  `total_money` decimal(10, 2) NULL DEFAULT 0.00,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `coupon_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `fk_order_details_coupon`(`coupon_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_chk_1` CHECK (`price` >= 0),
  CONSTRAINT `order_details_chk_2` CHECK (`number_of_products` > 0),
  CONSTRAINT `order_details_chk_3` CHECK (`total_money` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 1, 145.00, 323, 123.45, 'blue', NULL);
INSERT INTO `order_details` VALUES (3, 3, 3, 250184.00, 8, 2001472.00, NULL, NULL);
INSERT INTO `order_details` VALUES (4, 3, 2, 175927.00, 1, 175927.00, NULL, NULL);
INSERT INTO `order_details` VALUES (5, 3, 6, 70413.10, 4, 281652.41, NULL, NULL);
INSERT INTO `order_details` VALUES (6, 4, 10, 261867.00, 3, 785601.00, NULL, NULL);
INSERT INTO `order_details` VALUES (7, 4, 8, 256369.00, 2, 512738.00, NULL, NULL);
INSERT INTO `order_details` VALUES (8, 4, 12, 175378.00, 4, 701512.00, NULL, NULL);
INSERT INTO `order_details` VALUES (9, 5, 10, 261867.00, 3, 785601.00, NULL, NULL);
INSERT INTO `order_details` VALUES (10, 5, 8, 256369.00, 2, 512738.00, NULL, NULL);
INSERT INTO `order_details` VALUES (11, 5, 12, 175378.00, 4, 701512.00, NULL, NULL);
INSERT INTO `order_details` VALUES (12, 6, 12, 175378.00, 7, 1227646.00, NULL, NULL);
INSERT INTO `order_details` VALUES (13, 6, 13, 195956.00, 2, 391912.00, NULL, NULL);
INSERT INTO `order_details` VALUES (14, 7, 3, 250184.10, 8, NULL, NULL, NULL);
INSERT INTO `order_details` VALUES (15, 7, 2, 175927.30, 1, NULL, NULL, NULL);
INSERT INTO `order_details` VALUES (16, 7, 6, 70413.13, 4, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `order_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float NULL DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipping_date` date NULL DEFAULT NULL,
  `tracking_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `coupon_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_orders_coupon`(`coupon_id` ASC) USING BTREE,
  CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_chk_1` CHECK (`total_money` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 'Doan Tam 2', 'tam@gmail.com', '12345', '828 SVH', 'Giao tiet kiem', '2024-04-11 19:48:46', 'pending', 1999, '', NULL, NULL, NULL, '', 0, NULL);
INSERT INTO `orders` VALUES (2, 1, 'Doan Tam', 'tam@gmail.com', '12345', '828 SVH', 'Giao tiet kiem', '2024-04-14 14:44:27', 'pending', 1999, 'ghtk', NULL, '2024-04-14', NULL, 'cod', 1, NULL);
INSERT INTO `orders` VALUES (3, 1, 'Doan Tam', 'tam@gmail.com', '12345', '828 SVH', 'Giao tiet kiem', '2024-04-19 11:11:51', 'pending', 1999, '', NULL, NULL, NULL, '', 1, NULL);
INSERT INTO `orders` VALUES (4, 5, 'doan tam', 'doantam1502@gmail.com', '0123123123', '828 su van hanh', 'dễ bể', '2024-04-21 02:38:00', 'pending', 0, '', NULL, NULL, NULL, '', 1, NULL);
INSERT INTO `orders` VALUES (5, 5, 'doan tam', 'doantam1502@gmail.com', '0123123123', '828 su van hanh', 'dễ bể', '2024-04-21 02:38:05', 'pending', 0, '', NULL, NULL, NULL, '', 1, NULL);
INSERT INTO `orders` VALUES (6, 2, 'hoàng xx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vữ', '2024-05-03 17:52:02', 'pending', 1619560, 'express', NULL, '2024-05-04', NULL, 'cod', 1, NULL);
INSERT INTO `orders` VALUES (7, 1, 'Doan Tam', 'tam@gmail.com', '12345', '828 SVH', 'Giao tiet kiem', '2024-06-07 00:00:00', 'pending', 1999, 'ghtk', NULL, '2024-06-07', NULL, 'cod', 1, NULL);

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `image_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_images_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (7, 1, 'dbf814dc-1b12-4604-9d08-5c9270c3b87f_001.jpg');
INSERT INTO `product_images` VALUES (8, 1, 'ff6f4d97-4a8b-4fe5-86f2-e8dce3648a61_002.jpg');
INSERT INTO `product_images` VALUES (9, 1, '0b9f2207-b4a1-475b-a369-f16d59422323_003.jpg');
INSERT INTO `product_images` VALUES (10, 1, '8b4d679e-7855-439d-ba51-798874c0191f_004.jpg');
INSERT INTO `product_images` VALUES (11, 2, 'ae407da7-45bd-45a7-89d9-d3b684176835_005.jpg');
INSERT INTO `product_images` VALUES (12, 2, '9aa696de-76f8-4137-bf90-5af1841fd648_006.jpg');
INSERT INTO `product_images` VALUES (13, 2, '2d15f15b-cf61-420e-b9bc-691dd093ca54_007.jpg');
INSERT INTO `product_images` VALUES (14, 2, 'ef422567-e5a2-4128-913f-d61a438f4e58_008.jpg');
INSERT INTO `product_images` VALUES (15, 3, '1cf01127-3f36-450c-aa7f-57b9b3741008_009.jpg');
INSERT INTO `product_images` VALUES (16, 3, 'eb55e94a-ab1f-4c36-894e-af62826df668_010.jpg');
INSERT INTO `product_images` VALUES (17, 3, '98494cfc-b4d3-428e-aa3f-239ddf5eb635_011.jpg');
INSERT INTO `product_images` VALUES (18, 3, 'd5a43559-acee-4798-a5a1-e90c48ff0dca_012.jpg');
INSERT INTO `product_images` VALUES (19, 4, '3aecc9bd-108d-45fb-987a-a9440320597a_013.jpg');
INSERT INTO `product_images` VALUES (20, 4, '997be904-fd6c-405c-aff9-d2a00c51e46d_014.jpg');
INSERT INTO `product_images` VALUES (21, 4, '242ce181-bc55-4ef0-994b-c54bb5922e7f_015.jpg');
INSERT INTO `product_images` VALUES (22, 4, '902f6784-996b-463d-99c3-3f5eb537e02a_016.jpg');
INSERT INTO `product_images` VALUES (23, 4, 'e482b891-43ab-466a-8c90-a799c5bd7b60_016.jpg');
INSERT INTO `product_images` VALUES (24, 5, 'a6b1bc65-cb50-4149-bb4e-39465de1193a_016.jpg');
INSERT INTO `product_images` VALUES (25, 5, '46aecaa4-2ad0-47ed-92ce-dea98b12d300_017.jpg');
INSERT INTO `product_images` VALUES (26, 5, '67220cb2-b507-4ac0-a6c1-c8e239a5aab5_019.jpg');
INSERT INTO `product_images` VALUES (27, 5, '0d4904f2-68e9-49ba-af20-1cfcc3199509_020.jpg');
INSERT INTO `product_images` VALUES (28, 6, 'fcaa3c8a-3134-431c-985b-149b00ab822b_021.jpg');
INSERT INTO `product_images` VALUES (29, 6, '3067fca0-2b3b-40be-98f2-5e33447d99a0_022.jpg');
INSERT INTO `product_images` VALUES (30, 6, '1d022fbf-9df7-41e1-b5fa-9e0d1b80baca_023.jpg');
INSERT INTO `product_images` VALUES (31, 6, 'bfc58af2-d170-4b43-a7dc-a8cad9be1227_024.jpg');
INSERT INTO `product_images` VALUES (32, 7, '6695882b-ad12-401c-9f8a-b54157f7f3ac_025.jpg');
INSERT INTO `product_images` VALUES (33, 7, 'e9d801bc-ed58-4c1e-9d98-597bfdcabefe_026.jpg');
INSERT INTO `product_images` VALUES (34, 7, '728d298f-1795-4d05-a0fc-dd026f16b46e_027.jpg');
INSERT INTO `product_images` VALUES (35, 7, '6f0d9f98-e907-4c25-8363-25f3811ce391_028.jpg');
INSERT INTO `product_images` VALUES (36, 8, '6889e12b-4824-4bbf-bb58-918a4abc0269_030.jpg');
INSERT INTO `product_images` VALUES (37, 8, '1844c347-39f5-4283-8834-c81ea562da5a_031.jpg');
INSERT INTO `product_images` VALUES (38, 8, '908ca89b-69ac-4c93-8b32-8ccdf5996f06_032.jpg');
INSERT INTO `product_images` VALUES (39, 8, 'f8cbb633-bd21-49dc-9e50-b5ae9ce8cdb9_034.jpg');
INSERT INTO `product_images` VALUES (40, 9, 'ac34c345-d752-40d3-bea9-f4d78767a453_034.jpg');
INSERT INTO `product_images` VALUES (41, 9, '1af1247e-cb7f-4940-a617-55ff0a18f3e3_036.jpg');
INSERT INTO `product_images` VALUES (42, 9, 'e2cb6c68-57db-471b-8e6a-fbcd24a5f3e5_037.jpg');
INSERT INTO `product_images` VALUES (43, 9, '0964393c-6f54-4092-8e84-4dfe6240675e_038.jpg');
INSERT INTO `product_images` VALUES (44, 9, 'dfacfe84-67be-49f0-b0a3-987048a36f2f_039.jpg');
INSERT INTO `product_images` VALUES (45, 10, '9c7f5d54-d3e4-4472-b768-2e3ba869a404_039.jpg');
INSERT INTO `product_images` VALUES (46, 10, 'ce9cf7bd-c985-40c9-b5e2-12f53aa541bb_040.jpg');
INSERT INTO `product_images` VALUES (47, 10, '7a8fafff-2492-419c-95fa-bc79c38772aa_041.jpg');
INSERT INTO `product_images` VALUES (48, 10, '85f8641a-020a-4e2e-8eed-c805b85ed89f_042.jpg');
INSERT INTO `product_images` VALUES (49, 11, 'fc50862b-6ecd-4329-80c1-5af71d8ee648_043.jpg');
INSERT INTO `product_images` VALUES (50, 11, '4b1c2bc2-c534-45a4-a7f6-7080d96293b7_044.jpg');
INSERT INTO `product_images` VALUES (51, 11, 'e00880e7-f160-4098-bade-69f33c7b4569_045.jpg');
INSERT INTO `product_images` VALUES (52, 11, '2fd810bf-7319-42ac-972e-645582e3f62b_046.jpg');
INSERT INTO `product_images` VALUES (53, 12, '5b6e0a33-9cf7-4fad-b7ef-55ff0dd1d08c_046.jpg');
INSERT INTO `product_images` VALUES (54, 12, 'b26d0ade-4d33-43df-8efd-b5e32f8959bc_047.jpg');
INSERT INTO `product_images` VALUES (55, 12, 'b93fada8-41a2-4705-bb17-340f6b9aaa17_048.jpg');
INSERT INTO `product_images` VALUES (56, 12, '6ad5f228-6bca-40db-8073-70409bdd5782_049.jpg');
INSERT INTO `product_images` VALUES (57, 13, '81706715-4664-4ab1-9a37-656143588c8a_053.jpg');
INSERT INTO `product_images` VALUES (58, 13, 'e5b6fb3a-933b-4798-b95f-39b4f3ef8985_054.jpg');
INSERT INTO `product_images` VALUES (59, 13, '31e1b0ca-755a-4504-9f64-6dccdea9c74a_055.jpg');
INSERT INTO `product_images` VALUES (60, 13, '00c7c7e3-9a5e-4ce6-97f4-285f2822e62b_056.jpg');
INSERT INTO `product_images` VALUES (61, 14, '5fb76332-265b-4fb2-a471-d96315875813_056.jpg');
INSERT INTO `product_images` VALUES (62, 14, '37411544-951a-4988-9526-468420f50d90_057.jpg');
INSERT INTO `product_images` VALUES (63, 14, '5f393bb8-3d31-4a0f-ad56-0f070d1e3c23_058.jpg');
INSERT INTO `product_images` VALUES (64, 14, '50d850db-0f85-4428-8e40-4a77858a5291_059.jpg');
INSERT INTO `product_images` VALUES (65, 15, '0c53b8c8-4d60-4142-acb8-a403c9032dac_060.jpg');
INSERT INTO `product_images` VALUES (66, 15, '58b2e8bf-1530-4199-83f6-90ff6fb442a8_061.jpg');
INSERT INTO `product_images` VALUES (67, 15, '198364a4-f952-48e7-af16-0001d007cf52_062.jpg');
INSERT INTO `product_images` VALUES (68, 15, '1d468353-04db-488b-a245-9bd2fcea1eac_063.jpg');
INSERT INTO `product_images` VALUES (69, 16, '2836356a-e9dd-4325-a5d8-f2212e1f0e02_064.jpg');
INSERT INTO `product_images` VALUES (70, 16, '121e05e2-5486-4843-bf13-510e4c5ebc0d_065.jpg');
INSERT INTO `product_images` VALUES (71, 16, '9402194b-f050-4a86-89fb-69bf1f659423_066.jpg');
INSERT INTO `product_images` VALUES (72, 16, '4d675868-37a5-4b20-9a84-c95d5947cd85_067.jpg');
INSERT INTO `product_images` VALUES (73, 17, '3be191e0-8a24-4c79-afa8-1e239562e27b_068.jpg');
INSERT INTO `product_images` VALUES (74, 17, '9117ca61-6284-41cd-85f8-0aea4f31d77c_069.jpg');
INSERT INTO `product_images` VALUES (75, 17, '68d9f9a3-1e8a-4286-aacd-e0b5b40dd0f2_070.jpg');
INSERT INTO `product_images` VALUES (76, 17, '26ba7336-1577-42cd-9343-f0d9ddb35b08_080.jpg');
INSERT INTO `product_images` VALUES (77, 17, 'f023c150-13d8-4e78-a091-a71d989fa772_070.jpg');
INSERT INTO `product_images` VALUES (78, 18, '0aaf41f5-73f2-43a3-b3a5-1bf444ca61bc_070.jpg');
INSERT INTO `product_images` VALUES (79, 18, '3fd63ec1-f803-494c-b674-d6dc0cd1d134_080.jpg');
INSERT INTO `product_images` VALUES (80, 18, '4e3c66b3-2a10-4a47-bea4-5160e20e6231_081.jpg');
INSERT INTO `product_images` VALUES (81, 18, '4bd60bc2-86ee-4e76-8ed6-2264df35ee60_082.jpg');
INSERT INTO `product_images` VALUES (82, 19, '99b3451a-6963-4f91-a3f9-c3a2918a7301_083.jpg');
INSERT INTO `product_images` VALUES (83, 19, '7b92cf54-f80e-4619-a3a8-3c6c18dd1317_084.jpg');
INSERT INTO `product_images` VALUES (84, 19, '1b8c7021-ec3f-4e5d-820e-255b0ffe167a_085.jpg');
INSERT INTO `product_images` VALUES (85, 19, '6090f185-776a-4542-bd3a-eb8929ff1d84_086.jpg');
INSERT INTO `product_images` VALUES (86, 20, 'f8d4db92-06d3-4e24-87b1-5224bca6e051_087.jpg');
INSERT INTO `product_images` VALUES (87, 20, 'c883abf1-f044-4e08-9fde-1b34bb665397_088.jpg');
INSERT INTO `product_images` VALUES (88, 20, 'fde417ab-106b-4f07-9e47-7aa73926a141_089.jpg');
INSERT INTO `product_images` VALUES (89, 20, '8449e24b-f832-49bf-8a5a-c39fafef0229_090.jpg');
INSERT INTO `product_images` VALUES (90, 21, 'ecbc3bab-b8a8-44a2-900a-3bf4b8599a2f_090.jpg');
INSERT INTO `product_images` VALUES (91, 21, '425cddbf-7497-4ebe-bd02-47bea1860607_091.jpg');
INSERT INTO `product_images` VALUES (92, 21, 'cdf32cf0-d882-44f5-9f01-6c92a6399016_092.jpg');
INSERT INTO `product_images` VALUES (93, 21, '05bcbd38-4003-437e-b995-240d3090e042_093.jpg');
INSERT INTO `product_images` VALUES (94, 22, '4f309e2f-f500-49d2-be4e-004358c9d2ef_093.jpg');
INSERT INTO `product_images` VALUES (95, 22, '57b2e0f6-8acb-43f3-98a3-9cba3d5117a9_094.jpg');
INSERT INTO `product_images` VALUES (96, 22, 'de528a5a-c67d-4403-98dd-c94a7f685f2f_095.jpg');
INSERT INTO `product_images` VALUES (97, 22, 'bfede541-cca8-4da5-8c7b-4c469e51dad9_096.jpg');
INSERT INTO `product_images` VALUES (98, 23, '237d4fc2-094f-43b2-9c56-bab4ebefc5dc_097.jpg');
INSERT INTO `product_images` VALUES (99, 23, '639ae8aa-6022-4712-bead-d8c4f2feff30_098.jpg');
INSERT INTO `product_images` VALUES (100, 23, '4b066e14-6060-4885-b900-03253b21e565_099.jpg');
INSERT INTO `product_images` VALUES (101, 23, '3f97e982-69a5-40de-896d-20465cd60ed2_100.jpg');
INSERT INTO `product_images` VALUES (102, 23, 'b4744c03-6410-49dc-bbed-c09e75855367_101.jpg');
INSERT INTO `product_images` VALUES (103, 24, '7705904f-3e17-4a81-aeb0-39f75e2d5634_102.jpg');
INSERT INTO `product_images` VALUES (104, 24, '8ac26e9a-5d84-4cdd-99d2-cd0185882a23_103.jpg');
INSERT INTO `product_images` VALUES (105, 24, '3c4231b6-7554-4304-b632-000489e0c304_104.jpg');
INSERT INTO `product_images` VALUES (106, 24, 'b499a1cb-6420-4d42-af6f-2ebd19920a41_105.jpg');
INSERT INTO `product_images` VALUES (107, 25, '7c01fef9-72ac-4b3c-8d2c-02122700245d_104.jpg');
INSERT INTO `product_images` VALUES (108, 25, '466f9922-27b6-40bf-b347-84aa58df23ff_105.jpg');
INSERT INTO `product_images` VALUES (109, 25, 'bf0be4ce-cee2-4c6f-b2b7-75c8f72f0393_106.jpg');
INSERT INTO `product_images` VALUES (110, 25, '8d9385aa-a5c1-4d0e-a0d6-e9993ae07860_108.jpg');
INSERT INTO `product_images` VALUES (111, 26, '608f035c-9f78-4174-ab6d-bb9e81c17f90_110.jpg');
INSERT INTO `product_images` VALUES (112, 26, '20036045-6a0d-4c2a-abfd-88b233c96e03_111.jpg');
INSERT INTO `product_images` VALUES (113, 26, '789b295a-473a-40d5-bb6d-35506de80b08_112.jpg');
INSERT INTO `product_images` VALUES (114, 26, 'e9b00650-8544-4f48-9b63-94aac728adb3_113.jpg');
INSERT INTO `product_images` VALUES (115, 26, 'eccbac20-05f1-47f2-9005-f5c996470054_114.jpg');
INSERT INTO `product_images` VALUES (116, 27, 'fd8a0efd-f64b-46d7-9a53-2c2c25507b05_115.jpg');
INSERT INTO `product_images` VALUES (117, 27, '579fdf4c-f116-404c-8ecb-6b70b1ec4a56_116.jpg');
INSERT INTO `product_images` VALUES (118, 27, '2597bac3-96bb-4de2-84e6-98ebea74aae0_117.jpg');
INSERT INTO `product_images` VALUES (119, 28, 'f7036b9e-4f83-4205-ab59-fc98965dc4e6_118.jpg');
INSERT INTO `product_images` VALUES (120, 28, '9f8b624b-328e-45b6-ae92-f8437d8fefb7_119.jpg');
INSERT INTO `product_images` VALUES (121, 29, 'ffc89e3c-ae95-4f02-a2d3-38a1eb18b000_120.jpg');
INSERT INTO `product_images` VALUES (122, 29, 'c37518a8-70e3-4693-88ec-87f9e36077fe_121.jpg');
INSERT INTO `product_images` VALUES (123, 29, 'b7f7f92f-f3e2-44d0-aff7-180e90c6d6ba_122.jpg');
INSERT INTO `product_images` VALUES (124, 29, '4f842c39-f5b1-48df-9015-874dedb3a3c3_123.jpg');
INSERT INTO `product_images` VALUES (125, 30, '15db1a82-19a6-4d94-beb3-65676b07ddd5_125.jpg');
INSERT INTO `product_images` VALUES (126, 30, '3dac559e-d067-4d93-8087-3e81bb0a0365_126.jpg');
INSERT INTO `product_images` VALUES (127, 30, 'bf250b19-db89-4e22-990a-59f1955c91e5_127.jpg');
INSERT INTO `product_images` VALUES (128, 31, '7bd109ed-5926-4779-b7b7-a2012b1ad2ba_121.jpg');
INSERT INTO `product_images` VALUES (129, 31, 'cf95f214-7513-4433-bf3e-3876633abc4d_124.jpg');
INSERT INTO `product_images` VALUES (130, 31, '6fc4f312-0522-424a-9bf6-f370e703bef9_128.jpg');
INSERT INTO `product_images` VALUES (131, 32, '5da10433-9150-4424-9c0f-6f6857d87551_125.jpg');
INSERT INTO `product_images` VALUES (132, 32, 'e4dd1a0b-f2bc-4f0e-8c35-ed89a1296086_127.jpg');
INSERT INTO `product_images` VALUES (133, 32, 'a616767f-e35d-46d6-bea4-9cc225319442_129.jpg');
INSERT INTO `product_images` VALUES (134, 33, 'b87dbfb9-9aaf-4ade-8976-1f6dede813b0_129.jpg');
INSERT INTO `product_images` VALUES (135, 33, '4559d09b-c224-4700-86fe-fdcb1b17b68a_131.jpg');
INSERT INTO `product_images` VALUES (136, 33, '3f205ea4-cd92-4b77-ba82-4f2e7d13ddba_132.jpg');
INSERT INTO `product_images` VALUES (137, 33, '1a5c466f-fecb-4be9-910e-2bf15e6b2482_133.jpg');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_chk_1` CHECK (`price` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 60638 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Iphone 11 pro max', 1999.00, '0b9f2207-b4a1-475b-a369-f16d59422323_003.jpg', 'ngon', '2024-04-09 16:51:06', '2024-04-09 16:51:06', 2);
INSERT INTO `products` VALUES (2, 'Small Marble Clock', 175927.30, '2d15f15b-cf61-420e-b9bc-691dd093ca54_007.jpg', 'Officiis velit sit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (3, 'Incredible Aluminum Lamp', 250184.09, '1cf01127-3f36-450c-aa7f-57b9b3741008_009.jpg', 'Atque facere eos excepturi cum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (4, 'Heavy Duty Cotton Watch', 157608.91, '242ce181-bc55-4ef0-994b-c54bb5922e7f_015.jpg', 'Nobis distinctio quisquam ut id saepe sit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (5, 'Enormous Granite Gloves', 8826.74, '0d4904f2-68e9-49ba-af20-1cfcc3199509_020.jpg', 'Velit possimus velit incidunt rerum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (6, 'Synergistic Cotton Computer', 70413.13, '1d022fbf-9df7-41e1-b5fa-9e0d1b80baca_023.jpg', 'Facere ullam vel dignissimos.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (7, 'Fantastic Silk Pants', 96220.75, '6695882b-ad12-401c-9f8a-b54157f7f3ac_025.jpg', 'Neque beatae eveniet ea.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (8, 'Ergonomic Cotton Computer', 256369.25, '1844c347-39f5-4283-8834-c81ea562da5a_031.jpg', 'Aspernatur ab explicabo sequi eum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (9, 'Gorgeous Concrete Hat', 140468.50, '0964393c-6f54-4092-8e84-4dfe6240675e_038.jpg', 'Totam minus minima aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (10, 'Awesome Steel Gloves', 261866.67, '7a8fafff-2492-419c-95fa-bc79c38772aa_041.jpg', 'Quis omnis nihil.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (11, 'Gorgeous Plastic Lamp', 16592.60, '2fd810bf-7319-42ac-972e-645582e3f62b_046.jpg', 'Ab rerum nesciunt est eum animi.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (12, 'Enormous Copper Shoes', 175378.39, '5b6e0a33-9cf7-4fad-b7ef-55ff0dd1d08c_046.jpg', 'Autem et perferendis laborum facilis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (13, 'Enormous Iron Bottle', 195955.56, '00c7c7e3-9a5e-4ce6-97f4-285f2822e62b_056.jpg', 'Ut nemo autem magni nostrum qui.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (14, 'Intelligent Linen Car', 147091.77, '37411544-951a-4988-9526-468420f50d90_057.jpg', 'Dolores est tenetur et saepe modi velit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (15, 'Enormous Bronze Table', 53566.59, '0c53b8c8-4d60-4142-acb8-a403c9032dac_060.jpg', 'Autem quo alias perferendis sint enim.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (16, 'Gorgeous Paper Bottle', 216166.75, '121e05e2-5486-4843-bf13-510e4c5ebc0d_065.jpg', 'Molestiae exercitationem rerum deserunt qui saepe.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (17, 'Rustic Rubber Chair', 209696.17, '26ba7336-1577-42cd-9343-f0d9ddb35b08_080.jpg', 'Omnis eos laboriosam et libero voluptates.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (18, 'Enormous Bronze Clock', 51338.50, '0aaf41f5-73f2-43a3-b3a5-1bf444ca61bc_070.jpg', 'Consequatur vitae nihil tempora praesentium eos.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (19, 'Intelligent Aluminum Chair', 267463.16, '1b8c7021-ec3f-4e5d-820e-255b0ffe167a_085.jpg', 'Eum eveniet autem dignissimos rem doloremque.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (20, 'Intelligent Marble Clock', 36318.06, '8449e24b-f832-49bf-8a5a-c39fafef0229_090.jpg', 'Perspiciatis est sit voluptas quo ut perferendis nobis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (21, 'Practical Copper Plate', 12528.11, '05bcbd38-4003-437e-b995-240d3090e042_093.jpg', 'Mollitia ipsa tempora voluptas totam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (22, 'Aerodynamic Wool Watch', 192190.28, '4f309e2f-f500-49d2-be4e-004358c9d2ef_093.jpg', 'Ut sed dolorem ullam ipsa provident iure illo.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (23, 'Sleek Wool Gloves', 42045.94, '237d4fc2-094f-43b2-9c56-bab4ebefc5dc_097.jpg', 'Minus dolor sit aspernatur.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (24, 'Ergonomic Wooden Knife', 45839.41, '3c4231b6-7554-4304-b632-000489e0c304_104.jpg', 'Non perspiciatis cumque commodi rerum quia aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (25, 'Ergonomic Rubber Clock', 196106.20, '466f9922-27b6-40bf-b347-84aa58df23ff_105.jpg', 'Odit magni vitae quia natus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (26, 'Aerodynamic Granite Lamp', 54839.41, '20036045-6a0d-4c2a-abfd-88b233c96e03_111.jpg', 'Doloremque natus cumque cupiditate aut doloribus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (27, 'Incredible Iron Coat', 101791.30, '2597bac3-96bb-4de2-84e6-98ebea74aae0_117.jpg', 'Consequatur non voluptates non.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (28, 'Awesome Plastic Keyboard', 140880.34, '9f8b624b-328e-45b6-ae92-f8437d8fefb7_119.jpg', 'Qui eligendi minus ipsa dolores.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (29, 'Practical Bronze Shirt', 154583.56, '4f842c39-f5b1-48df-9015-874dedb3a3c3_123.jpg', 'Necessitatibus occaecati nobis voluptatibus totam beatae deleniti ipsam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (30, 'Gorgeous Silk Plate', 78318.55, '15db1a82-19a6-4d94-beb3-65676b07ddd5_125.jpg', 'Enim sit sunt ut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (31, 'Small Marble Hat', 96428.64, '6fc4f312-0522-424a-9bf6-f370e703bef9_128.jpg', 'Earum ut blanditiis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (32, 'Gorgeous Leather Pants', 198627.09, '5da10433-9150-4424-9c0f-6f6857d87551_125.jpg', 'Quam commodi fugit ut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (33, 'Mediocre Concrete Computer', 24230.47, '1a5c466f-fecb-4be9-910e-2bf15e6b2482_133.jpg', 'Sequi voluptatem occaecati.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (34, 'Mediocre Wool Bottle', 230514.67, NULL, 'Ex qui unde dignissimos odio.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (35, 'Lightweight Steel Table', 118812.34, NULL, 'Aut id voluptas saepe eum explicabo animi rerum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (36, 'Ergonomic Paper Computer', 8200.10, NULL, 'Voluptas porro perspiciatis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (37, 'Ergonomic Rubber Plate', 267770.09, NULL, 'Nisi expedita consequatur consequatur molestias deserunt asperiores.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (38, 'Lightweight Wooden Table', 250746.63, NULL, 'Et voluptas aliquam voluptas voluptas.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (39, 'Ergonomic Plastic Table', 34624.06, NULL, 'Aliquid neque officia optio deleniti numquam laborum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (40, 'Lightweight Copper Knife', 183750.55, NULL, 'Aut maiores voluptas eveniet.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (41, 'Incredible Copper Bench', 252547.03, NULL, 'Non aut accusamus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (42, 'Enormous Paper Keyboard', 146676.11, NULL, 'Et debitis amet.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (43, 'Awesome Rubber Hat', 64525.32, NULL, 'Autem earum maiores.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (44, 'Durable Wool Hat', 16714.67, NULL, 'Et ut magni necessitatibus cupiditate quasi sapiente.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (45, 'Aerodynamic Wooden Table', 43582.48, NULL, 'Iste commodi inventore officiis labore provident ipsam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (46, 'Synergistic Cotton Plate', 138372.30, NULL, 'Repellendus enim dolore id reiciendis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (47, 'Practical Leather Wallet', 65813.83, NULL, 'Voluptatem ratione et fugiat omnis est.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (48, 'Enormous Steel Bench', 243993.91, NULL, 'Omnis minus repudiandae sit deleniti.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (49, 'Small Bronze Clock', 123197.20, NULL, 'Impedit molestiae ipsum veritatis officia modi laboriosam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (50, 'Heavy Duty Marble Keyboard', 150617.13, NULL, 'Unde consequatur voluptatum qui et.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (51, 'Practical Paper Clock', 146257.03, NULL, 'Quasi exercitationem corrupti quod.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (52, 'Small Steel Hat', 43441.28, NULL, 'Et id quos illum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (53, 'Gorgeous Steel Plate', 42072.28, NULL, 'Eius repellendus enim.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (54, 'Gorgeous Bronze Wallet', 97888.04, NULL, 'Quos quibusdam veritatis hic.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (55, 'Ergonomic Paper Keyboard', 93169.56, NULL, 'Deserunt dolor enim.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (56, 'Ergonomic Cotton Computer', 118838.80, NULL, 'Deserunt animi eos est.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (57, 'Gorgeous Leather Lamp', 144171.53, NULL, 'Quidem ad omnis blanditiis aliquam aliquam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (58, 'Awesome Copper Shoes', 266966.31, NULL, 'Id qui officiis molestias nam non quia.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (59, 'Synergistic Granite Car', 120338.38, NULL, 'Id possimus sed numquam voluptates.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (60, 'Awesome Wooden Gloves', 10124.77, NULL, 'Et ipsam laborum fuga voluptas id.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (61, 'Practical Iron Bench', 182584.84, NULL, 'Natus distinctio voluptatem quaerat inventore repudiandae odio ad.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (62, 'Sleek Rubber Table', 254127.13, NULL, 'Sit atque dolorum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (63, 'Enormous Wool Hat', 138564.45, NULL, 'Consectetur labore odit et adipisci ab voluptatem libero.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (64, 'Heavy Duty Copper Computer', 48532.59, NULL, 'Quia qui alias sit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (65, 'Awesome Iron Table', 151422.77, NULL, 'Voluptas eaque enim repudiandae.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (66, 'Awesome Wool Chair', 136405.09, NULL, 'Est dicta sint quia eum nostrum occaecati.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (67, 'Practical Rubber Pants', 154189.45, NULL, 'Dolorum vero consequatur perferendis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (68, 'Sleek Linen Bag', 196189.78, NULL, 'Tempora voluptatum amet itaque animi earum et.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (69, 'Mediocre Paper Gloves', 195141.77, NULL, 'Non accusamus cum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (70, 'Small Silk Hat', 264732.84, NULL, 'Saepe non id quisquam eius nostrum officiis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (71, 'Gorgeous Linen Bottle', 258443.16, NULL, 'Reiciendis illo error vero est est ipsum qui.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (72, 'Incredible Wooden Computer', 273468.91, NULL, 'Perferendis eum nesciunt repudiandae.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (73, 'Intelligent Cotton Bench', 228996.30, NULL, 'Cupiditate sint quidem consectetur qui illum consequuntur sint.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (74, 'Aerodynamic Wooden Bottle', 151002.02, NULL, 'Eos sit dignissimos quia eveniet fugiat quam.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (75, 'Ergonomic Paper Lamp', 274926.81, NULL, 'Tenetur animi eius.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (76, 'Practical Steel Wallet', 53949.82, NULL, 'Qui et voluptas rerum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (77, 'Rustic Paper Watch', 63857.34, NULL, 'Tenetur ducimus quia quia iste veritatis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (78, 'Practical Silk Bottle', 51138.38, NULL, 'Voluptatem incidunt facere magni sit impedit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (79, 'Ergonomic Bronze Watch', 154575.67, NULL, 'Iusto voluptatem debitis aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (80, 'Ergonomic Aluminum Chair', 63422.51, NULL, 'Beatae assumenda est in hic suscipit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (81, 'Incredible Linen Table', 246225.41, NULL, 'Ex accusantium placeat aut quidem quo est quia.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (82, 'Mediocre Bronze Keyboard', 198495.08, NULL, 'Consequatur quaerat enim a tenetur.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (83, 'Small Wool Bench', 144517.41, NULL, 'Odit ipsam dignissimos maiores.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (84, 'Incredible Granite Chair', 56369.61, NULL, 'Temporibus in ut dolorem.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (85, 'Fantastic Wool Lamp', 157880.89, NULL, 'Optio error rerum.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (86, 'Small Wooden Bench', 151702.80, NULL, 'Ex doloribus repellendus fugiat doloribus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (87, 'Synergistic Leather Hat', 92628.23, NULL, 'Saepe at aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (88, 'Intelligent Iron Chair', 195105.28, NULL, 'Dolores nostrum quae velit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (89, 'Gorgeous Wooden Hat', 271061.63, NULL, 'Velit provident magni distinctio velit.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (90, 'Practical Silk Bottle', 151531.97, NULL, 'Et provident mollitia quae odit aut dicta.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (91, 'Ergonomic Wool Bench', 127677.95, NULL, 'Ratione quo esse rem voluptatem delectus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (92, 'Sleek Copper Gloves', 143524.78, NULL, 'Sint deserunt ad ducimus.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (93, 'Lightweight Concrete Bag', 58570.91, NULL, 'Veniam deleniti dolorem aliquam vel libero dolorem.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (94, 'Practical Aluminum Clock', 134717.59, NULL, 'Eum perferendis voluptatem.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (95, 'Lightweight Rubber Hat', 258095.70, NULL, 'Ab quod cum voluptatem.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (96, 'Rustic Leather Table', 92743.98, NULL, 'Voluptatibus dolor autem repellat ipsum ipsa recusandae nobis.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (97, 'Enormous Steel Wallet', 208460.22, NULL, 'Maiores dolor rerum cupiditate natus vero aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (98, 'Heavy Duty Plastic Knife', 11115.78, NULL, 'Temporibus alias minus nostrum autem reiciendis quia iste.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (99, 'Sleek Concrete Shirt', 7247.84, NULL, 'Totam eos quo eveniet maiores aut in.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (100, 'Rustic Wooden Shirt', 26714.30, NULL, 'Consequatur similique doloremque omnis facilis libero recusandae porro.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (101, 'Rustic Copper Knife', 36654.14, NULL, 'Nulla molestiae maxime iusto.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (102, 'Mediocre Wooden Watch', 102799.14, NULL, 'Quo quos qui ea.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (103, 'Incredible Steel Lamp', 214641.45, NULL, 'Est ipsam neque iste quod voluptatem placeat.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (104, 'Ergonomic Plastic Lamp', 277004.19, NULL, 'Omnis doloribus sit deserunt aut.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 4);
INSERT INTO `products` VALUES (105, 'Sleek Concrete Shirt', 150038.63, NULL, 'Dolores exercitationem consequatur aperiam consectetur ipsam recusandae.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 2);
INSERT INTO `products` VALUES (106, 'Synergistic Cotton Bottle', 213260.70, NULL, 'Ut aut et sed aspernatur mollitia.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (107, 'Ergonomic Iron Watch', 20195.19, NULL, 'Dolorum soluta sit facere est repudiandae eos.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (108, 'Rustic Steel Shirt', 43576.06, NULL, 'Earum pariatur aut voluptas dolorem.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (109, 'Aerodynamic Bronze Gloves', 75046.98, NULL, 'Aliquam illum iste temporibus voluptate.', '2024-04-09 18:46:45', '2024-04-09 18:46:45', 3);
INSERT INTO `products` VALUES (110, 'Aerodynamic Leather Bench', 201677.53, NULL, 'Assumenda mollitia et.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (111, 'Incredible Paper Shirt', 33054.55, NULL, 'Modi vero hic ut autem eaque.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (112, 'Mediocre Bronze Plate', 138490.86, NULL, 'Totam earum dicta.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 4);
INSERT INTO `products` VALUES (113, 'Practical Wooden Clock', 209683.05, NULL, 'Qui cumque praesentium voluptatem.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (114, 'Small Concrete Pants', 209037.31, NULL, 'Blanditiis autem dolore iure saepe.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (115, 'Aerodynamic Rubber Clock', 214919.00, NULL, 'Id animi magnam et veniam quia non velit.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (116, 'Practical Paper Shirt', 181098.59, NULL, 'Repudiandae qui non qui voluptatum nam laudantium.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (117, 'Practical Marble Car', 57038.96, NULL, 'Omnis veniam fugit autem.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (118, 'Intelligent Granite Shirt', 55649.54, NULL, 'Et ut ipsa non quia.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (119, 'Ergonomic Paper Coat', 196471.28, NULL, 'Minima minus aspernatur voluptatibus.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (120, 'Synergistic Marble Keyboard', 71546.06, NULL, 'Et quod aut dolores vel.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (121, 'Durable Bronze Knife', 9827.00, NULL, 'Omnis vel porro eum iure beatae.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (122, 'Small Plastic Coat', 150088.03, NULL, 'Blanditiis corrupti quaerat hic.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 4);
INSERT INTO `products` VALUES (123, 'Aerodynamic Granite Coat', 5215.13, NULL, 'Consectetur ut aut rerum repudiandae quasi facilis.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 4);
INSERT INTO `products` VALUES (124, 'Practical Wooden Gloves', 123927.33, NULL, 'Modi et et et sequi nesciunt doloremque optio.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 4);
INSERT INTO `products` VALUES (125, 'Practical Leather Plate', 15218.75, NULL, 'Recusandae nobis magni.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (126, 'Incredible Concrete Coat', 164291.00, NULL, 'Non illum voluptas consequatur distinctio.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (127, 'Mediocre Wooden Shirt', 217322.22, NULL, 'Et doloremque nesciunt alias vel labore.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (128, 'Heavy Duty Paper Bag', 145848.56, NULL, 'Rem fuga adipisci distinctio aut eius.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (129, 'Awesome Silk Shirt', 248528.50, NULL, 'Qui et sed nulla ratione aspernatur.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (130, 'Awesome Paper Bench', 161731.02, NULL, 'Sed quas dolorem id consequuntur non.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (131, 'Practical Aluminum Hat', 135994.61, NULL, 'Qui voluptates cumque placeat eaque et ut temporibus.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (132, 'Incredible Plastic Hat', 100560.17, NULL, 'Qui repellendus reprehenderit velit facere et.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (133, 'Lightweight Silk Shirt', 202807.48, NULL, 'Quod est sapiente.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (134, 'Ergonomic Wooden Shirt', 28679.16, NULL, 'Possimus dolor vel qui.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (135, 'Sleek Rubber Watch', 41847.13, NULL, 'Quis et est.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (136, 'Fantastic Granite Wallet', 160419.30, NULL, 'Ducimus officia inventore animi.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (137, 'Sleek Iron Shirt', 257641.42, NULL, 'Rem tenetur molestias quos natus in explicabo totam.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (138, 'Sleek Silk Computer', 45260.30, NULL, 'Fuga laudantium dolores qui.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (139, 'Synergistic Copper Car', 129368.98, NULL, 'Id iusto hic quis.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 4);
INSERT INTO `products` VALUES (140, 'Gorgeous Granite Pants', 268861.94, NULL, 'Atque laborum minima assumenda iure.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (141, 'Mediocre Plastic Bench', 101105.88, NULL, 'Iste cupiditate eum et quaerat dolores est.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (142, 'Fantastic Wool Chair', 264831.38, NULL, 'Perferendis quo sed iusto.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (143, 'Rustic Linen Plate', 267447.34, NULL, 'Quis ipsa quisquam.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (144, 'Ergonomic Plastic Bag', 67420.95, NULL, 'Vel vitae quia in et minima.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (145, 'Awesome Granite Plate', 189775.20, NULL, 'Eum nihil quia aut eius est.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (146, 'Intelligent Copper Chair', 109819.98, NULL, 'Vel quo sit dignissimos excepturi sed.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (147, 'Awesome Plastic Plate', 161825.41, NULL, 'Necessitatibus deserunt accusantium eius.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (148, 'Synergistic Bronze Pants', 129039.90, NULL, 'Non aut et qui corporis.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (149, 'Enormous Granite Chair', 6053.84, NULL, 'Voluptatem et consequatur soluta.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 2);
INSERT INTO `products` VALUES (150, 'Fantastic Linen Car', 147386.67, NULL, 'Rem vel quis voluptates incidunt aut voluptatibus.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (151, 'Heavy Duty Marble Bag', 261110.09, NULL, 'Ut hic quo accusamus.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
INSERT INTO `products` VALUES (152, 'Awesome Iron Lamp', 158880.58, NULL, 'Harum fugiat quo modi quo odio esse blanditiis.', '2024-04-09 18:46:46', '2024-04-09 18:46:46', 3);
-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'user');
INSERT INTO `roles` VALUES (2, 'admin');

-- ----------------------------
-- Table structure for social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE `social_accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tên người dùng',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of social_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expiration_date` datetime NULL DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  `is_mobile` tinyint(1) NULL DEFAULT 0,
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `refresh_expiration_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (3, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjAxMjM0NTY3OCIsInVzZXJJZCI6Miwic3ViIjoiMDEyMzQ1Njc4IiwiZXhwIjoxNzIwMTA4MTM0fQ.1m0klkdjr3C8QDZd4lyI7_fc0cFRWZJGTRf9aYgTXJQ', 'Bearer', '2024-07-04 15:48:54', 0, 0, 2, 0, '', NULL);
INSERT INTO `tokens` VALUES (4, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjAxMjM0NTY3OCIsInVzZXJJZCI6Miwic3ViIjoiMDEyMzQ1Njc4IiwiZXhwIjoxNzIwMTA4MTQ4fQ.yaL7fD25pCY4svBQyNiwXwjI4835SLVv3LLIVTEVBgA', 'Bearer', '2024-07-04 15:49:08', 0, 0, 2, 1, '', NULL);
INSERT INTO `tokens` VALUES (5, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjAxMjM0NTY3OCIsInVzZXJJZCI6Miwic3ViIjoiMDEyMzQ1Njc4IiwiZXhwIjoxNzIwMTkxMjE4fQ.9gZSOHhTms4CVetnaex8WlEqrs_ygq3n2IqWXs9Sp68', 'Bearer', '2024-07-05 14:53:38', 0, 0, 2, 1, 'af5d7355-1e18-45ad-a350-315766a1fb17', '2024-08-04 14:53:38');
INSERT INTO `tokens` VALUES (6, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMyIsInVzZXJJZCI6Mywic3ViIjoiMTIzIiwiZXhwIjoxNzIwMjg4NDIyfQ.pSWsM5ymOVoltXzOJp24-BPTSwXvihzpirbPSp7KuY4', 'Bearer', '2024-07-06 17:53:42', 0, 0, 3, 0, 'ac69534b-abf9-459a-a274-894e80705179', '2024-08-05 17:53:42');
INSERT INTO `tokens` VALUES (9, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEsInN1YiI6IjEyMzQ1Njc4OTAiLCJleHAiOjE3MjA2MzcwODl9.4KkOiaSMYUGv5BGsI_-s0UgydrKk6kxlZGzMwOJPeQc', 'Bearer', '2024-07-10 18:44:49', 0, 0, 1, 1, '7fc4fcda-c165-441e-b2a9-b6f38b4c3658', '2024-08-09 18:44:49');
INSERT INTO `tokens` VALUES (10, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMyIsInVzZXJJZCI6Mywic3ViIjoiMTIzIiwiZXhwIjoxNzIwNjM3MzY1fQ.44bbfgbB4yW8MdvZmPBpuQZgJsPowDTxExxk5c494HE', 'Bearer', '2024-07-10 18:49:25', 0, 0, 3, 0, '635bf452-847c-44ef-81c5-d35503c7e803', '2024-08-09 18:49:25');
INSERT INTO `tokens` VALUES (11, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEsInN1YiI6IjEyMzQ1Njc4OTAiLCJleHAiOjE3MjA4MTMxMTV9.FhTIWQ6aB2xC-HaVW-kbMbAJ_PjQsKL4f1L0aiUpZ6E', 'Bearer', '2024-07-12 19:38:35', 0, 0, 1, 1, 'ac4080ae-1b34-4db9-8b92-d7d3550a4fcd', '2024-08-11 19:38:35');
INSERT INTO `tokens` VALUES (12, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEsInN1YiI6IjEyMzQ1Njc4OTAiLCJleHAiOjE3MjA4MTM1NjV9.OgftHzssBgYlPrV8SrLwNLtgZ1W9nrdMoV2X1DNAYLA', 'Bearer', '2024-07-12 19:46:05', 0, 0, 1, 1, '363f84ed-c3d6-456c-89b5-6eee517b4160', '2024-08-11 19:46:05');
INSERT INTO `tokens` VALUES (14, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjE1MDIyMDAzIiwidXNlcklkIjo2LCJzdWIiOiIxNTAyMjAwMyIsImV4cCI6MTcyMTA1NzI4Nn0.FlU_VFZJnTxBxdGmKuqSca4PJB849B192WgFq-uB-IM', 'Bearer', '2024-07-15 15:28:07', 0, 0, 6, 1, '6199b4b5-9e2a-42fe-a28a-655c62bf2b57', '2024-08-14 15:28:07');
INSERT INTO `tokens` VALUES (15, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjE1MDIyMDAzIiwidXNlcklkIjo2LCJzdWIiOiIxNTAyMjAwMyIsImV4cCI6MTcyMTA1NzM2OH0.11s9793nVmFDPXH-Nhrpf_Y9oH0wUXDdTX4xIW0gnzg', 'Bearer', '2024-07-15 15:29:28', 0, 0, 6, 1, 'f8876517-dbf4-4400-8db7-f82a557bcd4f', '2024-08-14 15:29:28');
INSERT INTO `tokens` VALUES (16, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IiIsInVzZXJJZCI6Nywic3ViIjoiIiwiZXhwIjoxNzIxMDU3NjA3fQ.rv4gtrnE9HBqRtd-0QGzDNfxO2huItmvYBScevsTsYI', 'Bearer', '2024-07-15 15:33:27', 0, 0, 7, 1, '90c6d061-e3d8-4f11-8991-33f1bac697db', '2024-08-14 15:33:27');
INSERT INTO `tokens` VALUES (17, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IiIsInVzZXJJZCI6Nywic3ViIjoiIiwiZXhwIjoxNzIxMDU5MjkwfQ.E_eDaP1KVXPFmBFzWB1MkKCuSiuJU_HZgsXIMaBt3nM', 'Bearer', '2024-07-15 16:01:30', 0, 0, 7, 1, 'c5ddf46f-8666-4231-84c9-46de9ebe638f', '2024-08-14 16:01:30');
INSERT INTO `tokens` VALUES (18, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjE1MDIyMDAzIiwidXNlcklkIjo2LCJzdWIiOiIxNTAyMjAwMyIsImV4cCI6MTcyMTA1OTI5M30._zTQNWPqH_NW0iTksBApqw824A2ZoqmpyDzqK4dtTtY', 'Bearer', '2024-07-15 16:01:33', 0, 0, 6, 1, '089c7dee-c664-4f11-b207-58917386ffac', '2024-08-14 16:01:33');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `date_of_birth` date NULL DEFAULT NULL,
  `facebook_account_id` int NULL DEFAULT 0,
  `google_account_id` int NULL DEFAULT 0,
  `role_id` int NULL DEFAULT 1,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'John Doe', '1234567890', '123 Main Street, City, Country', '$2a$10$4RYPhSHA3XgWEzUKHan4Wuo8lGQxw/JruT4VSTCJUTVxgzoCI9n4y', '2024-04-12 02:10:58', '2024-06-06 18:40:24', 1, '1989-12-29', 0, 0, 1, '');
INSERT INTO `users` VALUES (2, 'Doan tam', '012345678', '123 Tran Phu', '$2a$10$pDcmbY0KypXQXFIKw.I2VeCcsm4kwTkkigiMNHHNcWglpNhyNXrvK', '2024-04-13 19:46:24', '2024-04-13 19:46:24', 1, '2003-02-15', 0, 0, 2, '');
INSERT INTO `users` VALUES (3, 'Admin', '123', '828 SVH', '$2a$10$lMH.MsbeGdE34Ge4Gno6/eNBe2GWwoCiMT6TYbggNXoph5t7SCwqS', '2024-04-14 18:31:34', '2024-05-04 06:18:32', 1, '2003-02-15', 2, 3, 2, '');
INSERT INTO `users` VALUES (4, 'x', '0583331528', '', '$2a$10$2nPn2rmmnHstzNW27KCSqeTK3.ofcmNCEjt7O/Q8FV/Izuzj4AfLu', '2024-04-15 22:01:17', '2024-04-15 22:01:17', 1, '2006-04-15', 0, 0, 1, '');
INSERT INTO `users` VALUES (5, 'Tam', '1262003', '12323', '$2a$10$A.KMGwwIscYH4BlUCK0.ROLtthPavvtjQCS7IkN9y2SWq4XelAAF.', '2024-04-15 22:02:44', '2024-04-15 22:02:44', 1, '2003-02-15', 0, 0, 1, '');
INSERT INTO `users` VALUES (6, 'testemail', '15022003', '828 SVH', '$2a$10$eeDv.SOzmw94g9jgCkl9SOzTf.N/SRH4P8INvn2TXDBXESRxcAa/e', '2024-06-15 15:03:25', '2024-06-15 15:03:25', 1, '2003-02-15', 0, 0, 1, 'doantam@123.com');
INSERT INTO `users` VALUES (7, 'ADMIN2', '', '828 SVH', '$2a$10$3de7iBMIAE9.0uiWvv0nveYXtRbbM6KCr8YTpQfjd1AzmfEdOxM0C', '2024-06-15 15:32:29', '2024-06-15 15:32:29', 1, '2003-02-15', 0, 0, 1, 'doantam@1234.com');

SET FOREIGN_KEY_CHECKS = 1;
