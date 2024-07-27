-- indexes & constraints for tables. Execute after data has been inserted from dev-db2.sql
--
-- Indexes for dumped tables
--

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `scribe_id` (`scribe_id`),
  ADD KEY `crown_id` (`crown_id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `scroll_status_id` (`scroll_status_id`);


--
-- Indexes for table `award_categories`
--
ALTER TABLE `award_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `crowns`
--
ALTER TABLE `crowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `personae`
--
ALTER TABLE `personae`
  ADD PRIMARY KEY (`id`);



--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reigns`
--
ALTER TABLE `reigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scribes`
--
ALTER TABLE `scribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scroll_status`
--
ALTER TABLE `scroll_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100102;


--
-- AUTO_INCREMENT for table `award_categories`
--
ALTER TABLE `award_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `award_types` (`id`),
  ADD CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `awards_ibfk_3` FOREIGN KEY (`scribe_id`) REFERENCES `scribes` (`id`),
  ADD CONSTRAINT `awards_ibfk_4` FOREIGN KEY (`crown_id`) REFERENCES `crowns` (`id`),
  ADD CONSTRAINT `awards_ibfk_5` FOREIGN KEY (`persona_id`) REFERENCES `personae` (`id`),
  ADD CONSTRAINT `awards_ibfk_6` FOREIGN KEY (`scroll_status_id`) REFERENCES `scroll_status` (`id`);


--
-- Constraints for table `award_types`
--
ALTER TABLE `award_types`
  ADD CONSTRAINT `award_types_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `award_categories` (`id`);

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
