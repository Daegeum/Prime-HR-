-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2026 at 07:15 AM
-- Server version: 8.0.44-0ubuntu0.22.04.1
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prime-hr`
--
CREATE DATABASE IF NOT EXISTS `prime-hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prime-hr`;

-- --------------------------------------------------------

--
-- Table structure for table `accomplishment_reports`
--

CREATE TABLE `accomplishment_reports` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `report_type` enum('Monthly','Quarterly','Annual') COLLATE utf8mb4_general_ci NOT NULL,
  `period_covered` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `accomplishments` text COLLATE utf8mb4_general_ci NOT NULL,
  `challenges` text COLLATE utf8mb4_general_ci,
  `recommendations` text COLLATE utf8mb4_general_ci,
  `attachment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected','revision_needed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_lifecycle`
--

CREATE TABLE `applicant_lifecycle` (
  `id` int UNSIGNED NOT NULL,
  `applicant_id` int UNSIGNED NOT NULL,
  `recruitment_status` varchar(32) COLLATE utf8mb4_general_ci DEFAULT 'not_started',
  `recruitment_notes` text COLLATE utf8mb4_general_ci,
  `onboarding_status` varchar(32) COLLATE utf8mb4_general_ci DEFAULT 'not_started',
  `onboarding_notes` text COLLATE utf8mb4_general_ci,
  `evaluation_status` varchar(32) COLLATE utf8mb4_general_ci DEFAULT 'not_started',
  `evaluation_score` int DEFAULT NULL,
  `evaluation_notes` text COLLATE utf8mb4_general_ci,
  `next_action_date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_score_sheets`
--

CREATE TABLE `applicant_score_sheets` (
  `id` int NOT NULL,
  `application_id` int NOT NULL,
  `applicant_id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `position_category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `overall_score` decimal(7,2) NOT NULL DEFAULT '0.00',
  `education_text` longtext COLLATE utf8mb4_general_ci,
  `masteral_text` longtext COLLATE utf8mb4_general_ci,
  `training_entries_json` longtext COLLATE utf8mb4_general_ci,
  `training_files_json` longtext COLLATE utf8mb4_general_ci,
  `qualification_met` tinyint(1) NOT NULL DEFAULT '0',
  `score_data` longtext COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applicant_score_sheets`
--

