-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: staging
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_adobe_ims_webapi`
--

DROP TABLE IF EXISTS `admin_adobe_ims_webapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_adobe_ims_webapi` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `admin_user_id` int unsigned NOT NULL DEFAULT '0' ,
  `access_token_hash` varchar(255) DEFAULT NULL ,
  `access_token` text ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `last_check_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ADOBE_IMS_WEBAPI_ACCESS_TOKEN_HASH` (`access_token_hash`),
  KEY `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_analytics_usage_version_log`
--

DROP TABLE IF EXISTS `admin_analytics_usage_version_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `last_viewed_in_version` varchar(50) NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_passwords`
--

DROP TABLE IF EXISTS `admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_passwords` (
  `password_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `user_id` int unsigned NOT NULL DEFAULT '0' ,
  `password_hash` varchar(255) DEFAULT NULL ,
  `expires` int unsigned NOT NULL DEFAULT '0' ,
  `last_updated` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL ,
  `severity` smallint unsigned NOT NULL DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `firstname` varchar(32) DEFAULT NULL ,
  `lastname` varchar(32) DEFAULT NULL ,
  `email` varchar(128) DEFAULT NULL ,
  `username` varchar(40) DEFAULT NULL ,
  `password` varchar(255) NOT NULL ,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `logdate` timestamp NULL DEFAULT NULL ,
  `lognum` smallint unsigned NOT NULL DEFAULT '0' ,
  `reload_acl_flag` smallint NOT NULL DEFAULT '0' ,
  `is_active` smallint NOT NULL DEFAULT '1' ,
  `extra` text ,
  `rp_token` text ,
  `rp_token_created_at` timestamp NULL DEFAULT NULL ,
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' ,
  `failures_num` smallint DEFAULT '0' ,
  `first_failure` timestamp NULL DEFAULT NULL ,
  `lock_expires` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_user_expiration`
--

DROP TABLE IF EXISTS `admin_user_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_expiration` (
  `user_id` int unsigned NOT NULL ,
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_user_session`
--

DROP TABLE IF EXISTS `admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `session_id` varchar(1) DEFAULT NULL ,
  `user_id` int unsigned DEFAULT NULL ,
  `status` smallint unsigned NOT NULL DEFAULT '1' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `ip` varchar(15) NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19417 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `severity` smallint unsigned NOT NULL DEFAULT '0' ,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `title` varchar(255) NOT NULL ,
  `description` text ,
  `url` varchar(255) DEFAULT NULL ,
  `is_read` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_remove` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_amasty` smallint NOT NULL DEFAULT '0' ,
  `expiration_date` datetime DEFAULT NULL ,
  `image_url` text ,
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_stock_asset`
--

DROP TABLE IF EXISTS `adobe_stock_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_asset` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `media_gallery_id` int unsigned DEFAULT NULL ,
  `category_id` int unsigned DEFAULT NULL ,
  `creator_id` int unsigned DEFAULT NULL ,
  `is_licensed` int unsigned NOT NULL DEFAULT '0' ,
  `creation_date` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`),
  CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_stock_category`
--

DROP TABLE IF EXISTS `adobe_stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `name` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CATEGORY_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_stock_creator`
--

DROP TABLE IF EXISTS `adobe_stock_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_creator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `name` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CREATOR_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adobe_user_profile`
--

DROP TABLE IF EXISTS `adobe_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_user_profile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `admin_user_id` int unsigned NOT NULL DEFAULT '0' ,
  `name` varchar(255) NOT NULL ,
  `email` varchar(255) NOT NULL ,
  `image` varchar(255) NOT NULL ,
  `account_type` varchar(255) DEFAULT NULL ,
  `access_token` text ,
  `refresh_token` text ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  PRIMARY KEY (`id`),
  KEY `ADOBE_USER_PROFILE_ID` (`id`),
  KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_additional_sections_cl`
--

DROP TABLE IF EXISTS `algolia_additional_sections_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_additional_sections_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_categories_cl`
--

DROP TABLE IF EXISTS `algolia_categories_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_categories_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121688 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_delete_products_cl`
--

DROP TABLE IF EXISTS `algolia_delete_products_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_delete_products_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_pages_cl`
--

DROP TABLE IF EXISTS `algolia_pages_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_pages_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6591 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_products_cl`
--

DROP TABLE IF EXISTS `algolia_products_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_products_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3899900 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_queue_runner_cl`
--

DROP TABLE IF EXISTS `algolia_queue_runner_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_queue_runner_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `algolia_suggestions_cl`
--

DROP TABLE IF EXISTS `algolia_suggestions_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algolia_suggestions_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_ampromo_rule`
--

DROP TABLE IF EXISTS `amasty_ampromo_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_ampromo_rule` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `salesrule_id` int unsigned NOT NULL ,
  `sku` text NOT NULL ,
  `type` smallint NOT NULL ,
  `top_banner_show_gift_images` tinyint(1) NOT NULL ,
  `after_product_banner_show_gift_images` tinyint(1) NOT NULL ,
  `items_discount` varchar(255) DEFAULT '' ,
  `minimal_items_price` float DEFAULT NULL ,
  `apply_tax` tinyint(1) NOT NULL ,
  `apply_shipping` tinyint(1) NOT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `AMASTY_AMPROMO_RULE_SALESRULE_ID` (`salesrule_id`),
  CONSTRAINT `AMASTY_AMPROMO_RULE_SALESRULE_ID_SALESRULE_ROW_ID` FOREIGN KEY (`salesrule_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_amrules_rule`
--

DROP TABLE IF EXISTS `amasty_amrules_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_amrules_rule` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `salesrule_id` int unsigned NOT NULL ,
  `eachm` text NOT NULL ,
  `priceselector` smallint NOT NULL ,
  `promo_cats` text NOT NULL ,
  `promo_skus` text NOT NULL ,
  `nqty` text NOT NULL ,
  `general_skip_settings` tinyint(1) NOT NULL ,
  `skip_rule` text NOT NULL ,
  `max_discount` text NOT NULL ,
  `apply_discount_to` varchar(4) NOT NULL ,
  `use_for` smallint NOT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `AMASTY_AMRULES_RULE_SALESRULE_ID` (`salesrule_id`),
  CONSTRAINT `AMASTY_AMRULES_RULE_SALESRULE_ID_SALESRULE_ROW_ID` FOREIGN KEY (`salesrule_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_banners_lite_banner_data`
--

DROP TABLE IF EXISTS `amasty_banners_lite_banner_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_banners_lite_banner_data` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `salesrule_id` int unsigned NOT NULL ,
  `banner_type` int NOT NULL DEFAULT '0' ,
  `banner_image` text ,
  `banner_alt` varchar(255) DEFAULT NULL ,
  `banner_hover_text` varchar(255) DEFAULT NULL ,
  `banner_link` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `AMASTY_BANNERS_LITE_BANNER_DATA_SALESRULE_ID` (`salesrule_id`),
  CONSTRAINT `AMASTY_BANNERS_LITE_BANNER_DATA_SALESRULE_ID_SALESRULE_ROW_ID` FOREIGN KEY (`salesrule_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_banners_lite_rule`
--

DROP TABLE IF EXISTS `amasty_banners_lite_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_banners_lite_rule` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `salesrule_id` int unsigned NOT NULL ,
  `banner_product_sku` text ,
  `banner_product_categories` text ,
  `show_banner_for` int DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `AMASTY_BANNERS_LITE_RULE_SALESRULE_ID` (`salesrule_id`),
  CONSTRAINT `AMASTY_BANNERS_LITE_RULE_SALESRULE_ID_SALESRULE_ROW_ID` FOREIGN KEY (`salesrule_id`) REFERENCES `salesrule` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_conditions_quote`
--

DROP TABLE IF EXISTS `amasty_conditions_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_conditions_quote` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `quote_id` int unsigned DEFAULT NULL ,
  `payment_code` text NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `AMASTY_CONDITIONS_QUOTE_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16712 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_sociallogin_customers`
--

DROP TABLE IF EXISTS `amasty_sociallogin_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_sociallogin_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `social_id` varchar(255) NOT NULL DEFAULT '' ,
  `customer_id` int unsigned DEFAULT NULL ,
  `type` varchar(20) NOT NULL DEFAULT '' ,
  `name` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `AMASTY_SOCIALLOGIN_CUSTOMERS_SOCIAL_ID` (`social_id`),
  KEY `AMASTY_SOCIALLOGIN_CUSTOMERS_TYPE` (`type`),
  KEY `AMASTY_SOCIALLOGIN_CUSTOMERS_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `AMASTY_SOCIALLOGIN_CSTRS_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_sociallogin_sales`
--

DROP TABLE IF EXISTS `amasty_sociallogin_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_sociallogin_sales` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `order_id` int unsigned DEFAULT NULL ,
  `social_id` varchar(255) DEFAULT NULL ,
  `items` int NOT NULL DEFAULT '0' ,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' ,
  `type` varchar(20) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`entity_id`),
  KEY `AMASTY_SOCIALLOGIN_SALES_SOCIAL_ID` (`social_id`),
  KEY `AMASTY_SOCIALLOGIN_SALES_TYPE` (`type`),
  KEY `AMASTY_SOCIALLOGIN_SALES_ORDER_ID` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `amasty_sociallogin_social`
--

DROP TABLE IF EXISTS `amasty_sociallogin_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amasty_sociallogin_social` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `code` varchar(20) NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AMASTY_SOCIALLOGIN_SOCIAL_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `parent_id` int unsigned NOT NULL DEFAULT '0' ,
  `tree_level` smallint unsigned NOT NULL DEFAULT '0' ,
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' ,
  `role_type` varchar(1) NOT NULL DEFAULT '0' ,
  `user_id` int unsigned NOT NULL DEFAULT '0' ,
  `user_type` varchar(16) DEFAULT NULL ,
  `role_name` varchar(50) DEFAULT NULL ,
  `gws_is_all` int NOT NULL DEFAULT '1' ,
  `gws_websites` text ,
  `gws_store_groups` text ,
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=1443 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_rule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `role_id` int unsigned NOT NULL DEFAULT '0' ,
  `resource_id` varchar(255) DEFAULT NULL ,
  `privileges` varchar(20) DEFAULT NULL ,
  `permission` varchar(10) DEFAULT NULL ,
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132063 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `braintree_credit_prices`
--

