
--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `crown_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `date` text,
  `scribe_id` int(11) DEFAULT NULL,
  `scroll_status_id` int(11) DEFAULT NULL,
  `scroll_updated` text,
  `scroll_comment` text,
  `provenance` text,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `award_categories`
--

CREATE TABLE `award_categories` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `precedence` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `open` int(11) DEFAULT NULL,
  `repeatable` tinyint(1) DEFAULT NULL,
  `recommendable` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'category for the awart type.  Influences the recommendation form',
  `tooltip` varchar(128) DEFAULT NULL,
  `default_title` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crowns`
--

CREATE TABLE `crowns` (
  `id` int(11) NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `startdate` date DEFAULT NULL,
  `name` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `provenance` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `accept_recommendations` tinyint(1) NOT NULL COMMENT 'Should this group show up in the recommendation form?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL DEFAULT '0',
  `surname` text COMMENT '2023-07-02: NULL until consent is given',
  `forename` text COMMENT '2023-07-02: NULL until consent is given',
  `region_id` int(11) NOT NULL,
  `last_name` text,
  `first_name` text,
  `blazon` text,
  `emblazon` text,
  `notes` text,
  `consent` enum('same page','seperate pages','don''t show') NOT NULL DEFAULT 'don''t show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personae`
--

CREATE TABLE `personae` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `pronouns` varchar(32) DEFAULT NULL COMMENT 'Preferred pronouns',
  `display_pronouns` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  `official` int(11) NOT NULL,
  `search_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reigns`
--

CREATE TABLE `reigns` (
  `id` int(11) NOT NULL,
  `sov1` text,
  `sov2` text,
  `begin` text,
  `end` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scribes`
--

CREATE TABLE `scribes` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scroll_status`
--

CREATE TABLE `scroll_status` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL COMMENT 'Persona for the title',
  `title` varchar(64) NOT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `display_title` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to hold preferred titles per persona';

-- --------------------------------------------------------