INSERT INTO `applicant_score_sheets` (`id`, `application_id`, `applicant_id`, `job_posting_id`, `position_category`, `overall_score`, `education_text`, `masteral_text`, `training_entries_json`, `training_files_json`, `qualification_met`, `score_data`, `created_at`, `updated_at`) VALUES
(4, 19, 122, 10, 'Teaching', 60.00, NULL, NULL, NULL, NULL, 0, '{\"t_personality\":0,\"t_communication\":0,\"t_analytical\":0,\"t_achievement\":0,\"t_leadership\":0,\"t_relationship\":0,\"t_job_fit\":0,\"t_aptitude\":0,\"t_edu_relevance\":36,\"t_edu_basic\":29,\"t_edu_doctoral\":2,\"t_exp_years\":5,\"t_exp_additional\":1,\"t_training_base\":5,\"t_training_additional\":1,\"t_eligibility\":8,\"t_accomplishments\":0}', '2026-02-27 06:55:34', '2026-02-27 06:55:34'),
(5, 20, 6, 11, 'Non-teaching', 44.00, NULL, NULL, NULL, NULL, 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":29,\"nt_exp_years\":4,\"nt_exp_additional_years\":23,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"honor_graduate\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-02 01:31:10', '2026-03-02 01:31:10'),
(6, 21, 25, 10, 'Teaching', 72.50, NULL, NULL, NULL, NULL, 0, '{\"t_personality\":0,\"t_communication\":0,\"t_analytical\":0,\"t_achievement\":0,\"t_leadership\":0,\"t_relationship\":0,\"t_job_fit\":0,\"t_aptitude\":0,\"t_edu_relevance\":34,\"t_edu_basic\":34,\"t_edu_doctoral\":1,\"t_exp_years\":15,\"t_exp_additional_years\":23,\"t_exp_additional\":5,\"t_training_base\":5,\"t_training_additional_hours\":16,\"t_training_additional\":0,\"t_eligibility\":7.5,\"t_eligibility_items\":[\"ra1080\",\"csc_exam\",\"bar_board\"],\"t_accomplishments\":0}', '2026-03-02 02:30:46', '2026-03-02 02:30:46'),
(7, 22, 25, 11, 'Non-teaching', 37.00, NULL, NULL, NULL, NULL, 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":26,\"nt_exp_years\":4,\"nt_exp_additional_years\":23,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"recognitions\",\"honor_graduate\"],\"nt_training\":1,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-02 02:34:30', '2026-03-02 02:34:30'),
(8, 23, 122, 11, 'Non-teaching', 40.00, NULL, NULL, NULL, NULL, 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"recognitions\"],\"nt_training\":1,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-02 02:36:19', '2026-03-02 02:36:19'),
(9, 24, 6, 2, 'Non-teaching', 24.00, NULL, NULL, NULL, NULL, 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":10,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"recognitions\",\"honor_graduate\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-16 02:00:09', '2026-03-16 02:00:09'),
(10, 25, 26, 2, 'Non-teaching', 45.00, 'BSIT', '', '[\"customer service\",\"Cisco\",\"basic configuration\"]', NULL, 1, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"BSIT\",\"nt_training_text\":\"customer service\\nCisco\\nbasic configuration\",\"nt_training_entries\":[\"customer service\",\"Cisco\",\"basic configuration\"],\"nt_qualified\":1,\"nt_exp_years\":4,\"nt_exp_additional_years\":24,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"honor_graduate\",\"board_bar_topnotcher\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"csc_exam\",\"bar_board\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-16 03:05:54', '2026-03-16 03:05:54'),
(11, 26, 27, 2, 'Non-teaching', 45.00, 'BSIT', '', '[\"cisco\",\"basic config\"]', NULL, 1, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"BSIT\",\"nt_training_text\":\"cisco\\nbasic config\",\"nt_training_entries\":[\"cisco\",\"basic config\"],\"nt_qualified\":1,\"nt_exp_years\":4,\"nt_exp_additional_years\":24,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"honor_graduate\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"csc_exam\",\"special_eligibility\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0}', '2026-03-16 05:27:49', '2026-03-16 05:27:49'),
(12, 27, 28, 1, 'Non-teaching', 41.50, 'Masteral Information Technology', '', '[]', '[\"1773707401_nt_training_pdf_0_28.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Masteral Information Technology\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"recognitions\",\"honor_graduate\"],\"nt_training\":0,\"nt_eligibility\":7.5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\",\"special_eligibility\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1773707401_nt_training_pdf_0_28.pdf\"],\"training_pdf_entries\":[\"1773707401_nt_training_pdf_0_28.pdf\"]}', '2026-03-17 00:30:01', '2026-03-17 00:30:01'),
(13, 28, 28, 2, 'Non-teaching', 39.00, 'Masteral Information Technology', '', '[]', '[\"1773710373_nt_training_pdf_0_28.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Masteral Information Technology\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"recognitions\"],\"nt_training\":0,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1773710373_nt_training_pdf_0_28.pdf\"],\"training_pdf_entries\":[\"1773710373_nt_training_pdf_0_28.pdf\"]}', '2026-03-17 01:19:33', '2026-03-17 01:19:33'),
(14, 29, 28, 10, 'Teaching', 55.00, 'qweqwe', 'qweqwe', '[]', '[\"1773711959_t_training_pdf_0_28.pdf\"]', 0, '{\"t_personality\":0,\"t_communication\":0,\"t_analytical\":0,\"t_achievement\":0,\"t_leadership\":0,\"t_relationship\":0,\"t_job_fit\":0,\"t_aptitude\":0,\"t_edu_relevance\":40,\"t_edu_basic\":35,\"t_edu_doctoral\":3,\"t_education_text\":\"qweqwe\",\"t_masteral_text\":\"qweqwe\",\"t_training_text\":\"\",\"t_training_entries\":[],\"t_qualified\":0,\"t_exp_years\":10,\"t_exp_additional_years\":0,\"t_exp_additional\":0,\"t_training_base\":0,\"t_training_additional_hours\":0,\"t_training_additional\":0,\"t_eligibility\":5,\"t_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"t_accomplishments\":0,\"t_training_pdf_entries\":[\"1773711959_t_training_pdf_0_28.pdf\"],\"training_pdf_entries\":[\"1773711959_t_training_pdf_0_28.pdf\"]}', '2026-03-17 01:45:59', '2026-03-17 01:45:59'),
(15, 30, 122, 2, 'Non-teaching', 39.00, 'Master of Science in Information Tech', '', '[]', '[\"1773712760_nt_training_pdf_0_122.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Master of Science in Information Tech\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"recognitions\"],\"nt_training\":0,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1773712760_nt_training_pdf_0_122.pdf\"],\"training_pdf_entries\":[\"1773712760_nt_training_pdf_0_122.pdf\"]}', '2026-03-17 01:59:20', '2026-03-17 01:59:20'),
(16, 31, 28, 13, 'Teaching', 65.00, 'BSIT', 'Master of arts', '[]', '[\"1774403705_t_training_pdf_0_28.pdf\"]', 0, '{\"t_personality\":0,\"t_communication\":0,\"t_analytical\":0,\"t_achievement\":0,\"t_leadership\":0,\"t_relationship\":0,\"t_job_fit\":0,\"t_aptitude\":0,\"t_edu_relevance\":40,\"t_edu_basic\":35,\"t_edu_doctoral\":2,\"t_education_text\":\"BSIT\",\"t_masteral_text\":\"Master of arts\",\"t_training_text\":\"\",\"t_training_entries\":[],\"t_qualified\":0,\"t_exp_years\":15,\"t_exp_additional_years\":23,\"t_exp_additional\":5,\"t_training_base\":0,\"t_training_additional_hours\":0,\"t_training_additional\":0,\"t_eligibility\":5,\"t_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"t_accomplishments\":0,\"t_training_pdf_entries\":[\"1774403705_t_training_pdf_0_28.pdf\"],\"training_pdf_entries\":[\"1774403705_t_training_pdf_0_28.pdf\"]}', '2026-03-25 01:55:05', '2026-03-25 01:55:05'),
(17, 32, 6, 15, 'Non-teaching', 45.00, 'Bachelor of science in information technology', '', '[]', '[\"1776647700_nt_training_pdf_0_6.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Bachelor of science in information technology\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":4,\"nt_exp_additional_years\":20,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"recognitions\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"special_eligibility\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1776647700_nt_training_pdf_0_6.pdf\"],\"training_pdf_entries\":[\"1776647700_nt_training_pdf_0_6.pdf\"],\"nt_eligibility_pdf_entries\":{\"ra1080\":\"1776647700_nt_eligibility_file_ra1080_6.pdf\",\"special_eligibility\":\"1776647700_nt_eligibility_file_special_eligibility_6.pdf\"}}', '2026-04-20 01:15:00', '2026-04-20 01:15:00'),
(18, 33, 28, 15, 'Non-teaching', 45.00, 'Bachelor of science in information technology', '', '[]', '[\"1776672915_nt_training_pdf_0_28.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Bachelor of science in information technology\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":4,\"nt_exp_additional_years\":23,\"nt_exp_additional\":1,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\",\"honor_graduate\"],\"nt_training\":5,\"nt_eligibility\":5,\"nt_eligibility_items\":[\"ra1080\",\"special_eligibility\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1776672915_nt_training_pdf_0_28.pdf\"],\"training_pdf_entries\":[\"1776672915_nt_training_pdf_0_28.pdf\"],\"nt_eligibility_pdf_entries\":{\"ra1080\":\"1776672915_nt_eligibility_file_ra1080_28.pdf\",\"special_eligibility\":\"1776672915_nt_eligibility_file_special_eligibility_28.pdf\"}}', '2026-04-20 08:15:15', '2026-04-20 08:15:15'),
(19, 34, 27, 15, 'Non-teaching', 39.00, 'bachelor of science in info tech', '', '[]', '[\"1776673164_nt_training_pdf_0_27.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"bachelor of science in info tech\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\"],\"nt_training\":5,\"nt_eligibility\":0,\"nt_eligibility_items\":[],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1776673164_nt_training_pdf_0_27.pdf\"],\"training_pdf_entries\":[\"1776673164_nt_training_pdf_0_27.pdf\"],\"nt_eligibility_pdf_entries\":[]}', '2026-04-20 08:19:24', '2026-04-20 08:19:24'),
(20, 35, 26, 1, 'Non-teaching', 41.50, 'Bachelor of Science in info tech', '', '[]', '[\"1776735951_nt_training_pdf_0_26.pdf\"]', 0, '{\"nt_personality\":0,\"nt_communication\":0,\"nt_analytical\":0,\"nt_achievement\":0,\"nt_leadership\":0,\"nt_relationship\":0,\"nt_job_fit\":0,\"nt_exam\":0,\"nt_education\":30,\"nt_education_text\":\"Bachelor of Science in info tech\",\"nt_training_text\":\"\",\"nt_training_entries\":[],\"nt_qualified\":0,\"nt_exp_years\":3,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment\":1,\"nt_accomplishment_items\":[\"citations\"],\"nt_training\":5,\"nt_eligibility\":2.5,\"nt_eligibility_items\":[\"ra1080\"],\"nt_perf_rating\":0,\"nt_perf_courtesy\":0,\"nt_perf_relations\":0,\"nt_perf_initiative\":0,\"nt_perf_leadership\":0,\"nt_perf_judgement\":0,\"nt_training_pdf_entries\":[\"1776735951_nt_training_pdf_0_26.pdf\"],\"training_pdf_entries\":[\"1776735951_nt_training_pdf_0_26.pdf\"],\"nt_eligibility_pdf_entries\":{\"ra1080\":\"1776735951_nt_eligibility_file_ra1080_26.pdf\"}}', '2026-04-21 01:45:51', '2026-04-21 01:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `background_investigation_requests`
--

CREATE TABLE `background_investigation_requests` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `applicant_id` int DEFAULT NULL,
  `sent_by` int NOT NULL,
  `letter_pdf_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `letter_original_filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `employee_attachment_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employee_attachment_original_filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employee_submitted_at` datetime DEFAULT NULL,
  `report_pdf_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_original_filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_submitted_by` int DEFAULT NULL,
  `report_submitted_at` datetime DEFAULT NULL,
  `status` enum('sent','submitted','reported') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'sent',
  `hr_notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `report_applicant_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_background_checked_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_position_applied` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `report_verifier_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_contact_details` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_q1_years_known` text COLLATE utf8mb4_general_ci,
  `report_q2_neighbor_desc` text COLLATE utf8mb4_general_ci,
  `report_q3_neighbor_relation` text COLLATE utf8mb4_general_ci,
  `report_q4_employee_desc` text COLLATE utf8mb4_general_ci,
  `report_q5_rehire_recommendation` text COLLATE utf8mb4_general_ci,
  `report_q6_incident_notes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `background_investigation_requests`
--

INSERT INTO `background_investigation_requests` (`id`, `employee_id`, `applicant_id`, `sent_by`, `letter_pdf_path`, `letter_original_filename`, `sent_at`, `employee_attachment_path`, `employee_attachment_original_filename`, `employee_submitted_at`, `report_pdf_path`, `report_original_filename`, `report_submitted_by`, `report_submitted_at`, `status`, `hr_notes`, `created_at`, `updated_at`, `report_applicant_name`, `report_background_checked_by`, `report_position_applied`, `report_date`, `report_verifier_name`, `report_contact_details`, `report_q1_years_known`, `report_q2_neighbor_desc`, `report_q3_neighbor_relation`, `report_q4_employee_desc`, `report_q5_rehire_recommendation`, `report_q6_incident_notes`) VALUES
(1, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773107817_2903_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 09:57:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-03-10 01:57:04', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773107930_3127_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 09:58:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-03-10 01:58:56', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773107936_3768_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 09:59:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-03-10 01:59:03', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773107948_1724_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 09:59:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-03-10 01:59:17', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773108125_9647_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 10:02:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-03-10 02:02:12', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 12, 12, 14, 'uploads/background_investigation/letters/authorization_letter_1773108132_4249_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-03-10 10:02:18', 'uploads/background_investigation/responses/submission_1773108467_4065_485416945_637023395891898_6326880344736905846_n.jpg', '485416945_637023395891898_6326880344736905846_n.jpg', '2026-03-10 10:07:47', NULL, NULL, 14, '2026-03-10 12:27:35', 'reported', 'BACKGROUND INVESTIGATION REPORT\nApplicant: Fresdie Pimentel Andallo\nBackground Checked By: Carlos Reyes Mendoza\nPosition Applied For: Instructor\nDate: 2026-03-10\nVerifier\'s Name: kenneth\nContact Details: kenneth\n\n1. How long have you known the applicant? 1 month\n2. How would you describe the applicant as a neighbor? good\n3. Given a chance, would you still want the applicant as a neighbor? yes\n4. How would you describe the applicant as an employee? goods\n5. Would you consider this applicant for re-hiring? excellent\n6. Is there any incident that the applicant had fought with his/her co-employee? yes', '2026-03-10 02:02:18', '2026-04-06 00:35:27', 'Fresdie Pimentel Andallo', 'Carlos Reyes Mendoza', 'Instructor', '2026-03-10', 'kenneth', 'kenneth', '1 month', 'good', 'yes', 'goods', 'excellent', 'yes'),
(7, 25, 25, 14, 'uploads/background_investigation/letters/authorization_letter_1773723604_7478_1773638869_tor_27.pdf', '1773638869_tor_27.pdf', '2026-03-17 13:00:08', 'uploads/background_investigation/responses/submission_1773723694_9502_2026_-_COL_-_TESTIMONIAL_DINNER_TARP__3__page-0001.jpg', '2026 - COL - TESTIMONIAL DINNER TARP (3)_page-0001.jpg', '2026-03-17 13:01:34', NULL, NULL, NULL, NULL, 'submitted', NULL, '2026-03-17 05:00:08', '2026-04-06 00:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 6, 6, 14, 'uploads/background_investigation/letters/authorization_letter_1776729392_3448_Doc1.pdf', 'Doc1.pdf', '2026-04-21 07:56:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-04-20 23:56:38', '2026-04-20 23:56:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 6, 6, 14, 'uploads/background_investigation/letters/authorization_letter_1776729398_7203_Doc1.pdf', 'Doc1.pdf', '2026-04-21 07:56:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sent', NULL, '2026-04-20 23:56:43', '2026-04-20 23:56:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 6, 6, 14, 'uploads/background_investigation/letters/authorization_letter_1776729457_5923_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-04-21 07:57:43', 'uploads/background_investigation/responses/submission_1776729674_9716_Letter_of_Authorization.pdf', 'Letter of Authorization.pdf', '2026-04-21 08:01:14', NULL, NULL, 14, '2026-04-28 15:19:06', 'reported', 'BACKGROUND INVESTIGATION REPORT\nApplicant: Jane Doe Applicant\nBackground Checked By: Carlos Reyes Mendoza\nPosition Applied For: Administrative Officer I (Accounting Support)\nDate: 2026-04-28\nVerifier\'s Name: Antonio Tan\nContact Details: 09630808679\n\n1. How long have you known the applicant? 3 years\n2. How would you describe the applicant as a neighbor? kind\n3. Given a chance, would you still want the applicant as a neighbor? yes\n4. How would you describe the applicant as an employee? good\n5. Would you consider this applicant for re-hiring? yes\n6. Is there any incident that the applicant had fought with his/her co-employee? yes', '2026-04-20 23:57:43', '2026-04-28 07:19:06', 'Jane Doe Applicant', 'Carlos Reyes Mendoza', 'Administrative Officer I (Accounting Support)', '2026-04-28', 'Antonio Tan', '09630808679', '3 years', 'kind', 'yes', 'good', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clearances`
--

CREATE TABLE `clearances` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `clearance_type` enum('Resignation','Transfer','End of Contract','Study Leave') COLLATE utf8mb4_general_ci NOT NULL,
  `effective_date` date NOT NULL,
  `reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('pending','in_progress','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `library_cleared` tinyint(1) DEFAULT '0',
  `library_cleared_by` int DEFAULT NULL,
  `library_cleared_at` datetime DEFAULT NULL,
  `property_cleared` tinyint(1) DEFAULT '0',
  `property_cleared_by` int DEFAULT NULL,
  `property_cleared_at` datetime DEFAULT NULL,
  `accounting_cleared` tinyint(1) DEFAULT '0',
  `accounting_cleared_by` int DEFAULT NULL,
  `accounting_cleared_at` datetime DEFAULT NULL,
  `hr_cleared` tinyint(1) DEFAULT '0',
  `hr_cleared_by` int DEFAULT NULL,
  `hr_cleared_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `department` text NOT NULL,
  `code` varchar(20) NOT NULL,
  `1` int NOT NULL,
  `2` int NOT NULL,
  `3` int NOT NULL,
  `4` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `code`, `1`, `2`, `3`, `4`) VALUES
(1, 'Board of Regent', 'BOR', 0, 0, 0, 0),
(2, 'Office of the President', 'PRESIDENT', 0, 0, 0, 0),
(3, 'Office of the Vice President for Administration', 'OVPA', 0, 0, 0, 0),
(4, 'Office of the Vice President for Research, Development and Extension', 'OVPRD', 0, 0, 0, 0),
(5, 'Office of the Campus Director', 'OCD', 0, 0, 0, 0),
(6, 'College of Agriculture (CA)', 'CA', 0, 323, 0, 0),
(7, 'College of Arts & Sciences (CAS)', 'CAS', 765, 201, 1214, 1031),
(8, 'College of Business Administration & Accountancy (CBAA)', 'CBAA', 764, 98, 1248, 976),
(9, 'College of Computer Studies (CCS)', 'CCS', 1035, 224, 1575, 880),
(10, 'College of Criminal Justice Education (CCJE)', 'CCJE', 1618, 44, 1618, 936),
(11, 'College of Food Nutrition & Dietetics (CFND)', 'CFND', 0, 0, 0, 772),
(12, 'College of Engineering (COE)', 'COE', 734, 34, 734, 0),
(13, 'College of Hospitality Management & Tourism (CHMT)', 'CHMT', 837, 837, 1773, 878),
(14, 'College of Teacher Education (CTE)', 'CTE', 739, 19, 1611, 899),
(15, 'Senior High School (SHS)', 'SHS', 0, 0, 0, 0),
(16, 'Graduate Studies and Applied Research (GSAR)', 'GSAR', 0, 0, 0, 0),
(17, 'Accounting Office', 'ACCOUNTING', 0, 0, 0, 0),
(18, 'Admission and Registrarship', 'REGISTRAR', 0, 0, 0, 0),
(19, 'Agri-Aqua Technology Business Incubation (AATBI)', 'AATBI', 0, 0, 0, 0),
(20, 'Alumni Affairs and Job Placement Services (AAPS)', 'AAPS', 0, 0, 0, 0),
(21, 'Bids and Award Committee (BAC)', 'BAC', 0, 0, 0, 0),
(22, 'Budget and Finance Office (BFO)', 'BFO', 0, 0, 0, 0),
(23, 'Business Affairs Office (BAO)', 'BAO', 0, 0, 0, 0),
(24, 'Curriculum Instruction Development (CID)', 'CID', 0, 0, 0, 0),
(25, 'Extension and Training Services (ETS)', 'ETS', 0, 0, 0, 0),
(26, 'Faculty Association (FA)', 'FA', 0, 0, 0, 0),
(27, 'Gender and Development (GAD)', 'GAD', 0, 0, 0, 0),
(28, 'Guidance and Counseling', 'GUIDANCE', 0, 0, 0, 0),
(29, 'Human Resources Management Office (HRMO)', 'HRMO', 0, 0, 0, 0),
(30, 'Information Communication and Technology Services (ICTS)', 'ICTS', 0, 0, 0, 0),
(31, 'Innovation and Technology Support Office (ITSO)', 'ITSO', 0, 0, 0, 0),
(32, 'Internal COA', 'I-COA', 0, 0, 0, 0),
(33, 'Intellectual Property Technology Business Management (IP-TBM)\r\n', 'IP-TBM', 0, 0, 0, 0),
(34, 'International / Local Affairs (ILA)', 'ILA', 0, 0, 0, 0),
(35, 'Library Services', 'LIBRARY', 0, 0, 0, 0),
(36, 'Management Information System (MIS)', 'MIS', 0, 0, 0, 0),
(37, 'Medical and Dental Clinic Services', 'MD CLINIC', 0, 0, 0, 0),
(38, 'National Service Training Program (NSTP)', 'NSTP', 0, 0, 0, 0),
(39, 'Non-Teaching Association (NTEA)', 'NTEA', 0, 0, 0, 0),
(40, 'Office of Student Affairs and Services (OSAS)', 'OSAS', 0, 0, 0, 0),
(41, 'Physical Plant and Site Development (PPSD)', 'PPSD', 0, 0, 0, 0),
(42, 'Quality Assurance (QA)', 'QA', 0, 0, 0, 0),
(43, 'Record Management Office / Document Control Office', 'RDO / DCO', 0, 0, 0, 0),
(44, 'Research and Development (RD)', 'RD', 0, 0, 0, 0),
(45, 'Scholarship and Financial Assistance (SFA)', 'SFA', 0, 0, 0, 0),
(46, 'Security Management and Services (SMS)', 'SMS', 0, 0, 0, 0),
(47, 'Sports, Cultural and Literary Arts', 'SPORTS', 0, 0, 0, 0),
(48, 'Supreme Students Council (SSC)', 'SSC', 0, 0, 0, 0),
(49, 'Supply and Property Management Unit', 'SUPPLY', 0, 0, 0, 0),
(50, 'The Baybay Granary Publication', 'BAYBAY', 0, 0, 0, 0),
(52, 'Planning and Development Office', 'PDO', 0, 0, 0, 0),
(53, 'Cashiers Office', 'CASHIER', 0, 0, 0, 0),
(54, 'Other (Please type in Feedback)', '', 0, 0, 0, 0),
(55, 'College of Nursing and Allied Health (CONAH)', 'CONAH', 693, 0, 0, 0),
(56, 'College of Law (COL)', 'COL', 425, 0, 0, 0),
(57, 'Information Office (IO)', 'IO', 0, 0, 0, 0),
(58, 'General Service Office (GSO)', 'GSO', 0, 0, 0, 0),
(59, 'Procurement Office', 'PROCUREMENT', 0, 0, 0, 0),
(60, 'Project Management Office', 'PMO', 0, 0, 0, 0),
(61, 'Legal Office', 'LEGAL', 0, 0, 0, 0),
(62, 'Internal Audit Office', 'IAU', 0, 0, 0, 0),
(63, 'College of Business Management & Accountancy (CBMA)', 'CBMA', 0, 0, 0, 0),
(65, 'Dental Clinic', 'DENTAL', 0, 0, 0, 0),
(66, 'Center for Innovation and Emerging Technology (CIET)', 'CIET', 0, 0, 0, 0),
(67, 'Lopez Satellite Campus', 'LOPEZ', 0, 0, 0, 0),
(68, 'Nagcarlan Satellite Campus', 'NAGCARLAN', 0, 0, 0, 0),
(70, 'University Disaster Risk Reduction Management Office', 'UDRRMO', 0, 0, 0, 0),
(71, 'College of Industrial Technology', 'CIT', 986, 0, 1623, 0),
(72, 'THE GEARS PUBLICATION', 'GEARS', 0, 0, 0, 0),
(73, 'College of Fisheries', 'COF', 0, 0, 0, 883),
(74, 'Audit Department', 'AUDIT', 0, 0, 0, 0),
(75, 'Center for Lake Sustainable Development (CLSD)', 'CLSD', 0, 0, 0, 0),
(76, 'Office of the Vice President for Academic Affairs', 'OVPAA', 0, 0, 0, 0),
(77, 'Board of Secretary Office', 'BS', 0, 0, 0, 0),
(78, 'Technical Advocate', 'TechAd', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dtr_requests`
--

CREATE TABLE `dtr_requests` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `request_type` enum('Missing Time In','Missing Time Out','Incorrect Time In','Incorrect Time Out','Missed Biometric','Others') COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `actual_time_in` time NOT NULL,
  `actual_time_out` time NOT NULL,
  `recorded_time_in` time DEFAULT NULL,
  `recorded_time_out` time DEFAULT NULL,
  `reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `supporting_documents` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL,
  `variables` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `variables`, `created_at`) VALUES
(1, 'exam_scheduled', 'Written Exam Scheduled - {job_title}', 'Dear {applicant_name},\n\nYou have been qualified for the position of {job_title} at {company_name}.\n\nYour written exam has been scheduled for:\nDate: {exam_date}\nTime: {exam_time}\nDuration: {exam_duration} minutes\n\nPlease log in to the system to take your exam.\n\nGood luck!\n\nBest regards,\nHR Team', 'applicant_name,job_title,company_name,exam_date,exam_time,exam_duration', '2025-10-06 14:52:13'),
(2, 'interview_scheduled', 'Interview Scheduled - {job_title}', 'Dear {applicant_name},\n\nCongratulations! You have passed the written exam for the position of {job_title}.\n\nYour interview has been scheduled for:\nDate: {interview_date}\nTime: {interview_time}\nPlatform: {meeting_platform}\nMeeting Link: {meeting_link}\n\nPlease join the meeting 5 minutes before the scheduled time.\n\nBest regards,\nHR Team', 'applicant_name,job_title,interview_date,interview_time,meeting_platform,meeting_link', '2025-10-06 14:52:13'),
(3, 'hiring_result', 'Hiring Decision - {job_title}', 'Dear {applicant_name},\n\nThank you for your interest in the {job_title} position.\n\n{hiring_decision_message}\n\n{hiring_notes}\n\nBest regards,\nHR Team', 'applicant_name,job_title,hiring_decision_message,hiring_notes', '2025-10-06 14:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `employee_nominations`
--

CREATE TABLE `employee_nominations` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `award_id` int NOT NULL,
  `nominee_id` int NOT NULL,
  `nominator_id` int NOT NULL,
  `nomination_reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `supporting_evidence` text COLLATE utf8mb4_general_ci,
  `nomination_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected','winner_selected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_nominations`
--

INSERT INTO `employee_nominations` (`id`, `program_id`, `award_id`, `nominee_id`, `nominator_id`, `nomination_reason`, `supporting_evidence`, `nomination_date`, `status`, `approved_by`, `approved_at`) VALUES
(1, 2, 4, 102, 12, 'yeheyyy', '', '2026-03-04 06:57:38', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--

CREATE TABLE `exam_attempts` (
  `id` int NOT NULL,
  `application_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_answer` text COLLATE utf8mb4_general_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `points_awarded` decimal(5,2) DEFAULT NULL COMMENT 'Points awarded for essay questions (manual grading)',
  `attempted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_attempts`
--

INSERT INTO `exam_attempts` (`id`, `application_id`, `question_id`, `selected_answer`, `is_correct`, `points_awarded`, `attempted_at`) VALUES
(11, 1, 25, 'B', 1, NULL, '2025-10-30 13:27:11'),
(12, 1, 26, 'I would adapt an existing data-focused course (e.g., Data Mining or Advanced Programming) by implementing the Project-Based Learning (PBL) model. Students would use Python and open-source libraries (e.g., TensorFlow or PyTorch) to complete a mini-project, such as building a basic image classifier or a natural language processing (NLP) model. This shifts the focus from theoretical statistics to the practical steps of data preparation, model training, and performance evaluation.', 1, 8.00, '2025-10-30 13:27:11'),
(13, 1, 23, 'D', 1, NULL, '2025-10-30 13:27:11'),
(14, 1, 22, 'C', 1, NULL, '2025-10-30 13:27:11'),
(15, 1, 27, 'For a database course, I\'d assign case studies on major data breaches (e.g., Equifax, Facebook) to discuss the impact of weak security on data privacy and the professional failure of data custodians.', 1, 9.00, '2025-10-30 13:27:11'),
(16, 1, 21, 'C', 1, NULL, '2025-10-30 13:27:11'),
(17, 1, 24, 'B', 1, NULL, '2025-10-30 13:27:11'),
(25, 2, 25, 'B', 1, NULL, '2025-10-30 13:48:10'),
(26, 2, 23, 'D', 1, NULL, '2025-10-30 13:48:10'),
(27, 2, 27, 'ML is driving automation and decision-making across nearly every industry, from finance to healthcare. Graduates need to move beyond simple CRUD (Create, Read, Update, Delete) applications and understand how to build and deploy intelligent systems.', 1, 8.00, '2025-10-30 13:48:10'),
(28, 2, 26, 'Before submitting a final project, students must explicitly document every third-party library or API used, stating its license type (e.g., MIT, GPL) and confirming compliance with the terms of reuse.', 1, 7.00, '2025-10-30 13:48:10'),
(29, 2, 21, 'C', 1, NULL, '2025-10-30 13:48:10'),
(30, 2, 22, 'C', 1, NULL, '2025-10-30 13:48:10'),
(31, 2, 24, 'B', 1, NULL, '2025-10-30 13:48:10'),
(32, 3, 28, 'C', 1, NULL, '2025-11-28 00:32:40'),
(33, 4, 29, 'B', 1, NULL, '2025-12-01 17:12:22'),
(34, 4, 30, 'B', 1, NULL, '2025-12-01 17:12:22'),
(35, 6, 31, 'A', 0, 0.00, '2026-02-11 08:54:37'),
(38, 5, 33, 'i would love to be a kind of fish because i want to explore the rest of the world underwater', 1, 8.00, '2026-02-13 06:46:46'),
(39, 5, 32, 'B', 1, 2.00, '2026-02-13 06:46:46'),
(40, 9, 32, 'B', 1, 2.00, '2026-02-13 07:08:31'),
(41, 9, 33, 'bird because i want to fly', 1, 7.00, '2026-02-13 07:08:31'),
(42, 12, 32, 'B', 1, 2.00, '2026-02-13 07:10:07'),
(43, 12, 33, 'Dog', 1, 3.00, '2026-02-13 07:10:07'),
(44, 14, 29, 'A', 0, 0.00, '2026-02-24 07:47:42'),
(45, 14, 30, 'B', 0, 0.00, '2026-02-24 07:47:42'),
(53, 8, 27, 'integrate these ethical topics into a technical course (e.g., Database Systems or Software Engineering) to ensure students graduate with a strong sense of professional accountability', 1, 8.00, '2026-03-02 06:55:05'),
(54, 8, 21, 'C', 1, 1.00, '2026-03-02 06:55:05'),
(55, 8, 24, 'B', 1, 1.00, '2026-03-02 06:55:05'),
(56, 8, 22, 'C', 1, 1.00, '2026-03-02 06:55:05'),
(57, 8, 23, 'B', 0, 0.00, '2026-03-02 06:55:05'),
(58, 8, 26, 'echnology is critical and outline how you would adapt an existing course or propose a new elective to effectively teach the fundamental concepts and practical applications of this technology.', 1, 7.00, '2026-03-02 06:55:05'),
(59, 8, 25, 'B', 1, 1.00, '2026-03-02 06:55:05'),
(60, 20, 43, 'B', 1, 1.00, '2026-03-11 06:08:02'),
(61, 20, 42, 'B', 0, 0.00, '2026-03-11 06:08:02'),
(62, 20, 40, 'B', 1, 1.00, '2026-03-11 06:08:02'),
(63, 20, 38, 'B', 0, 0.00, '2026-03-11 06:08:02'),
(64, 20, 35, 'C', 0, 0.00, '2026-03-11 06:08:02'),
(65, 20, 39, 'C', 1, 1.00, '2026-03-11 06:08:02'),
(66, 20, 36, 'C', 0, 0.00, '2026-03-11 06:08:02'),
(67, 20, 41, 'B', 1, 1.00, '2026-03-11 06:08:02'),
(68, 20, 34, 'C', 0, 0.00, '2026-03-11 06:08:02'),
(69, 20, 37, 'B', 1, 1.00, '2026-03-11 06:08:02'),
(70, 22, 40, 'B', 1, 1.00, '2026-03-11 06:16:56'),
(71, 22, 36, 'B', 1, 1.00, '2026-03-11 06:16:56'),
(72, 22, 38, 'B', 0, 0.00, '2026-03-11 06:16:56'),
(73, 22, 41, 'B', 1, 1.00, '2026-03-11 06:16:56'),
(74, 22, 37, 'C', 0, 0.00, '2026-03-11 06:16:56'),
(75, 22, 35, 'C', 0, 0.00, '2026-03-11 06:16:56'),
(76, 22, 43, 'B', 1, 1.00, '2026-03-11 06:16:56'),
(77, 22, 42, 'B', 0, 0.00, '2026-03-11 06:16:56'),
(78, 22, 39, 'C', 1, 1.00, '2026-03-11 06:16:56'),
(79, 22, 34, 'B', 1, 1.00, '2026-03-11 06:16:56'),
(80, 27, 32, 'B', 1, 2.00, '2026-04-21 01:16:39'),
(81, 27, 33, 'i want to be a tutubi', 1, 10.00, '2026-04-21 01:16:39'),
(82, 35, 32, 'B', 1, 2.00, '2026-04-21 01:48:32'),
(83, 35, 33, 'bird, i want to fly', 1, 10.00, '2026-04-21 01:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
  `id` int NOT NULL,
  `exam_schedule_id` int DEFAULT NULL,
  `application_id` int NOT NULL,
  `applicant_id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `exam_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_present` tinyint(1) DEFAULT '0',
  `marked_by` int DEFAULT NULL,
  `marked_at` datetime DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_attendance`
--

INSERT INTO `exam_attendance` (`id`, `exam_schedule_id`, `application_id`, `applicant_id`, `job_posting_id`, `exam_date`, `exam_time`, `exam_location`, `is_present`, `marked_by`, `marked_at`, `notes`, `created_at`) VALUES
(1, 1, 12, 25, 1, '2026-02-16', '15:00:00', 'ICTS', 1, 14, '2026-02-13 14:01:54', '', '2026-02-13 05:38:41'),
(2, 1, 9, 6, 1, '2026-02-16', '15:00:00', 'ICTS', 1, 14, '2026-02-13 14:01:51', '', '2026-02-13 05:38:48'),
(3, 1, 5, 12, 1, '2026-02-16', '15:00:00', 'ICTS', 1, 14, '2026-02-13 14:01:28', '', '2026-02-13 05:38:54'),
(4, 2, 14, 121, 8, '2026-02-25', '15:00:00', 'ICTS office', 1, 15, '2026-02-24 15:46:11', '', '2026-02-24 07:42:18'),
(7, 13, 22, 25, 11, '2026-03-12', '15:00:00', 'ICTS', 1, 14, '2026-03-11 13:21:34', '', '2026-03-02 04:00:39'),
(8, 14, 20, 6, 11, '2026-03-13', '15:00:00', 'ICTS', 1, 14, '2026-03-11 13:21:40', '', '2026-03-02 04:00:46'),
(12, 11, 8, 6, 3, '2026-03-02', '15:00:00', 'ICTS', 1, 14, '2026-03-02 13:52:01', '', '2026-03-02 05:11:50'),
(13, 12, 10, 25, 4, '2026-03-02', '14:00:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-02 05:44:20'),
(14, 12, 7, 6, 4, '2026-03-02', '14:00:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-02 05:44:27'),
(15, 12, 6, 12, 4, '2026-03-02', '14:00:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-02 05:44:34'),
(17, 16, 23, 122, 11, '2026-03-13', '15:00:00', 'ICTS', 1, 14, '2026-03-11 13:21:46', '', '2026-03-11 05:20:36'),
(21, 29, 30, 122, 2, '2026-03-18', '15:00:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-17 03:28:11'),
(22, 29, 24, 6, 2, '2026-03-18', '15:00:00', 'ICTS', 1, 14, '2026-03-17 13:30:02', '', '2026-03-17 03:28:18'),
(23, 30, 26, 27, 2, '2026-03-20', '15:48:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-17 04:49:08'),
(24, 30, 25, 26, 2, '2026-03-20', '15:48:00', 'ICTS', 0, NULL, NULL, NULL, '2026-03-17 04:49:17'),
(25, 31, 27, 28, 1, '2026-04-21', '09:20:00', 'ICTS', 1, 14, '2026-04-21 09:15:51', '', '2026-04-21 01:15:25'),
(26, 32, 35, 26, 1, '2026-04-21', '09:47:00', 'ICTS', 1, 14, '2026-04-21 09:48:04', '', '2026-04-21 01:47:39'),
(27, 34, 32, 6, 15, '2026-04-21', '15:10:00', 'ICTS office', 1, 14, '2026-04-21 15:12:48', '', '2026-04-21 07:10:53'),
(28, 34, 33, 28, 15, '2026-04-21', '15:10:00', 'ICTS office', 1, 14, '2026-04-21 15:13:04', '', '2026-04-21 07:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `question` text COLLATE utf8mb4_general_ci NOT NULL,
  `question_type` enum('multiple_choice','identification','enumeration','essay') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'multiple_choice',
  `option_a` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `option_b` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `option_c` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `option_d` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `correct_answer` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `correct_text` text COLLATE utf8mb4_general_ci,
  `enumeration_items` text COLLATE utf8mb4_general_ci,
  `points` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `job_posting_id`, `question`, `question_type`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `correct_text`, `enumeration_items`, `points`, `created_at`) VALUES
(21, 3, 'Which of the following sorting algorithms has the best worst-case time complexity, guaranteed to be O(n \\log n)?', 'multiple_choice', 'Insertion Sort', 'Quick Sort', 'Merge Sort', 'Bubble Sort', 'C', '', '', 1, '2025-10-29 14:47:13'),
(22, 3, 'In a relational database, which of the following Normal Forms (NF) specifically aims to eliminate transitive dependencies?', 'multiple_choice', 'First Normal Form (1NF)', 'Second Normal Form (2NF)', 'Third Normal Form (3NF)', 'Boyce-Codd Normal Form (BCNF)', 'C', '', '', 1, '2025-10-29 14:47:13'),
(23, 3, 'The principle in Object-Oriented Programming that allows an object to take on many forms, such as having a method behave differently based on the type of object calling it, is known as:', 'multiple_choice', 'Inheritance', 'Encapsulation', 'Abstraction', 'Polymorphism', 'D', '', '', 1, '2025-10-29 14:47:13'),
(24, 3, 'At which layer of the OSI model do routers primarily operate to determine the best path for data packet forwarding across different network segments?', 'multiple_choice', 'Data Link Layer', 'Network Layer', 'Transport Layer', 'Application Layer', 'B', '', '', 1, '2025-10-29 14:47:13'),
(25, 3, 'An Instructor introduces a complex concept by first solving a related, simpler problem, then gradually increasing the difficulty, and finally having students solve the target complex problem. This teaching technique is best known as:', 'multiple_choice', 'Flipped Classroom Model', 'Scaffolding', 'Project-Based Learning (PBL)', 'Bloom&#039;s Taxonomy Application', 'B', '', '', 1, '2025-10-29 14:47:13'),
(26, 3, 'Select one emerging technology (e.g., Machine Learning, Cloud Computing, or Blockchain) that you believe is crucial for the next generation of Computer Studies graduates. Explain why this technology is critical and outline how you would adapt an existing course or propose a new elective to effectively teach the fundamental concepts and practical applications of this technology.', 'essay', '', '', '', '', '', '', '', 10, '2025-10-29 14:56:31'),
(27, 3, 'Discuss the ethical and legal responsibilities of a Computer Science professional, specifically concerning data privacy and intellectual property (IP). As an instructor, how would you integrate these ethical topics into a technical course (e.g., Database Systems or Software Engineering) to ensure students graduate with a strong sense of professional accountability?', 'essay', '', '', '', '', '', '', '', 10, '2025-10-29 14:56:31'),
(28, 6, 'Which soil horizon is commonly referred to as the &quot;zone of accumulation&quot; (illuviation), where minerals leached from upper layers are deposited?', 'multiple_choice', 'O Horizon', 'A Horizon', 'B Horizon', 'C Horizon', 'C', '', '', 10, '2025-11-28 00:32:05'),
(29, 8, 'Which of the following frameworks is primarily used to analyze the external macro-environmental factors (Political, Economic, Social, Technological, Legal, and Environmental) affecting a business?', 'multiple_choice', 'SWOT Analysis', 'PESTLE Analysis', 'Porter&#039;s Five Forces', 'The BCG Matrix', 'B', '', '', 8, '2025-12-01 16:58:22'),
(30, 8, 'According to Herzberg’s Two-Factor Theory of motivation, which of the following is considered a &quot;Hygiene Factor&quot; that prevents dissatisfaction but does not necessarily motivate employees?', 'multiple_choice', 'Recognition', 'Salary and Working Conditions', 'Personal Growth', 'Achievement', 'B', '', '', 8, '2025-12-01 16:58:22'),
(31, 4, 'what is the sound of the dog?', 'multiple_choice', 'aww', 'twit', 'meow', 'ahhhh!', 'A', '', '', 1, '2026-02-11 08:44:16'),
(32, 1, 'What is the sound of the cat?', 'multiple_choice', 'tweet tweet', 'meowww', 'arf', 'shhhhhh', 'B', '', '', 2, '2026-02-13 05:55:00'),
(33, 1, 'If you ever had a chance to become a animal which anime would you become?', 'essay', '', '', '', '', '', '', '', 10, '2026-02-13 05:55:00'),
(34, 11, 'When a new employee joins the company, which of the following is typically the first step an HR Assistant performs in the onboarding process?', 'multiple_choice', 'Conducting a performance review', 'Verifying employment eligibility and collecting tax forms', 'Assigning a long-term mentor', 'Negotiating the final salary', 'B', '', '', 1, '2026-03-11 02:33:41'),
(35, 11, 'Which software system is most commonly used by HR Assistants to manage employee digital records and track attendance?', 'multiple_choice', 'CRM (Customer Relationship Management)', 'HRIS (Human Resources Information System)', 'CMS (Content Management System)', 'ERP (Enterprise Resource Planning)', 'B', '', '', 1, '2026-03-11 02:33:41'),
(36, 11, 'If an employee asks for a detailed summary of their accumulated Paid Time Off (PTO), what is the most appropriate action for an HR Assistant?', 'multiple_choice', 'Tell the employee to estimate it based on their start date', 'Provide the data retrieved from the official tracking system', 'Ask the employee&#039;s direct supervisor to calculate it', 'Advise the employee that this information is confidential and cannot be shared', 'B', '', '', 1, '2026-03-11 02:33:41'),
(37, 11, 'What is the primary purpose of a Form I-9 in the United States?', 'multiple_choice', 'To report annual income to the IRS', 'To document that each new employee is authorized to work in the U.S.', 'To enroll an employee in a health insurance plan', 'To request a background check from a third-party vendor', 'B', '', '', 1, '2026-03-11 02:33:41'),
(38, 11, 'During the recruitment process, an HR Assistant is often tasked with &quot;screening&quot; resumes. What does this process involve?', 'multiple_choice', 'Calling every applicant for a 30-minute interview', 'Checking the social media profiles of all candidates', 'Reviewing resumes to see which candidates meet the minimum job qualifications', 'Sending a job offer to the person with the most experience', 'C', '', '', 1, '2026-03-11 02:33:41'),
(39, 11, 'Which of the following should be kept in a separate, confidential file rather than the general personnel file?', 'multiple_choice', 'The employee’s original job application', 'Performance evaluation forms', 'Medical records and disability-related documentation', 'Records of promotions and pay raise', 'C', '', '', 1, '2026-03-11 02:33:41'),
(40, 11, 'An HR Assistant is drafting a job posting. Which section is essential to ensure candidates understand the daily expectations of the role?', 'multiple_choice', 'Company history', 'List of essential duties and responsibilities', 'CEO&#039;s biography', 'List of nearby lunch locations', 'B', '', '', 1, '2026-03-11 02:33:41'),
(41, 11, 'When coordinating an interview schedule for multiple candidates and managers, what is the most important factor for the HR Assistant to consider?', 'multiple_choice', 'The physical appearance of the candidates', 'The availability of all interviewers and the reservation of a meeting space', 'The weather forecast for the following week', 'The order in which resumes were received', 'B', '', '', 1, '2026-03-11 02:33:41'),
(42, 11, 'If an HR Assistant notices a discrepancy in an employee&#039;s time-sheet, what should be their first course of action?', 'multiple_choice', 'Change the hours to match what they think is correct', 'Notify the payroll department to skip the employee&#039;s check', 'Contact the employee or their supervisor to clarify the information', 'Ignore the error to avoid conflict', 'C', '', '', 1, '2026-03-11 02:33:41'),
(43, 11, 'What does the acronym &quot;FLSA&quot; stand for, which dictates rules regarding minimum wage and overtime?', 'multiple_choice', 'Federal Labor and Safety Act', 'Fair Labor Standards Act', 'Formal Labor Statistics Agency', 'Financial Labor and Savings Association', 'B', '', '', 1, '2026-03-11 02:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `exam_location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `duration_minutes` int DEFAULT '60',
  `max_capacity` int DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_general_ci,
  `status` enum('scheduled','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'scheduled',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_schedules`
--

INSERT INTO `exam_schedules` (`id`, `job_posting_id`, `exam_date`, `exam_time`, `exam_location`, `duration_minutes`, `max_capacity`, `instructions`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-02-16', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-02-13 05:38:41', '2026-02-13 05:38:41'),
(2, 8, '2026-02-25', '15:00:00', 'ICTS office', 60, NULL, NULL, 'scheduled', 15, '2026-02-24 07:42:18', '2026-02-24 07:42:18'),
(6, 11, '2026-03-03', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-02 04:00:39', '2026-03-02 04:00:39'),
(11, 3, '2026-03-02', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-02 05:13:06', '2026-03-02 05:13:06'),
(12, 4, '2026-03-02', '14:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-02 05:44:20', '2026-03-02 05:44:20'),
(13, 11, '2026-03-12', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-11 01:12:24', '2026-03-11 01:12:24'),
(14, 11, '2026-03-13', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-11 01:12:48', '2026-03-11 01:12:48'),
(16, 11, '2026-03-13', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-11 05:20:36', '2026-03-11 05:20:36'),
(28, 2, '2026-03-18', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-17 03:27:57', '2026-03-17 03:27:57'),
(29, 2, '2026-03-18', '15:00:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-17 04:16:26', '2026-03-17 04:16:26'),
(30, 2, '2026-03-20', '15:48:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-03-17 04:49:08', '2026-03-17 04:49:08'),
(31, 1, '2026-04-21', '09:20:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-04-21 01:15:25', '2026-04-21 01:15:25'),
(32, 1, '2026-04-21', '09:47:00', 'ICTS', 60, NULL, NULL, 'scheduled', 14, '2026-04-21 01:47:39', '2026-04-21 01:47:39'),
(33, 15, '2026-04-21', '15:10:00', 'IC', 60, NULL, NULL, 'scheduled', 14, '2026-04-21 07:10:53', '2026-04-21 07:10:53'),
(34, 15, '2026-04-21', '15:10:00', 'ICTS office', 60, NULL, NULL, 'scheduled', 14, '2026-04-21 07:11:12', '2026-04-21 07:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `idp_tna_periods`
--

CREATE TABLE `idp_tna_periods` (
  `id` int NOT NULL,
  `period_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `year` int NOT NULL,
  `quarter` enum('1st Quarter','2nd Quarter','3rd Quarter','4th Quarter') COLLATE utf8mb4_general_ci NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('open','closed') COLLATE utf8mb4_general_ci DEFAULT 'open',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `idp_tna_periods`
--

INSERT INTO `idp_tna_periods` (`id`, `period_name`, `year`, `quarter`, `deadline`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(3, '2026 - 1st Quarter', 2026, '1st Quarter', '2026-02-28', 'open', 14, '2026-02-03 02:16:05', '2026-03-17 05:07:10'),
(4, '2026 - 2nd Quarter', 2026, '2nd Quarter', '2026-06-05', 'open', 14, '2026-03-05 06:55:42', '2026-03-16 00:51:29'),
(6, '2026 - 3rd Quarter', 2026, '3rd Quarter', '2026-05-16', 'open', 14, '2026-03-16 00:55:27', '2026-03-16 00:55:27'),
(7, '2026', 2026, '4th Quarter', '2026-04-23', 'open', 14, '2026-03-17 05:04:16', '2026-03-17 05:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `individual_development_plans`
--

CREATE TABLE `individual_development_plans` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `period_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `current_position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salary_grade` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `years_in_position` int DEFAULT NULL,
  `years_in_lspu` int DEFAULT NULL,
  `years_in_other_office` int DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `office` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_development_required` tinyint(1) DEFAULT '0',
  `supervisor_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `purpose_meet_current_competencies` tinyint(1) DEFAULT '0',
  `purpose_increase_current_competencies` tinyint(1) DEFAULT '0',
  `purpose_meet_next_position` tinyint(1) DEFAULT '0',
  `purpose_acquire_new_competencies` tinyint(1) DEFAULT '0',
  `purpose_others` text COLLATE utf8mb4_general_ci,
  `long_term_goals` text COLLATE utf8mb4_general_ci,
  `short_term_goals` text COLLATE utf8mb4_general_ci,
  `status` enum('draft','submitted','reviewed','approved') COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `individual_development_plans`
--

INSERT INTO `individual_development_plans` (`id`, `employee_id`, `period_id`, `name`, `current_position`, `salary_grade`, `years_in_position`, `years_in_lspu`, `years_in_other_office`, `division`, `office`, `no_development_required`, `supervisor_name`, `purpose_meet_current_competencies`, `purpose_increase_current_competencies`, `purpose_meet_next_position`, `purpose_acquire_new_competencies`, `purpose_others`, `long_term_goals`, `short_term_goals`, `status`, `submitted_at`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(4, 12, 3, 'Fresdie Pimentel Andallo', 'Instructor', '', 0, 0, 0, '', 'College of Computer Studies (CCS)', 0, '', 0, 0, 0, 0, '', '[]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"}]', 'submitted', '2026-02-27 09:00:08', NULL, NULL, '2026-02-27 00:59:46', '2026-02-27 01:00:08'),
(5, 103, 3, 'Bernardo Jose Alvarez Alvarez', 'Administrative Officer II', 'Grade 7', 1, 1, 1, 'administrative', 'Budget and Finance Office (BFO)', 0, 'maam', 0, 1, 1, 0, '', '[{\"area\":\"Area of Development1\",\"activity\":\"Development Activity1\",\"target_date\":\"2026-02-27\",\"stage\":\"Completion Stage1\"},{\"area\":\"Area of Development2\",\"activity\":\"Development Activity2\",\"target_date\":\"2026-02-27\",\"stage\":\"Completion Stage2\"},{\"area\":\"Area of Development3\",\"activity\":\"Development Activity3\",\"target_date\":\"2026-02-27\",\"stage\":\"Completion Stage3\"}]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"A\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"2026-02-27\",\"responsible\":\"HI\",\"stage\":\"L\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"B\",\"activity\":\"F\",\"target_date\":\"2026-02-27\",\"responsible\":\"J\",\"stage\":\"K\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"C\",\"activity\":\"G\",\"target_date\":\"2026-02-27\",\"responsible\":\"m\",\"stage\":\"N\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"DE\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"2026-02-27\",\"responsible\":\"O\",\"stage\":\"P\"}]', 'submitted', '2026-02-27 09:13:34', NULL, NULL, '2026-02-27 01:13:34', '2026-02-27 01:13:34'),
(6, 12, 4, 'Fresdie Pimentel Andallo', 'Instructor', '', 0, 0, 0, '', 'College of Computer Studies (CCS)', 0, '', 0, 0, 0, 0, '', '[]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"}]', 'draft', NULL, NULL, NULL, '2026-03-05 07:55:34', '2026-03-05 07:55:34'),
(7, 31, 4, 'Juan Miguel Reyes Santos', 'Administrative Officer I', '', 0, 0, 0, '', 'College of Business Administration & Accountancy (CBAA)', 0, '', 0, 0, 0, 0, '', '[]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"}]', 'draft', NULL, NULL, NULL, '2026-03-06 00:43:22', '2026-03-06 00:43:22'),
(8, 12, 6, 'Fresdie Pimentel Andallo', 'Instructor', '', 0, 0, 0, '', 'College of Computer Studies (CCS)', 0, '', 0, 0, 0, 0, '', '[]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"}]', 'draft', NULL, NULL, NULL, '2026-03-18 13:48:59', '2026-03-18 13:48:59'),
(9, 31, 7, 'Juan Miguel Reyes Santos', 'Administrative Officer I', 'Grade 12', 1, 1, 1, '', 'College of Business Administration & Accountancy (CBAA)', 0, '', 0, 0, 0, 0, '', '[{\"area\":\"Area of Development\",\"activity\":\"Development Activity\",\"target_date\":\"2026-03-30\",\"stage\":\"Completion Stage\"}]', '[{\"area\":\"Behavioral Training such as: Value Re-orientation, Team Building, Oral Communication, Written Communication, Customer Relations, People Development, Improving Planning & Delivery, Solving Problems and making decisions, Basic Communication Training Program, etc.\",\"priority\":\"\",\"activity\":\"Conduct of training\\/seminar\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Technical Skills Training such as: Basic Occupational Safety & health, University Safety procedures, Preventive Maintenance Activities, etc.\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Quality Management Training such as: Customer Requirements, Time Management, Continuous Improvement for Quality & Productivity, etc\",\"priority\":\"\",\"activity\":\"\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"},{\"area\":\"Others: Formal Classroom Training, on-the job training, Self-development, developmental activities\\/interventions, etc.\",\"priority\":\"\",\"activity\":\"Coaching on the Job-knowledge sharing and learning session\",\"target_date\":\"\",\"responsible\":\"\",\"stage\":\"\"}]', 'submitted', '2026-03-30 13:19:08', NULL, NULL, '2026-03-30 04:44:59', '2026-03-30 05:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `interview_questions`
--

CREATE TABLE `interview_questions` (
  `id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `question` text COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `question_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'general',
  `created_by` int DEFAULT NULL,
  `weight` decimal(3,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_questions`
--

INSERT INTO `interview_questions` (`id`, `job_posting_id`, `question`, `category`, `question_type`, `created_by`, `weight`, `created_at`) VALUES
(27, 3, 'How do you see yourself 5 years from now?', '', 'general', 14, 1.00, '2025-10-30 21:01:55'),
(28, 3, 'What are your strengths', '', 'technical', 14, 1.00, '2025-11-04 14:35:28'),
(29, 6, 'How do you see yourself 5 years from now', '', 'general', 13, 1.00, '2025-11-28 00:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `interview_rankings`
--

CREATE TABLE `interview_rankings` (
  `id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `application_id` int NOT NULL,
  `average_score` decimal(5,2) NOT NULL,
  `total_score_sheets` int DEFAULT '0',
  `rank` int NOT NULL,
  `hr_decision` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `hr_notes` text COLLATE utf8mb4_general_ci,
  `decided_by` int DEFAULT NULL,
  `decided_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_rankings`
--

INSERT INTO `interview_rankings` (`id`, `job_posting_id`, `application_id`, `average_score`, `total_score_sheets`, `rank`, `hr_decision`, `hr_notes`, `decided_by`, `decided_at`, `created_at`, `updated_at`) VALUES
(6, 3, 1, 81.60, 2, 1, 'hired', 'Selected based on interview evaluation', 14, '2026-02-26 02:08:43', '2025-11-05 15:22:44', '2026-02-26 02:08:43'),
(8, 8, 4, 82.05, 2, 1, 'hired', 'Selected based on interview evaluation', 15, '2026-02-24 08:14:17', '2026-02-24 08:13:34', '2026-02-24 08:14:17'),
(15, 11, 20, 84.64, 1, 1, 'rejected', 'Not selected - other candidates were chosen', 14, '2026-03-11 08:10:54', '2026-03-11 08:03:21', '2026-03-11 08:10:54'),
(16, 11, 23, 83.07, 1, 2, 'rejected', 'Not selected - other candidates were chosen', 14, '2026-03-11 08:11:02', '2026-03-11 08:03:21', '2026-03-11 08:11:02'),
(17, 11, 22, 75.21, 1, 3, 'hired', 'Selected based on interview evaluation', 14, '2026-03-11 08:10:50', '2026-03-11 08:03:21', '2026-03-11 08:10:50'),
(36, 1, 35, 74.79, 1, 1, 'pending', NULL, NULL, NULL, '2026-04-21 23:33:33', '2026-04-21 23:33:33'),
(37, 1, 9, 70.93, 5, 3, 'pending', NULL, NULL, NULL, '2026-04-21 23:33:33', '2026-04-22 00:03:46'),
(38, 1, 27, 72.75, 2, 2, 'pending', NULL, NULL, NULL, '2026-04-21 23:33:33', '2026-04-22 00:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `interview_responses`
--

CREATE TABLE `interview_responses` (
  `id` int NOT NULL,
  `session_id` int NOT NULL,
  `question_id` int NOT NULL,
  `response` text COLLATE utf8mb4_general_ci NOT NULL,
  `ai_score` decimal(5,2) DEFAULT NULL,
  `manual_score` decimal(5,2) DEFAULT NULL,
  `response_time` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_score_sheets`
--

CREATE TABLE `interview_score_sheets` (
  `id` int NOT NULL,
  `interview_session_id` int NOT NULL,
  `evaluator_id` int NOT NULL,
  `overall_score` decimal(5,2) NOT NULL,
  `comments` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `position_category` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Teaching or Non-teaching',
  `t_personality` decimal(5,2) DEFAULT NULL COMMENT 'Personality score (1-10)',
  `t_communication` decimal(5,2) DEFAULT NULL COMMENT 'Communication skills (1-10)',
  `t_analytical` decimal(5,2) DEFAULT NULL COMMENT 'Analytical skills (1-10)',
  `t_achievement` decimal(5,2) DEFAULT NULL COMMENT 'Achievement orientation (1-10)',
  `t_leadership` decimal(5,2) DEFAULT NULL COMMENT 'Leadership/Management (1-10)',
  `t_relationship` decimal(5,2) DEFAULT NULL COMMENT 'Relationship Management (1-10)',
  `t_job_fit` decimal(5,2) DEFAULT NULL COMMENT 'Job Fit (1-10)',
  `t_aptitude` decimal(5,2) DEFAULT NULL COMMENT 'Aptitude Test rating (1-5)',
  `t_edu_relevance` decimal(5,2) DEFAULT NULL COMMENT 'Relevance and Appropriateness of Education (0-40)',
  `t_edu_basic` decimal(5,2) DEFAULT NULL COMMENT 'Basic Minimum Requirement per QS Masteral (0-35)',
  `t_edu_doctoral` decimal(5,2) DEFAULT NULL COMMENT 'Doctoral Degree Points (0-5)',
  `t_exp_years` decimal(5,2) DEFAULT NULL COMMENT 'Experience years points (5-15)',
  `t_exp_additional` decimal(5,2) DEFAULT NULL COMMENT 'Additional experience points beyond 10 years (0-20)',
  `t_training_base` decimal(5,2) DEFAULT NULL COMMENT 'Training base (40hrs) (0-5)',
  `t_training_additional` decimal(5,2) DEFAULT NULL COMMENT 'Additional training points (0-10)',
  `t_eligibility` decimal(5,2) DEFAULT NULL COMMENT 'RA 1080, CSC Exam, BAR/BOARD Exam (0-10)',
  `t_accomplishments` decimal(5,2) DEFAULT NULL COMMENT 'Citations, Recognitions, etc. (0-5)',
  `nt_personality` decimal(5,2) DEFAULT NULL COMMENT 'Personality score (1-10)',
  `nt_communication` decimal(5,2) DEFAULT NULL COMMENT 'Communication skills (1-10)',
  `nt_analytical` decimal(5,2) DEFAULT NULL COMMENT 'Analytical skills (1-10)',
  `nt_achievement` decimal(5,2) DEFAULT NULL COMMENT 'Achievement orientation (1-10)',
  `nt_leadership` decimal(5,2) DEFAULT NULL COMMENT 'Leadership/Management (1-10)',
  `nt_relationship` decimal(5,2) DEFAULT NULL COMMENT 'Relationship Management (1-10)',
  `nt_job_fit` decimal(5,2) DEFAULT NULL COMMENT 'Job Fit (1-10)',
  `nt_exam` decimal(5,2) DEFAULT NULL COMMENT 'Written Employment Examination rating (1-5)',
  `nt_education` decimal(5,2) DEFAULT NULL COMMENT 'Basic Minimum Requirement per QS (0-30)',
  `nt_exp_years` decimal(5,2) DEFAULT NULL COMMENT 'Experience years points (2-4)',
  `nt_exp_additional` decimal(5,2) DEFAULT NULL COMMENT 'Additional experience points (0-5)',
  `nt_accomplishment` decimal(5,2) DEFAULT NULL COMMENT 'Outstanding Accomplishment (0-1)',
  `nt_training` decimal(5,2) DEFAULT NULL COMMENT 'Basic Minimum Requirement per QS (0-5)',
  `nt_eligibility` decimal(5,2) DEFAULT NULL COMMENT 'RA 1080, CSC Exam, BAR/BOARD Exam, Special Eligibility (0-10)',
  `nt_perf_rating` decimal(5,2) DEFAULT NULL COMMENT 'Overall Performance Rating (10-20)',
  `nt_perf_courtesy` decimal(5,2) DEFAULT NULL COMMENT 'Performance: Courtesy (0-4)',
  `nt_perf_relations` decimal(5,2) DEFAULT NULL COMMENT 'Performance: Human Relations (0-4)',
  `nt_perf_initiative` decimal(5,2) DEFAULT NULL COMMENT 'Performance: Initiative (0-4)',
  `nt_perf_leadership` decimal(5,2) DEFAULT NULL COMMENT 'Performance: Leadership (0-4)',
  `nt_perf_judgement` decimal(5,2) DEFAULT NULL COMMENT 'Performance: Judgement/Decision-making (0-4)',
  `detailed_scores_json` text COLLATE utf8mb4_general_ci COMMENT 'JSON storage of all detailed scores for backup',
  `score_formula_version` tinyint NOT NULL DEFAULT '2' COMMENT 'Score formula version used when computing overall score',
  `computed_overall_score` decimal(5,2) DEFAULT NULL COMMENT 'Normalized computed overall score (0-100) based on current formula'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_score_sheets`
--

INSERT INTO `interview_score_sheets` (`id`, `interview_session_id`, `evaluator_id`, `overall_score`, `comments`, `created_at`, `updated_at`, `position_category`, `t_personality`, `t_communication`, `t_analytical`, `t_achievement`, `t_leadership`, `t_relationship`, `t_job_fit`, `t_aptitude`, `t_edu_relevance`, `t_edu_basic`, `t_edu_doctoral`, `t_exp_years`, `t_exp_additional`, `t_training_base`, `t_training_additional`, `t_eligibility`, `t_accomplishments`, `nt_personality`, `nt_communication`, `nt_analytical`, `nt_achievement`, `nt_leadership`, `nt_relationship`, `nt_job_fit`, `nt_exam`, `nt_education`, `nt_exp_years`, `nt_exp_additional`, `nt_accomplishment`, `nt_training`, `nt_eligibility`, `nt_perf_rating`, `nt_perf_courtesy`, `nt_perf_relations`, `nt_perf_initiative`, `nt_perf_leadership`, `nt_perf_judgement`, `detailed_scores_json`, `score_formula_version`, `computed_overall_score`) VALUES
(5, 1, 14, 72.71, '', '2025-11-05 14:51:17', '2026-02-27 09:02:37', 'Teaching', 9.00, 8.00, 8.00, 9.00, 9.00, 10.00, 8.00, 4.00, 35.00, 25.00, 4.00, 5.00, 0.00, 4.00, 0.00, 8.00, 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 72.71),
(7, 1, 31, 90.48, '', '2025-11-05 15:11:45', '2026-02-27 09:02:37', 'Teaching', 8.00, 9.00, 8.00, 9.00, 8.00, 10.00, 8.00, 5.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 90.48),
(8, 6, 15, 83.14, '', '2026-02-24 08:05:07', '2026-02-27 09:02:37', 'Teaching', 10.00, 10.00, 10.00, 7.00, 9.00, 8.00, 10.00, 5.00, 35.00, 30.00, 4.00, 10.00, 1.00, 3.00, 1.00, 10.00, 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 83.14),
(9, 6, 36, 80.95, '', '2026-02-24 08:08:53', '2026-02-27 09:02:37', 'Teaching', 10.00, 10.00, 9.00, 8.00, 9.00, 8.00, 10.00, 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 80.95),
(10, 7, 14, 84.64, '', '2026-03-11 07:50:15', '2026-03-11 07:50:15', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4.00, 5.00, 6.00, 3.00, 7.00, 8.00, 4.00, 4.00, 29.00, 4.00, 1.00, 1.00, 5.00, 5.00, 17.00, 3.00, 3.00, 4.00, 3.00, 4.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":84.64,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":23,\"nt_exp_additional\":1,\"nt_accomplishment_items\":[\"citations\",\"honor_graduate\"],\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":5}', 2, NULL),
(11, 8, 14, 75.21, '', '2026-03-11 07:58:06', '2026-03-11 07:58:06', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 8.00, 5.00, 6.00, 7.00, 6.00, 6.00, 5.00, 26.00, 4.00, 1.00, 1.00, 1.00, 5.00, 17.00, 4.00, 3.00, 1.00, 3.00, 2.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":75.21,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":23,\"nt_exp_additional\":1,\"nt_accomplishment_items\":[\"recognitions\",\"honor_graduate\"],\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":5}', 2, NULL),
(12, 9, 14, 83.07, '', '2026-03-11 08:02:23', '2026-03-11 08:02:23', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 8.00, 9.00, 9.00, 9.00, 7.00, 8.00, 4.00, 30.00, 3.00, 0.00, 1.00, 1.00, 5.00, 18.00, 2.00, 3.00, 4.00, 4.00, 4.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":83.07,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[\"citations\",\"recognitions\"],\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":5}', 2, NULL),
(13, 5, 14, 76.79, '', '2026-04-06 02:01:00', '2026-04-06 02:01:00', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 6.00, 6.00, 8.00, 9.00, 8.00, 9.00, 4.00, 28.00, 2.00, 0.00, 1.00, 5.00, 5.00, 13.00, 3.00, 2.00, 3.00, 3.00, 4.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":76.79,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[\"citations\",\"board_bar_topnotcher\"],\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":5}', 2, NULL),
(14, 5, 93, 81.43, '', '2026-04-06 02:09:01', '2026-04-06 02:09:01', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 6.00, 7.00, 10.00, 8.00, 8.00, 9.00, 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":81.43,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[],\"nt_eligibility_items\":[],\"nt_accomplishment_score\":0,\"nt_eligibility_score\":0}', 2, NULL),
(15, 5, 94, 62.14, '', '2026-04-06 02:38:58', '2026-04-06 02:38:58', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 10.00, 4.00, 8.00, 3.00, 5.00, 5.00, 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":62.14,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[],\"nt_eligibility_items\":[],\"nt_accomplishment_score\":0,\"nt_eligibility_score\":0}', 2, NULL),
(16, 5, 12, 69.29, '', '2026-04-06 02:54:47', '2026-04-06 02:54:47', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6.00, 5.00, 6.00, 6.00, 8.00, 6.00, 4.00, 4.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":69.29,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[],\"nt_eligibility_items\":[],\"nt_accomplishment_score\":0,\"nt_eligibility_score\":0}', 2, NULL),
(17, 5, 31, 65.00, '', '2026-04-06 02:55:51', '2026-04-06 02:55:51', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 6.00, 7.00, 7.00, 9.00, 6.00, 7.00, 3.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":65,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[],\"nt_eligibility_items\":[],\"nt_accomplishment_score\":0,\"nt_eligibility_score\":0}', 2, NULL),
(18, 11, 14, 67.64, '', '2026-04-21 09:25:10', '2026-04-21 09:25:10', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6.00, 7.00, 8.00, 6.00, 7.00, 5.00, 5.00, 4.00, 24.00, 3.00, 0.00, 1.00, 4.00, 7.50, 10.00, 2.00, 2.00, 2.00, 2.00, 3.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":67.64,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[\"recognitions\",\"honor_graduate\"],\"nt_eligibility_items\":[\"ra1080\",\"csc_exam\",\"special_eligibility\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":7.5}', 2, NULL),
(19, 12, 14, 74.79, '', '2026-04-21 09:26:03', '2026-04-21 09:26:03', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 5.00, 6.00, 5.00, 7.00, 6.00, 10.00, 5.00, 30.00, 3.00, 0.00, 1.00, 5.00, 2.50, 13.00, 2.00, 2.00, 3.00, 3.00, 2.00, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":74.79,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[\"citations\"],\"nt_eligibility_items\":[\"ra1080\"],\"nt_accomplishment_score\":1,\"nt_eligibility_score\":2.5}', 2, NULL),
(20, 11, 12, 77.86, '', '2026-04-22 00:03:40', '2026-04-22 00:43:23', 'Non-teaching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 4.00, 5.00, 6.00, 7.00, 4.00, 6.00, 5.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"position_category\":\"Non-teaching\",\"score_formula_version\":2,\"computed_overall_score\":77.86,\"t_exp_additional_years\":0,\"t_training_additional_hours\":0,\"t_eligibility_items\":[],\"t_eligibility_score\":0,\"t_accomplishment_items\":[],\"t_accomplishment_score\":0,\"nt_exp_additional_years\":0,\"nt_exp_additional\":0,\"nt_accomplishment_items\":[],\"nt_eligibility_items\":[],\"nt_accomplishment_score\":0,\"nt_eligibility_score\":0}', 2, 77.86);

-- --------------------------------------------------------

--
-- Table structure for table `interview_sessions`
--

CREATE TABLE `interview_sessions` (
  `id` int NOT NULL,
  `application_id` int NOT NULL,
  `interviewer_id` int NOT NULL,
  `meeting_link` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `meeting_platform` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'scheduled',
  `ai_rating` decimal(5,2) DEFAULT NULL,
  `manual_rating` decimal(5,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_sessions`
--

INSERT INTO `interview_sessions` (`id`, `application_id`, `interviewer_id`, `meeting_link`, `meeting_platform`, `scheduled_date`, `status`, `ai_rating`, `manual_rating`, `notes`, `created_at`) VALUES
(1, 1, 14, 'https://meet.google.com/zjk-dbup-rie', 'Google Meet', '2025-11-04 13:00:00', 'scheduled', NULL, NULL, NULL, '2025-10-30 19:24:30'),
(2, 2, 14, 'https://meet.google.com/zjk-dbup-rie', 'Google Meet', '2025-11-04 13:00:00', 'scheduled', NULL, NULL, NULL, '2025-10-30 19:24:34'),
(3, 3, 13, 'https://meet.google.com/qnp-bwvk-usv', 'Google Meet', '2025-11-28 09:00:00', 'scheduled', NULL, NULL, NULL, '2025-11-28 00:35:14'),
(4, 5, 14, 'ICTS', 'F2F', '2026-02-20 15:00:00', 'scheduled', NULL, NULL, NULL, '2026-02-13 07:21:31'),
(5, 9, 14, 'ICTS', 'F2F', '2026-02-20 15:00:00', 'scheduled', NULL, NULL, NULL, '2026-02-13 07:21:39'),
(6, 4, 15, 'ICTS office', 'F2F', '2026-02-25 15:57:00', 'scheduled', NULL, NULL, NULL, '2026-02-24 07:57:36'),
(7, 20, 14, 'ICT BUILDING', 'F2F', '2026-03-11 15:10:00', 'scheduled', NULL, NULL, NULL, '2026-03-11 07:11:05'),
(8, 22, 14, 'ICT BUILDING', 'F2F', '2026-03-11 15:10:00', 'scheduled', NULL, NULL, NULL, '2026-03-11 07:11:13'),
(9, 23, 14, 'ICT BUILDING', 'F2F', '2026-03-11 15:10:00', 'scheduled', NULL, NULL, NULL, '2026-03-11 07:11:20'),
(10, 12, 14, 'ICT BUILDING', 'F2F', '2026-03-11 15:25:00', 'scheduled', NULL, NULL, NULL, '2026-03-11 07:25:39'),
(11, 27, 14, 'ICT BUILDING', 'F2F', '2026-04-22 16:00:00', 'scheduled', NULL, NULL, NULL, '2026-04-21 09:23:09'),
(12, 35, 14, 'ICT BUILDING', 'F2F', '2026-04-22 16:00:00', 'scheduled', NULL, NULL, NULL, '2026-04-21 09:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  `applicant_id` int NOT NULL,
  `application_letter` text COLLATE utf8mb4_general_ci NOT NULL,
  `pds_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cv_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tor_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `certificates_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `other_documents` text COLLATE utf8mb4_general_ci,
  `t_eligibility_file` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `t_eligibility_files_json` longtext COLLATE utf8mb4_general_ci,
  `nt_eligibility_file` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nt_eligibility_files_json` longtext COLLATE utf8mb4_general_ci,
  `status` int NOT NULL DEFAULT '1',
  `education_qualified` tinyint(1) DEFAULT NULL,
  `training_qualified` tinyint(1) DEFAULT NULL,
  `evaluated_score` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qualification_reviewed_by` int DEFAULT NULL,
  `qualification_reviewed_at` datetime DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_score` decimal(5,2) DEFAULT NULL,
  `exam_passed` tinyint(1) DEFAULT NULL,
  `interview_score` decimal(5,2) DEFAULT NULL,
  `interview_notes` text COLLATE utf8mb4_general_ci,
  `interview_date` datetime DEFAULT NULL,
  `hiring_decision` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hiring_notes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_posting_id`, `applicant_id`, `application_letter`, `pds_file`, `cv_file`, `tor_file`, `certificates_file`, `other_documents`, `t_eligibility_file`, `t_eligibility_files_json`, `nt_eligibility_file`, `nt_eligibility_files_json`, `status`, `education_qualified`, `training_qualified`, `evaluated_score`, `qualification_reviewed_by`, `qualification_reviewed_at`, `applied_at`, `exam_score`, `exam_passed`, `interview_score`, `interview_notes`, `interview_date`, `hiring_decision`, `hiring_notes`) VALUES
(1, 3, 12, '1761741188_app_letter_12.pdf', '1761741188_pds_12.pdf', '1761741188_cv_12.pdf', '1761741188_tor_12.pdf', '1761741188_certs_12.pdf', '1761741188_other_0_12.pdf', NULL, NULL, NULL, NULL, 8, NULL, NULL, 0.00, NULL, NULL, '2025-10-29 16:33:09', 88.00, 1, 90.48, NULL, '2026-02-26 10:08:43', 'hired', 'Selected based on interview evaluation'),
(2, 3, 26, '1761742851_app_letter_26.pdf', '1761742851_pds_26.pdf', '1761742851_cv_26.pdf', '1761742851_tor_26.pdf', '1761742851_certs_26.pdf', '1761742851_other_0_26.pdf', NULL, NULL, NULL, NULL, 10, NULL, NULL, 0.00, NULL, NULL, '2025-10-29 17:00:51', 80.00, 1, NULL, NULL, NULL, NULL, NULL),
(3, 6, 25, '1764289512_app_letter_25.pdf', '1764289512_pds_25.pdf', '1764289512_cv_25.pdf', '1764289512_tor_25.pdf', '1764289512_certs_25.pdf', '1764289512_other_0_25.pdf', NULL, NULL, NULL, NULL, 7, NULL, NULL, 0.00, NULL, NULL, '2025-11-28 00:25:12', 100.00, 1, NULL, NULL, NULL, NULL, NULL),
(4, 8, 33, '1764608026_app_letter_33.pdf', '1764608026_pds_33.pdf', '1764608026_cv_33.pdf', '1764608026_tor_33.pdf', '1764608026_certs_33.pdf', '1764608026_other_0_33.pdf', NULL, NULL, NULL, NULL, 7, NULL, NULL, 0.00, NULL, NULL, '2025-12-01 16:53:46', 100.00, 1, 80.95, NULL, '2026-02-24 16:08:53', NULL, NULL),
(5, 1, 12, '1770798130_app_letter_12.docx', '1770798130_pds_12.docx', '1770798130_cv_12.docx', '1770798130_tor_12.docx', '1770798130_certs_12.docx', '1770798130_other_0_12.docx', NULL, NULL, NULL, NULL, 7, NULL, NULL, 0.00, NULL, NULL, '2026-02-11 08:22:10', 83.33, 1, NULL, NULL, NULL, NULL, NULL),
(6, 4, 12, '1770798805_app_letter_12.docx', '1770798805_pds_12.docx', '1770798805_cv_12.docx', '1770798805_tor_12.docx', '1770798805_certs_12.docx', '1770798805_other_0_12.docx', NULL, NULL, NULL, NULL, 6, NULL, NULL, 0.00, NULL, NULL, '2026-02-11 08:33:25', 0.00, 0, NULL, NULL, NULL, NULL, NULL),
(7, 4, 6, '1770860755_app_letter_6.pdf', '1770860755_pds_6.pdf', '1770860755_cv_6.pdf', '1770860755_tor_6.pdf', '1770860755_certs_6.pdf', '1770860755_other_0_6.pdf', NULL, NULL, NULL, NULL, 11, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 01:45:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 3, 6, '1770860778_app_letter_6.pdf', '1770860778_pds_6.pdf', '1770860778_cv_6.pdf', '1770860778_tor_6.pdf', '1770860778_certs_6.pdf', '1770860778_other_0_6.pdf', NULL, NULL, NULL, NULL, 10, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 01:46:18', 76.00, 1, NULL, NULL, NULL, NULL, NULL),
(9, 1, 6, '1770860815_app_letter_6.pdf', '1770860815_pds_6.pdf', '1770860815_cv_6.pdf', '1770860815_tor_6.pdf', '1770860815_certs_6.pdf', '', NULL, NULL, NULL, NULL, 7, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 01:46:55', 75.00, 1, 65.00, NULL, '2026-04-06 10:55:51', NULL, NULL),
(10, 4, 25, '1770861994_app_letter_25.pdf', '1770861994_pds_25.pdf', '1770861994_cv_25.pdf', '1770861994_tor_25.pdf', '1770861994_certs_25.pdf', '1770861994_other_0_25.pdf', NULL, NULL, NULL, NULL, 11, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 02:06:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 3, 25, '1770862230_app_letter_25.pdf', '1770862230_pds_25.pdf', '1770862230_cv_25.pdf', '1770862230_tor_25.pdf', '1770862230_certs_25.pdf', '1770862230_other_0_25.pdf', NULL, NULL, NULL, NULL, 10, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 02:10:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, 25, '1770862484_app_letter_25.pdf', '1770862484_pds_25.pdf', '1770862484_cv_25.pdf', '1770862484_tor_25.pdf', '1770862484_certs_25.pdf', '', NULL, NULL, NULL, NULL, 7, NULL, NULL, 0.00, NULL, NULL, '2026-02-12 02:14:44', 41.67, 0, NULL, NULL, NULL, NULL, NULL),
(13, 1, 27, '1770951080_app_letter_27.pdf', '1770951080_pds_27.pdf', '1770951080_cv_27.pdf', '1770951080_tor_27.pdf', '1770951080_certs_27.pdf', '1770951080_other_0_27.pdf', NULL, NULL, NULL, NULL, 3, 0, 0, 0.00, 14, '2026-03-25 09:50:15', '2026-02-13 02:51:20', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]'),
(14, 8, 121, '1771917279_app_letter_121.pdf', '1771917279_pds_121.pdf', '1771917279_cv_121.pdf', '1771917279_tor_121.pdf', '1771917279_certs_121.pdf', '', NULL, NULL, NULL, NULL, 6, NULL, NULL, 0.00, NULL, NULL, '2026-02-24 07:14:39', 0.00, 0, NULL, NULL, NULL, NULL, NULL),
(15, 8, 6, '1771917980_app_letter_6.pdf', '1771917980_pds_6.pdf', '1771917980_cv_6.pdf', '1771917980_tor_6.pdf', '1771917980_certs_6.pdf', '', NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.00, NULL, NULL, '2026-02-24 07:26:20', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]'),
(19, 10, 122, '1772175334_app_letter_122.pdf', '1772175334_pds_122.pdf', '1772175334_cv_122.pdf', '1772175334_tor_122.pdf', '1772175334_certs_122.pdf', '', NULL, NULL, NULL, NULL, 3, 0, 0, 0.00, 16, '2026-03-25 10:52:52', '2026-02-27 06:55:34', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]'),
(20, 11, 6, '1772415070_app_letter_6.pdf', '1772415070_pds_6.pdf', '1772415070_cv_6.pdf', '1772415070_tor_6.pdf', '1772415070_certs_6.pdf', '1772415070_other_0_6.pdf', NULL, NULL, NULL, NULL, 10, NULL, NULL, 0.00, NULL, NULL, '2026-03-02 01:31:10', 50.00, 0, 84.64, NULL, '2026-03-11 16:10:54', 'rejected', 'Not selected - other candidates were chosen'),
(21, 10, 25, '1772418646_app_letter_25.pdf', '1772418646_pds_25.pdf', '1772418646_cv_25.pdf', '1772418646_tor_25.pdf', '1772418646_certs_25.pdf', '1772418646_other_0_25.pdf', NULL, NULL, NULL, NULL, 3, 0, 0, 0.00, 16, '2026-03-25 10:52:45', '2026-03-02 02:30:46', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]'),
(22, 11, 25, '1772418870_app_letter_25.pdf', '1772418870_pds_25.pdf', '1772418870_cv_25.pdf', '1772418870_tor_25.pdf', '1772418870_certs_25.pdf', '1772418870_other_0_25.pdf', NULL, NULL, NULL, NULL, 8, NULL, NULL, 0.00, NULL, NULL, '2026-03-02 02:34:30', 60.00, 0, 75.21, NULL, '2026-03-11 16:10:50', 'hired', 'Selected based on interview evaluation'),
(23, 11, 122, '1772418979_app_letter_122.pdf', '1772418979_pds_122.pdf', '1772418979_cv_122.pdf', '1772418979_tor_122.pdf', '1772418979_certs_122.pdf', '1772418979_other_0_122.pdf', NULL, NULL, NULL, NULL, 10, NULL, NULL, 0.00, NULL, NULL, '2026-03-02 02:36:19', 80.00, 1, 83.07, NULL, '2026-03-11 16:11:02', 'rejected', 'Not selected - other candidates were chosen'),
(24, 2, 6, '1773626409_app_letter_6.pdf', '1773626409_pds_6.pdf', '1773626409_cv_6.pdf', '1773626409_tor_6.pdf', '1773626409_certs_6.pdf', '1773626409_other_0_6.pdf', NULL, NULL, NULL, NULL, 4, 0, 0, 9.00, 14, '2026-03-16 12:51:37', '2026-03-16 02:00:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 2, 26, '1773630354_app_letter_26.pdf', '1773630354_pds_26.pdf', '1773630354_cv_26.pdf', '1773630354_tor_26.pdf', '1773630354_certs_26.pdf', '1773630354_other_0_26.pdf', NULL, NULL, NULL, NULL, 11, 1, 0, 0.00, 14, '2026-03-16 12:41:03', '2026-03-16 03:05:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 2, 27, '1773638869_app_letter_27.pdf', '1773638869_pds_27.pdf', '1773638869_cv_27.pdf', '1773638869_tor_27.pdf', '1773638869_certs_27.pdf', '1773638869_other_0_27.pdf', NULL, NULL, NULL, NULL, 11, 1, 1, 45.00, 14, '2026-03-16 13:29:43', '2026-03-16 05:27:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1, 28, '1773707401_app_letter_28.pdf', '1773707401_pds_28.pdf', '1773707401_cv_28.pdf', '1773707401_tor_28.pdf', '1773707401_certs_28.pdf', '1773707401_other_0_28.pdf,1773707401_other_1_28.pdf', NULL, NULL, NULL, NULL, 7, 1, 1, 41.50, 14, '2026-04-21 09:11:16', '2026-03-17 00:30:01', 100.00, 1, 77.86, NULL, '2026-04-22 08:43:23', NULL, '[AUTO_EMAIL_VERIFIED_SENT]'),
(28, 2, 28, '1773710373_app_letter_28.pdf', '1773710373_pds_28.pdf', '1773710373_cv_28.pdf', '1773710373_tor_28.pdf', '1773710373_certs_28.pdf', '', NULL, NULL, NULL, NULL, 2, 1, 1, 39.00, 14, '2026-04-20 16:22:16', '2026-03-17 01:19:33', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_VERIFIED_SENT]'),
(29, 10, 28, '1773711959_app_letter_28.pdf', '1773711959_pds_28.pdf', '1773711959_cv_28.pdf', '1773711959_tor_28.pdf', '1773711959_certs_28.pdf', '1773711959_other_0_28.pdf,1773711959_other_1_28.pdf', NULL, NULL, NULL, NULL, 2, 1, 1, 55.00, 16, '2026-03-25 10:52:38', '2026-03-17 01:45:59', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_VERIFIED_SENT]'),
(30, 2, 122, '1773712760_app_letter_122.pdf', '1773712760_pds_122.pdf', '1773712760_cv_122.pdf', '1773712760_tor_122.pdf', '1773712760_certs_122.pdf', '1773712760_other_0_122.pdf', NULL, NULL, NULL, NULL, 11, 1, 1, 39.00, 14, '2026-03-17 10:18:40', '2026-03-17 01:59:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 13, 28, '1774403705_app_letter_28.pdf', '1774403705_pds_28.pdf', '', '1774403705_tor_28.pdf', '', '', NULL, NULL, NULL, NULL, 2, 1, 1, 65.00, 14, '2026-03-25 10:34:05', '2026-03-25 01:55:05', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_VERIFIED_SENT]'),
(32, 15, 6, '1776647700_app_letter_6.pdf', '1776647700_pds_6.pdf', '1776647700_cv_6.pdf', '1776647700_tor_6.pdf', '', '', NULL, NULL, NULL, NULL, 4, 1, 1, 45.00, 14, '2026-04-20 09:24:52', '2026-04-20 01:15:00', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]\n[AUTO_EMAIL_VERIFIED_SENT]'),
(33, 15, 28, '1776672915_app_letter_28.pdf', '1776672915_pds_28.pdf', '1776672915_cv_28.pdf', '1776672915_tor_28.pdf', '', '', NULL, NULL, NULL, NULL, 4, 1, 1, 45.00, 14, '2026-04-20 16:15:56', '2026-04-20 08:15:15', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_VERIFIED_SENT]'),
(34, 15, 27, '1776673164_app_letter_27.pdf', '1776673164_pds_27.pdf', '1776673164_cv_27.pdf', '1776673164_tor_27.pdf', '', '', NULL, NULL, NULL, NULL, 3, 0, 0, 0.00, 14, '2026-04-20 16:42:08', '2026-04-20 08:19:24', NULL, NULL, NULL, NULL, NULL, NULL, '[AUTO_EMAIL_NOT_QUALIFIED_SENT]'),
(35, 1, 26, '1776735951_app_letter_26.pdf', '1776735951_pds_26.pdf', '', '1776735951_tor_26.pdf', '', '', NULL, NULL, NULL, NULL, 7, 1, 1, 41.50, 14, '2026-04-21 09:46:07', '2026-04-21 01:45:51', 100.00, 1, 74.79, NULL, '2026-04-21 17:26:03', NULL, '[AUTO_EMAIL_VERIFIED_SENT]');

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` int NOT NULL,
  `campus` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Los Baños',
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `requirements` text COLLATE utf8mb4_general_ci NOT NULL,
  `required_documents_json` longtext COLLATE utf8mb4_general_ci,
  `qualifications` text COLLATE utf8mb4_general_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salary_range` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `employment_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `position_category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `application_deadline` date DEFAULT NULL,
  `max_applications` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `title`, `department_id`, `campus`, `description`, `requirements`, `required_documents_json`, `qualifications`, `image_path`, `salary_range`, `employment_type`, `position_category`, `application_deadline`, `max_applications`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Administrative Officer I (Accounting Support)', 17, 'SANTA CRUZ', 'This position provides essential technical and administrative support to the Accounting Office, handling moderately complex financial and administrative transactions.', '', NULL, 'Experience:\r\nNone required. (Experience in administrative or accounting work is an advantage but not mandatory for SG-10 entry-level.)\r\n\r\nEligibility:\r\nCareer Service (Professional) Eligibility or a relevant Second Level Eligibility (e.g., CPA license or BAR eligibility if applicable, though typically only for higher SG positions).\r\n\r\nSkills:\r\nProficiency in Microsoft Office Suite, particularly Excel and Word.\r\nKnowledge of basic government accounting and auditing rules/processes is a plus.\r\nStrong attention to detail, organization, and analytical skills.', NULL, 'Grade 10', 'Plantilla', 'Non-teaching', '2026-04-30', NULL, 1, 14, '2025-10-29 10:22:41', '2026-04-21 01:33:34'),
(2, 'Part-Time Clerk / Administrative Assistant (Enrollment Peak)', 18, 'SANTA CRUZ', 'This is a part-time, project-based position, primarily tasked with assisting the Registrar Office during peak periods like enrollment, admissions, and graduation clearance.', 'eyy', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Minimum: Completion of at least two years of college studies is preferred.\r\nHigh School Graduates with extensive relevant clerical experience may be considered.\r\nSix (6) months of experience in a clerical or office setting is desirable, especially in an academic or high-volume environment.\r\n\r\nSkills &amp;amp;amp;amp;amp;amp;amp; Abilities:\r\nHigh proficiency in data entry with meticulous attention to detail and accuracy.\r\nExcellent organizational and time management skills to handle peak workloads.\r\nProficiency in using a computer for word processing and spreadsheet applications (MS Excel and Word).', NULL, '500', 'Part time', 'Non-teaching', '2026-03-27', NULL, 2, 14, '2025-10-29 10:48:02', '2026-03-30 07:19:00'),
(3, 'Instructor', 9, 'SANTA CRUZ', 'This position involves delivering high-quality instruction, conducting research, and providing extension services within the College of Computer Studies.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Minimum: Master&amp;amp;amp;amp;amp;amp;amp;amp;amp;#039;s Degree in Computer Science, Information Technology, Computer Engineering, or a closely related field.\r\nCandidates who are currently pursuing a Master&amp;amp;amp;amp;amp;amp;amp;amp;amp;#039;s degree may be considered if they meet specific credit hour requirements.', NULL, 'Grade 10', 'Plantilla', 'Teaching', '2026-03-27', NULL, 3, 14, '2025-10-29 11:07:35', '2026-03-24 04:28:40'),
(4, 'Lecturer (Civil Engineering)', 12, 'SANTA CRUZ', 'Understood. I will present the final section without bullet points, as requested.????️ College of Engineering Part-Time Faculty ProfileFieldSuggested ContentJob TitlePart-Time Instructor / Lecturer (Civil Engineering)DepartmentCOE - College of Engineering (COE)CampusSANTA CRUZ campusEmployment TypePart-timeCategoryTeachingSalaryP500 - P1,500/hour (Based on the example rate)???? Job Description (Short Version)This position requires a Licensed Engineer to teach specific, assigned undergraduate engineering courses on a per-hour basis. Deliver effective instruction and conduct laboratory sessions for assigned undergraduate engineering courses. Prepare and administer course materials, examinations, and student assessments. Maintain accurate attendance and grade records, submitting final grades promptly. Provide basic academic consultation to students during scheduled office hours.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Education: Minimum Bachelor of Science degree in the relevant Engineering field (e.g., BS Civil Engineering, BS Electrical Engineering). Preference for candidates with a Master&amp;amp;amp;amp;#039;s degree (M.S. or M.Eng.) in the related engineering discipline. Experience: At least one (1) year of professional practice in the field after passing the board exam, OR prior teaching experience. Training: Relevant industry certifications or specialized training in their field are highly preferred. Eligibility: Must be a duly registered and Licensed Engineer (R.A. 1080) in the specific field to be taught (e.g., Civil Engineer, Mechanical Engineer, etc.). Skills &amp;amp;amp;amp;amp; Abilities: Proficiency in relevant engineering software (e.g., AutoCAD, modeling software). Strong presentation and communication skills.', NULL, '120', 'Part time', 'Teaching', '2026-02-27', NULL, 2, 14, '2025-10-29 11:12:05', '2026-03-24 04:28:40'),
(5, 'asdasdasd', 21, 'LOS BAÑOS', 'asdasd', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'asdasdasd', NULL, 'Grade 16', 'Plantilla', 'Non-teaching', '2026-02-14', NULL, 2, 13, '2025-11-04 17:30:55', '2026-03-24 04:28:40'),
(6, 'Soil Science', 6, 'LOS BAÑOS', 'Assist the faculty-in-charge during laboratory classes and field demonstrations.\r\nHelp in checking quizzes, problem sets, and laboratory reports.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Must be a knowledgeable student (3rd year standing or higher) or a recent graduate of BS Agriculture.', NULL, '100', 'Part time', 'Teaching', '2026-02-14', NULL, 2, 13, '2025-11-28 00:24:26', '2026-03-24 04:28:40'),
(7, 'Soil Science', 6, 'LOS BAÑOS', 'Assist the faculty-in-charge during laboratory classes and field demonstrations.\r\nHelp in checking quizzes, problem sets, and laboratory reports.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Must be a knowledgeable student (3rd year standing or higher) or a recent graduate of BS Agriculture.', NULL, '100', 'Part time', 'Teaching', '2026-02-14', NULL, 2, 13, '2025-11-28 00:25:19', '2026-03-24 04:28:40'),
(8, 'Professor for Business Mgt.', 8, 'SAN PABLO', 'Teach business management courses.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'At least 2 years of teaching experience', NULL, '120', 'Job Order', 'Teaching', '2026-02-27', NULL, 2, 15, '2025-12-01 16:32:13', '2026-03-24 04:28:40'),
(9, 'IT Technician', 9, 'SAN PABLO', 'Provide IT support to the campus.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Cisco certified', NULL, 'Grade 1', 'Plantilla', 'Non-teaching', '2026-02-14', NULL, 2, 15, '2025-12-01 16:32:13', '2026-03-24 04:28:40'),
(10, 'Teach', 14, 'SINILOAN', 'kokokoasd', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'asdadas', NULL, 'Grade 5', 'Plantilla', 'Teaching', '2026-04-11', NULL, 2, 16, '2026-02-11 07:52:44', '2026-04-21 00:17:30'),
(11, 'Human Resources Assistant', 29, 'SANTA CRUZ', 'This position provides administrative support to the HR department. The HR Assistant will handle employee records, assist in the recruitment process, schedule interviews, and manage daily attendance and leave requests.', '', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Bachelor&amp;#039;s Degree in Psychology, Human Resource Management, or Business Administration. Strong organizational and interpersonal skills, with strict attention to confidentiality.', 'uploads/job_posting/job_20260226_133919_f8bc5cd2298d.jpg', 'Grade 5', 'Plantilla', 'Non-teaching', '2026-03-27', NULL, 3, 14, '2026-02-26 05:39:19', '2026-03-24 04:28:40'),
(12, 'Instuctor 1', 63, 'SANTA CRUZ', 'Job Description', 'Requirements', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\",\"certificates_file\"]', 'Qualifications', NULL, 'Grade 5', 'Plantilla', 'Teaching', '2026-04-17', NULL, 0, 14, '2026-03-17 02:49:05', '2026-03-24 04:28:40'),
(13, 'Instructor', 55, 'SANTA CRUZ', 'one (1) clinical instructor', '- Application letter addressed to: University President, Laguna State Polytechnic University\n- Resume / Personal Data Sheet (PDS)\n- Transcript of Records (TOR)', '[\"application_letter\",\"pds_file\",\"tor_file\"]', 'bachelor&#039;s degree in the area of specialization, with relevant master&#039;s degree or master&#039;s degree units earned and with equivalent professional license', 'uploads/job_posting/job_20260324_145901_873a52044fd9.jpg', '120', 'Part time', 'Teaching', '2026-03-31', NULL, 2, 14, '2026-03-24 06:59:01', '2026-04-06 01:31:57'),
(14, 'INTERNAL AUDITOR', 74, 'SANTA CRUZ', 'Note: Applications with incomplete documents shall not be entertained.\r\nLSPIJ - Los Baöos Campus adheres to the general existing Equal Employment Opportunity Principle (EEOP), as such, there is no discrimination based on gender\r\nidentity, sexual orientation, disabilities, religion and/or indigenous group membership in the implementation of Human Resource Merit Promotion and Selection. All\r\ninterested and qualified applicants are encouraged to apply.', '- Application letter addressed to: University President, Laguna State Polytechnic University\n- Resume / Personal Data Sheet (PDS)\n- Curriculum Vitae (CV)\n- Transcript of Records (TOR)', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\"]', 'bachelor&#039;s degree relevant to the job\r\nTraining: none required\r\nEligibility:\r\nCareer Service (Professional/\r\nSecond Level Eligibility)\r\nExperience: none required\r\nCompetency: none required\r\nInterested and qualified applicants should signify their interest in writing. Attach the following\r\ndocuments to the application letter not later than April 9, 2026:\r\n• fully accomplished Personal Data Sheet (PDS) with Work Experience Sheet and recent\r\npassport-sized or unfiltered digital picture (CS Form No. 212, Revised 2025); digitally signed or\r\nelectronically signed;\r\n• hard copy or electronic copy of performance rating in the last rating period (if applicable);\r\n• hard copy or electronic copy of proof of eligibility/rating/license; nd\r\n• hard copy or electronic copy of of transcript of records.', 'uploads/job_posting/job_20260420_083324_c35bd9a18714.jpg', 'Grade 11', 'Plantilla', 'Non-teaching', '2026-04-30', NULL, 0, 14, '2026-04-20 00:33:24', '2026-04-21 00:34:36'),
(15, 'INTERNAL AUDITOR', 74, 'SANTA CRUZ', 'Note: Applications with incomplete documents shall not be entertained.\r\nLSPIJ - Santa cruz Campus adheres to the general existing Equal Employment Opportunity Principle (EEOP), as such, there is no discrimination based on gender\r\nidentity, sexual orientation, disabilities, religion and/or indigenous group membership in the implementation of Human Resource Merit Promotion and Selection. All\r\ninterested and qualified applicants are encouraged to apply.', '- Application letter addressed to: University President, Laguna State Polytechnic University\n- Resume / Personal Data Sheet (PDS)\n- Curriculum Vitae (CV)\n- Transcript of Records (TOR)', '[\"application_letter\",\"pds_file\",\"cv_file\",\"tor_file\"]', 'bachelor&amp;#039;s degree relevant to the job\r\nTraining: none required\r\nEligibility:\r\nCareer Service (Professional/\r\nSecond Level Eligibility)\r\nExperience: none required\r\nCompetency: none required\r\nInterested and qualified applicants should signify their interest in writing. Attach the following\r\ndocuments to the application letter not later than April 9, 2026:\r\n• fully accomplished Personal Data Sheet (PDS) with Work Experience Sheet and recent\r\npassport-sized or unfiltered digital picture (CS Form No. 212, Revised 2025); digitally signed or\r\nelectronically signed;\r\n• hard copy or electronic copy of performance rating in the last rating period (if applicable);\r\n• hard copy or electronic copy of proof of eligibility/rating/license; nd\r\n• hard copy or electronic copy of of transcript of records.', 'uploads/job_posting/job_20260420_084003_bcda3142b924.jpg', 'Grade 11', 'Plantilla', 'Non-teaching', '2026-04-30', NULL, 1, 14, '2026-04-20 00:40:03', '2026-04-20 01:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `leave_type` enum('Vacation Leave','Sick Leave','Maternity Leave','Paternity Leave','Special Privilege Leave','Solo Parent Leave','Study Leave','Others') COLLATE utf8mb4_general_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `number_of_days` decimal(4,1) NOT NULL,
  `reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `commutation` enum('Not Requested','Requested') COLLATE utf8mb4_general_ci DEFAULT 'Not Requested',
  `status` enum('pending','approved','rejected','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_balances`
--

CREATE TABLE `leave_balances` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `year` int NOT NULL,
  `vacation_leave` decimal(5,1) DEFAULT '15.0',
  `sick_leave` decimal(5,1) DEFAULT '15.0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_balances`
--

INSERT INTO `leave_balances` (`id`, `employee_id`, `year`, `vacation_leave`, `sick_leave`, `created_at`, `updated_at`) VALUES
(1, 30, 2025, 15.0, 15.0, '2025-10-30 15:05:47', '2025-10-30 15:05:47'),
(2, 5, 2025, 15.0, 15.0, '2025-10-30 15:06:17', '2025-10-30 15:06:17'),
(3, 31, 2025, 15.0, 15.0, '2025-11-04 07:50:10', '2025-11-04 07:50:10'),
(4, 18, 2025, 15.0, 15.0, '2025-11-05 13:07:40', '2025-11-05 13:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pass_slips`
--

CREATE TABLE `pass_slips` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `time_out` time NOT NULL,
  `time_in` time NOT NULL,
  `purpose` enum('Official Business','Personal','Emergency') COLLATE utf8mb4_general_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance_peer_ratings`
--

CREATE TABLE `performance_peer_ratings` (
  `id` int NOT NULL,
  `peer_selection_id` int NOT NULL,
  `performance_rating_id` int NOT NULL,
  `peer_evaluator_id` int NOT NULL,
  `rating_1_professionalism` decimal(2,1) DEFAULT NULL,
  `rating_2_responsiveness` decimal(2,1) DEFAULT NULL,
  `rating_3_feedback` decimal(2,1) DEFAULT NULL,
  `rating_4_integrity` decimal(2,1) DEFAULT NULL,
  `rating_5_stress` decimal(2,1) DEFAULT NULL,
  `total_score` decimal(3,2) DEFAULT NULL,
  `adjectival_rating` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance_peer_selections`
--

CREATE TABLE `performance_peer_selections` (
  `id` int NOT NULL,
  `performance_rating_id` int NOT NULL,
  `employee_id` int NOT NULL COMMENT 'Employee being rated',
  `peer_evaluator_id` int NOT NULL COMMENT 'Selected peer to evaluate',
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performance_peer_selections`
--

INSERT INTO `performance_peer_selections` (`id`, `performance_rating_id`, `employee_id`, `peer_evaluator_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 107, 93, 'pending', '2026-04-16 01:00:28', '2026-04-16 01:00:28'),
(2, 2, 107, 102, 'pending', '2026-04-16 01:00:28', '2026-04-16 01:00:28'),
(3, 2, 107, 12, 'pending', '2026-04-16 01:00:28', '2026-04-16 01:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `performance_ratings`
--

CREATE TABLE `performance_ratings` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL COMMENT 'Job Order employee being rated',
  `evaluator_id` int NOT NULL COMMENT 'Department Head who is rating',
  `rating_period` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department_unit` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating_1_quantity` int DEFAULT NULL COMMENT 'Quantity of work',
  `rating_2_quality` int DEFAULT NULL COMMENT 'Quality of work',
  `rating_3_job_knowledge` int DEFAULT NULL COMMENT 'Job knowledge',
  `rating_4_judgment` int DEFAULT NULL COMMENT 'Judgment',
  `rating_5_initiative` int DEFAULT NULL COMMENT 'Initiative and creativity',
  `rating_6_dependability` int DEFAULT NULL COMMENT 'Dependability',
  `rating_7_cooperation` int DEFAULT NULL COMMENT 'Cooperation',
  `rating_8_learning` int DEFAULT NULL COMMENT 'Learning ability',
  `rating_9_punctuality` int DEFAULT NULL COMMENT 'Punctuality and attendance',
  `rating_10_human_relations` int DEFAULT NULL COMMENT 'Human relations',
  `supervisor_total_score` decimal(5,2) DEFAULT NULL COMMENT 'Total score / 10',
  `supervisor_adjectival_rating` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `supervisor_recommendation` text COLLATE utf8mb4_general_ci,
  `client_rating_1_professionalism` int DEFAULT NULL,
  `client_rating_2_responsiveness` int DEFAULT NULL,
  `client_rating_3_feedback` int DEFAULT NULL,
  `client_rating_4_integrity` int DEFAULT NULL,
  `client_rating_5_stress` int DEFAULT NULL,
  `client_total_score` decimal(5,2) DEFAULT NULL COMMENT 'Total score / 5',
  `client_adjectival_rating` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `overall_rating` decimal(5,2) DEFAULT NULL COMMENT 'Weighted overall rating',
  `final_recommendation` text COLLATE utf8mb4_general_ci,
  `status` enum('draft','submitted','reviewed','approved') COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `peer_selection_status` enum('pending','selected','completed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance_ratings`
--

INSERT INTO `performance_ratings` (`id`, `employee_id`, `evaluator_id`, `rating_period`, `name`, `department_unit`, `position`, `rating_1_quantity`, `rating_2_quality`, `rating_3_job_knowledge`, `rating_4_judgment`, `rating_5_initiative`, `rating_6_dependability`, `rating_7_cooperation`, `rating_8_learning`, `rating_9_punctuality`, `rating_10_human_relations`, `supervisor_total_score`, `supervisor_adjectival_rating`, `supervisor_recommendation`, `client_rating_1_professionalism`, `client_rating_2_responsiveness`, `client_rating_3_feedback`, `client_rating_4_integrity`, `client_rating_5_stress`, `client_total_score`, `client_adjectival_rating`, `overall_rating`, `final_recommendation`, `status`, `peer_selection_status`, `submitted_at`, `reviewed_by`, `reviewed_at`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, 22, 23, '2026', 'Miguel Torres Santos', 'College of Engineering (COE)', 'IT Support Specialist', 5, 4, 4, 5, 5, 4, 5, 4, 4, 5, 4.50, 'Excellent', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4.50, '', 'submitted', 'pending', '2026-01-06 04:53:15', NULL, NULL, NULL, NULL, '2026-01-05 20:53:15', '2026-01-05 20:53:15'),
(2, 107, 123, '2026', 'Francisco Miguel Santos Santos', 'College of Computer Studies (CCS)', 'Driver', 5, 4, 4, 3, 4, 3, 4, 3, 4, 3, 3.70, 'Very Satisfactory', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.70, '', 'submitted', 'selected', '2026-04-16 08:59:49', NULL, NULL, NULL, NULL, '2026-04-16 00:59:49', '2026-04-16 01:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `permission_to_study`
--

CREATE TABLE `permission_to_study` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `employee_number` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campus` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` enum('Male','Female') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `civil_status` enum('Single','Married','Widowed','Separated') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_general_ci,
  `years_in_service` int DEFAULT NULL,
  `citizenship` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Filipino',
  `school_type` enum('Public','Private') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_graduated` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_address` text COLLATE utf8mb4_general_ci,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_intended` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `program` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type_of_study` enum('Graduate','Undergraduate','Short Course','Training') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mode_of_study` enum('Full-time','Part-time','Distance Learning') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `term` enum('1st Semester','2nd Semester','Summer') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subjects_to_take` text COLLATE utf8mb4_general_ci,
  `subjects_completed` text COLLATE utf8mb4_general_ci,
  `subjects_remaining` text COLLATE utf8mb4_general_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text COLLATE utf8mb4_general_ci,
  `subjects` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','approved','rejected','revision_needed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `employee_notif_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `employee_notif_viewed_at` datetime DEFAULT NULL,
  `pdf_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `revision_comments` text COLLATE utf8mb4_general_ci,
  `wants_scholarship` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission_to_study`
--

INSERT INTO `permission_to_study` (`id`, `employee_id`, `name`, `employee_number`, `designation`, `department`, `campus`, `date_of_birth`, `place_of_birth`, `sex`, `civil_status`, `permanent_address`, `years_in_service`, `citizenship`, `school_type`, `school_graduated`, `school_address`, `email`, `mobile_number`, `course`, `school_intended`, `program`, `type_of_study`, `mode_of_study`, `term`, `subjects_to_take`, `subjects_completed`, `subjects_remaining`, `start_date`, `end_date`, `reason`, `subjects`, `status`, `employee_notif_viewed`, `employee_notif_viewed_at`, `pdf_path`, `approved_by`, `approved_at`, `rejection_reason`, `revision_comments`, `wants_scholarship`, `created_at`, `updated_at`) VALUES
(1, 32, '', 'EMP-2024-SC-002', 'Library Assistant', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '1996-10-03', '', 'Female', '', 'Santa Cruz, Laguna', NULL, 'Filipino', NULL, '', 'Santa Cruz', 'marialuisa.cruz@lspu.edu.ph', '09992223333', 'MASTERAL IT', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[{\"subject\":\"ITEP 111\",\"days\":\"21\",\"time\":\"09:00\",\"units\":\"3\"},{\"subject\":\"ITEP 112\",\"days\":\"21\",\"time\":\"08:00\",\"units\":\"3\"},{\"subject\":\"ITEP 113\",\"days\":\"21\",\"time\":\"08:00\",\"units\":\"3\"},{\"subject\":\"ITEP 114\",\"days\":\"21\",\"time\":\"08:00\",\"units\":\"3\"}]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 14, '2026-02-02 16:30:29', NULL, NULL, 0, '2026-01-05 18:57:02', '2026-02-02 08:30:29'),
(2, 32, '', 'EMP-2024-SC-002', 'Library Assistant', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '1996-10-03', '', 'Female', '', 'Santa Cruz, Laguna', NULL, 'Filipino', NULL, '', 'Santa Cruz', 'marialuisa.cruz@lspu.edu.ph', '09992223333', 'MASTERAL IT', 'LSPU', NULL, NULL, NULL, 'Summer', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 16, '2026-01-06 03:58:35', NULL, NULL, 1, '2026-01-05 19:11:07', '2026-01-05 19:58:35'),
(3, 32, '', 'EMP-2024-SC-002', 'Library Assistant', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '1996-10-03', '', 'Female', '', 'Santa Cruz, Laguna', NULL, 'Filipino', NULL, '', 'Santa Cruz', 'marialuisa.cruz@lspu.edu.ph', '09992223333', 'MASTERAL IT', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'rejected', 0, NULL, NULL, 14, '2026-01-29 15:26:39', 'none ', NULL, 1, '2026-01-05 19:14:49', '2026-01-29 07:26:39'),
(4, 18, '', 'EMP-2015-101', 'Associate Professor', 'Office of the Campus Director', 'LOS BAÑOS', '1980-06-19', '', 'Male', '', 'Los Baños, Laguna', NULL, 'Filipino', NULL, '', 'Santa Cruz Campus', 'jose.mercado@lspu.edu.ph', '09221234567', 'BS Info Tech', 'LSPU', NULL, NULL, NULL, '1st Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'pending', 1, '2026-04-07 12:49:00', NULL, NULL, NULL, NULL, NULL, 1, '2026-01-27 02:08:05', '2026-04-07 04:49:00'),
(5, 18, '', 'EMP-2015-101', 'Associate Professor', 'Office of the Campus Director', 'LOS BAÑOS', '1980-06-19', '', 'Male', '', 'Los Baños, Laguna', NULL, 'Filipino', NULL, '', 'Santa Cruz Campus', 'jose.mercado@lspu.edu.ph', '09221234567', 'BS Info Tech', 'LSPU', NULL, NULL, NULL, '1st Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 14, '2026-02-02 16:01:45', NULL, NULL, 0, '2026-01-27 02:14:00', '2026-02-02 08:01:45'),
(6, 18, '', 'EMP-2015-101', 'Associate Professor', 'Office of the Campus Director', 'LOS BAÑOS', '1980-06-19', '', 'Male', '', NULL, NULL, 'Filipino', NULL, '', 'Santa Cruz Campus', 'jose.mercado@lspu.edu.ph', '09221234567', 'BS Info Tech', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 14, '2026-02-02 16:25:47', NULL, NULL, 1, '2026-02-02 07:09:49', '2026-02-02 08:25:47'),
(8, 91, 'Patricia Ann  Mendoza', 'EMP-2016-205', 'Associate Professor', 'College of Business Administration & Accountancy (CBAA)', 'SANTA CRUZ', '1981-11-18', '', 'Female', '', NULL, NULL, 'Filipino', NULL, '', 'Santa cruz', 'patricia.mendoza@lspu.edu.ph', '09180000004', 'BSIT', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 14, '2026-02-09 10:53:47', NULL, NULL, 1, '2026-02-09 02:05:49', '2026-02-09 02:53:47'),
(9, 95, 'Diana Marie Santos', 'EMP-2023-404', 'IT Support Specialist', 'Senior High School (SHS)', 'SANTA CRUZ', '1992-05-27', '', 'Female', '', NULL, NULL, 'Filipino', NULL, '', 'Santa cruz', 'diana.santos@lspu.edu.ph', '09180000008', 'BSIT', 'LSPU', NULL, NULL, NULL, '1st Semester', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, NULL, 14, '2026-03-30 17:02:24', NULL, NULL, 1, '2026-02-09 06:24:42', '2026-03-30 09:02:24'),
(10, 31, 'Juan Miguel Reyes Santos', 'EMP-2024-SC-001', 'Administrative Officer I', 'College of Business Administration & Accountancy (CBAA)', 'SANTA CRUZ', '1994-05-12', '', 'Male', '', '', 1, 'Filipino', 'Private', 'Provided in attached PDF', '', 'juanmiguel.santos@lspu.edu.ph', '09981234567', '', '', NULL, NULL, NULL, '', '[]', '[]', '[]', NULL, NULL, NULL, NULL, 'rejected', 0, NULL, 'uploads/permission_to_study/application_10.pdf', 14, '2026-03-10 14:37:01', 'fill up the permission', NULL, 0, '2026-02-23 08:34:28', '2026-03-10 06:37:01'),
(11, 12, 'Fresdie Pimentel Andallo', 'EMP-2026-003', 'Instructor', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '2003-07-29', '', 'Male', '', NULL, NULL, 'Filipino', NULL, '', 'Santa cruz, Laguna', 'pjandallo29@gmail.com', '09630808679', 'BSIT', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[{\"subject\":\"SUBJECTS\",\"days\":\"DAYS\",\"time\":\"09:04\",\"units\":\"1\"},{\"subject\":\"SUBJECTS\",\"days\":\"DAYS\",\"time\":\"09:04\",\"units\":\"3\"}]', '[]', '[]', NULL, NULL, NULL, NULL, 'pending', 1, '2026-04-07 12:49:00', 'uploads/permission_to_study/application_11.pdf', 14, '2026-03-16 09:02:19', NULL, '[HR Revision Request - 2026-03-16 09:02:19] do not\n\n[Employee Resubmitted - 2026-03-16 09:04:15] Application updated and resubmitted for review.', 0, '2026-03-05 07:39:28', '2026-04-07 04:49:00'),
(12, 12, 'Fresdie Pimentel Andallo', 'EMP-2026-003', 'Instructor', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '2003-07-29', '', 'Male', '', NULL, NULL, 'Filipino', NULL, '', 'Santa cruz, Laguna', 'pjandallo29@gmail.com', '09630808679', 'BSIT', 'LSPU', NULL, NULL, NULL, '2nd Semester', '[{\"subject\":\"SUBJECTS\",\"days\":\"DAYS\",\"time\":\"\",\"units\":\"\"},{\"subject\":\"SUBJECTS\",\"days\":\"DAYS\",\"time\":\"\",\"units\":\"\"}]', '[]', '[]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, 'uploads/permission_to_study/application_12.pdf', 14, '2026-04-06 16:16:35', NULL, NULL, 1, '2026-03-16 01:08:13', '2026-04-06 08:16:35'),
(13, 12, 'Fresdie Pimentel Andallo', 'EMP-2026-003', 'Instructor', 'College of Computer Studies (CCS)', 'SANTA CRUZ', '2003-07-29', '', 'Male', '', NULL, NULL, 'Filipino', NULL, '', 'Santa cruz', 'pjandallo29@gmail.com', '09630808679', 'BSIT', 'Lspu', NULL, NULL, NULL, '1st Semester', '[{\"subject\":\"WEB DEV 1\",\"days\":\"wed, thrus\",\"time\":\"22:00\",\"units\":\"4\"},{\"subject\":\"Database\",\"days\":\"Wednesday\",\"time\":\"13:00\",\"units\":\"4\"},{\"subject\":\"UX\\/UI\",\"days\":\"Wednesday\",\"time\":\"15:00\",\"units\":\"4\"}]', '[{\"subject\":\"Mobile Dev\",\"units\":\"4\"}]', '[{\"subject\":\"WEB DEV 2\",\"units\":\"4\"},{\"subject\":\"Data structure\",\"units\":\"4\"}]', NULL, NULL, NULL, NULL, 'approved', 0, NULL, 'uploads/permission_to_study/application_13.pdf', 14, '2026-04-16 13:42:39', NULL, NULL, 1, '2026-04-16 05:17:40', '2026-04-16 05:42:39');

--
-- Triggers `permission_to_study`
--
DELIMITER $$
CREATE TRIGGER `trg_pts_reset_viewed_on_status_change` BEFORE UPDATE ON `permission_to_study` FOR EACH ROW BEGIN
    IF NEW.status <> OLD.status THEN
        IF NEW.status IN ('approved', 'rejected') THEN
            SET NEW.employee_notif_viewed = 0;
            SET NEW.employee_notif_viewed_at = NULL;
        ELSE
            SET NEW.employee_notif_viewed = 1;
            SET NEW.employee_notif_viewed_at = COALESCE(NEW.employee_notif_viewed_at, NOW());
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recognition_award_criteria`
--

CREATE TABLE `recognition_award_criteria` (
  `id` int NOT NULL,
  `award_id` int NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `area_info` text COLLATE utf8mb4_general_ci,
  `area_input_type` enum('dropdown','checkbox') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'dropdown',
  `area_options_json` text COLLATE utf8mb4_general_ci,
  `total_points` decimal(7,2) NOT NULL DEFAULT '10.00',
  `criteria_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `criteria_description` text COLLATE utf8mb4_general_ci,
  `weight_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `max_score` decimal(7,2) NOT NULL DEFAULT '10.00',
  `sort_order` int NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_award_criteria`
--

INSERT INTO `recognition_award_criteria` (`id`, `award_id`, `category_name`, `subcategory_name`, `area_name`, `area_info`, `area_input_type`, `area_options_json`, `total_points`, `criteria_name`, `criteria_description`, `weight_percentage`, `max_score`, `sort_order`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 4, 'Professionalism', 'Always Seeking self-improvement and professional development', 'Educational Qualification', 'Highest education attainment', 'dropdown', '[{\"label\":\"Doctorate Degree\",\"points\":60},{\"label\":\"Complete academic requirements in Doctorate\",\"points\":50},{\"label\":\"With doctorate units\",\"points\":40},{\"label\":\"Master Graduate\",\"points\":30},{\"label\":\"Complete academic requirements in masters\",\"points\":20},{\"label\":\"Master\'s unit\",\"points\":10}]', 60.00, '', NULL, 0.00, 10.00, 1, 14, '2026-03-04 05:58:55', '2026-03-04 05:58:55'),
(17, 5, 'Profeesionalism', '1. Always seeking self-improvement and professional development.', '1. Always seeking self-improvement and professional development.', '', 'dropdown', '[{\"label\":\"Score\",\"points\":60}]', 60.00, '', NULL, 0.00, 10.00, 1, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(18, 5, 'Profeesionalism', '2. Abreast of the latest developments in educational practices and policies', '2. Abreast of the latest developments in educational practices and policies', '', 'dropdown', '[{\"label\":\"Score\",\"points\":60}]', 60.00, '', NULL, 0.00, 10.00, 2, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(19, 5, 'Profeesionalism', '3.Has a strong sense of commitment to the profession', '3.Has a strong sense of commitment to the profession', '', 'dropdown', '[{\"label\":\"Score\",\"points\":60}]', 60.00, '', NULL, 0.00, 10.00, 3, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(20, 5, 'Profeesionalism', '4. Has always tried to improve teaching practices.', '4. Has always tried to improve teaching practices.', '', 'dropdown', '[{\"label\":\"Score\",\"points\":60}]', 60.00, '', NULL, 0.00, 10.00, 4, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(21, 5, 'Profeesionalism', '5. Actively collaborating and sharing with colleagues.', '5. Actively collaborating and sharing with colleagues.', '', 'dropdown', '[{\"label\":\"Score\",\"points\":60}]', 60.00, '', NULL, 0.00, 10.00, 5, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(22, 5, 'Teaching', 'Subject expertise', 'Subject expertise', '', 'dropdown', '[{\"label\":\"Score\",\"points\":75}]', 75.00, '', NULL, 0.00, 10.00, 6, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(23, 5, 'Teaching', 'Effective teaching practices', 'Effective teaching practices', '', 'dropdown', '[{\"label\":\"Score\",\"points\":75}]', 75.00, '', NULL, 0.00, 10.00, 7, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(24, 5, 'Teaching', 'Effective classroom management', 'Effective classroom management', '', 'dropdown', '[{\"label\":\"Score\",\"points\":75}]', 75.00, '', NULL, 0.00, 10.00, 8, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20'),
(25, 5, 'Teaching', 'Curriculum planning, Organization, And Development', 'Curriculum planning, Organization, And Development', '', 'dropdown', '[{\"label\":\"Score\",\"points\":75}]', 75.00, '', NULL, 0.00, 10.00, 9, 14, '2026-03-05 05:50:20', '2026-03-05 05:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_award_panelists`
--

CREATE TABLE `recognition_award_panelists` (
  `id` int NOT NULL,
  `award_id` int NOT NULL,
  `panelist_id` int NOT NULL,
  `assigned_by` int DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_award_panelists`
--

INSERT INTO `recognition_award_panelists` (`id`, `award_id`, `panelist_id`, `assigned_by`, `assigned_at`) VALUES
(1, 4, 24, 14, '2026-03-04 06:02:47'),
(2, 4, 31, 14, '2026-03-04 06:02:47'),
(4, 5, 107, 14, '2026-03-05 05:34:32'),
(5, 5, 31, 14, '2026-03-05 05:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_nominations`
--

CREATE TABLE `recognition_nominations` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `award_id` int NOT NULL,
  `nominee_id` int NOT NULL,
  `nominator_id` int NOT NULL,
  `supervisor_id` int DEFAULT NULL,
  `nomination_reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `supporting_evidence` text COLLATE utf8mb4_general_ci,
  `nomination_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected','winner_selected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_nominations`
--

INSERT INTO `recognition_nominations` (`id`, `program_id`, `award_id`, `nominee_id`, `nominator_id`, `supervisor_id`, `nomination_reason`, `supporting_evidence`, `nomination_date`, `status`, `approved_by`, `approved_at`) VALUES
(1, 2, 4, 102, 12, 123, 'yeheyyy', '', '2026-03-04 06:57:38', 'approved', 14, '2026-03-05 03:45:48'),
(2, 2, 5, 93, 12, NULL, 'goods', '', '2026-03-05 03:12:38', 'approved', NULL, '2026-03-05 03:12:38'),
(3, 2, 5, 105, 107, NULL, 'magaling', '', '2026-03-05 05:42:02', 'approved', NULL, '2026-03-05 05:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_panel_scores`
--

CREATE TABLE `recognition_panel_scores` (
  `id` int NOT NULL,
  `award_id` int NOT NULL,
  `nomination_id` int NOT NULL,
  `panelist_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `score_value` decimal(7,2) NOT NULL,
  `comments` text COLLATE utf8mb4_general_ci,
  `scored_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_panel_scores`
--

INSERT INTO `recognition_panel_scores` (`id`, `award_id`, `nomination_id`, `panelist_id`, `criteria_id`, `score_value`, `comments`, `scored_at`) VALUES
(1, 4, 1, 31, 2, 40.00, '', '2026-03-05 03:03:21'),
(27, 5, 2, 107, 17, 60.00, '', '2026-03-05 05:58:55'),
(28, 5, 2, 107, 18, 60.00, '', '2026-03-05 05:58:55'),
(29, 5, 2, 107, 19, 60.00, '', '2026-03-05 05:58:55'),
(30, 5, 2, 107, 20, 60.00, '', '2026-03-05 05:58:55'),
(31, 5, 2, 107, 21, 60.00, '', '2026-03-05 05:58:55'),
(32, 5, 2, 107, 22, 75.00, '', '2026-03-05 05:58:55'),
(33, 5, 2, 107, 23, 75.00, '', '2026-03-05 05:58:55'),
(34, 5, 2, 107, 24, 75.00, '', '2026-03-05 05:58:55'),
(35, 5, 2, 107, 25, 75.00, '', '2026-03-05 05:58:55'),
(36, 5, 2, 31, 17, 60.00, '', '2026-03-05 05:59:29'),
(37, 5, 2, 31, 18, 60.00, '', '2026-03-05 05:59:29'),
(38, 5, 2, 31, 19, 60.00, '', '2026-03-05 05:59:29'),
(39, 5, 2, 31, 20, 60.00, '', '2026-03-05 05:59:29'),
(40, 5, 2, 31, 21, 60.00, '', '2026-03-05 05:59:29'),
(41, 5, 2, 31, 22, 75.00, '', '2026-03-05 05:59:29'),
(42, 5, 2, 31, 23, 75.00, '', '2026-03-05 05:59:29'),
(43, 5, 2, 31, 24, 75.00, '', '2026-03-05 05:59:29'),
(44, 5, 2, 31, 25, 75.00, '', '2026-03-05 05:59:29'),
(54, 5, 3, 31, 17, 54.00, '', '2026-03-16 01:33:58'),
(55, 5, 3, 31, 18, 60.00, '', '2026-03-16 01:33:58'),
(56, 5, 3, 31, 19, 45.00, '', '2026-03-16 01:33:58'),
(57, 5, 3, 31, 20, 60.00, '', '2026-03-16 01:33:58'),
(58, 5, 3, 31, 21, 60.00, '', '2026-03-16 01:33:58'),
(59, 5, 3, 31, 22, 75.00, '', '2026-03-16 01:33:58'),
(60, 5, 3, 31, 23, 60.00, '', '2026-03-16 01:33:58'),
(61, 5, 3, 31, 24, 75.00, '', '2026-03-16 01:33:58'),
(62, 5, 3, 31, 25, 25.00, '', '2026-03-16 01:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_programs`
--

CREATE TABLE `recognition_programs` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `campus` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nomination_deadline` datetime NOT NULL,
  `status` enum('draft','open','closed','completed') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'draft',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_programs`
--

INSERT INTO `recognition_programs` (`id`, `name`, `description`, `campus`, `nomination_deadline`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'PROGRAM ON AWARDS AND INCENTIVES FOR SERVICE EXCELLENCE (PRAISE) 2025', 'This program aims to encourage, recognize, and reward employees for their innovative ideas, superior accomplishments, exemplary behavior, and extraordinary acts or services that contribute to the efficiency, economy, and overall improvement of university operations.', '2', '2026-05-15 17:00:00', 'open', 14, '2026-03-04 01:28:03', '2026-03-04 02:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_program_awards`
--

CREATE TABLE `recognition_program_awards` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `award_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `allowed_employment_statuses` text COLLATE utf8mb4_general_ci,
  `allowed_employee_types` text COLLATE utf8mb4_general_ci,
  `display_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recognition_program_awards`
--

INSERT INTO `recognition_program_awards` (`id`, `program_id`, `award_title`, `allowed_employment_statuses`, `allowed_employee_types`, `display_order`, `created_at`, `updated_at`) VALUES
(4, 2, 'BEST EMPLOYEE (DISTINGUISHED FACULTY OF THE YEAR)', '[\"Permanent\",\"Part-time\"]', '[\"Teaching\"]', 1, '2026-03-04 01:28:04', '2026-03-04 01:28:04'),
(5, 2, 'OUTSTANDING NON-TEACHING PERSONNEL', '[\"Permanent\",\"Casual\"]', '[\"Non-teaching\"]', 2, '2026-03-04 01:28:04', '2026-03-04 01:28:04'),
(6, 2, 'UNSUNG HERO AWARD (EXEMPLARY UTILITY / SUPPORT STAFF)', '[\"Casual\",\"Job Order\"]', '[\"Non-teaching\"]', 3, '2026-03-04 01:28:04', '2026-03-04 01:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `recognition_votes`
--

CREATE TABLE `recognition_votes` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `nomination_id` int NOT NULL,
  `voter_id` int NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recognition_winners`
--

CREATE TABLE `recognition_winners` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `nomination_id` int DEFAULT NULL,
  `winner_id` int NOT NULL,
  `total_nominations` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '1',
  `award_details` text COLLATE utf8mb4_general_ci,
  `selected_by` int DEFAULT NULL,
  `selected_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_slips`
--

CREATE TABLE `request_slips` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `request_type` enum('Office Supplies','Equipment','Repair/Maintenance','IT Support','Facilities','Transportation','Others') COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `urgency` enum('Low','Medium','High','Critical') COLLATE utf8mb4_general_ci NOT NULL,
  `details` text COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `needed_date` date DEFAULT NULL,
  `justification` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','in_progress','completed','rejected','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `assigned_to` int DEFAULT NULL,
  `assigned_at` datetime DEFAULT NULL,
  `completed_by` int DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_applications`
--

CREATE TABLE `scholarship_applications` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `permission_to_study_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` enum('Male','Female') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `civil_status` enum('Single','Married','Widowed','Separated') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_general_ci,
  `years_in_service` int DEFAULT NULL,
  `citizenship` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Filipino',
  `school_type` enum('Public','Private') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_graduated` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_address` text COLLATE utf8mb4_general_ci,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_intended` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `program` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type_of_school` enum('Public','Private') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `father_address` text COLLATE utf8mb4_general_ci,
  `father_occupation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `father_status` enum('Living','Deceased') COLLATE utf8mb4_general_ci DEFAULT 'Living',
  `mother_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mother_address` text COLLATE utf8mb4_general_ci,
  `mother_occupation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mother_status` enum('Living','Deceased') COLLATE utf8mb4_general_ci DEFAULT 'Living',
  `spouse_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number_of_children` int DEFAULT '0',
  `family_gross_income` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','approved','rejected','revision_needed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `employee_notif_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `employee_notif_viewed_at` datetime DEFAULT NULL,
  `pdf_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `revision_comments` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship_applications`
--

INSERT INTO `scholarship_applications` (`id`, `employee_id`, `permission_to_study_id`, `name`, `date_of_birth`, `place_of_birth`, `sex`, `civil_status`, `permanent_address`, `years_in_service`, `citizenship`, `school_type`, `school_graduated`, `school_address`, `email`, `mobile_number`, `course`, `school_intended`, `program`, `type_of_school`, `father_name`, `father_address`, `father_occupation`, `father_status`, `mother_name`, `mother_address`, `mother_occupation`, `mother_status`, `spouse_name`, `number_of_children`, `family_gross_income`, `status`, `employee_notif_viewed`, `employee_notif_viewed_at`, `pdf_path`, `approved_by`, `approved_at`, `rejection_reason`, `revision_comments`, `created_at`, `updated_at`) VALUES
(1, 32, NULL, 'Maria Luisa Dela Cruz', '1996-10-03', 'Santl.anghel Norte Sta.cruz, Laguna ', 'Female', 'Single', 'Santa Cruz, Laguna', 4, 'Filipino', 'Public', 'LSPU', 'Santa Cruz', 'marialuisa.cruz@lspu.edu.ph', '09992223333', 'MASTERAL IT', 'LSPU', 'BSIT', 'Public', 'Eric Cruz', 'Santa Cruz, Laguna', 'Businessman', 'Living', 'Shenna Cruz', 'Santa Cruz, Laguna', 'House wife', 'Living', '', 0, 0.00, 'pending', 1, '2026-04-07 12:49:00', NULL, NULL, NULL, NULL, NULL, '2026-01-05 19:30:49', '2026-04-07 04:49:00'),
(2, 32, NULL, 'Maria Luisa Dela Cruz', '1996-10-03', 'Santl.anghel Norte Sta.cruz, Laguna ', 'Female', 'Single', 'Santa Cruz, Laguna', 4, 'Filipino', 'Public', 'LSPU', 'Santa Cruz', 'marialuisa.cruz@lspu.edu.ph', '09992223333', 'MASTERAL IT', 'LSPU', 'BSIT', 'Public', 'Eric Cruz', 'Santa Cruz, Laguna', 'Businessman', 'Living', 'Shenna Cruz', 'Santa Cruz, Laguna', 'House wife', 'Living', '', 0, 0.00, 'approved', 0, NULL, NULL, 14, '2026-02-02 16:30:29', NULL, NULL, '2026-01-05 19:32:36', '2026-02-02 08:30:29'),
(3, 18, NULL, 'Jose Rizal Mercado', '1980-06-19', 'Santo anghel Norte', 'Male', 'Single', 'Brgy. Santisima cruz, Santa cruz, Laguna', 10, 'Filipino', 'Public', 'L:SPU Santa cruz (Main Campus)', 'Santa Cruz, Laguna', 'jose.mercado@lspu.edu.ph', '09221234567', 'BS Info Tech', 'LSPU', 'BSIT', 'Public', 'Fresdie B. Andallo ', 'Brgy Santisima cruz Santa cruz, Laguna', 'yeheyy', 'Living', 'Maryjane P. Andallo ', 'Brgy Santisima cruz Santa cruz, Laguna', 'yippie', 'Living', '', 0, 0.00, 'approved', 0, NULL, NULL, 14, '2026-02-02 16:25:47', NULL, NULL, '2026-02-02 07:18:59', '2026-02-02 08:25:47'),
(5, 91, 8, 'Patricia Ann  Mendoza', '1981-11-18', 'Sto.aghel', 'Female', 'Single', 'Santacruz ', 9, 'Filipino', 'Public', 'LSPU Santa cruz', 'Santa cruz', 'patricia.mendoza@lspu.edu.ph', '09180000004', 'BSIT', 'LSPU', 'Info Tech', 'Public', 'Andallo, Fresdie', 'Santa Cruz, Laguna', 'yeheyy', 'Living', 'Andallo II, Fresdie ', 'Santa cruz, Laguna', 'yippie ', 'Living', '', 0, 0.00, 'approved', 0, NULL, NULL, 14, '2026-02-09 10:53:47', NULL, NULL, '2026-02-09 02:53:08', '2026-02-09 02:53:47'),
(6, 95, 9, 'Diana Marie Santos', '1992-05-27', 'Sto.aghel', 'Female', 'Single', '234 IT Support, Jasaan, Santa Cruz, Laguna, CALABARZON (Region IV-A), 4009', 2, 'Filipino', 'Public', 'LSPU Santa cruz', 'Santa cruz', 'diana.santos@lspu.edu.ph', '09180000008', 'BSIT', 'LSPU', 'Info Tech', 'Public', 'Andallo, Fresdie', 'Santa cruz', 'yeheyy', 'Living', 'Andallo II, Fresdie ', 'Santa cruz', 'yippie ', 'Living', '', 0, 0.00, 'pending', 1, '2026-04-07 12:49:00', NULL, NULL, NULL, NULL, NULL, '2026-02-09 06:25:35', '2026-04-07 04:49:00'),
(8, 31, 10, 'Juan Miguel Reyes Santos', '1994-05-12', '', 'Male', '', '', 1, 'Filipino', 'Private', 'Provided in attached PDF', '', 'juanmiguel.santos@lspu.edu.ph', '09981234567', '', '', 'Provided in attached PDF', '', '', '', '', 'Living', '', '', '', 'Living', '', 0, 0.00, 'rejected', 0, NULL, 'uploads/scholarship_application/application_8.pdf', 14, '2026-03-10 14:31:43', 'fill up the schorlar ', NULL, '2026-02-23 08:34:41', '2026-03-10 06:31:43'),
(9, 12, 13, 'Fresdie Pimentel Andallo', '2003-07-29', 'Sto.anghel Santa cruz Laguna', 'Male', 'Single', '0639 Kamagong, Santisima Cruz, Santa Cruz, Laguna, CALABARZON, 4009', 0, 'Filipino', 'Public', 'PGMNHS', 'Santa cruz', 'pjandallo29@gmail.com', '09630808679', 'BSIT', 'Lspu', 'BS Info tech', 'Public', 'Fresdie B. Andallo', 'Santisima cruz, Santa cruz Laguna', 'security guard', 'Living', 'Maryjane P. Andallo', 'Santisima cruz, Santa cruz Laguna', 'house keeping', 'Living', '', 0, 0.00, 'approved', 0, NULL, NULL, 14, '2026-04-16 13:42:44', NULL, NULL, '2026-04-16 05:41:45', '2026-04-16 05:42:44');

--
-- Triggers `scholarship_applications`
--
DELIMITER $$
CREATE TRIGGER `trg_sa_reset_viewed_on_status_change` BEFORE UPDATE ON `scholarship_applications` FOR EACH ROW BEGIN
    IF NEW.status <> OLD.status THEN
        IF NEW.status IN ('approved', 'rejected') THEN
            SET NEW.employee_notif_viewed = 0;
            SET NEW.employee_notif_viewed_at = NULL;
        ELSE
            SET NEW.employee_notif_viewed = 1;
            SET NEW.employee_notif_viewed_at = COALESCE(NEW.employee_notif_viewed_at, NOW());
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `training_assessments`
--

CREATE TABLE `training_assessments` (
  `id` int NOT NULL,
  `training_program_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `impact_assessment_id` int DEFAULT NULL,
  `assignment_id` int DEFAULT NULL,
  `seminar_training` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `venue` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speaker_rapport` int DEFAULT NULL,
  `speaker_voice` int DEFAULT NULL,
  `speaker_clarity` int DEFAULT NULL,
  `speaker_mastery` int DEFAULT NULL,
  `speaker_comments` text COLLATE utf8mb4_general_ci,
  `topics_objective` int DEFAULT NULL,
  `topics_applicability` int DEFAULT NULL,
  `topics_clarity` int DEFAULT NULL,
  `topics_relevance` int DEFAULT NULL,
  `topics_comments` text COLLATE utf8mb4_general_ci,
  `support_kit` int DEFAULT NULL,
  `support_multimedia` int DEFAULT NULL,
  `support_venue` int DEFAULT NULL,
  `support_food` int DEFAULT NULL,
  `support_comments` text COLLATE utf8mb4_general_ci,
  `recommend_to_others` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_seminar_topics` text COLLATE utf8mb4_general_ci,
  `overall_rating` int DEFAULT NULL,
  `general_comments` text COLLATE utf8mb4_general_ci,
  `status` enum('draft','submitted') COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_assessments`
--

INSERT INTO `training_assessments` (`id`, `training_program_id`, `employee_id`, `impact_assessment_id`, `assignment_id`, `seminar_training`, `venue`, `date`, `name`, `speaker_rapport`, `speaker_voice`, `speaker_clarity`, `speaker_mastery`, `speaker_comments`, `topics_objective`, `topics_applicability`, `topics_clarity`, `topics_relevance`, `topics_comments`, `support_kit`, `support_multimedia`, `support_venue`, `support_food`, `support_comments`, `recommend_to_others`, `next_seminar_topics`, `overall_rating`, `general_comments`, `status`, `submitted_at`, `created_at`, `updated_at`) VALUES
(5, 1, 21, 6, 1, 'Linux System Fundamentals and Mobile Device Security', 'Virtual Training Laboratory / IT Certification Center', '2026-01-03', 'Lucia Reyes Flores', 4, 4, 4, 3, '', 3, 4, 3, 4, '', 4, 3, 4, 3, '', '', '', 4, '', 'submitted', '2026-01-06 02:01:12', '2026-01-05 17:57:48', '2026-01-05 18:01:12'),
(6, 3, 103, 7, 3, 'Sage mode ', 'mount mutombo', '2026-02-28', 'Bernardo Jose Alvarez Alvarez', 4, 4, 4, 4, 'done', 4, 4, 4, 4, 'done', 4, 4, 4, 4, 'done', 'yes', 'water', 4, 'water water', 'submitted', '2026-02-27 09:52:56', '2026-02-27 01:52:56', '2026-02-27 01:52:56'),
(7, 3, 12, 8, 4, 'Sage mode ', 'mount mutombo', '2026-02-28', 'Fresdie Pimentel Andallo', 4, 4, 4, 4, 'done', 4, 4, 4, 3, 'yeyheyy', 4, 3, 4, 4, 'yhyy', 'yes', 'about water', 3, '', 'submitted', '2026-02-27 09:56:45', '2026-02-27 01:56:45', '2026-02-27 01:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `training_needs_assessments`
--

CREATE TABLE `training_needs_assessments` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `idp_id` int DEFAULT NULL,
  `period_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `highest_educational_attainment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `present_designation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `college_department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `years_in_lspu` int DEFAULT NULL,
  `trainings_attended` text COLLATE utf8mb4_general_ci,
  `training_courses_wanted` text COLLATE utf8mb4_general_ci,
  `comments_suggestions` text COLLATE utf8mb4_general_ci,
  `status` enum('draft','submitted','reviewed','approved') COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_needs_assessments`
--

INSERT INTO `training_needs_assessments` (`id`, `employee_id`, `idp_id`, `period_id`, `name`, `highest_educational_attainment`, `specialization`, `present_designation`, `college_department`, `years_in_lspu`, `trainings_attended`, `training_courses_wanted`, `comments_suggestions`, `status`, `submitted_at`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(2, 103, 5, 3, 'Bernardo Jose Alvarez Alvarez', 'Highest Educational Attainment', 'Human Resources, Employee Relations', 'Administrative Officer II', 'Budget and Finance Office (BFO)', 1, 'Sandman', 'Pitch blank', 'soogoodd', 'submitted', '2026-02-27 09:15:19', NULL, NULL, '2026-02-27 01:15:19', '2026-02-27 01:15:19'),
(3, 12, 6, 4, 'Fresdie Pimentel Andallo', '', 'Accounting', 'Instructor', 'College of Computer Studies (CCS)', 0, '', '', '', 'submitted', '2026-03-16 09:12:28', NULL, NULL, '2026-03-16 01:12:00', '2026-03-16 01:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `training_programs`
--

CREATE TABLE `training_programs` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `objective` text COLLATE utf8mb4_general_ci,
  `venue` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_conducted` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `status` enum('active','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `requires_impact_assessment` tinyint(1) DEFAULT '1' COMMENT 'Requires Training Program Impact Assessment',
  `requires_training_assessment` tinyint(1) DEFAULT '1' COMMENT 'Requires Training Assessment Form'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_programs`
--

INSERT INTO `training_programs` (`id`, `title`, `objective`, `venue`, `date_conducted`, `created_by`, `status`, `created_at`, `updated_at`, `requires_impact_assessment`, `requires_training_assessment`) VALUES
(1, 'Linux System Fundamentals and Mobile Device Security', 'This training program is designed to provide participants with foundational knowledge in operating systems and network security.', 'Virtual Training Laboratory / IT Certification Center', '2026-01-03', 16, 'active', '2026-01-02 22:47:28', '2026-01-02 22:47:28', 1, 1),
(2, 'Strategic Leadership & Conflict Resolution', 'To equip management with advanced communication strategies, improve team-wide productivity through emotional intelligence, and establish a standardized framework for resolving workplace conflicts.', 'Main Conference Room', '2026-01-08', 16, 'active', '2026-01-05 18:09:18', '2026-01-05 18:09:18', 1, 0),
(3, 'Sage mode ', 'become a Hokage ', 'mount mutombo', '2026-02-28', 14, 'active', '2026-02-27 01:32:00', '2026-02-27 01:32:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `training_program_assignments`
--

CREATE TABLE `training_program_assignments` (
  `id` int NOT NULL,
  `training_program_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `notification_sent` tinyint(1) DEFAULT '0',
  `notification_sent_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_program_assignments`
--

INSERT INTO `training_program_assignments` (`id`, `training_program_id`, `employee_id`, `notification_sent`, `notification_sent_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 1, '2026-01-03 06:47:28', 'pending', '2026-01-02 22:47:28', '2026-01-02 22:47:28'),
(2, 2, 32, 1, '2026-01-06 02:09:18', 'pending', '2026-01-05 18:09:18', '2026-01-05 18:09:18'),
(3, 3, 103, 1, '2026-02-27 09:32:00', 'pending', '2026-02-27 01:32:00', '2026-02-27 01:32:00'),
(4, 3, 12, 1, '2026-02-27 09:32:00', 'pending', '2026-02-27 01:32:00', '2026-02-27 01:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `training_program_attachments`
--

CREATE TABLE `training_program_attachments` (
  `id` int NOT NULL,
  `training_program_id` int NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training_program_attachments`
--

INSERT INTO `training_program_attachments` (`id`, `training_program_id`, `file_path`, `original_filename`, `uploaded_by`, `created_at`) VALUES
(1, 3, 'uploads/training_programs/training_1772775213_0_Andallo_II__Fresdie_-_PracticalExam_ReflectionPaper_docx__2_.pdf', 'Andallo II, Fresdie - PracticalExam_ReflectionPaper.docx (2).pdf', 14, '2026-03-06 05:33:33'),
(2, 3, 'uploads/training_programs/training_1772775213_1_STUDENT-AUDENTES-SCC.pdf', 'STUDENT-AUDENTES-SCC.pdf', 14, '2026-03-06 05:33:33'),
(3, 3, 'uploads/training_programs/training_1772775213_2_Andallo_II__Fresdie_-_PracticalExam_ReflectionPaper_docx.pdf', 'Andallo II, Fresdie - PracticalExam_ReflectionPaper.docx.pdf', 14, '2026-03-06 05:33:33'),
(4, 1, 'uploads/training_programs/training_1772779921_0_STUDENT-AUDENTES-SCC.pdf', 'STUDENT-AUDENTES-SCC.pdf', 14, '2026-03-06 06:52:01'),
(5, 1, 'uploads/training_programs/training_1772779921_1_Andallo_II__Fresdie_-_PracticalExam_ReflectionPaper_docx.pdf', 'Andallo II, Fresdie - PracticalExam_ReflectionPaper.docx.pdf', 14, '2026-03-06 06:52:01'),
(6, 1, 'uploads/training_programs/training_1772779921_2_OperatingSystemsBasicsUpdate20260102-29-16bsae.pdf', 'OperatingSystemsBasicsUpdate20260102-29-16bsae.pdf', 14, '2026-03-06 06:52:01'),
(7, 1, 'uploads/training_programs/training_1772781209_0_STUDENT-AUDENTES-SCC.pdf', 'STUDENT-AUDENTES-SCC.pdf', 14, '2026-03-06 07:13:29'),
(8, 1, 'uploads/training_programs/training_1772781209_1_Andallo_II__Fresdie_-_PracticalExam_ReflectionPaper_docx.pdf', 'Andallo II, Fresdie - PracticalExam_ReflectionPaper.docx.pdf', 14, '2026-03-06 07:13:29'),
(9, 1, 'uploads/training_programs/training_1772781209_2_OperatingSystemsBasicsUpdate20260102-29-16bsae.pdf', 'OperatingSystemsBasicsUpdate20260102-29-16bsae.pdf', 14, '2026-03-06 07:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `training_program_impact_assessments`
--

CREATE TABLE `training_program_impact_assessments` (
  `id` int NOT NULL,
  `training_program_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `assignment_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department_unit` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_conducted` date DEFAULT NULL,
  `rating_1` int DEFAULT NULL COMMENT 'Performance efficiency rating',
  `rating_2` int DEFAULT NULL COMMENT 'Ideas and recommendations rating',
  `rating_3` int DEFAULT NULL COMMENT 'New system development rating',
  `rating_4` int DEFAULT NULL COMMENT 'Skills upgrade rating',
  `rating_5` int DEFAULT NULL COMMENT 'Applied new skills rating',
  `rating_6` int DEFAULT NULL COMMENT 'Confidence rating',
  `rating_7` int DEFAULT NULL COMMENT 'Higher responsibility rating',
  `rating_8` int DEFAULT NULL COMMENT 'Knowledge transfer rating',
  `remarks_1` text COLLATE utf8mb4_general_ci,
  `remarks_2` text COLLATE utf8mb4_general_ci,
  `remarks_3` text COLLATE utf8mb4_general_ci,
  `remarks_4` text COLLATE utf8mb4_general_ci,
  `remarks_5` text COLLATE utf8mb4_general_ci,
  `remarks_6` text COLLATE utf8mb4_general_ci,
  `remarks_7` text COLLATE utf8mb4_general_ci,
  `remarks_8` text COLLATE utf8mb4_general_ci,
  `comments_suggestions` text COLLATE utf8mb4_general_ci,
  `future_training_needs` text COLLATE utf8mb4_general_ci,
  `supervisor_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `supervisor_signature` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `supervisor_date` date DEFAULT NULL,
  `wants_training_assessment` tinyint(1) DEFAULT '0',
  `status` enum('draft','submitted') COLLATE utf8mb4_general_ci DEFAULT 'draft',
  `submitted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_program_impact_assessments`
--

INSERT INTO `training_program_impact_assessments` (`id`, `training_program_id`, `employee_id`, `assignment_id`, `name`, `title`, `department_unit`, `date_conducted`, `rating_1`, `rating_2`, `rating_3`, `rating_4`, `rating_5`, `rating_6`, `rating_7`, `rating_8`, `remarks_1`, `remarks_2`, `remarks_3`, `remarks_4`, `remarks_5`, `remarks_6`, `remarks_7`, `remarks_8`, `comments_suggestions`, `future_training_needs`, `supervisor_name`, `supervisor_signature`, `supervisor_date`, `wants_training_assessment`, `status`, `submitted_at`, `created_at`, `updated_at`) VALUES
(6, 1, 21, 1, 'Lucia Reyes Flores', 'Linux System Fundamentals and Mobile Device Security', 'College of Criminal Justice Education (CCJE)', '2026-01-03', 5, 4, 4, 5, 5, 4, 5, 4, '', '', '', '', '', '', '', '', '', '', '', 'uploads/signatures/signature_21_1767635852_695bfb8c0e0dc.jpg', '2026-01-06', 1, 'submitted', '2026-01-06 01:57:32', '2026-01-05 17:57:32', '2026-01-05 17:57:32'),
(7, 3, 103, 3, 'Bernardo Jose Alvarez Alvarez', 'Sage mode ', 'Budget and Finance Office (BFO)', '2026-02-28', 4, 3, 3, 4, 4, 4, 4, 4, '', '', '', '', '', '', '', '', 'done', 'donenan', 'maam', '', '2026-02-27', 1, 'submitted', '2026-02-27 09:51:48', '2026-02-27 01:51:48', '2026-02-27 01:51:48'),
(8, 3, 12, 4, 'Fresdie Pimentel Andallo', 'Sage mode ', 'College of Computer Studies (CCS)', '2026-02-28', 5, 5, 4, 4, 5, 4, 4, 5, '', '', '', '', '', '', '', '', 'done', 'yeheyy', 'maam', '', '2026-02-27', 1, 'submitted', '2026-02-27 09:55:21', '2026-02-27 01:55:21', '2026-02-27 01:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `travel_orders`
--

CREATE TABLE `travel_orders` (
  `id` int NOT NULL,
  `employee_id` int NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `travel_type` enum('Local','Foreign') COLLATE utf8mb4_general_ci NOT NULL,
  `mode_of_transport` enum('Air','Land','Sea') COLLATE utf8mb4_general_ci NOT NULL,
  `funding_source` enum('University Budget','External Grant','Personal') COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `employee_type` varchar(20) DEFAULT NULL COMMENT 'Faculty or Personnel',
  `employment_status` varchar(20) DEFAULT NULL COMMENT 'Permanent, Part-time, Casual, Job Order',
  `department_role` varchar(20) DEFAULT NULL COMMENT 'Head or Staff (for Department users)',
  `is_psd` tinyint(1) DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `first` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `middle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `last` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `image` longtext NOT NULL,
  `designation` varchar(255) NOT NULL,
  `office` varchar(255) NOT NULL,
  `supervisor` int NOT NULL,
  `signed` longtext NOT NULL,
  `status` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password2` longtext NOT NULL,
  `employeeno` varchar(20) DEFAULT NULL,
  `applicant_id` varchar(50) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bday` date NOT NULL,
  `sex` int NOT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'House Number, Street Name, Unit/Apartment',
  `barangay` varchar(100) DEFAULT NULL COMMENT 'Barangay name',
  `city` varchar(100) DEFAULT NULL COMMENT 'City or Municipality name',
  `province` varchar(100) DEFAULT NULL COMMENT 'Province name',
  `region` varchar(100) DEFAULT NULL COMMENT 'Region name',
  `postal_code` varchar(4) DEFAULT NULL COMMENT 'Philippine postal code (4 digits)',
  `hired` date DEFAULT NULL,
  `campus` int DEFAULT NULL,
  `expertise` varchar(255) NOT NULL,
  `filename` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `type`, `employee_type`, `employment_status`, `department_role`, `is_psd`, `name`, `prefix`, `first`, `middle`, `last`, `suffix`, `image`, `designation`, `office`, `supervisor`, `signed`, `status`, `username`, `password2`, `employeeno`, `applicant_id`, `contact`, `email`, `bday`, `sex`, `street_address`, `barangay`, `city`, `province`, `region`, `postal_code`, `hired`, `campus`, `expertise`, `filename`) VALUES
(2, 2, NULL, NULL, NULL, 0, 'HR Administrator', NULL, 'HR', '', 'Administrator', NULL, '', 'HR Manager', '29', 0, '', 1, 'hr_admin', '$2y$10$4849uYLumse3lwcduFHaoezeRHWeWf1HvKjDNEnVlhrOaJQHeaVLS', 'HR001', NULL, '09123456789', 'hr@company.com', '1990-01-01', 1, '456 Rizal Avenue', 'Poblacion', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2025-10-06', 1, 'Human Resources Management', ''),
(5, 4, NULL, NULL, NULL, 1, 'John Smith Employee', NULL, 'John', 'Michael', 'Smith', NULL, '', 'Software Developer', '9', 0, '', 1, 'john_employee', '$2y$10$YWopIGFru6AA7vzgjcLe9O0nj0UEI8oXislpuCP4//PMSpWaqBkH2', 'EMP0001', NULL, '09123456789', 'john.employee@example.com', '1990-05-15', 1, '123 Main Street', 'Anos', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2024-01-15', 1, 'PHP, JavaScript, Database Management', ''),
(6, 6, NULL, NULL, NULL, 0, 'Jane Doe Applicant', NULL, 'Jane', 'Marie', 'Doe', NULL, '', '', '', 0, '', 1, 'jane_applicant', '$2y$12$kehCTuRLdu0cYUPIaSyqxepfF6IDQaGZVMwvuR2zERs4J5gYbYFtq', NULL, 'APP0001', '09876543210', 'fresdiea@gmail.com', '1995-08-22', 2, '456 Oak Avenue', 'Baybayin', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', NULL, NULL, 'Marketing, Communication, Project Management', ''),
(12, 4, 'Faculty', 'Permanent', NULL, 1, 'Fresdie Pimentel Andallo', NULL, 'Fresdie', 'Pimentel', 'Andallo ', NULL, '', 'Instructor', '9', 0, '', 1, 'Pjo', '$2y$12$gy50tgw76tFSb99sOTrfGuCVDuAytU.L.8KfyiDQ6hHjHbLN9URP2', 'EMP-2026-003', NULL, '09630808679', 'pjandallo29@gmail.com', '2003-07-29', 1, '0639 Kamagong', 'Santisima Cruz', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2026-02-26', 2, 'Accounting', ''),
(13, 2, NULL, NULL, NULL, 0, 'Maria Santos Cruz', NULL, 'Maria', 'Santos', 'Cruz', NULL, '', 'HR Manager', '1', 0, '', 1, 'hr.losbanos', '$2y$10$xIFXb1ipYzCAb5eK1.VqieLm/TLiK9pwpWPgFsISMyBQEEz4JTvhe', 'EMP-2020-001', NULL, '09171234567', 'hr.losbanos@lspu.edu.ph', '1985-06-15', 2, '789 University Road', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2020-01-15', 1, '', ''),
(14, 2, NULL, NULL, NULL, 0, 'Carlos Reyes Mendoza', NULL, 'Carlos', 'Reyes', 'Mendoza', NULL, '', 'HR Manager', '1', 0, '', 1, 'hr.santacruz', '$2y$12$r0T0ozyWcBNLQjCVnGCMG.5XBqwjJ2iIloOXWmPUT24UBW6QOTUQu', 'EMP-2020-002', NULL, '09181234567', 'hr.santacruz@lspu.edu.ph', '1987-03-20', 1, '321 Provincial Road', 'Poblacion II', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2020-02-01', 2, '', ''),
(15, 2, NULL, NULL, NULL, 0, 'Ana Marie Torres Diaz', NULL, 'Ana Marie', 'Torres', 'Diaz', NULL, '', 'HR Manager', '1', 0, '', 1, 'hr.sanpablo', '$2y$12$wtuht.aa/xN/Kc6/m55oKOwnKJgneprZnXjFpXzFA.RBZV5/NoY2a', 'EMP-2020-003', NULL, '09191234567', 'hr.sanpablo@lspu.edu.ph', '1988-09-10', 2, '567 San Pablo-Lucban Road', 'San Antonio', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', '2020-03-01', 3, '', ''),
(16, 2, NULL, NULL, NULL, 0, 'Roberto Garcia Santos', NULL, 'Roberto', 'Garcia', 'Santos', NULL, '', 'HR Manager', '1', 0, '', 1, 'hr.siniloan', '$2y$10$VzvVozZ.evOxvK/bYiTlre/ESp1s2dGU0.p022Y/8Av3fCeYtAIJ2', 'EMP-2020-004', NULL, '09201234567', 'hr.siniloan@lspu.edu.ph', '1986-11-25', 1, '234 National Highway', 'Poblacion', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2020-04-01', 4, '', ''),
(17, 3, NULL, NULL, NULL, 0, 'Jennifer Lopez Ramos', NULL, 'Jennifer', 'Lopez', 'Ramos', NULL, '', 'HR Assistant', '1', 0, '', 1, 'hrstaff.losbanos', '$2y$10$/sUt0er2w6F.d8bAIv5YbesphqD1uSuDG5DKIxQPS8f6sSNmvfuzq', 'EMP-2021-001', NULL, '09211234567', 'hrstaff.losbanos@lspu.edu.ph', '1990-04-12', 2, '890 Lopez Avenue', 'Mayondon', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2021-06-01', 1, '', ''),
(18, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Jose Rizal Mercado', NULL, 'Jose', 'Rizal', 'Mercado', NULL, '', 'Associate Professor', '5', 0, '', 1, 'jmercado', '$2y$10$QM5267nj2fqFqx/lZzVTUOr/AzbJCeGiJ6Ep2RHFpdMQBrAiEX4BG', 'EMP-2015-101', NULL, '09221234567', 'jose.mercado@lspu.edu.ph', '1980-06-19', 1, '112 Faculty Housing', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2015-08-01', 1, 'Computer Engineering, Artificial Intelligence', ''),
(19, 4, 'Faculty', 'Part-time', NULL, 0, 'Prof. Gabriela Silang Cruz', NULL, 'Gabriela', 'Silang', 'Cruz', NULL, '', 'Part-time Instructor', '8', 0, '', 1, 'gcruz', '$2y$10$M2DvV4Wj8Bn1azfX7u9XpeomCToa94WMg2ysJInMiieYcLxlH29tG', 'EMP-2023-201', NULL, '09231234567', 'gabriela.cruz@lspu.edu.ph', '1992-03-25', 2, '445 Cruz Street', 'Poblacion III', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2023-06-01', 2, 'Business Management, Entrepreneurship', ''),
(20, 4, 'Personnel', 'Permanent', NULL, 1, 'Pedro Santos Alvarez', NULL, 'Pedro', 'Santos', 'Alvarez', NULL, '', 'Administrative Officer III', '22', 0, '', 1, 'palvarez', '$2y$10$OEra43qb/9GuGLjR0zBwP.7LTl2hyczu.qQwuci/CGjPbM8kRNlfy', 'EMP-2018-301', NULL, '09241234567', 'pedro.alvarez@lspu.edu.ph', '1985-07-15', 1, '678 Del Pilar Street', 'San Roque', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', '2018-01-10', 3, 'Budget Management, Financial Planning', ''),
(21, 4, 'Personnel', 'Casual', NULL, 0, 'Lucia Reyes Flores', NULL, 'Lucia', 'Reyes', 'Flores', NULL, '', 'Administrative Aide', '10', 0, '', 1, 'lflores', '$2y$10$t7R3LfXfltmLK6grAW3RResditAH.mw9X/TkIRRVq6qkj72xds0Te', 'EMP-2024-401', NULL, '09251234567', 'lucia.flores@lspu.edu.ph', '1995-11-08', 2, '901 Flores Road', 'Salubungan', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2024-01-15', 4, 'Office Administration', ''),
(22, 4, 'Personnel', 'Job Order', NULL, 0, 'Miguel Torres Santos', NULL, 'Miguel', 'Torres', 'Santos', NULL, '', 'IT Support Specialist', '15', 0, '', 1, 'msantos', '$2y$12$29JZzHag6y6nR9Y9LxF/gOgMBAjpgBk/1GD2pZdmz3SqQ6UHTS/ey', 'EMP-2024-501', NULL, '09261234567', 'miguel.santos@lspu.edu.ph', '1993-02-28', 1, '543 Tech Avenue', 'Maahas', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2024-06-01', 1, 'Network Administration, Hardware Support', ''),
(23, 5, NULL, NULL, 'Head', 0, 'Dr. Antonio Luna Garcia', NULL, 'Antonio', 'Luna', 'Garcia', NULL, '', 'Department Chair - Computer Science', '12', 0, '', 1, 'dept.head.cs', '$2y$10$hgnAAB1MHGAt0FOjoIBmbOTFvfapyFScpuX./8EjUmqq/olmvuNpm', 'EMP-2010-601', NULL, '09271234567', 'antonio.garcia@lspu.edu.ph', '1975-10-29', 1, '765 Department Building', 'Anos', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2010-08-01', 1, 'Computer Science, Algorithm Design', ''),
(24, 5, NULL, NULL, 'Head', 0, 'Elena Ramirez Bautista', NULL, 'Elena', 'Ramirez', 'Bautista', NULL, '', 'Department Secretary', '5', 0, '', 1, 'dept.staff.eng', '$2y$10$43QjkR.FGu6DaEvREaG5cepASBuNI56uiwWzDQu.dzipGlO9mYK5.', 'EMP-2019-701', NULL, '09281234567', 'elena.bautista@lspu.edu.ph', '1988-05-18', 2, '432 Admin Building', 'Poblacion IV', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2019-03-01', 2, 'Office Management', ''),
(25, 4, 'Personnel', 'Permanent', NULL, 0, 'Juan Dela Cruz Perez', NULL, 'Juan', 'Dela Cruz', 'Perez', NULL, '', 'Human Resources Assistant', '29', 0, '', 1, 'jperez', '$2y$10$WxKklaum93KMxKZuWk6dUO/07btjzLM0PRzZKPLlOm5A1q/HcpyjK', 'EMP-2026-005', NULL, '09291234567', 'pogipj59@gmail.com', '2000-08-15', 1, '234 Perez Street', 'San Antonio', 'Bay', 'Laguna', 'CALABARZON (Region IV-A)', '4033', '2026-03-11', 2, 'BS Computer Science', ''),
(26, 6, NULL, NULL, NULL, 0, 'Maria Clara Santos Reyes', NULL, 'Maria Clara', 'Santos', 'Reyes', NULL, '', '', '0', 0, '', 1, 'mreyes', '$2y$12$ylxIb10FXSIt70iWq8RwFO5lttJNiR2BsRdOGwrp1aVjCsgKvqQaK', NULL, 'APP-2024-002', '09301234567', 'maria.reyes@email.com', '1996-12-10', 2, '567 Reyes Avenue', 'Poblacion V', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', NULL, NULL, 'MBA, 3 years HR experience', ''),
(27, 6, NULL, NULL, NULL, 0, 'Dr. Rafael Enriquez Torres', NULL, 'Rafael', 'Enriquez', 'Torres', NULL, '', '', '0', 0, '', 1, 'rtorres', '$2y$12$D.kPMXIIv2qHFeQxzjMvF.E/YFh110ajvOwFsn.7L4OmEVBMD4Odi', NULL, 'APP-2024-003', '09311234567', 'rafael.torres@email.com', '1985-04-22', 1, '890 Torres Road', 'San Isidro', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', NULL, NULL, 'PhD Engineering, 10 years teaching experience', ''),
(28, 6, NULL, NULL, NULL, 0, 'Sofia Mendoza Cruz', NULL, 'Sofia', 'Mendoza', 'Cruz', '', '', '', '0', 0, '', 1, 'scruz', '$2y$12$HiPcyA/cStzq9LatoImwBOd8R7e8ipzJkEXo5t12qvPyR6xLi4khq', NULL, 'APP-2024-004', '09321234567', 'sofia.cruz@email.com', '1998-09-05', 2, '123 Cruz Lane', 'Llavac', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', NULL, NULL, 'BS Accountancy, Fresh Graduate', ''),
(30, 1, NULL, NULL, NULL, 0, 'System Administrator', NULL, 'System', '', 'Administrator', NULL, '', 'System Administrator', '1', 0, '', 1, 'admin', '$2y$12$E2wWXlpDUyOCLmBRdeJXdOFMt2RGkNf0fFTQQPgtEeL43Vp3HBnum', 'ADMIN-001', NULL, '09171234567', 'admin@lspu.edu.ph', '1980-01-01', 1, '1 LSPU Main Building', 'Poblacion', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2019-01-01', 1, 'System Administration', ''),
(31, 4, 'Personnel', 'Permanent', NULL, 1, 'Juan Miguel Santos', NULL, 'Juan Miguel', 'Reyes', 'Santos', NULL, '', 'Administrative Officer I', '8', 0, '', 1, 'jmsantos.sc', '$2y$10$uZqE0CB3r83RZ9dTzcgUse5oCqPpmFk/MdXOEe3nNN8U.eLZYIhVq', 'EMP-2024-SC-001', NULL, '09981234567', 'juanmiguel.santos@lspu.edu.ph', '1994-05-12', 1, '154 Rizal Street', 'Poblacion I', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2024-07-01', 2, 'Office Administration', ''),
(32, 4, 'Personnel', 'Contractual', NULL, 0, 'Maria Luisa Dela Cruz', NULL, 'Maria Luisa', 'Dela', 'Cruz', NULL, '', 'Library Assistant', '9', 0, '', 1, 'mlcruz.sc', '$2y$10$8Mbd.8KemyW4e2E3UfgLrub4/h2XEShJj02QfAFHo9hmfxk2Autu2', 'EMP-2024-SC-002', NULL, '09992223333', 'marialuisa.cruz@lspu.edu.ph', '1996-10-03', 2, '278 Bonifacio Avenue', 'Poblacion II', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2024-07-15', 2, 'Library and Records Management', ''),
(33, 6, NULL, NULL, NULL, 0, 'John Paul Applicant', NULL, 'John Paul', 'Reyes', 'Applicant', NULL, '', '', '', 0, '', 1, 'jpaul_applicant_sp', '$2y$10$eNocR8Y.bsoHkkgpCsRgJeKHY0rj1BViKtyiiL/hZAXl4n6eKXKkG', NULL, 'APP-2025-004', '09111111111', 'jpaul.applicant.sp@example.com', '1998-01-01', 1, '321 Mabini Street', 'San Roque', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', NULL, NULL, 'Business', ''),
(34, 6, NULL, NULL, NULL, 0, 'Mary Jane Applicant', NULL, 'Mary Jane', 'Cruz', 'Applicant', NULL, '', '', '', 0, '', 1, 'mjane_applicant_sp', '$2y$10$/vkrDqi9fpmc8wDHm.G2/.s.XyULB8eD94bxEhsBKlsXV4.xi7Odm', NULL, 'APP-2025-005', '09222222222', 'mjane.applicant.sp@example.com', '1999-02-02', 2, '456 Del Pilar Road', 'San Antonio', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', NULL, NULL, 'IT', ''),
(35, 6, NULL, NULL, NULL, 0, 'Peter Pan Applicant', NULL, 'Peter Pan', 'Santos', 'Applicant', NULL, '', '', '', 0, '', 1, 'ppan_applicant_sp', '$2y$10$fGuaYIXLhNZwjC3S06NVF.dP4aa99tuBFTWIlIAXlF038g6OmgjXy', NULL, 'APP-2025-006', '09333333333', 'ppan.applicant.sp@example.com', '2000-03-03', 1, '789 Luna Street', 'San Isidro', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', NULL, NULL, 'IT and Business', ''),
(36, 4, 'Faculty', 'Permanent', NULL, 1, 'James Bond Employee', NULL, 'James', 'Sy', 'Bond', NULL, '', 'Professor', '8', 0, '', 1, 'jbond_employee_sp', '$2y$10$eF9fcrFoySPS3iMbuhk6MedG7MAjCCuKZtC5zuMPG9XawTwt1.6j6', 'SP-001', NULL, '09444444444', 'jbond.employee.sp@example.com', '1980-04-04', 1, '567 faculty Ave', 'San Gregorio', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', '2022-01-01', 3, 'Business Management', ''),
(37, 4, 'Personnel', 'Permanent', NULL, 1, 'Minnie Mouse Employee', NULL, 'Minnie', 'Disney', 'Mouse', NULL, '', 'IT Staff', '9', 0, '', 1, 'mmouse_employee_sp', '$2y$10$OolzvBF.a0ELCKsHYUXaT.FCAxs43Zzo7vwlzTwDMvVPOvlQShHJK', 'SP-002', NULL, '09555555555', 'mmouse.employee.sp@example.com', '1985-05-05', 2, '890 Admin Road', 'San Nicolas', 'San Pablo City', 'Laguna', 'CALABARZON (Region IV-A)', '4000', '2022-02-01', 3, 'Network Administration', ''),
(78, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Maria Elena Reyes Santos', NULL, 'Maria Elena', 'Reyes', 'Santos', NULL, '', 'Professor', '5', 0, '', 1, 'mereyes', '$2y$10$WkzRVTxbhPb/7GZwdKvL/uK.Mw6FGBI027tUjSvCrAGXzv3xYh4yW', 'EMP-2016-102', NULL, '09170000001', 'maria.reyes@lspu.edu.ph', '1982-03-15', 2, '123 Prof Street', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2016-08-01', 1, 'Mathematics, Statistics', ''),
(79, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Ricardo Cruz Mendoza', NULL, 'Ricardo', 'Cruz', 'Mendoza', NULL, '', 'Assistant Professor', '6', 0, '', 1, 'rcmendoza', '$2y$10$z87YQkdyrWJioKAc8ixF7.F1JXn5VAYOXGjr0jCV7NnP2rL9XpxHC', 'EMP-2018-103', NULL, '09170000002', 'ricardo.mendoza@lspu.edu.ph', '1985-07-22', 1, '234 Science Ave', 'Anos', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2018-01-15', 1, 'Physics, Thermodynamics', ''),
(80, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Anna Liza Garcia Torres', NULL, 'Anna Liza', 'Garcia', 'Torres', NULL, '', 'Instructor', '7', 0, '', 1, 'algarcia', '$2y$10$7.YxaLD73WoLjKh3Qe62ieMnl.7f6yikN9DZ.uDYZz12P6km8MLNK', 'EMP-2020-104', NULL, '09170000003', 'anna.garcia@lspu.edu.ph', '1990-11-08', 2, '345 Chem Building', 'Maahas', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2020-06-01', 1, 'Chemistry, Organic Chemistry', ''),
(81, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Ferdinand Santos Alvarez', NULL, 'Ferdinand', 'Santos', 'Alvarez', NULL, '', 'Associate Professor', '8', 0, '', 1, 'fsalvarez', '$2y$10$DMw9vrWoCkiHK5SuzKZbveDZBZ95CGNyRhFQORVw1lfiZB7BOwdoC', 'EMP-2014-105', NULL, '09170000004', 'ferdinand.alvarez@lspu.edu.ph', '1978-09-30', 1, '456 Business Hall', 'Mayondon', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2014-09-01', 1, 'Business Administration, Management', ''),
(82, 4, 'Faculty', 'Part-time', NULL, 0, 'Prof. Cristina Lopez Bautista', NULL, 'Cristina', 'Lopez', 'Bautista', NULL, '', 'Part-time Instructor', '9', 0, '', 1, 'clbautista', '$2y$10$nIQI215PfVHiD94pFZOEY.rJ/zJVPN4gXXwucaj18RvEfmzp0QaFq', 'EMP-2023-106', NULL, '09170000005', 'cristina.bautista@lspu.edu.ph', '1992-12-14', 2, '567 IT Building', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2023-08-01', 1, 'Information Technology, Programming', ''),
(83, 4, 'Personnel', 'Permanent', NULL, 0, 'Roberto Carlos Dela Cruz', NULL, 'Roberto Carlos', 'Dela', 'Cruz', NULL, '', 'Administrative Officer IV', '22', 0, '', 1, 'rcdelacruz', '$2y$10$C4MDdfwjGk9pbMPUkRU20uc1Q/ymCrZ1WSHVrqs6yg/P8bpKmWoMG', 'EMP-2019-302', NULL, '09170000006', 'roberto.delacruz@lspu.edu.ph', '1988-05-20', 1, '678 Admin Office', 'Anos', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2019-03-15', 1, 'Accounting, Budget Management', ''),
(84, 4, 'Personnel', 'Permanent', NULL, 0, 'Jennifer Anne Santos Ramirez', NULL, 'Jennifer Anne', 'Santos', 'Ramirez', NULL, '', 'Administrative Assistant III', '10', 0, '', 1, 'jasramirez', '$2y$10$eM839k8kekRSfXVaXTCLvOEG70qpLenjKHZoxLn5wBFtAwrQ.mdoy', 'EMP-2021-303', NULL, '09170000007', 'jennifer.ramirez@lspu.edu.ph', '1994-08-11', 2, '789 Records Room', 'Maahas', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2021-11-01', 1, 'Office Administration, Records Management', ''),
(85, 4, 'Personnel', 'Permanent', NULL, 0, 'Mark Anthony Torres Garcia', NULL, 'Mark Anthony', 'Torres', 'Garcia', NULL, '', 'IT Specialist II', '15', 0, '', 1, 'matgarcia', '$2y$10$wuYeIeQk02m02LAaH9vFEenpKOMwfRbMon4FX1nBBuK/wlV.2MkB2', 'EMP-2022-304', NULL, '09170000008', 'mark.garcia@lspu.edu.ph', '1991-02-28', 1, '890 Tech Center', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2022-04-01', 1, 'Network Administration, Hardware Support', ''),
(86, 4, 'Personnel', 'Permanent', NULL, 0, 'Michelle Grace Mendoza Reyes', NULL, 'Michelle Grace', 'Mendoza', 'Reyes', NULL, '', 'Librarian II', '11', 0, '', 1, 'mgmreyes', '$2y$10$kdoQnN4cf9Zb9C2r7y5A1emni8Udwdk1jnOUKTrP.GF/oeF0wtPJu', 'EMP-2020-305', NULL, '09170000009', 'michelle.reyes@lspu.edu.ph', '1989-10-05', 2, '901 Library Wing', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2020-09-01', 1, 'Library Science, Information Management', ''),
(87, 4, 'Personnel', 'Job Order', NULL, 0, 'Alexander James Cruz Santos', NULL, 'Alexander James', 'Cruz', 'Santos', NULL, '', 'Security Guard', '23', 0, '', 1, 'ajcsantos', '$2y$10$AI8WWFLmw23pl8s7KpaDDeNTmEIGHQlVKRpmG0IUNqvMYMLGivjv.', 'EMP-2023-306', NULL, '09170000010', 'alexander.santos@lspu.edu.ph', '1987-06-17', 1, '234 Security Post', 'Anos', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2023-01-15', 1, 'Security Services, Safety Management', ''),
(88, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Antonio Miguel Lopez', NULL, 'Antonio Miguel', 'Lopez', '', NULL, '', 'Professor', '5', 0, '', 1, 'amlopez', '$2y$10$kyg/7aorGjfXL.uX1izzZ.nUNNoBI7.VUZ16UBLKdhzpUoEAyyfK6', 'EMP-2015-202', NULL, '09180000001', 'antonio.lopez@lspu.edu.ph', '1979-04-12', 1, '345 Engineering Hall', 'Poblacion I', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2015-08-01', 2, 'Engineering, Mechanical Engineering', ''),
(89, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Regina Marie Santos', NULL, 'Regina Marie', 'Santos', '', NULL, '', 'Assistant Professor', '6', 0, '', 1, 'rmsantos', '$2y$10$HKOms83C9P9IWAbHy.OMJO7uI6Mia71Ov7BDwJx7Rv.ywCWc2LzI6', 'EMP-2017-203', NULL, '09180000002', 'regina.santos@lspu.edu.ph', '1984-09-25', 2, '456 Education Building', 'Poblacion II', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2017-01-15', 2, 'Education, Curriculum Development', ''),
(90, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Eduardo Jose Ramirez', NULL, 'Eduardo Jose', 'Ramirez', '', NULL, '', 'Instructor', '7', 0, '', 1, 'ejramirez', '$2y$10$jI.QwLgAC1v2pHShEV75C.ClHSVcVriG01nZ3KGgAV4mKXsSYtjlq', 'EMP-2019-204', NULL, '09180000003', 'eduardo.ramirez@lspu.edu.ph', '1988-01-30', 1, '567 Agriculture Hall', 'Poblacion III', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2019-06-01', 2, 'Agriculture, Crop Science', ''),
(91, 4, 'Faculty', 'Permanent', NULL, 0, 'Patricia Ann  Mendoza', NULL, 'Patricia Ann', '', 'Mendoza', NULL, '', 'Associate Professor', '8', 0, '', 1, 'pamendoza', '$2y$10$la7LCd3KROKLfriQXx6wruPxhKdxGqB1jr4GeccnBizmx9TEePsGW', 'EMP-2016-205', NULL, '09180000004', 'patricia.mendoza@lspu.edu.ph', '1981-11-18', 2, '678 Nursing Building', 'Santisima Cruz', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2016-09-01', 2, 'Nursing, Healthcare Management', ''),
(92, 4, 'Faculty', 'Part-time', NULL, 0, 'Prof. Carlos Manuel Torres', NULL, 'Carlos Manuel', 'Torres', '', NULL, '', 'Part-time Instructor', '9', 0, '', 1, 'cmtorres', '$2y$10$pJ1/sBcjrgxnT9h/ALScgekdQJmaNOO3tDVB0oY0rzOcKBZQy6qUK', 'EMP-2023-206', NULL, '09180000005', 'carlos.torres@lspu.edu.ph', '1993-07-08', 1, '789 CS Department', 'Poblacion V', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2023-08-01', 2, 'Computer Science, Database Systems', ''),
(93, 4, 'Personnel', 'Permanent', NULL, 1, 'Angelica Rose Garcia', NULL, 'Angelica Rose', 'Garcia', '', NULL, '', 'Administrative Officer III', '22', 0, '', 1, 'argarcia', '$2y$10$M1XYtAXBFbh2VkAudpyXqeBseKejsOy9BwPcnoz5sagsaxK49aiS6', 'EMP-2018-402', NULL, '09180000006', 'angelica.garcia@lspu.edu.ph', '1986-03-14', 2, '890 Finance Office', 'Duhat', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2018-03-15', 2, 'Financial Management, Procurement', ''),
(94, 4, 'Personnel', 'Permanent', NULL, 1, 'Benjamin Cruz Alvarez', NULL, 'Benjamin', 'Cruz', 'Alvarez', NULL, '', 'Administrative Assistant II', '10', 0, '', 1, 'bcalvarez', '$2y$10$W6.bpVsZ1ggRKLZH6r493OmOl0PGCF37vtPpLiwuECEhaHKoXAZja', 'EMP-2022-403', NULL, '09180000007', 'benjamin.alvarez@lspu.edu.ph', '1995-12-03', 1, '123 Admin Wing', 'Gatid', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2022-11-01', 2, 'Office Management, Documentation', ''),
(95, 4, 'Personnel', 'Permanent', NULL, 0, 'Diana Marie Santos', NULL, 'Diana Marie', 'Santos', '', NULL, '', 'IT Support Specialist', '15', 0, '', 1, 'dmsantos', '$2y$10$vyrPVC4QRnlXi2SZv9Mtq.GSynBFsBouP1kITFYpRdhAsKb00r3zy', 'EMP-2023-404', NULL, '09180000008', 'diana.santos@lspu.edu.ph', '1992-05-27', 2, '234 IT Support', 'Jasaan', 'Santa Cruz', 'Laguna', 'CALABARZON (Region IV-A)', '4009', '2023-04-01', 2, 'Technical Support, Software Installation', ''),
(96, 4, 'Personnel', 'Permanent', NULL, 0, 'Francis Paul Mendoza Mendoza', NULL, 'Francis Paul', 'Mendoza', 'Mendoza', NULL, '', 'Laboratory Technician', '12', 0, '', 1, 'fpmendoza', '$2y$10$DaAtXl0eFpHrzzud.lqG5O9TbA8xa5EQVZ5B29SCsyJN3ZfCDXMAS', 'EMP-2021-405', NULL, '09180000009', 'francis.mendoza@lspu.edu.ph', '1990-08-19', 1, '345 Dormitory 1', 'Lalakay', 'Los Baños', 'Laguna', 'CALABARZON', '4030', '2021-09-01', 1, 'Laboratory Management, Equipment Maintenance', ''),
(97, 4, 'Personnel', 'Casual', NULL, 0, 'Gloria Reyes Torres', NULL, 'Gloria', 'Reyes', 'Torres', NULL, '', 'Utility Worker', '24', 0, '', 1, 'grtorres', '$2y$10$74XMVxng1zZC9TCXtvRXqeIPXy4ag9tHQM0yFElgYyvG8cz9icD.u', 'EMP-2024-406', NULL, '09180000010', 'gloria.torres@lspu.edu.ph', '1988-02-11', 2, '456 Dormitory 2', 'Maahas', 'Los Baños', 'Laguna', 'CALABARZON', '4030', '2024-01-15', 1, 'Maintenance, Facilities Management', ''),
(98, 4, 'Faculty', 'Permanent', NULL, 0, 'Lourdes Fatima Cruz Cruz', NULL, 'Lourdes Fatima', 'Cruz', 'Cruz', NULL, '', 'Professor', '5', 0, '', 1, 'lfcruz', '$2y$10$.HDmLWDZBeEWvIBWkBPaNOvekR00CMFwjYV9XvP/1e7WYHAzuZ4oC', 'EMP-2014-302', NULL, '09190000001', 'lourdes.cruz@lspu.edu.ph', '1977-01-25', 2, '567 Clinic Building', 'Mayondon', 'Los Baños', 'Laguna', 'CALABARZON', '4030', '2014-08-01', 1, 'Psychology, Counseling', ''),
(99, 4, 'Faculty', 'Permanent', NULL, 0, 'Jose Emmanuel Santos Santos', NULL, 'Jose Emmanuel', 'Santos', 'Santos', NULL, '', 'Assistant Professor', '6', 0, '', 1, 'jesantos', '$2y$10$aE51wup4CnVxqtT94kktE.0rSeLJf3kmXBQ1NQH.GMna6lE.iXbcm', 'EMP-2016-303', NULL, '09190000002', 'jose.santos@lspu.edu.ph', '1983-06-10', 1, '678 Sports Complex', 'Batong Malake', 'Los Baños', 'Laguna', 'CALABARZON', '4030', '2016-01-15', 1, 'English, Literature', ''),
(100, 4, 'Faculty', 'Permanent', NULL, 1, 'Prof. Maria Victoria Ramirez', NULL, 'Maria Victoria', 'Ramirez', '', NULL, '', 'Instructor', '7', 0, '', 1, 'mvramirez', '$2y$10$8USVHXXyd1/i3nxYtoesZef5TzmDy9mk92qlnjyJ2kJrmbG.zpioa', 'EMP-2018-304', NULL, '09190000003', 'maria.ramirez@lspu.edu.ph', '1987-10-05', 2, '789 Conference Hall', 'San Antonio', 'Los Baños', 'Laguna', 'CALABARZON (Region IV-A)', '4030', '2018-06-01', 3, 'History, Social Studies', ''),
(101, 4, 'Faculty', 'Permanent', NULL, 0, 'Roberto Carlos Mendoza Mendoza', NULL, 'Roberto Carlos', 'Mendoza', 'Mendoza', NULL, '', 'Associate Professor', '8', 0, '', 1, 'rcmendoza2', '$2y$10$vbMdFNqbCnvUhYxMq9thueJHjDVNcJGPK3KsjUuYMPvZLKBdhq6U.', 'EMP-2015-305', NULL, '09190000004', 'roberto.mendoza@lspu.edu.ph', '1980-04-22', 1, '890 Staff Room', 'Bagong Silang', 'Los Baños', 'Laguna', 'CALABARZON', '4030', '2015-09-01', 1, 'Economics, Development Studies', ''),
(102, 4, 'Faculty', 'Part-time', NULL, 0, 'Angelica Rose Torres Torres', NULL, 'Angelica Rose', 'Torres', 'Torres', NULL, '', 'Part-time Instructor', '9', 0, '', 1, 'artorres', '$2y$10$Rsv7RcIICkmE..qLk1AO/.yMXFrXJJt128KndBqfnKQmyJtG9s1C2', 'EMP-2023-307', NULL, '09190000005', 'angelica.torres@lspu.edu.ph', '1994-03-17', 2, '123 Warehouse', 'Barangay I (Pob.)', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2023-08-01', 2, 'Fine Arts, Visual Communication', ''),
(103, 4, 'Personnel', 'Permanent', NULL, 0, 'Bernardo Jose Alvarez Alvarez', NULL, 'Bernardo Jose', 'Alvarez', 'Alvarez', NULL, '', 'Administrative Officer II', '22', 0, '', 1, 'bjalvarez', '$2y$10$8x1bg7I7KbLTjsfGNB3f7.BTvqxUoy8UT9VLDTBUqC/UFz229eKI2', 'EMP-2017-502', NULL, '09190000006', 'bernardo.alvarez@lspu.edu.ph', '1985-07-08', 1, '234 Maintenance Office', 'Bubukal', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2017-03-15', 2, 'Human Resources, Employee Relations', ''),
(104, 4, 'Personnel', 'Permanent', NULL, 0, 'Carmela Santos Garcia', NULL, 'Carmela', 'Santos', 'Garcia', NULL, '', 'Administrative Assistant I', '10', 0, '', 1, 'csgarcia', '$2y$10$uNLDx6JrW2PRak4UZWXH1OL0D2lJ9TBJDvqOFbt1DGRJo9VEvH8A.', 'EMP-2023-503', NULL, '09190000007', 'carmela.garcia@lspu.edu.ph', '1996-09-14', 2, '345 Security Office', 'Bubukal', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2023-11-01', 2, 'Administrative Support, Filing', ''),
(105, 4, 'Personnel', 'Permanent', NULL, 0, 'Daniel Reyes Mendoza', NULL, 'Daniel', 'Reyes', 'Mendoza', NULL, '', 'Computer Technician', '15', 0, '', 1, 'drmendoza', '$2y$10$5jv9M1K.8hubPjHs2T4YSOe86vXYnFie/m3wvRpqfUC0Ki4iloXVW', 'EMP-2024-504', NULL, '09190000008', 'daniel.mendoza@lspu.edu.ph', '1993-11-30', 1, '456 Archives Room', 'Calios', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2024-04-01', 2, 'Computer Repair, Hardware Maintenance', ''),
(106, 4, 'Personnel', 'Permanent', NULL, 0, 'Elena Marie Cruz Cruz', NULL, 'Elena Marie', 'Cruz', 'Cruz', NULL, '', 'Guidance Counselor', '13', 0, '', 1, 'emcruz', '$2y$10$KoE.Wbx8RyM6gHKmTb8smO8MT/Xrbv.VW9e6QBfp9pNvxE.DXeRAm', 'EMP-2020-505', NULL, '09190000009', 'elena.cruz@lspu.edu.ph', '1989-12-07', 2, '567 Records Room', 'Pagsawitan', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2020-09-01', 2, 'Student Counseling, Career Guidance', ''),
(107, 4, 'Personnel', 'Job Order', NULL, 0, 'Francisco Miguel Santos Santos', NULL, 'Francisco Miguel', 'Santos', 'Santos', NULL, '', 'Driver', '25', 0, '', 1, 'fmsantos', '$2y$12$iB8h791cT8S4e442Jx17WuHp1GgAg45LFX8XV7GeAOGXELLeFoqRa', 'EMP-2024-506', NULL, '09190000010', 'francisco.santos@lspu.edu.ph', '1987-05-23', 1, '678 Training Center', 'Patimbao', 'Santa Cruz', 'Laguna', 'CALABARZON', '4009', '2024-01-15', 2, 'Vehicle Operation, Transportation', ''),
(108, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Rosalinda Marie Lopez', NULL, 'Rosalinda Marie', 'Lopez', '', NULL, '', 'Professor', '5', 0, '', 1, 'rmlopez', '$2y$10$kc49yT.7u3RoG6MX/1Z1a.gUemsVGkxUcWA2fW2R8HgIocSBpmQne', 'EMP-2013-402', NULL, '09200000001', 'rosalinda.lopez@lspu.edu.ph', '1976-08-19', 2, '789 IT Lab', 'Bagumbayan', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2013-08-01', 4, 'Biology, Microbiology', ''),
(109, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Antonio Jose Garcia', NULL, 'Antonio Jose', 'Garcia', '', NULL, '', 'Assistant Professor', '6', 0, '', 1, 'ajgarcia', '$2y$10$jWU2jVRy8GjcCNjgl0xh2eGfVUHN0rAWc8paeI6jPWTbFI5QDLNUG', 'EMP-2015-403', NULL, '09200000002', 'antonio.garcia@lspu.edu.ph', '1982-12-03', 1, '890 Audio Visual', 'G. Redor', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2015-01-15', 4, 'Physical Education, Sports Science', ''),
(110, 4, 'Faculty', 'Permanent', NULL, 0, 'Prof. Bernadette Cruz Santos', NULL, 'Bernadette', 'Cruz', 'Santos', NULL, '', 'Instructor', '7', 0, '', 1, 'bcsantos', '$2y$10$BssAq0VtpXecTJz/VS3RiORsiG4KjNn0cbbxXDvrgb147grQ4eZYy', 'EMP-2017-404', NULL, '09200000003', 'bernadette.santos@lspu.edu.ph', '1986-04-28', 2, '123 Multimedia Room', 'Llavac', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2017-06-01', 4, 'Filipino, Literature', ''),
(111, 4, 'Faculty', 'Permanent', NULL, 0, 'Dr. Cesar Manuel Ramirez', NULL, 'Cesar Manuel', 'Ramirez', '', NULL, '', 'Associate Professor', '8', 0, '', 1, 'cmramirez', '$2y$10$R9I7XEKksfMsMYsSwYmPdearll33GyLluUIFCpAd6jX8zIGZI9tj.', 'EMP-2014-405', NULL, '09200000004', 'cesar.ramirez@lspu.edu.ph', '1979-09-15', 1, '234 Guidance Office', 'Magsaysay', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2014-09-01', 4, 'Mathematics Education, Statistics', ''),
(112, 4, 'Faculty', 'Part-time', NULL, 0, 'Prof. Delia Rose Mendoza', NULL, 'Delia Rose', 'Mendoza', '', NULL, '', 'Part-time Instructor', '9', 0, '', 1, 'drmendoza2', '$2y$10$OCbxn4kIp6fXIlZr8d1kHueLbse0h9LEolkoTfa06fFlJphSNs1GS', 'EMP-2023-406', NULL, '09200000005', 'delia.mendoza@lspu.edu.ph', '1995-01-11', 2, '345 Printing Services', 'Mendiola', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2023-08-01', 4, 'Tourism, Hospitality Management', ''),
(113, 4, 'Personnel', 'Permanent', NULL, 0, 'Emilio Santos Torres', NULL, 'Emilio', 'Santos', 'Torres', NULL, '', 'Administrative Officer I', '22', 0, '', 1, 'estorres', '$2y$10$CYPPBFh2.4WGJwmAjLmPS.imq3Quqs9oIpAyv27hjRFViVL0TGZnC', 'EMP-2016-602', NULL, '09200000006', 'emilio.torres@lspu.edu.ph', '1984-11-22', 1, '456 Bookstore', 'Salubungan', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2016-03-15', 4, 'Supply Management, Inventory Control', ''),
(114, 4, 'Personnel', 'Permanent', NULL, 0, 'Felicitas Garcia Alvarez', NULL, 'Felicitas', 'Garcia', 'Alvarez', NULL, '', 'Clerk II', '10', 0, '', 1, 'fgalvarez', '$2y$10$yXdq/Vc2HA9c1ruGeerxL.6NBq6nw.jPkvEZYjLIXEoEKrXCN1/Oq', 'EMP-2024-603', NULL, '09200000007', 'felicitas.alvarez@lspu.edu.ph', '1997-06-09', 2, '567 Canteen', 'Wawa', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2024-11-01', 4, 'Data Entry, Records Keeping', ''),
(115, 4, 'Personnel', 'Job Order', NULL, 0, 'Gabriel Jose Mendoza', NULL, 'Gabriel Jose', 'Mendoza', '', NULL, '', 'Electrician', '26', 0, '', 1, 'gjmendoza', '$2y$10$dfo4MEvWrq1J3fSp7vGLWOyA5w2E60i/ZiyL/ZOjMpQJcwv5yrrFe', 'EMP-2024-604', NULL, '09200000008', 'gabriel.mendoza@lspu.edu.ph', '1994-03-04', 1, '678 Medical Clinic', 'Liyang', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2024-04-01', 4, 'Electrical Maintenance, Wiring', ''),
(116, 4, 'Personnel', 'Permanent', NULL, 0, 'Hazel Marie Cruz', NULL, 'Hazel Marie', 'Cruz', '', NULL, '', 'Nurse', '14', 0, '', 1, 'hmcruz', '$2y$10$REZuOwwd7RhLx9v3nOKF5.9BQF1FwZcJxMdXycVwTQz9KzrjZqK2S', 'EMP-2021-605', NULL, '09200000009', 'hazel.cruz@lspu.edu.ph', '1990-07-16', 2, '789 Transport Office', 'Kapatalan', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2021-09-01', 4, 'Healthcare Services, First Aid', ''),
(117, 4, 'Personnel', 'Casual', NULL, 0, 'Isidro Reyes Santos', NULL, 'Isidro', 'Reyes', 'Santos', NULL, '', 'Janitor', '27', 0, '', 1, 'irsantos', '$2y$10$Vm8Hp41YStlMU0VaPynt5OaEZn1pOegZeD6Jt3ZOHleLWFk46KPAK', 'EMP-2024-606', NULL, '09200000010', 'isidro.santos@lspu.edu.ph', '1986-10-31', 1, '890 Registrar Office', 'Poblacion', 'Siniloan', 'Laguna', 'CALABARZON (Region IV-A)', '4012', '2024-01-15', 4, 'Cleaning Services, Sanitation', ''),
(121, 6, NULL, NULL, NULL, 0, 'Dr. Jerico Dyoskopo Dia', 'Dr.', 'Jerico', 'Dyoskopo', 'Dia', NULL, '', '', '', 0, '', 1, 'jerico_ni_joy', '$2y$10$vFdK8JaHx2ePxUKsHu4zDeg/INrQRPdLbWvci.JSs2ig/2hQdqdi.', NULL, 'APP1.844674407371E+19', '09630808670', 'ryanrivarez7@gmail.com', '2026-10-11', 1, '00123 kamagong', '043402010', '043402000', '043400000', '040000000', '4033', NULL, NULL, 'IT Support', ''),
(122, 6, NULL, NULL, NULL, 0, 'Alfredo Jargue Joya Jr.', NULL, 'Alfredo', 'Jargue', 'Joya', 'Jr.', '', '', '', 0, '', 1, 'alfredrin', '$2y$10$W53NF7zh6d51TVYSoK6OCOO7JAraFBEQCHNWRcXC1FcMorjPyEhoG', NULL, 'APP-2026-001', '09630808679', 'alfredojoya23@gmail.com', '2003-07-10', 1, '456 Archives Room', '043422005', '043422000', '043400000', '040000000', '4010', NULL, NULL, 'Customer Service', ''),
(123, 5, NULL, NULL, 'Head', 0, 'Crest Ramos Ibarra', NULL, 'Crest', 'Ramos', 'Ibarra', NULL, '', 'Administrative', '9', 0, '', 1, 'Crest29', '$2y$12$f.Lrztp5cR3DRm16xHq.IuEfrM0quBWYCw9nLsk67M1RtRf8.aZWG', 'EMP-2026-004', NULL, '09875761125', 'Crest@gmail.com', '2001-02-06', 1, '0635 Magdanol', 'Barangay Zone VII (Pob.)', 'Luisiana', 'Laguna', 'CALABARZON', '4032', '2026-03-04', 2, 'Academic Mission', ''),
(124, 6, NULL, NULL, NULL, 0, 'Raymond Valenzue;a Rivarez', NULL, 'Raymond', 'Valenzue;a', 'Rivarez', NULL, '', '', '', 0, '', 1, 'raymond.rivarez', '$2y$12$ZDAtHEVGD5PsAbZkCCi0QOMlcQrJQUxt4trxl5DFJ/mbe7NEEEx2y', NULL, 'APP-2026-002', '09515997230', 'raymondrivarez23@gmail.com', '2004-03-15', 1, '0837 Codera Street', '043422017', '043422000', '043400000', '040000000', '4010', NULL, NULL, 'IT Support', ''),
(125, 6, NULL, NULL, NULL, 0, 'THIRD Reyes Andallo III', NULL, 'THIRD', 'Reyes', 'Andallo', 'III', '', '', '', 0, '', 1, 'thirdy', '$2y$12$0ACIsqcqkjC7ZpT1mL6X5./3rwrHdizQyNNQQey9h8yU1nB.NsgsS', NULL, 'APP-2026-003', '09752484620', 'pjandallo90@gmail.com', '1967-04-06', 1, '0639 Kamagong', '043426023', '043426000', '043400000', '040000000', '4009', NULL, NULL, 'Research and Extension', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomplishment_reports`
--
ALTER TABLE `accomplishment_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `report_type` (`report_type`);

--
-- Indexes for table `applicant_lifecycle`
--
ALTER TABLE `applicant_lifecycle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `applicant_score_sheets`
--
ALTER TABLE `applicant_score_sheets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_application_id` (`application_id`),
  ADD KEY `idx_applicant_id` (`applicant_id`),
  ADD KEY `idx_job_posting_id` (`job_posting_id`);

--
-- Indexes for table `background_investigation_requests`
--
ALTER TABLE `background_investigation_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bg_employee` (`employee_id`),
  ADD KEY `idx_bg_status` (`status`),
  ADD KEY `idx_bg_sent_at` (`sent_at`),
  ADD KEY `idx_bg_applicant` (`applicant_id`);

--
-- Indexes for table `clearances`
--
ALTER TABLE `clearances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dtr_requests`
--
ALTER TABLE `dtr_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_nominations`
--
ALTER TABLE `employee_nominations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_program_award_nominee_nominator` (`program_id`,`award_id`,`nominee_id`,`nominator_id`),
  ADD KEY `idx_nominations_program_award` (`program_id`,`award_id`),
  ADD KEY `idx_nominations_nominee` (`nominee_id`),
  ADD KEY `idx_nominations_nominator` (`nominator_id`),
  ADD KEY `fk_employee_nominations_award` (`award_id`);

--
-- Indexes for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_exam_attendance_application_id` (`application_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `applicant_id` (`applicant_id`),
  ADD KEY `job_posting_id` (`job_posting_id`),
  ADD KEY `exam_schedule_id` (`exam_schedule_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posting_id` (`job_posting_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posting_id` (`job_posting_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `exam_date` (`exam_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `idp_tna_periods`
--
ALTER TABLE `idp_tna_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `quarter` (`quarter`),
  ADD KEY `status` (`status`),
  ADD KEY `deadline` (`deadline`);

--
-- Indexes for table `individual_development_plans`
--
ALTER TABLE `individual_development_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `interview_questions`
--
ALTER TABLE `interview_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posting_id` (`job_posting_id`),
  ADD KEY `fk_interview_questions_created_by` (`created_by`);

--
-- Indexes for table `interview_rankings`
--
ALTER TABLE `interview_rankings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ranking` (`job_posting_id`,`application_id`),
  ADD KEY `job_posting_id` (`job_posting_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `decided_by` (`decided_by`),
  ADD KEY `idx_rankings` (`job_posting_id`,`average_score`,`rank`);

--
-- Indexes for table `interview_responses`
--
ALTER TABLE `interview_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `interview_score_sheets`
--
ALTER TABLE `interview_score_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interview_session_id` (`interview_session_id`),
  ADD KEY `evaluator_id` (`evaluator_id`);

--
-- Indexes for table `interview_sessions`
--
ALTER TABLE `interview_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posting_id` (`job_posting_id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_position_category` (`position_category`),
  ADD KEY `idx_application_deadline` (`application_deadline`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `leave_type` (`leave_type`),
  ADD KEY `date_from` (`date_from`);

--
-- Indexes for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_year` (`employee_id`,`year`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pass_slips`
--
ALTER TABLE `pass_slips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `performance_peer_ratings`
--
ALTER TABLE `performance_peer_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_peer_rating` (`peer_selection_id`),
  ADD KEY `performance_rating_id` (`performance_rating_id`),
  ADD KEY `idx_peer_rating_evaluator` (`peer_evaluator_id`);

--
-- Indexes for table `performance_peer_selections`
--
ALTER TABLE `performance_peer_selections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_peer_selection` (`performance_rating_id`,`peer_evaluator_id`),
  ADD KEY `idx_peer_selection_employee` (`employee_id`),
  ADD KEY `idx_peer_selection_evaluator` (`peer_evaluator_id`),
  ADD KEY `idx_peer_selection_status` (`status`);

--
-- Indexes for table `performance_ratings`
--
ALTER TABLE `performance_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `evaluator_id` (`evaluator_id`),
  ADD KEY `rating_period` (`rating_period`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `permission_to_study`
--
ALTER TABLE `permission_to_study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `idx_pts_employee_status_viewed` (`employee_id`,`status`,`employee_notif_viewed`);

--
-- Indexes for table `recognition_award_criteria`
--
ALTER TABLE `recognition_award_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recognition_award_criteria_award` (`award_id`);

--
-- Indexes for table `recognition_award_panelists`
--
ALTER TABLE `recognition_award_panelists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_award_panelist` (`award_id`,`panelist_id`),
  ADD KEY `idx_recognition_award_panelists_award` (`award_id`),
  ADD KEY `idx_recognition_award_panelists_panelist` (`panelist_id`);

--
-- Indexes for table `recognition_nominations`
--
ALTER TABLE `recognition_nominations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_program_award_nominee_nominator` (`program_id`,`award_id`,`nominee_id`,`nominator_id`),
  ADD KEY `idx_nom_program` (`program_id`),
  ADD KEY `idx_nom_award` (`award_id`),
  ADD KEY `idx_nom_nominee` (`nominee_id`),
  ADD KEY `idx_nom_nominator` (`nominator_id`),
  ADD KEY `idx_nom_supervisor` (`supervisor_id`),
  ADD KEY `idx_nom_status` (`status`),
  ADD KEY `fk_recognition_nom_approved_by` (`approved_by`);

--
-- Indexes for table `recognition_panel_scores`
--
ALTER TABLE `recognition_panel_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_panel_score` (`award_id`,`nomination_id`,`panelist_id`,`criteria_id`),
  ADD KEY `idx_recognition_panel_scores_nomination` (`nomination_id`),
  ADD KEY `idx_recognition_panel_scores_panelist` (`panelist_id`),
  ADD KEY `idx_recognition_panel_scores_criteria` (`criteria_id`);

--
-- Indexes for table `recognition_programs`
--
ALTER TABLE `recognition_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recognition_programs_status` (`status`),
  ADD KEY `idx_recognition_programs_campus` (`campus`);

--
-- Indexes for table `recognition_program_awards`
--
ALTER TABLE `recognition_program_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recognition_awards_program_id` (`program_id`);

--
-- Indexes for table `recognition_votes`
--
ALTER TABLE `recognition_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_vote` (`program_id`,`nomination_id`,`voter_id`),
  ADD KEY `idx_votes_program` (`program_id`),
  ADD KEY `idx_votes_nomination` (`nomination_id`);

--
-- Indexes for table `recognition_winners`
--
ALTER TABLE `recognition_winners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_winners_program` (`program_id`),
  ADD KEY `idx_winners_nomination` (`nomination_id`),
  ADD KEY `idx_winners_winner` (`winner_id`);

--
-- Indexes for table `request_slips`
--
ALTER TABLE `request_slips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `urgency` (`urgency`),
  ADD KEY `request_type` (`request_type`);

--
-- Indexes for table `scholarship_applications`
--
ALTER TABLE `scholarship_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `permission_to_study_id` (`permission_to_study_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `idx_sa_employee_status_viewed` (`employee_id`,`status`,`employee_notif_viewed`);

--
-- Indexes for table `training_assessments`
--
ALTER TABLE `training_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_program_id` (`training_program_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `impact_assessment_id` (`impact_assessment_id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `training_needs_assessments`
--
ALTER TABLE `training_needs_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `idp_id` (`idp_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `training_programs`
--
ALTER TABLE `training_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `training_program_assignments`
--
ALTER TABLE `training_program_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_training_employee` (`training_program_id`,`employee_id`),
  ADD KEY `training_program_id` (`training_program_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `training_program_attachments`
--
ALTER TABLE `training_program_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_training_program_id` (`training_program_id`),
  ADD KEY `idx_uploaded_by` (`uploaded_by`);

--
-- Indexes for table `training_program_impact_assessments`
--
ALTER TABLE `training_program_impact_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_program_id` (`training_program_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `travel_orders`
--
ALTER TABLE `travel_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status` (`status`),
  ADD KEY `date_from` (`date_from`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employeeno_unique` (`employeeno`),
  ADD KEY `idx_user_type` (`type`),
  ADD KEY `idx_employee_type` (`employee_type`),
  ADD KEY `idx_employment_status` (`employment_status`),
  ADD KEY `idx_city` (`city`),
  ADD KEY `idx_province` (`province`),
  ADD KEY `idx_region` (`region`),
  ADD KEY `idx_postal_code` (`postal_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomplishment_reports`
--
ALTER TABLE `accomplishment_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_lifecycle`
--
ALTER TABLE `applicant_lifecycle`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_score_sheets`
--
ALTER TABLE `applicant_score_sheets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `background_investigation_requests`
--
ALTER TABLE `background_investigation_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clearances`
--
ALTER TABLE `clearances`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `dtr_requests`
--
ALTER TABLE `dtr_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_nominations`
--
ALTER TABLE `employee_nominations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `idp_tna_periods`
--
ALTER TABLE `idp_tna_periods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `individual_development_plans`
--
ALTER TABLE `individual_development_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `interview_questions`
--
ALTER TABLE `interview_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `interview_rankings`
--
ALTER TABLE `interview_rankings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `interview_responses`
--
ALTER TABLE `interview_responses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_score_sheets`
--
ALTER TABLE `interview_score_sheets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `interview_sessions`
--
ALTER TABLE `interview_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_balances`
--
ALTER TABLE `leave_balances`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pass_slips`
--
ALTER TABLE `pass_slips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_peer_ratings`
--
ALTER TABLE `performance_peer_ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_peer_selections`
--
ALTER TABLE `performance_peer_selections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `performance_ratings`
--
ALTER TABLE `performance_ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_to_study`
--
ALTER TABLE `permission_to_study`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `recognition_award_criteria`
--
ALTER TABLE `recognition_award_criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `recognition_award_panelists`
--
ALTER TABLE `recognition_award_panelists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recognition_nominations`
--
ALTER TABLE `recognition_nominations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recognition_panel_scores`
--
ALTER TABLE `recognition_panel_scores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `recognition_programs`
--
ALTER TABLE `recognition_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recognition_program_awards`
--
ALTER TABLE `recognition_program_awards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recognition_votes`
--
ALTER TABLE `recognition_votes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recognition_winners`
--
ALTER TABLE `recognition_winners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_slips`
--
ALTER TABLE `request_slips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scholarship_applications`
--
ALTER TABLE `scholarship_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `training_assessments`
--
ALTER TABLE `training_assessments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `training_needs_assessments`
--
ALTER TABLE `training_needs_assessments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training_programs`
--
ALTER TABLE `training_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training_program_assignments`
--
ALTER TABLE `training_program_assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `training_program_attachments`
--
ALTER TABLE `training_program_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `training_program_impact_assessments`
--
ALTER TABLE `training_program_impact_assessments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `travel_orders`
--
ALTER TABLE `travel_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_nominations`
--
ALTER TABLE `employee_nominations`
  ADD CONSTRAINT `fk_employee_nominations_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nominations_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nominations_program` FOREIGN KEY (`program_id`) REFERENCES `recognition_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `exam_attempts_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`),
  ADD CONSTRAINT `exam_attempts_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `exam_questions` (`id`);

--
-- Constraints for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD CONSTRAINT `exam_attendance_ibfk_schedule` FOREIGN KEY (`exam_schedule_id`) REFERENCES `exam_schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_ibfk_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`);

--
-- Constraints for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD CONSTRAINT `exam_schedules_ibfk_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_schedules_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `individual_development_plans`
--
ALTER TABLE `individual_development_plans`
  ADD CONSTRAINT `fk_idp_period` FOREIGN KEY (`period_id`) REFERENCES `idp_tna_periods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interview_questions`
--
ALTER TABLE `interview_questions`
  ADD CONSTRAINT `fk_interview_questions_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `interview_questions_ibfk_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`);

--
-- Constraints for table `interview_rankings`
--
ALTER TABLE `interview_rankings`
  ADD CONSTRAINT `interview_rankings_ibfk_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  ADD CONSTRAINT `interview_rankings_ibfk_2` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`),
  ADD CONSTRAINT `interview_rankings_ibfk_3` FOREIGN KEY (`decided_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `interview_responses`
--
ALTER TABLE `interview_responses`
  ADD CONSTRAINT `interview_responses_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `interview_sessions` (`id`),
  ADD CONSTRAINT `interview_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `interview_questions` (`id`);

--
-- Constraints for table `interview_score_sheets`
--
ALTER TABLE `interview_score_sheets`
  ADD CONSTRAINT `interview_score_sheets_ibfk_1` FOREIGN KEY (`interview_session_id`) REFERENCES `interview_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interview_score_sheets_ibfk_2` FOREIGN KEY (`evaluator_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `interview_sessions`
--
ALTER TABLE `interview_sessions`
  ADD CONSTRAINT `interview_sessions_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `job_applications` (`id`),
  ADD CONSTRAINT `interview_sessions_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  ADD CONSTRAINT `job_applications_ibfk_2` FOREIGN KEY (`applicant_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `job_postings_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `job_postings_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `performance_peer_ratings`
--
ALTER TABLE `performance_peer_ratings`
  ADD CONSTRAINT `performance_peer_ratings_ibfk_1` FOREIGN KEY (`peer_selection_id`) REFERENCES `performance_peer_selections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_peer_ratings_ibfk_2` FOREIGN KEY (`performance_rating_id`) REFERENCES `performance_ratings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_peer_ratings_ibfk_3` FOREIGN KEY (`peer_evaluator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `performance_peer_selections`
--
ALTER TABLE `performance_peer_selections`
  ADD CONSTRAINT `performance_peer_selections_ibfk_1` FOREIGN KEY (`performance_rating_id`) REFERENCES `performance_ratings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_peer_selections_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `performance_peer_selections_ibfk_3` FOREIGN KEY (`peer_evaluator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `performance_ratings`
--
ALTER TABLE `performance_ratings`
  ADD CONSTRAINT `fk_perf_employee` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_perf_evaluator` FOREIGN KEY (`evaluator_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recognition_award_criteria`
--
ALTER TABLE `recognition_award_criteria`
  ADD CONSTRAINT `fk_recognition_award_criteria_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recognition_award_panelists`
--
ALTER TABLE `recognition_award_panelists`
  ADD CONSTRAINT `fk_recognition_award_panelists_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_award_panelists_user` FOREIGN KEY (`panelist_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recognition_nominations`
--
ALTER TABLE `recognition_nominations`
  ADD CONSTRAINT `fk_recognition_nom_approved_by` FOREIGN KEY (`approved_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_recognition_nom_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_nom_nominator` FOREIGN KEY (`nominator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_recognition_nom_nominee` FOREIGN KEY (`nominee_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_recognition_nom_program` FOREIGN KEY (`program_id`) REFERENCES `recognition_programs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_nom_supervisor` FOREIGN KEY (`supervisor_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `recognition_panel_scores`
--
ALTER TABLE `recognition_panel_scores`
  ADD CONSTRAINT `fk_recognition_panel_scores_award` FOREIGN KEY (`award_id`) REFERENCES `recognition_program_awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_panel_scores_criteria` FOREIGN KEY (`criteria_id`) REFERENCES `recognition_award_criteria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_panel_scores_nomination` FOREIGN KEY (`nomination_id`) REFERENCES `recognition_nominations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_recognition_panel_scores_panelist` FOREIGN KEY (`panelist_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recognition_program_awards`
--
ALTER TABLE `recognition_program_awards`
  ADD CONSTRAINT `fk_recognition_awards_program` FOREIGN KEY (`program_id`) REFERENCES `recognition_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recognition_winners`
--
ALTER TABLE `recognition_winners`
  ADD CONSTRAINT `fk_winners_nomination` FOREIGN KEY (`nomination_id`) REFERENCES `employee_nominations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_winners_program` FOREIGN KEY (`program_id`) REFERENCES `recognition_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scholarship_applications`
--
ALTER TABLE `scholarship_applications`
  ADD CONSTRAINT `fk_scholarship_permission` FOREIGN KEY (`permission_to_study_id`) REFERENCES `permission_to_study` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_assessments`
--
ALTER TABLE `training_assessments`
  ADD CONSTRAINT `fk_assessment_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `training_program_assignments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assessment_employee` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assessment_impact` FOREIGN KEY (`impact_assessment_id`) REFERENCES `training_program_impact_assessments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assessment_training` FOREIGN KEY (`training_program_id`) REFERENCES `training_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_needs_assessments`
--
ALTER TABLE `training_needs_assessments`
  ADD CONSTRAINT `fk_tna_idp` FOREIGN KEY (`idp_id`) REFERENCES `individual_development_plans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tna_period` FOREIGN KEY (`period_id`) REFERENCES `idp_tna_periods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_program_assignments`
--
ALTER TABLE `training_program_assignments`
  ADD CONSTRAINT `fk_training_employee` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_training_program` FOREIGN KEY (`training_program_id`) REFERENCES `training_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_program_attachments`
--
ALTER TABLE `training_program_attachments`
  ADD CONSTRAINT `fk_tp_attachments_program` FOREIGN KEY (`training_program_id`) REFERENCES `training_programs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tp_attachments_uploader` FOREIGN KEY (`uploaded_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_program_impact_assessments`
--
ALTER TABLE `training_program_impact_assessments`
  ADD CONSTRAINT `fk_impact_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `training_program_assignments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_impact_employee` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_impact_training` FOREIGN KEY (`training_program_id`) REFERENCES `training_programs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