DROP TABLE IF EXISTS `braintree_credit_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `braintree_credit_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL ,
  `term` int NOT NULL ,
  `monthly_payment` decimal(12,2) NOT NULL ,
  `instalment_rate` decimal(12,2) NOT NULL ,
  `cost_of_purchase` decimal(12,2) NOT NULL ,
  `total_inc_interest` decimal(12,2) NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM` (`product_id`,`term`),
  KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `braintree_transaction_details`
--

DROP TABLE IF EXISTS `braintree_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `braintree_transaction_details` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `order_id` int unsigned NOT NULL ,
  `transaction_source` varchar(12) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID` (`order_id`),
  CONSTRAINT `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL ,
  `data` mediumblob ,
  `create_time` int DEFAULT NULL ,
  `update_time` int DEFAULT NULL ,
  `expire_time` int DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_tag`
--

DROP TABLE IF EXISTS `cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL ,
  `cache_id` varchar(200) NOT NULL ,
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL ,
  `value` varchar(255) NOT NULL ,
  `count` int unsigned NOT NULL DEFAULT '0' ,
  `updated_at` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `parent_id` int unsigned NOT NULL DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `path` varchar(255) NOT NULL ,
  `position` int NOT NULL ,
  `level` int NOT NULL DEFAULT '0' ,
  `children_count` int NOT NULL ,
  `row_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `created_in` bigint unsigned NOT NULL DEFAULT '1' ,
  `updated_in` bigint unsigned NOT NULL DEFAULT '2147483647' ,
  PRIMARY KEY (`row_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`),
  KEY `CATALOG_CATEGORY_ENTITY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_CREATED_IN` (`created_in`),
  KEY `CATALOG_CATEGORY_ENTITY_UPDATED_IN` (`updated_in`),
  CONSTRAINT `CAT_CTGR_ENTT_ENTT_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4310 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_after_insert` AFTER INSERT ON `catalog_category_entity` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) VALUES (NEW.`entity_id`);
INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (NEW.`entity_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_after_update` AFTER UPDATE ON `catalog_category_entity` FOR EACH ROW BEGIN
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`parent_id` <=> OLD.`parent_id`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`path` <=> OLD.`path`) OR NOT(NEW.`position` <=> OLD.`position`) OR NOT(NEW.`level` <=> OLD.`level`) OR NOT(NEW.`children_count` <=> OLD.`children_count`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`parent_id` <=> OLD.`parent_id`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`path` <=> OLD.`path`) OR NOT(NEW.`position` <=> OLD.`position`) OR NOT(NEW.`level` <=> OLD.`level`) OR NOT(NEW.`children_count` <=> OLD.`children_count`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_after_delete` AFTER DELETE ON `catalog_category_entity` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) VALUES (OLD.`entity_id`);
INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (OLD.`entity_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` datetime DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` decimal(20,6) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` int DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39716 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_int_after_insert` AFTER INSERT ON `catalog_category_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_category_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_int_after_update` AFTER UPDATE ON `catalog_category_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_category_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_entity_int_after_delete` AFTER DELETE ON `catalog_category_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_category_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogpermissions_category_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` mediumtext ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19302 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ROW_ID_CAT_CTGR_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_category_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123467 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_1`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_flat_store_1` (
  `entity_id` int unsigned NOT NULL ,
  `parent_id` int unsigned NOT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `path` varchar(255) NOT NULL DEFAULT '' ,
  `position` int NOT NULL ,
  `level` int NOT NULL ,
  `children_count` int NOT NULL ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `all_children` text ,
  `automatic_sorting` varchar(255) DEFAULT NULL ,
  `available_sort_by` text ,
  `brand_gender_id_unique` int DEFAULT NULL ,
  `children` text ,
  `custom_apply_to_products` int DEFAULT NULL ,
  `custom_design` varchar(255) DEFAULT NULL ,
  `custom_design_from` datetime DEFAULT NULL ,
  `custom_design_to` datetime DEFAULT NULL ,
  `custom_layout_update` text ,
  `custom_layout_update_file` varchar(255) DEFAULT NULL ,
  `custom_use_parent_settings` int DEFAULT NULL ,
  `default_sort_by` varchar(255) DEFAULT NULL ,
  `description` text ,
  `display_mode` varchar(255) DEFAULT NULL ,
  `filter_price_range` decimal(12,4) DEFAULT NULL ,
  `image` varchar(255) DEFAULT NULL ,
  `include_in_menu` int DEFAULT NULL ,
  `is_active` int DEFAULT NULL ,
  `is_anchor` int DEFAULT NULL ,
  `is_featured` int DEFAULT NULL ,
  `landing_page` int DEFAULT NULL ,
  `megamenu_show_catimage` int DEFAULT NULL ,
  `megamenu_show_catimage_height` varchar(255) DEFAULT NULL ,
  `megamenu_show_catimage_img` varchar(255) DEFAULT NULL ,
  `megamenu_show_catimage_width` varchar(255) DEFAULT NULL ,
  `megamenu_type` varchar(255) DEFAULT NULL ,
  `megamenu_type_class` varchar(255) DEFAULT NULL ,
  `megamenu_type_footer` text ,
  `megamenu_type_half_pos` varchar(255) DEFAULT NULL ,
  `megamenu_type_header` text ,
  `megamenu_type_imgpos` varchar(255) DEFAULT NULL ,
  `megamenu_type_labelclr` varchar(255) DEFAULT NULL ,
  `megamenu_type_labeltx` varchar(255) DEFAULT NULL ,
  `megamenu_type_leftblock` text ,
  `megamenu_type_leftblock_w` varchar(255) DEFAULT NULL ,
  `megamenu_type_numofcolumns` varchar(255) DEFAULT NULL ,
  `megamenu_type_rightblock` text ,
  `megamenu_type_rightblock_w` varchar(255) DEFAULT NULL ,
  `megamenu_type_showtitle` int DEFAULT NULL ,
  `megamenu_type_subcatlevel` varchar(255) DEFAULT NULL ,
  `megamenu_type_subcol` varchar(255) DEFAULT NULL ,
  `megamenu_type_viewmore` varchar(255) DEFAULT NULL ,
  `meta_description` text ,
  `meta_keywords` text ,
  `meta_title` varchar(255) DEFAULT NULL ,
  `mob_image` varchar(255) DEFAULT NULL ,
  `name` varchar(255) DEFAULT NULL ,
  `page_layout` varchar(255) DEFAULT NULL ,
  `path_in_store` text ,
  `thumbnail` varchar(255) DEFAULT NULL ,
  `top_brands` varchar(255) DEFAULT NULL ,
  `url_key` varchar(255) DEFAULT NULL ,
  `url_path` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_1_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_1_TMP_PATH` (`path`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_1_TMP_LEVEL` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_flat_store_2`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_flat_store_2` (
  `entity_id` int unsigned NOT NULL ,
  `parent_id` int unsigned NOT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
  `path` varchar(255) NOT NULL DEFAULT '' ,
  `position` int NOT NULL ,
  `level` int NOT NULL ,
  `children_count` int NOT NULL ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `all_children` text ,
  `automatic_sorting` varchar(255) DEFAULT NULL ,
  `available_sort_by` text ,
  `brand_gender_id_unique` int DEFAULT NULL ,
  `children` text ,
  `custom_apply_to_products` int DEFAULT NULL ,
  `custom_design` varchar(255) DEFAULT NULL ,
  `custom_design_from` datetime DEFAULT NULL ,
  `custom_design_to` datetime DEFAULT NULL ,
  `custom_layout_update` text ,
  `custom_layout_update_file` varchar(255) DEFAULT NULL ,
  `custom_use_parent_settings` int DEFAULT NULL ,
  `default_sort_by` varchar(255) DEFAULT NULL ,
  `description` text ,
  `display_mode` varchar(255) DEFAULT NULL ,
  `filter_price_range` decimal(12,4) DEFAULT NULL ,
  `image` varchar(255) DEFAULT NULL ,
  `include_in_menu` int DEFAULT NULL ,
  `is_active` int DEFAULT NULL ,
  `is_anchor` int DEFAULT NULL ,
  `is_featured` int DEFAULT NULL ,
  `landing_page` int DEFAULT NULL ,
  `megamenu_show_catimage` int DEFAULT NULL ,
  `megamenu_show_catimage_height` varchar(255) DEFAULT NULL ,
  `megamenu_show_catimage_img` varchar(255) DEFAULT NULL ,
  `megamenu_show_catimage_width` varchar(255) DEFAULT NULL ,
  `megamenu_type` varchar(255) DEFAULT NULL ,
  `megamenu_type_class` varchar(255) DEFAULT NULL ,
  `megamenu_type_footer` text ,
  `megamenu_type_half_pos` varchar(255) DEFAULT NULL ,
  `megamenu_type_header` text ,
  `megamenu_type_imgpos` varchar(255) DEFAULT NULL ,
  `megamenu_type_labelclr` varchar(255) DEFAULT NULL ,
  `megamenu_type_labeltx` varchar(255) DEFAULT NULL ,
  `megamenu_type_leftblock` text ,
  `megamenu_type_leftblock_w` varchar(255) DEFAULT NULL ,
  `megamenu_type_numofcolumns` varchar(255) DEFAULT NULL ,
  `megamenu_type_rightblock` text ,
  `megamenu_type_rightblock_w` varchar(255) DEFAULT NULL ,
  `megamenu_type_showtitle` int DEFAULT NULL ,
  `megamenu_type_subcatlevel` varchar(255) DEFAULT NULL ,
  `megamenu_type_subcol` varchar(255) DEFAULT NULL ,
  `megamenu_type_viewmore` varchar(255) DEFAULT NULL ,
  `meta_description` text ,
  `meta_keywords` text ,
  `meta_title` varchar(255) DEFAULT NULL ,
  `mob_image` varchar(255) DEFAULT NULL ,
  `name` varchar(255) DEFAULT NULL ,
  `page_layout` varchar(255) DEFAULT NULL ,
  `path_in_store` text ,
  `thumbnail` varchar(255) DEFAULT NULL ,
  `top_brands` varchar(255) DEFAULT NULL ,
  `url_key` varchar(255) DEFAULT NULL ,
  `url_path` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_2_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_2_TMP_PATH` (`path`),
  KEY `CATALOG_CATEGORY_FLAT_STORE_2_TMP_LEVEL` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product` (
  `entity_id` int NOT NULL AUTO_INCREMENT ,
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6635314 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_product_after_insert` AFTER INSERT ON `catalog_category_product` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_product_after_update` AFTER UPDATE ON `catalog_category_product` FOR EACH ROW BEGIN
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`category_id` <=> OLD.`category_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`category_id` <=> OLD.`category_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`)) THEN INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`category_id` <=> OLD.`category_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`category_id` <=> OLD.`category_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`)) THEN INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`category_id` <=> OLD.`category_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`)) THEN INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_category_product_after_delete` AFTER DELETE ON `catalog_category_product` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_category_product_cl`
--

DROP TABLE IF EXISTS `catalog_category_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53312 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store13`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store13` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE13_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_755D4F0D55D5EE6C608F4FF47294DEAF` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store13_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store13_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store13_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_8389A453B1D17695872A3F5AB53CED55` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_15E0763074BBF12DA79E845D659BCC7F` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store2`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store2` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_87FCED52F67C72BB6992C79EB4DCFA8A` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_15B841C92B67D986A980051DF109F9D1` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_store2_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store2_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store2_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int DEFAULT NULL ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE2_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_2AB6FE58F086547FA7E4590837296849` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int unsigned NOT NULL DEFAULT '0' ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `position` int NOT NULL DEFAULT '0' ,
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `visibility` smallint unsigned NOT NULL ,
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `visitor_id` int unsigned NOT NULL DEFAULT '0' ,
  `customer_id` int unsigned DEFAULT NULL ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned DEFAULT NULL ,
  `list_id` int unsigned DEFAULT NULL ,
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` (`list_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` FOREIGN KEY (`list_id`) REFERENCES `catalog_compare_list` (`list_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_compare_list`
--

DROP TABLE IF EXISTS `catalog_compare_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_compare_list` (
  `list_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `list_id_mask` varchar(32) DEFAULT NULL ,
  `customer_id` int unsigned DEFAULT NULL ,
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `CATALOG_COMPARE_LIST_CUSTOMER_ID` (`customer_id`),
  KEY `CATALOG_COMPARE_LIST_LIST_ID_MASK` (`list_id_mask`),
  CONSTRAINT `CATALOG_COMPARE_LIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL ,
  `frontend_input_renderer` varchar(255) DEFAULT NULL ,
  `is_global` smallint unsigned NOT NULL DEFAULT '1' ,
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' ,
  `is_searchable` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_filterable` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_comparable` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_html_allowed_on_front` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_used_for_price_rules` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_filterable_in_search` smallint unsigned NOT NULL DEFAULT '0' ,
  `used_in_product_listing` smallint unsigned NOT NULL DEFAULT '0' ,
  `used_for_sort_by` smallint unsigned NOT NULL DEFAULT '0' ,
  `apply_to` varchar(255) DEFAULT NULL ,
  `is_visible_in_advanced_search` smallint unsigned NOT NULL DEFAULT '0' ,
  `position` int NOT NULL DEFAULT '0' ,
  `is_wysiwyg_enabled` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_used_for_promo_rules` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_required_in_admin_store` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `search_weight` float NOT NULL DEFAULT '1' ,
  `is_pagebuilder_enabled` tinyint(1) NOT NULL DEFAULT '0' ,
  `additional_data` text ,
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_attribute_cl`
--

DROP TABLE IF EXISTS `catalog_product_attribute_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_attribute_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=541660 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int unsigned NOT NULL ,
  `parent_id` int unsigned NOT NULL ,
  `required` smallint unsigned NOT NULL DEFAULT '0' ,
  `position` int unsigned NOT NULL DEFAULT '0' ,
  `type` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`option_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `title` varchar(255) DEFAULT NULL ,
  `parent_product_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  KEY `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL ,
  `min_price` decimal(20,6) NOT NULL ,
  `max_price` decimal(20,6) NOT NULL ,
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL ,
  `parent_product_id` int unsigned NOT NULL ,
  `product_id` int unsigned NOT NULL ,
  `position` int unsigned NOT NULL DEFAULT '0' ,
  `is_default` smallint unsigned NOT NULL DEFAULT '0' ,
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' ,
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `selection_qty` decimal(12,4) DEFAULT NULL ,
  `selection_can_change_qty` smallint NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`selection_id`,`parent_product_id`),
  KEY `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_SEQUENCE_PRD_BNDL_OPT_SEQUENCE_VAL` FOREIGN KEY (`option_id`) REFERENCES `sequence_product_bundle_option` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `FK_606117FEB5F50D0182CEC9D260C05DD2` FOREIGN KEY (`selection_id`) REFERENCES `sequence_product_bundle_selection` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_bundle_selection_after_insert` AFTER INSERT ON `catalog_product_bundle_selection` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`parent_product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_bundle_selection_after_update` AFTER UPDATE ON `catalog_product_bundle_selection` FOR EACH ROW BEGIN
IF (NOT(NEW.`selection_id` <=> OLD.`selection_id`) OR NOT(NEW.`option_id` <=> OLD.`option_id`) OR NOT(NEW.`parent_product_id` <=> OLD.`parent_product_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`position` <=> OLD.`position`) OR NOT(NEW.`is_default` <=> OLD.`is_default`) OR NOT(NEW.`selection_price_type` <=> OLD.`selection_price_type`) OR NOT(NEW.`selection_price_value` <=> OLD.`selection_price_value`) OR NOT(NEW.`selection_qty` <=> OLD.`selection_qty`) OR NOT(NEW.`selection_can_change_qty` <=> OLD.`selection_can_change_qty`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`parent_product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_bundle_selection_after_delete` AFTER DELETE ON `catalog_product_bundle_selection` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`parent_product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' ,
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `parent_product_id` int unsigned NOT NULL ,
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` (`parent_product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_PARENT_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AE9FDBF7988FB6BE3E04D91DA2CFB273` FOREIGN KEY (`selection_id`) REFERENCES `sequence_product_bundle_selection` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `stock_status` smallint DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_category_cl`
--

DROP TABLE IF EXISTS `catalog_product_category_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_category_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=648978 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' ,
  `sku` varchar(64) NOT NULL ,
  `has_options` smallint NOT NULL DEFAULT '0' ,
  `required_options` smallint unsigned NOT NULL DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `row_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `created_in` bigint unsigned NOT NULL DEFAULT '1' ,
  `updated_in` bigint unsigned NOT NULL DEFAULT '2147483647' ,
  PRIMARY KEY (`row_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  KEY `CATALOG_PRODUCT_ENTITY_CREATED_IN` (`created_in`),
  KEY `CATALOG_PRODUCT_ENTITY_UPDATED_IN` (`updated_in`),
  KEY `CATALOG_PRODUCT_ENTITY_ENTITY_ID_CREATED_IN_UPDATED_IN` (`entity_id`,`created_in`,`updated_in`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_ENTITY_ID_SEQUENCE_PRODUCT_SEQUENCE_VALUE` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10024 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_after_insert` AFTER INSERT ON `catalog_product_entity` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`entity_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`entity_id`);
INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (NEW.`entity_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`entity_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_after_update` AFTER UPDATE ON `catalog_product_entity` FOR EACH ROW BEGIN
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`type_id` <=> OLD.`type_id`) OR NOT(NEW.`sku` <=> OLD.`sku`) OR NOT(NEW.`has_options` <=> OLD.`has_options`) OR NOT(NEW.`required_options` <=> OLD.`required_options`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`type_id` <=> OLD.`type_id`) OR NOT(NEW.`sku` <=> OLD.`sku`) OR NOT(NEW.`has_options` <=> OLD.`has_options`) OR NOT(NEW.`required_options` <=> OLD.`required_options`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`type_id` <=> OLD.`type_id`) OR NOT(NEW.`sku` <=> OLD.`sku`) OR NOT(NEW.`has_options` <=> OLD.`has_options`) OR NOT(NEW.`required_options` <=> OLD.`required_options`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
IF (NOT(NEW.`entity_id` <=> OLD.`entity_id`) OR NOT(NEW.`attribute_set_id` <=> OLD.`attribute_set_id`) OR NOT(NEW.`type_id` <=> OLD.`type_id`) OR NOT(NEW.`sku` <=> OLD.`sku`) OR NOT(NEW.`has_options` <=> OLD.`has_options`) OR NOT(NEW.`required_options` <=> OLD.`required_options`) OR NOT(NEW.`created_at` <=> OLD.`created_at`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_after_delete` AFTER DELETE ON `catalog_product_entity` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`entity_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (OLD.`entity_id`);
INSERT IGNORE INTO `targetrule_product_rule_cl` (`entity_id`) VALUES (OLD.`entity_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (OLD.`entity_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` datetime DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95034 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_datetime_after_insert` AFTER INSERT ON `catalog_product_entity_datetime` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_datetime_after_update` AFTER UPDATE ON `catalog_product_entity_datetime` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_datetime_after_delete` AFTER DELETE ON `catalog_product_entity_datetime` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` decimal(20,6) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=578709 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_decimal_after_insert` AFTER INSERT ON `catalog_product_entity_decimal` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_decimal_after_update` AFTER UPDATE ON `catalog_product_entity_decimal` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_decimal_after_delete` AFTER DELETE ON `catalog_product_entity_decimal` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `position` int NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` int DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`),
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=462068 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_int_after_insert` AFTER INSERT ON `catalog_product_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_int_after_update` AFTER UPDATE ON `catalog_product_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_int_after_delete` AFTER DELETE ON `catalog_product_entity_int` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  `media_type` varchar(32) NOT NULL DEFAULT 'image' ,
  `disabled` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60154 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `label` varchar(255) DEFAULT NULL ,
  `position` int unsigned DEFAULT NULL ,
  `disabled` smallint unsigned NOT NULL DEFAULT '0' ,
  `record_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ROW_ID` (`row_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_VAL_ID_STORE_ID` (`row_id`,`value_id`,`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1258176 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int unsigned NOT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`,`row_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID` (`row_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `provider` varchar(32) DEFAULT NULL ,
  `url` text ,
  `title` varchar(255) DEFAULT NULL ,
  `description` text ,
  `metadata` text ,
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` mediumtext ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_ROW_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=266384 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_text_after_insert` AFTER INSERT ON `catalog_product_entity_text` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_text_after_update` AFTER UPDATE ON `catalog_product_entity_text` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_text_after_delete` AFTER DELETE ON `catalog_product_entity_text` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `all_groups` smallint unsigned NOT NULL DEFAULT '1' ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' ,
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `website_id` smallint unsigned NOT NULL ,
  `percentage_value` decimal(5,2) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EBC6A54F44DFA66FA9024CAD97FED6C7` (`row_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7138 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_tier_price_after_insert` AFTER INSERT ON `catalog_product_entity_tier_price` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_tier_price_after_update` AFTER UPDATE ON `catalog_product_entity_tier_price` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`all_groups` <=> OLD.`all_groups`) OR NOT(NEW.`customer_group_id` <=> OLD.`customer_group_id`) OR NOT(NEW.`qty` <=> OLD.`qty`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`percentage_value` <=> OLD.`percentage_value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`all_groups` <=> OLD.`all_groups`) OR NOT(NEW.`customer_group_id` <=> OLD.`customer_group_id`) OR NOT(NEW.`qty` <=> OLD.`qty`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`percentage_value` <=> OLD.`percentage_value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_tier_price_after_delete` AFTER DELETE ON `catalog_product_entity_tier_price` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ROW_ID_ATTRIBUTE_ID_STORE_ID` (`row_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ROW_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1723987 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_varchar_after_insert` AFTER INSERT ON `catalog_product_entity_varchar` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_varchar_after_update` AFTER UPDATE ON `catalog_product_entity_varchar` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = NEW.`row_id`);
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id); END IF;
IF (NOT(NEW.`value_id` <=> OLD.`value_id`) OR NOT(NEW.`attribute_id` <=> OLD.`attribute_id`) OR NOT(NEW.`store_id` <=> OLD.`store_id`) OR NOT(NEW.`value` <=> OLD.`value`) OR NOT(NEW.`row_id` <=> OLD.`row_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_entity_varchar_after_delete` AFTER DELETE ON `catalog_product_entity_varchar` FOR EACH ROW BEGIN
SET @entity_id = (SELECT `entity_id` FROM `catalog_product_entity` WHERE `row_id` = OLD.`row_id`);
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) values(@entity_id);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) values(@entity_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT ,
  `type_id` varchar(64) NOT NULL ,
  `visitor_id` int unsigned DEFAULT NULL ,
  `customer_id` int unsigned DEFAULT NULL ,
  `product_id` int unsigned NOT NULL ,
  `added_at` bigint NOT NULL ,
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` int unsigned NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` decimal(12,4) NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` decimal(12,4) NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` decimal(12,4) NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` decimal(12,4) NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` int unsigned NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` int unsigned NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `value` int unsigned NOT NULL ,
  `source_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `final_price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price_type` smallint unsigned NOT NULL ,
  `special_price` decimal(20,6) DEFAULT NULL ,
  `tier_percent` decimal(20,6) DEFAULT NULL ,
  `orig_price` decimal(20,6) DEFAULT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `base_tier` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `alt_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `alt_tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `alt_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `alt_tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `selection_id` int unsigned NOT NULL DEFAULT '0' ,
  `group_type` smallint unsigned DEFAULT '0' ,
  `is_required` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `selection_id` int unsigned NOT NULL DEFAULT '0' ,
  `group_type` smallint unsigned DEFAULT '0' ,
  `is_required` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price_type` smallint unsigned NOT NULL ,
  `special_price` decimal(20,6) DEFAULT NULL ,
  `tier_percent` decimal(20,6) DEFAULT NULL ,
  `orig_price` decimal(20,6) DEFAULT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `base_tier` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int unsigned NOT NULL ,
  `child_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int unsigned NOT NULL ,
  `child_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `orig_price` decimal(20,6) DEFAULT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `base_tier` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `orig_price` decimal(20,6) DEFAULT NULL ,
  `price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `base_tier` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `final_price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `final_price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  `tax_class_id` smallint unsigned DEFAULT '0' ,
  `price` decimal(20,6) DEFAULT NULL ,
  `final_price` decimal(20,6) DEFAULT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  `max_price` decimal(20,6) DEFAULT NULL ,
  `tier_price` decimal(20,6) DEFAULT NULL ,
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int unsigned NOT NULL ,
  `customer_group_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `min_price` decimal(20,6) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`entity_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint unsigned NOT NULL ,
  `default_store_id` smallint unsigned NOT NULL ,
  `website_date` date DEFAULT NULL ,
  `rate` float DEFAULT '1' ,
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `linked_product_id` int unsigned NOT NULL DEFAULT '0' ,
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`linked_product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_link_after_insert` AFTER INSERT ON `catalog_product_link` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_link_after_update` AFTER UPDATE ON `catalog_product_link` FOR EACH ROW BEGIN
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`linked_product_id` <=> OLD.`linked_product_id`) OR NOT(NEW.`link_type_id` <=> OLD.`link_type_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`linked_product_id` <=> OLD.`linked_product_id`) OR NOT(NEW.`link_type_id` <=> OLD.`link_type_id`)) THEN INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`linked_product_id` <=> OLD.`linked_product_id`) OR NOT(NEW.`link_type_id` <=> OLD.`link_type_id`)) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`linked_product_id` <=> OLD.`linked_product_id`) OR NOT(NEW.`link_type_id` <=> OLD.`link_type_id`)) THEN INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`linked_product_id` <=> OLD.`linked_product_id`) OR NOT(NEW.`link_type_id` <=> OLD.`link_type_id`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_link_after_delete` AFTER DELETE ON `catalog_product_link` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalog_product_attribute_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `product_link_attribute_code` varchar(32) DEFAULT NULL ,
  `data_type` varchar(32) DEFAULT NULL ,
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_link_attribute_id` smallint unsigned DEFAULT NULL ,
  `link_id` int unsigned NOT NULL ,
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_link_attribute_id` smallint unsigned DEFAULT NULL ,
  `link_id` int unsigned NOT NULL ,
  `value` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_link_attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `link_id` int unsigned NOT NULL ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `code` varchar(32) DEFAULT NULL ,
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `type` varchar(50) DEFAULT NULL ,
  `is_require` smallint NOT NULL DEFAULT '1' ,
  `sku` varchar(64) DEFAULT NULL ,
  `max_characters` int unsigned DEFAULT NULL ,
  `file_extension` varchar(50) DEFAULT NULL ,
  `image_size_x` smallint unsigned DEFAULT NULL ,
  `image_size_y` smallint unsigned DEFAULT NULL ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' ,
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `title` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_type_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' ,
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_type_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `title` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `sku` varchar(64) DEFAULT NULL ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_price_cl`
--

DROP TABLE IF EXISTS `catalog_product_price_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_price_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=812829 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int unsigned NOT NULL ,
  `child_id` int unsigned NOT NULL ,
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`child_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_RELATION_PARENT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `position` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_super_attribute_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `use_default` smallint unsigned DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `parent_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ROW_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_super_link_after_insert` AFTER INSERT ON `catalog_product_super_link` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_super_link_after_update` AFTER UPDATE ON `catalog_product_super_link` FOR EACH ROW BEGIN
IF (NOT(NEW.`link_id` <=> OLD.`link_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`parent_id` <=> OLD.`parent_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_super_link_after_delete` AFTER DELETE ON `catalog_product_super_link` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_WS_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_website_after_insert` AFTER INSERT ON `catalog_product_website` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_website_after_update` AFTER UPDATE ON `catalog_product_website` FOR EACH ROW BEGIN
IF (NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`website_id` <=> OLD.`website_id`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`website_id` <=> OLD.`website_id`)) THEN INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`website_id` <=> OLD.`website_id`)) THEN INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalog_product_website_after_delete` AFTER DELETE ON `catalog_product_website` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalog_product_category_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalogpermissions_product_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalog_search_engine`
--

DROP TABLE IF EXISTS `catalog_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_search_engine` (
  `entity_id` int unsigned NOT NULL ,
  `source_model` varchar(255) DEFAULT NULL ,
  `value` varchar(255) DEFAULT NULL ,
  `store_id` int NOT NULL ,
  `version_id` int unsigned NOT NULL ,
  UNIQUE KEY `CATALOG_SEARCH_ENGINE_ENTITY_ID_STORE_ID_SOURCE_MODEL` (`entity_id`,`store_id`,`source_model`),
  FULLTEXT KEY `CATALOG_SEARCH_ENGINE_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_search_version`
--

DROP TABLE IF EXISTS `catalog_search_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_search_version` (
  `entity_id` int unsigned NOT NULL ,
  `version_id` int unsigned NOT NULL ,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int unsigned NOT NULL ,
  `category_id` int unsigned NOT NULL ,
  `product_id` int unsigned NOT NULL ,
  PRIMARY KEY (`url_rewrite_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` (`product_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_SEQUENCE_CAT_CTGR_SEQUENCE_VAL` FOREIGN KEY (`category_id`) REFERENCES `sequence_catalog_category` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_name` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_cl`
--

DROP TABLE IF EXISTS `cataloginventory_stock_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466735 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `stock_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `qty` decimal(12,4) DEFAULT NULL ,
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `use_config_min_qty` smallint unsigned NOT NULL DEFAULT '1' ,
  `is_qty_decimal` smallint unsigned NOT NULL DEFAULT '0' ,
  `backorders` smallint unsigned NOT NULL DEFAULT '0' ,
  `use_config_backorders` smallint unsigned NOT NULL DEFAULT '1' ,
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' ,
  `use_config_min_sale_qty` smallint unsigned NOT NULL DEFAULT '1' ,
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `use_config_max_sale_qty` smallint unsigned NOT NULL DEFAULT '1' ,
  `is_in_stock` smallint unsigned NOT NULL DEFAULT '0' ,
  `low_stock_date` timestamp NULL DEFAULT NULL ,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL ,
  `use_config_notify_stock_qty` smallint unsigned NOT NULL DEFAULT '1' ,
  `manage_stock` smallint unsigned NOT NULL DEFAULT '0' ,
  `use_config_manage_stock` smallint unsigned NOT NULL DEFAULT '1' ,
  `stock_status_changed_auto` smallint unsigned NOT NULL DEFAULT '0' ,
  `use_config_qty_increments` smallint unsigned NOT NULL DEFAULT '1' ,
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `use_config_enable_qty_inc` smallint unsigned NOT NULL DEFAULT '1' ,
  `enable_qty_increments` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_decimal_divided` smallint unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `deferred_stock_update` smallint unsigned NOT NULL DEFAULT '0' ,
  `use_config_deferred_stock_update` smallint unsigned NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID` (`website_id`,`product_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_SEQUENCE_PRD_SEQUENCE_VAL` FOREIGN KEY (`product_id`) REFERENCES `sequence_product` (`sequence_value`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1577417 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_cataloginventory_stock_item_after_insert` AFTER INSERT ON `cataloginventory_stock_item` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (NEW.`product_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_cataloginventory_stock_item_after_update` AFTER UPDATE ON `cataloginventory_stock_item` FOR EACH ROW BEGIN
IF (NOT(NEW.`item_id` <=> OLD.`item_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`stock_id` <=> OLD.`stock_id`) OR NOT(NEW.`qty` <=> OLD.`qty`) OR NOT(NEW.`min_qty` <=> OLD.`min_qty`) OR NOT(NEW.`use_config_min_qty` <=> OLD.`use_config_min_qty`) OR NOT(NEW.`is_qty_decimal` <=> OLD.`is_qty_decimal`) OR NOT(NEW.`backorders` <=> OLD.`backorders`) OR NOT(NEW.`use_config_backorders` <=> OLD.`use_config_backorders`) OR NOT(NEW.`min_sale_qty` <=> OLD.`min_sale_qty`) OR NOT(NEW.`use_config_min_sale_qty` <=> OLD.`use_config_min_sale_qty`) OR NOT(NEW.`max_sale_qty` <=> OLD.`max_sale_qty`) OR NOT(NEW.`use_config_max_sale_qty` <=> OLD.`use_config_max_sale_qty`) OR NOT(NEW.`is_in_stock` <=> OLD.`is_in_stock`) OR NOT(NEW.`low_stock_date` <=> OLD.`low_stock_date`) OR NOT(NEW.`notify_stock_qty` <=> OLD.`notify_stock_qty`) OR NOT(NEW.`use_config_notify_stock_qty` <=> OLD.`use_config_notify_stock_qty`) OR NOT(NEW.`manage_stock` <=> OLD.`manage_stock`) OR NOT(NEW.`use_config_manage_stock` <=> OLD.`use_config_manage_stock`) OR NOT(NEW.`stock_status_changed_auto` <=> OLD.`stock_status_changed_auto`) OR NOT(NEW.`use_config_qty_increments` <=> OLD.`use_config_qty_increments`) OR NOT(NEW.`qty_increments` <=> OLD.`qty_increments`) OR NOT(NEW.`use_config_enable_qty_inc` <=> OLD.`use_config_enable_qty_inc`) OR NOT(NEW.`enable_qty_increments` <=> OLD.`enable_qty_increments`) OR NOT(NEW.`is_decimal_divided` <=> OLD.`is_decimal_divided`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`deferred_stock_update` <=> OLD.`deferred_stock_update`) OR NOT(NEW.`use_config_deferred_stock_update` <=> OLD.`use_config_deferred_stock_update`)) THEN INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`item_id` <=> OLD.`item_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`stock_id` <=> OLD.`stock_id`) OR NOT(NEW.`qty` <=> OLD.`qty`) OR NOT(NEW.`min_qty` <=> OLD.`min_qty`) OR NOT(NEW.`use_config_min_qty` <=> OLD.`use_config_min_qty`) OR NOT(NEW.`is_qty_decimal` <=> OLD.`is_qty_decimal`) OR NOT(NEW.`backorders` <=> OLD.`backorders`) OR NOT(NEW.`use_config_backorders` <=> OLD.`use_config_backorders`) OR NOT(NEW.`min_sale_qty` <=> OLD.`min_sale_qty`) OR NOT(NEW.`use_config_min_sale_qty` <=> OLD.`use_config_min_sale_qty`) OR NOT(NEW.`max_sale_qty` <=> OLD.`max_sale_qty`) OR NOT(NEW.`use_config_max_sale_qty` <=> OLD.`use_config_max_sale_qty`) OR NOT(NEW.`is_in_stock` <=> OLD.`is_in_stock`) OR NOT(NEW.`low_stock_date` <=> OLD.`low_stock_date`) OR NOT(NEW.`notify_stock_qty` <=> OLD.`notify_stock_qty`) OR NOT(NEW.`use_config_notify_stock_qty` <=> OLD.`use_config_notify_stock_qty`) OR NOT(NEW.`manage_stock` <=> OLD.`manage_stock`) OR NOT(NEW.`use_config_manage_stock` <=> OLD.`use_config_manage_stock`) OR NOT(NEW.`stock_status_changed_auto` <=> OLD.`stock_status_changed_auto`) OR NOT(NEW.`use_config_qty_increments` <=> OLD.`use_config_qty_increments`) OR NOT(NEW.`qty_increments` <=> OLD.`qty_increments`) OR NOT(NEW.`use_config_enable_qty_inc` <=> OLD.`use_config_enable_qty_inc`) OR NOT(NEW.`enable_qty_increments` <=> OLD.`enable_qty_increments`) OR NOT(NEW.`is_decimal_divided` <=> OLD.`is_decimal_divided`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`deferred_stock_update` <=> OLD.`deferred_stock_update`) OR NOT(NEW.`use_config_deferred_stock_update` <=> OLD.`use_config_deferred_stock_update`)) THEN INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
IF (NOT(NEW.`item_id` <=> OLD.`item_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`stock_id` <=> OLD.`stock_id`) OR NOT(NEW.`qty` <=> OLD.`qty`) OR NOT(NEW.`min_qty` <=> OLD.`min_qty`) OR NOT(NEW.`use_config_min_qty` <=> OLD.`use_config_min_qty`) OR NOT(NEW.`is_qty_decimal` <=> OLD.`is_qty_decimal`) OR NOT(NEW.`backorders` <=> OLD.`backorders`) OR NOT(NEW.`use_config_backorders` <=> OLD.`use_config_backorders`) OR NOT(NEW.`min_sale_qty` <=> OLD.`min_sale_qty`) OR NOT(NEW.`use_config_min_sale_qty` <=> OLD.`use_config_min_sale_qty`) OR NOT(NEW.`max_sale_qty` <=> OLD.`max_sale_qty`) OR NOT(NEW.`use_config_max_sale_qty` <=> OLD.`use_config_max_sale_qty`) OR NOT(NEW.`is_in_stock` <=> OLD.`is_in_stock`) OR NOT(NEW.`low_stock_date` <=> OLD.`low_stock_date`) OR NOT(NEW.`notify_stock_qty` <=> OLD.`notify_stock_qty`) OR NOT(NEW.`use_config_notify_stock_qty` <=> OLD.`use_config_notify_stock_qty`) OR NOT(NEW.`manage_stock` <=> OLD.`manage_stock`) OR NOT(NEW.`use_config_manage_stock` <=> OLD.`use_config_manage_stock`) OR NOT(NEW.`stock_status_changed_auto` <=> OLD.`stock_status_changed_auto`) OR NOT(NEW.`use_config_qty_increments` <=> OLD.`use_config_qty_increments`) OR NOT(NEW.`qty_increments` <=> OLD.`qty_increments`) OR NOT(NEW.`use_config_enable_qty_inc` <=> OLD.`use_config_enable_qty_inc`) OR NOT(NEW.`enable_qty_increments` <=> OLD.`enable_qty_increments`) OR NOT(NEW.`is_decimal_divided` <=> OLD.`is_decimal_divided`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`deferred_stock_update` <=> OLD.`deferred_stock_update`) OR NOT(NEW.`use_config_deferred_stock_update` <=> OLD.`use_config_deferred_stock_update`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_cataloginventory_stock_item_after_delete` AFTER DELETE ON `cataloginventory_stock_item` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogsearch_fulltext_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `cataloginventory_stock_cl` (`entity_id`) VALUES (OLD.`product_id`);
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_id` smallint unsigned NOT NULL ,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `stock_status` smallint unsigned NOT NULL ,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_id` smallint unsigned NOT NULL ,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `stock_status` smallint unsigned NOT NULL ,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_id` smallint unsigned NOT NULL ,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `stock_status` smallint unsigned NOT NULL ,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `stock_id` smallint unsigned NOT NULL ,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  `stock_status` smallint unsigned NOT NULL ,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogpermissions_category_cl`
--

DROP TABLE IF EXISTS `catalogpermissions_category_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogpermissions_category_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25575 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogpermissions_product_cl`
--

DROP TABLE IF EXISTS `catalogpermissions_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogpermissions_product_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20952 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule` (
  `rule_id` int unsigned NOT NULL ,
  `name` varchar(255) DEFAULT NULL ,
  `description` text ,
  `from_date` date DEFAULT NULL ,
  `to_date` date DEFAULT NULL ,
  `is_active` smallint NOT NULL DEFAULT '0' ,
  `conditions_serialized` mediumtext ,
  `actions_serialized` mediumtext ,
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  `simple_action` varchar(32) DEFAULT NULL ,
  `discount_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `row_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `created_in` bigint unsigned NOT NULL DEFAULT '1' ,
  `updated_in` bigint unsigned NOT NULL DEFAULT '2147483647' ,
  PRIMARY KEY (`row_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`),
  KEY `CATALOGRULE_RULE_ID` (`rule_id`),
  KEY `CATALOGRULE_CREATED_IN` (`created_in`),
  KEY `CATALOGRULE_UPDATED_IN` (`updated_in`),
  CONSTRAINT `CATALOGRULE_RULE_ID_SEQUENCE_CATALOGRULE_SEQUENCE_VALUE` FOREIGN KEY (`rule_id`) REFERENCES `sequence_catalogrule` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_after_insert` AFTER INSERT ON `catalogrule` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogrule_rule_cl` (`entity_id`) VALUES (NEW.`rule_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_after_update` AFTER UPDATE ON `catalogrule` FOR EACH ROW BEGIN
IF (NOT(NEW.`rule_id` <=> OLD.`rule_id`) OR NOT(NEW.`name` <=> OLD.`name`) OR NOT(NEW.`description` <=> OLD.`description`) OR NOT(NEW.`from_date` <=> OLD.`from_date`) OR NOT(NEW.`to_date` <=> OLD.`to_date`) OR NOT(NEW.`is_active` <=> OLD.`is_active`) OR NOT(NEW.`conditions_serialized` <=> OLD.`conditions_serialized`) OR NOT(NEW.`actions_serialized` <=> OLD.`actions_serialized`) OR NOT(NEW.`stop_rules_processing` <=> OLD.`stop_rules_processing`) OR NOT(NEW.`sort_order` <=> OLD.`sort_order`) OR NOT(NEW.`simple_action` <=> OLD.`simple_action`) OR NOT(NEW.`discount_amount` <=> OLD.`discount_amount`) OR NOT(NEW.`row_id` <=> OLD.`row_id`) OR NOT(NEW.`created_in` <=> OLD.`created_in`) OR NOT(NEW.`updated_in` <=> OLD.`updated_in`)) THEN INSERT IGNORE INTO `catalogrule_rule_cl` (`entity_id`) VALUES (NEW.`rule_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_after_delete` AFTER DELETE ON `catalogrule` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalogrule_rule_cl` (`entity_id`) VALUES (OLD.`rule_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_customer_group` (
  `customer_group_id` int unsigned NOT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`row_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_ROW_ID_CATALOGRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalogrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `catalogrule_group_website_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' ,
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `rule_id` int unsigned NOT NULL DEFAULT '0' ,
  `from_time` int unsigned NOT NULL DEFAULT '0' ,
  `to_time` int unsigned NOT NULL DEFAULT '0' ,
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `action_operator` varchar(10) DEFAULT 'to_fixed' ,
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `action_stop` smallint NOT NULL DEFAULT '0' ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product_cl`
--

DROP TABLE IF EXISTS `catalogrule_product_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1198253 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `rule_date` date NOT NULL ,
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `website_id` smallint unsigned NOT NULL ,
  `latest_start_date` date DEFAULT NULL ,
  `earliest_end_date` date DEFAULT NULL ,
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_product_price_after_insert` AFTER INSERT ON `catalogrule_product_price` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_product_price_after_update` AFTER UPDATE ON `catalogrule_product_price` FOR EACH ROW BEGIN
IF (NOT(NEW.`rule_product_price_id` <=> OLD.`rule_product_price_id`) OR NOT(NEW.`rule_date` <=> OLD.`rule_date`) OR NOT(NEW.`customer_group_id` <=> OLD.`customer_group_id`) OR NOT(NEW.`product_id` <=> OLD.`product_id`) OR NOT(NEW.`rule_price` <=> OLD.`rule_price`) OR NOT(NEW.`website_id` <=> OLD.`website_id`) OR NOT(NEW.`latest_start_date` <=> OLD.`latest_start_date`) OR NOT(NEW.`earliest_end_date` <=> OLD.`earliest_end_date`)) THEN INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (NEW.`product_id`); END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mohamad`@`localhost`*/ /*!50003 TRIGGER `trg_catalogrule_product_price_after_delete` AFTER DELETE ON `catalogrule_product_price` FOR EACH ROW BEGIN
INSERT IGNORE INTO `catalog_product_price_cl` (`entity_id`) VALUES (OLD.`product_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `rule_date` date NOT NULL ,
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `website_id` smallint unsigned NOT NULL ,
  `latest_start_date` date DEFAULT NULL ,
  `earliest_end_date` date DEFAULT NULL ,
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_product_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `rule_id` int unsigned NOT NULL DEFAULT '0' ,
  `from_time` int unsigned NOT NULL DEFAULT '0' ,
  `to_time` int unsigned NOT NULL DEFAULT '0' ,
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `action_operator` varchar(10) DEFAULT 'to_fixed' ,
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  `action_stop` smallint NOT NULL DEFAULT '0' ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_rule_cl`
--

DROP TABLE IF EXISTS `catalogrule_rule_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_rule_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_website` (
  `website_id` smallint unsigned NOT NULL ,
  `row_id` int unsigned NOT NULL ,
  PRIMARY KEY (`row_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_ROW_ID_CATALOGRULE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `catalogrule` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_fulltext_cl`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogsearch_fulltext_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1450624 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `catalogsearch_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogsearch_recommendations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `query_id` int unsigned NOT NULL DEFAULT '0' ,
  `relation_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`),
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `name` varchar(255) DEFAULT NULL ,
  `content` text ,
  `content_height` varchar(25) DEFAULT NULL ,
  `checkbox_text` text ,
  `is_active` smallint NOT NULL DEFAULT '0' ,
  `is_html` smallint NOT NULL DEFAULT '0' ,
  `mode` smallint NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_block` (
  `block_id` smallint NOT NULL ,
  `title` varchar(255) NOT NULL ,
  `identifier` varchar(255) NOT NULL ,
  `content` mediumtext ,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `is_active` smallint NOT NULL DEFAULT '1' ,
  `row_id` smallint NOT NULL AUTO_INCREMENT ,
  `created_in` bigint unsigned NOT NULL DEFAULT '1' ,
  `updated_in` bigint unsigned NOT NULL DEFAULT '2147483647' ,
  PRIMARY KEY (`row_id`),
  KEY `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE` (`block_id`),
  KEY `CMS_BLOCK_IDENTIFIER` (`identifier`),
  KEY `CMS_BLOCK_CREATED_IN` (`created_in`),
  KEY `CMS_BLOCK_UPDATED_IN` (`updated_in`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`),
  CONSTRAINT `CMS_BLOCK_BLOCK_ID_SEQUENCE_CMS_BLOCK_SEQUENCE_VALUE` FOREIGN KEY (`block_id`) REFERENCES `sequence_cms_block` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_block_store` (
  `store_id` smallint unsigned NOT NULL ,
  `row_id` smallint NOT NULL ,
  PRIMARY KEY (`row_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_ROW_ID_CMS_BLOCK_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `cms_block` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page` (
  `page_id` smallint NOT NULL ,
  `title` varchar(255) DEFAULT NULL ,
  `page_layout` varchar(255) DEFAULT NULL ,
  `meta_keywords` text ,
  `meta_description` text ,
  `identifier` varchar(100) DEFAULT NULL ,
  `content_heading` varchar(255) DEFAULT NULL ,
  `content` mediumtext ,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `is_active` smallint NOT NULL DEFAULT '1' ,
  `sort_order` smallint NOT NULL DEFAULT '0' ,
  `layout_update_xml` text ,
  `custom_theme` varchar(100) DEFAULT NULL ,
  `custom_root_template` varchar(255) DEFAULT NULL ,
  `custom_layout_update_xml` text ,
  `layout_update_selected` varchar(128) DEFAULT NULL ,
  `custom_theme_from` date DEFAULT NULL ,
  `custom_theme_to` date DEFAULT NULL ,
  `meta_title` varchar(255) DEFAULT NULL ,
  `website_root` smallint unsigned NOT NULL DEFAULT '1' ,
  `row_id` smallint NOT NULL AUTO_INCREMENT ,
  `created_in` bigint unsigned NOT NULL DEFAULT '1' ,
  `updated_in` bigint unsigned NOT NULL DEFAULT '2147483647' ,
  PRIMARY KEY (`row_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  KEY `CMS_PAGE_PAGE_ID` (`page_id`),
  KEY `CMS_PAGE_CREATED_IN` (`created_in`),
  KEY `CMS_PAGE_UPDATED_IN` (`updated_in`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`),
  CONSTRAINT `CMS_PAGE_PAGE_ID_SEQUENCE_CMS_PAGE_SEQUENCE_VALUE` FOREIGN KEY (`page_id`) REFERENCES `sequence_cms_page` (`sequence_value`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_store` (
  `store_id` smallint unsigned NOT NULL ,
  `row_id` smallint NOT NULL ,
  PRIMARY KEY (`row_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_ROW_ID_CMS_PAGE_ROW_ID` FOREIGN KEY (`row_id`) REFERENCES `cms_page` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `status` smallint unsigned NOT NULL DEFAULT '0' ,
  `company_name` varchar(40) DEFAULT NULL ,
  `legal_name` varchar(80) DEFAULT NULL ,
  `company_email` varchar(255) DEFAULT NULL ,
  `vat_tax_id` varchar(40) DEFAULT NULL ,
  `reseller_id` varchar(40) DEFAULT NULL ,
  `,
  `street` varchar(40) DEFAULT NULL ,
  `city` varchar(40) DEFAULT NULL ,
  `country_id` varchar(2) DEFAULT NULL ,
  `region` varchar(40) DEFAULT NULL ,
  `region_id` int unsigned DEFAULT NULL ,
  `postcode` varchar(30) DEFAULT NULL ,
  `telephone` varchar(20) DEFAULT NULL ,
  `customer_group_id` int unsigned DEFAULT NULL ,
  `sales_representative_id` int unsigned DEFAULT NULL ,
  `super_user_id` int unsigned DEFAULT NULL ,
  `reject_reason` text ,
  `rejected_at` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `COMPANY_CUSTOMER_GROUP_ID_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `COMPANY_SALES_REPRESENTATIVE_ID_ADMIN_USER_USER_ID` (`sales_representative_id`),
  KEY `COMPANY_COUNTRY_ID` (`country_id`),
  KEY `COMPANY_REGION_ID` (`region_id`),
  FULLTEXT KEY `COMPANY_COMPANY_NAME_LEGAL_NAME` (`company_name`,`legal_name`),
  CONSTRAINT `COMPANY_COUNTRY_ID_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country_id`) REFERENCES `directory_country` (`country_id`) ON DELETE SET NULL,
  CONSTRAINT `COMPANY_CUSTOMER_GROUP_ID_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE SET NULL,
  CONSTRAINT `COMPANY_REGION_ID_DIRECTORY_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE SET NULL,
  CONSTRAINT `COMPANY_SALES_REPRESENTATIVE_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`sales_representative_id`) REFERENCES `admin_user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_advanced_customer_entity`
--

DROP TABLE IF EXISTS `company_advanced_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_advanced_customer_entity` (
  `customer_id` int unsigned NOT NULL ,
  `company_id` int unsigned NOT NULL ,
  `job_title` text ,
  `status` smallint unsigned NOT NULL DEFAULT '1' ,
  `telephone` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`customer_id`),
  KEY `COMPANY_ADVANCED_CUSTOMER_ENTITY_STATUS` (`status`),
  CONSTRAINT `COMPANY_ADVANCED_CSTR_ENTT_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_credit`
--

DROP TABLE IF EXISTS `company_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_credit` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `company_id` int unsigned NOT NULL ,
  `credit_limit` decimal(20,4) unsigned DEFAULT NULL ,
  `balance` decimal(20,4) NOT NULL DEFAULT '0.0000' ,
  `currency_code` varchar(3) NOT NULL DEFAULT '' ,
  `exceed_limit` smallint NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_id`),
  KEY `COMPANY_CREDIT_COMPANY_ID` (`company_id`),
  CONSTRAINT `COMPANY_CREDIT_COMPANY_ID_COMPANY_ENTITY_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_credit_history`
--

DROP TABLE IF EXISTS `company_credit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_credit_history` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `company_credit_id` int unsigned NOT NULL ,
  `user_id` int unsigned DEFAULT NULL ,
  `user_type` int NOT NULL DEFAULT '0' ,
  `currency_credit` varchar(3) NOT NULL ,
  `currency_operation` varchar(3) NOT NULL ,
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' ,
  `rate_credit` decimal(24,12) DEFAULT '0.000000000000' ,
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' ,
  `balance` decimal(20,4) NOT NULL DEFAULT '0.0000' ,
  `credit_limit` decimal(20,4) NOT NULL DEFAULT '0.0000' ,
  `available_credit` decimal(20,4) NOT NULL DEFAULT '0.0000' ,
  `type` int NOT NULL DEFAULT '0' ,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `purchase_order` varchar(60) DEFAULT NULL ,
  `custom_reference_number` varchar(60) DEFAULT NULL ,
  `,
  PRIMARY KEY (`entity_id`),
  KEY `COMPANY_CREDIT_HISTORY_COMPANY_CREDIT_ID` (`company_credit_id`),
  CONSTRAINT `COMPANY_CREDIT_HISTORY_COMPANY_CREDIT_ID_COMPANY_CREDIT_ENTT_ID` FOREIGN KEY (`company_credit_id`) REFERENCES `company_credit` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_order_entity`
--

DROP TABLE IF EXISTS `company_order_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_order_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `order_id` int unsigned NOT NULL ,
  `company_id` int unsigned DEFAULT NULL ,
  `company_name` varchar(40) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `COMPANY_ORDER_ENTITY_ENTITY_ID` (`entity_id`),
  UNIQUE KEY `COMPANY_ORDER_ENTITY_ORDER_ID` (`order_id`),
  CONSTRAINT `COMPANY_ORDER_ENTITY_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_payment`
--

DROP TABLE IF EXISTS `company_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_payment` (
  `company_id` int unsigned NOT NULL ,
  `applicable_payment_method` smallint unsigned NOT NULL DEFAULT '0' ,
  `available_payment_methods` text ,
  `use_config_settings` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`company_id`),
  KEY `COMPANY_PAYMENT_COMPANY_ID` (`company_id`),
  CONSTRAINT `COMPANY_PAYMENT_COMPANY_ID_COMPANY_ENTITY_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_permissions`
--

DROP TABLE IF EXISTS `company_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT ,
  `role_id` int unsigned NOT NULL ,
  `resource_id` varchar(80) DEFAULT NULL ,
  `permission` varchar(80) DEFAULT NULL ,
  PRIMARY KEY (`permission_id`),
  KEY `COMPANY_PERMISSIONS_ROLE_ID` (`role_id`),
  CONSTRAINT `COMPANY_PERMISSIONS_ROLE_ID_COMPANY_ROLES_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `company_roles` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10302 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_roles`
--

DROP TABLE IF EXISTS `company_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_roles` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `sort_order` int unsigned NOT NULL ,
  `role_name` varchar(40) DEFAULT NULL ,
  `company_id` int unsigned NOT NULL ,
  PRIMARY KEY (`role_id`),
  KEY `COMPANY_ROLES_COMPANY_ID` (`company_id`),
  CONSTRAINT `COMPANY_ROLES_COMPANY_ID_COMPANY_ENTITY_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_shipping`
--

DROP TABLE IF EXISTS `company_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_shipping` (
  `company_id` int unsigned NOT NULL ,
  `applicable_shipping_method` smallint unsigned NOT NULL DEFAULT '0' ,
  `available_shipping_methods` text ,
  `use_config_settings` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`company_id`),
  CONSTRAINT `COMPANY_SHIPPING_COMPANY_ID_COMPANY_ENTITY_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_structure`
--

DROP TABLE IF EXISTS `company_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_structure` (
  `structure_id` int NOT NULL AUTO_INCREMENT ,
  `parent_id` int unsigned NOT NULL ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `entity_type` smallint unsigned NOT NULL DEFAULT '0' ,
  `path` varchar(255) NOT NULL ,
  `position` int NOT NULL ,
  `level` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`structure_id`),
  KEY `COMPANY_STRUCTURE_PARENT_ID` (`parent_id`),
  KEY `COMPANY_STRUCTURE_ENTITY_ID` (`entity_id`),
  KEY `COMPANY_STRUCTURE_ENTITY_TYPE` (`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=54562 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_team`
--

DROP TABLE IF EXISTS `company_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_team` (
  `team_id` int NOT NULL AUTO_INCREMENT ,
  `name` varchar(40) DEFAULT NULL ,
  `description` text ,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_user_roles`
--

DROP TABLE IF EXISTS `company_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_user_roles` (
  `user_role_id` int NOT NULL AUTO_INCREMENT ,
  `role_id` int unsigned NOT NULL ,
  `user_id` int unsigned NOT NULL ,
  PRIMARY KEY (`user_role_id`),
  KEY `COMPANY_USER_ROLES_ROLE_ID` (`role_id`),
  KEY `COMPANY_USER_ROLES_USER_ID` (`user_id`),
  CONSTRAINT `COMPANY_USER_ROLES_ROLE_ID_COMPANY_ROLES_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `company_roles` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `COMPANY_USER_ROLES_USER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`user_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config_data` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `scope` varchar(8) NOT NULL DEFAULT 'default' ,
  `scope_id` int NOT NULL DEFAULT '0' ,
  `path` varchar(255) NOT NULL DEFAULT 'general' ,
  `value` text ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2855 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `job_code` varchar(255) NOT NULL DEFAULT '0' ,
  `status` varchar(7) NOT NULL DEFAULT 'pending' ,
  `messages` text ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `scheduled_at` timestamp NULL DEFAULT NULL ,
  `executed_at` timestamp NULL DEFAULT NULL ,
  `finished_at` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE_STATUS_SCHEDULED_AT` (`job_code`,`status`,`scheduled_at`)
) ENGINE=InnoDB AUTO_INCREMENT=46618106 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `increment_id` varchar(50) DEFAULT NULL ,
  `parent_id` int unsigned DEFAULT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `is_active` smallint unsigned NOT NULL DEFAULT '1' ,
  `city` varchar(255) NOT NULL ,
  `company` varchar(255) DEFAULT NULL ,
  `country_id` varchar(255) NOT NULL ,
  `fax` varchar(255) DEFAULT NULL ,
  `firstname` varchar(255) NOT NULL ,
  `lastname` varchar(255) NOT NULL ,
  `middlename` varchar(255) DEFAULT NULL ,
  `postcode` varchar(255) DEFAULT NULL ,
  `prefix` varchar(40) DEFAULT NULL ,
  `region` varchar(255) DEFAULT NULL ,
  `region_id` int unsigned DEFAULT NULL ,
  `street` text NOT NULL ,
  `suffix` varchar(40) DEFAULT NULL ,
  `telephone` varchar(255) NOT NULL ,
  `vat_id` varchar(255) DEFAULT NULL ,
  `vat_is_valid` int unsigned DEFAULT NULL ,
  `vat_request_date` varchar(255) DEFAULT NULL ,
  `vat_request_id` varchar(255) DEFAULT NULL ,
  `vat_request_success` int unsigned DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77692 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` datetime DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14791 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` text NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=390658 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_dummy_cl`
--

DROP TABLE IF EXISTS `customer_dummy_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_dummy_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL ,
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' ,
  `input_filter` varchar(255) DEFAULT NULL ,
  `multiline_count` smallint unsigned NOT NULL DEFAULT '1' ,
  `validate_rules` text ,
  `is_system` smallint unsigned NOT NULL DEFAULT '0' ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  `data_model` varchar(255) DEFAULT NULL ,
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_searchable_in_grid` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_used_for_customer_segment` int unsigned NOT NULL DEFAULT '0' ,
  `grid_filter_condition_type` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`attribute_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER` (`sort_order`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  `is_visible` smallint unsigned DEFAULT NULL ,
  `is_required` smallint unsigned DEFAULT NULL ,
  `default_value` text ,
  `multiline_count` smallint unsigned DEFAULT NULL ,
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `website_id` smallint unsigned DEFAULT NULL ,
  `email` varchar(255) DEFAULT NULL ,
  `group_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `increment_id` varchar(50) DEFAULT NULL ,
  `store_id` smallint unsigned DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `is_active` smallint unsigned NOT NULL DEFAULT '1' ,
  `disable_auto_group_change` smallint unsigned NOT NULL DEFAULT '0' ,
  `created_in` varchar(255) DEFAULT NULL ,
  `prefix` varchar(40) DEFAULT NULL ,
  `firstname` varchar(255) DEFAULT NULL ,
  `middlename` varchar(255) DEFAULT NULL ,
  `lastname` varchar(255) DEFAULT NULL ,
  `suffix` varchar(40) DEFAULT NULL ,
  `dob` date DEFAULT NULL ,
  `password_hash` varchar(128) DEFAULT NULL ,
  `rp_token` varchar(128) DEFAULT NULL ,
  `rp_token_created_at` datetime DEFAULT NULL ,
  `default_billing` int unsigned DEFAULT NULL ,
  `default_shipping` int unsigned DEFAULT NULL ,
  `taxvat` varchar(50) DEFAULT NULL ,
  `confirmation` varchar(64) DEFAULT NULL ,
  `gender` smallint unsigned DEFAULT NULL ,
  `failures_num` smallint DEFAULT '0' ,
  `first_failure` timestamp NULL DEFAULT NULL ,
  `lock_expires` timestamp NULL DEFAULT NULL ,
  `session_cutoff` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  KEY `CUSTOMER_ENTITY_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_ENTITY_DOB` (`dob`),
  KEY `CUSTOMER_ENTITY_DEFAULT_BILLING` (`default_billing`),
  KEY `CUSTOMER_ENTITY_DEFAULT_SHIPPING` (`default_shipping`),
  KEY `CUSTOMER_ENTITY_GENDER` (`gender`),
  KEY `CUSTOMER_ENTITY_GROUP_ID` (`group_id`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4045195 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` datetime DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66499 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2278516 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` text NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2308672 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_grid_flat`
--

DROP TABLE IF EXISTS `customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_grid_flat` (
  `entity_id` int unsigned NOT NULL ,
  `name` text ,
  `email` varchar(255) DEFAULT NULL ,
  `group_id` int DEFAULT NULL ,
  `created_at` timestamp NULL DEFAULT NULL ,
  `website_id` int DEFAULT NULL ,
  `confirmation` varchar(255) DEFAULT NULL ,
  `created_in` text ,
  `dob` date DEFAULT NULL ,
  `gender` int DEFAULT NULL ,
  `taxvat` varchar(255) DEFAULT NULL ,
  `lock_expires` timestamp NULL DEFAULT NULL ,
  `commerce_license` varchar(255) DEFAULT NULL ,
  `phone_verified` int DEFAULT NULL ,
  `shipping_full` text ,
  `billing_full` text ,
  `billing_firstname` varchar(255) DEFAULT NULL ,
  `billing_lastname` varchar(255) DEFAULT NULL ,
  `billing_telephone` varchar(255) DEFAULT NULL ,
  `billing_postcode` varchar(255) DEFAULT NULL ,
  `billing_country_id` varchar(255) DEFAULT NULL ,
  `billing_region` varchar(255) DEFAULT NULL ,
  `billing_region_id` int DEFAULT NULL ,
  `billing_street` varchar(255) DEFAULT NULL ,
  `billing_city` varchar(255) DEFAULT NULL ,
  `billing_fax` varchar(255) DEFAULT NULL ,
  `billing_vat_id` varchar(255) DEFAULT NULL ,
  `billing_company` varchar(255) DEFAULT NULL ,
  `billing_block_number` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_6FEA43650752774282BEE98EAADA8B3C` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`,`billing_block_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group` (
  `customer_group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL ,
  `tax_class_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_group_excluded_website`
--

DROP TABLE IF EXISTS `customer_group_excluded_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group_excluded_website` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int unsigned NOT NULL ,
  `website_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GROUP_EXCLUDED_WEBSITE_CUSTOMER_GROUP_ID_WEBSITE_ID` (`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT ,
  `customer_id` int NOT NULL ,
  `last_login_at` timestamp NULL DEFAULT NULL ,
  `last_logout_at` timestamp NULL DEFAULT NULL ,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64256 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_visitor`
--

DROP TABLE IF EXISTS `customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_visitor` (
  `visitor_id` bigint unsigned NOT NULL AUTO_INCREMENT ,
  `customer_id` int DEFAULT NULL ,
  `session_id` varchar(1) DEFAULT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=66093 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_change` (
  `design_change_id` int NOT NULL AUTO_INCREMENT ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `design` varchar(255) DEFAULT NULL ,
  `date_from` date DEFAULT NULL ,
  `date_to` date DEFAULT NULL ,
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `design_config_dummy_cl`
--

DROP TABLE IF EXISTS `design_config_dummy_cl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_config_dummy_cl` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `design_config_grid_flat`
--

DROP TABLE IF EXISTS `design_config_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_config_grid_flat` (
  `entity_id` int unsigned NOT NULL ,
  `store_website_id` int DEFAULT NULL ,
  `store_group_id` int DEFAULT NULL ,
  `store_id` int DEFAULT NULL ,
  `theme_theme_id` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL ,
  `iso2_code` varchar(2) DEFAULT NULL ,
  `iso3_code` varchar(3) DEFAULT NULL ,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `country_id` varchar(2) DEFAULT NULL ,
  `type` varchar(30) DEFAULT NULL ,
  `format` text NOT NULL ,
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_region` (
  `region_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `country_id` varchar(4) NOT NULL DEFAULT '0' ,
  `code` varchar(32) DEFAULT NULL ,
  `default_name` varchar(255) DEFAULT NULL ,
  `visibility` int unsigned NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`),
  FULLTEXT KEY `DIRECTORY_COUNTRY_REGION_DEFAULT_NAME` (`default_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2353 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(16) NOT NULL ,
  `region_id` int unsigned NOT NULL DEFAULT '0' ,
  `name` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL ,
  `currency_to` varchar(3) NOT NULL ,
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' ,
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district_myfatoorah_order_payment_url`
--

DROP TABLE IF EXISTS `district_myfatoorah_order_payment_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_myfatoorah_order_payment_url` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `payment_url` text NOT NULL ,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `FK_868C0E3B9593DF79188634BFA3D9247C` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=288908 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district_productmatchmaker_tree`
--

DROP TABLE IF EXISTS `district_productmatchmaker_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district_productmatchmaker_tree` (
  `id` int unsigned NOT NULL AUTO_INCREMENT ,
  `tree` text ,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  `number_of_downloads` int DEFAULT NULL ,
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' ,
  `link_url` varchar(255) DEFAULT NULL ,
  `link_file` varchar(255) DEFAULT NULL ,
  `link_type` varchar(20) DEFAULT NULL ,
  `sample_url` varchar(255) DEFAULT NULL ,
  `sample_file` varchar(255) DEFAULT NULL ,
  `sample_type` varchar(20) DEFAULT NULL ,
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `link_id` int unsigned NOT NULL DEFAULT '0' ,
  `website_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' ,
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `order_id` int unsigned DEFAULT '0' ,
  `order_increment_id` varchar(50) DEFAULT NULL ,
  `order_item_id` int unsigned NOT NULL DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `customer_id` int unsigned DEFAULT '0' ,
  `product_name` varchar(255) DEFAULT NULL ,
  `product_sku` varchar(255) DEFAULT NULL ,
  `link_section_title` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `purchased_id` int unsigned NOT NULL DEFAULT '0' ,
  `order_item_id` int unsigned DEFAULT '0' ,
  `product_id` int unsigned DEFAULT '0' ,
  `link_hash` varchar(255) DEFAULT NULL ,
  `number_of_downloads_bought` int unsigned NOT NULL DEFAULT '0' ,
  `number_of_downloads_used` int unsigned NOT NULL DEFAULT '0' ,
  `link_id` int unsigned NOT NULL DEFAULT '0' ,
  `link_title` varchar(255) DEFAULT NULL ,
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' ,
  `link_url` varchar(255) DEFAULT NULL ,
  `link_file` varchar(255) DEFAULT NULL ,
  `link_type` varchar(255) DEFAULT NULL ,
  `status` varchar(50) DEFAULT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `link_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `title` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `product_id` int unsigned NOT NULL DEFAULT '0' ,
  `sample_url` varchar(255) DEFAULT NULL ,
  `sample_file` varchar(255) DEFAULT NULL ,
  `sample_type` varchar(20) DEFAULT NULL ,
  `sort_order` int unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ROW_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `sample_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `title` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_code` varchar(255) NOT NULL ,
  `attribute_model` varchar(255) DEFAULT NULL ,
  `backend_model` varchar(255) DEFAULT NULL ,
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' ,
  `backend_table` varchar(255) DEFAULT NULL ,
  `frontend_model` varchar(255) DEFAULT NULL ,
  `frontend_input` varchar(50) DEFAULT NULL ,
  `frontend_label` varchar(255) DEFAULT NULL ,
  `frontend_class` varchar(255) DEFAULT NULL ,
  `source_model` varchar(255) DEFAULT NULL ,
  `is_required` smallint unsigned NOT NULL DEFAULT '0' ,
  `is_user_defined` smallint unsigned NOT NULL DEFAULT '0' ,
  `default_value` text ,
  `is_unique` smallint unsigned NOT NULL DEFAULT '0' ,
  `note` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED` (`frontend_input`,`entity_type_id`,`is_user_defined`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_group_name` varchar(255) DEFAULT NULL ,
  `sort_order` smallint NOT NULL DEFAULT '0' ,
  `default_id` smallint unsigned DEFAULT '0' ,
  `attribute_group_code` varchar(255) NOT NULL ,
  `tab_group_code` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `type` smallint unsigned NOT NULL ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `option_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86634 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_set_name` varchar(255) DEFAULT NULL ,
  `sort_order` smallint NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `increment_id` varchar(50) DEFAULT NULL ,
  `parent_id` int unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `is_active` smallint unsigned NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_group_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `sort_order` smallint NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18741 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` datetime DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `increment_prefix` varchar(20) DEFAULT NULL ,
  `increment_last_id` varchar(50) DEFAULT NULL ,
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` text NOT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `entity_type_code` varchar(50) NOT NULL ,
  `entity_model` varchar(255) NOT NULL ,
  `attribute_model` varchar(255) DEFAULT NULL ,
  `entity_table` varchar(255) DEFAULT NULL ,
  `value_table_prefix` varchar(255) DEFAULT NULL ,
  `entity_id_field` varchar(255) DEFAULT NULL ,
  `is_data_sharing` smallint unsigned NOT NULL DEFAULT '1' ,
  `data_sharing_key` varchar(100) DEFAULT 'default' ,
  `default_attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `increment_model` varchar(255) DEFAULT NULL ,
  `increment_per_store` smallint unsigned NOT NULL DEFAULT '0' ,
  `increment_pad_length` smallint unsigned NOT NULL DEFAULT '8' ,
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' ,
  `additional_attribute_table` varchar(255) DEFAULT NULL ,
  `entity_attribute_collection` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT ,
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `store_id` smallint unsigned NOT NULL DEFAULT '0' ,
  `entity_id` int unsigned NOT NULL DEFAULT '0' ,
  `value` varchar(255) DEFAULT NULL ,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_element` (
  `element_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `type_id` smallint unsigned NOT NULL ,
  `fieldset_id` smallint unsigned DEFAULT NULL ,
  `attribute_id` smallint unsigned NOT NULL ,
  `sort_order` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `type_id` smallint unsigned NOT NULL ,
  `code` varchar(64) NOT NULL ,
  `sort_order` int NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint unsigned NOT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  `label` varchar(255) NOT NULL ,
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint unsigned NOT NULL AUTO_INCREMENT ,
  `code` varchar(64) NOT NULL ,
  `label` varchar(255) NOT NULL ,
  `is_system` smallint unsigned NOT NULL DEFAULT '0' ,
  `theme` varchar(64) DEFAULT NULL ,
  `store_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint unsigned NOT NULL ,
  `entity_type_id` smallint unsigned NOT NULL ,
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT ,
  `template_code` varchar(150) NOT NULL ,
  `template_text` text NOT NULL ,
  `template_styles` text ,
  `template_type` int unsigned DEFAULT NULL ,
  `template_subject` varchar(200) NOT NULL ,
  `template_sender_name` varchar(200) DEFAULT NULL ,
  `template_sender_email` varchar(200) DEFAULT NULL ,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `orig_template_code` varchar(200) DEFAULT NULL ,
  `orig_template_variables` text ,
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 ,
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facebook_business_extension_config`
--

