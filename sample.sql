-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: mysql
-- Generation Time: Jun 05, 2014 at 09:54 PM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `whatsapp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
`id` int(11) NOT NULL,
  `from` varchar(32) NOT NULL,
  `to` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `ctime` int(11) NOT NULL,
  `from_nickname` varchar(64) NOT NULL,
  `to_nickname` varchar(64) NOT NULL,
  `whatsapp_id` varchar(64) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=302 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_message_fields`
--

CREATE TABLE IF NOT EXISTS `custom_message_fields` (
  `message_id` int(11) NOT NULL,
  `target` varchar(64) NOT NULL,
  `field1` varchar(100) NOT NULL,
  `field2` varchar(100) NOT NULL,
  `field3` varchar(100) NOT NULL,
  `field4` varchar(100) NOT NULL,
  `field5` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` int(11) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `avatar` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kind` int(11) NOT NULL,
  `target` text NOT NULL,
  `data` text NOT NULL,
  `ctime` int(11) NOT NULL,
  `stime` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=420 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_targets`
--

CREATE TABLE IF NOT EXISTS `message_targets` (
  `message_id` int(11) NOT NULL,
  `target` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

CREATE TABLE IF NOT EXISTS `numbers` (
  `group_id` int(11) NOT NULL,
  `target` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `synced` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `senders`
--

CREATE TABLE IF NOT EXISTS `senders` (
`id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `identity` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `challenge_data` varchar(128) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
`id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `debug` text NOT NULL,
  `target` varchar(32) NOT NULL,
  `whatsapp_id` varchar(64) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3952 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `roles` text NOT NULL,
  `credits` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `dtime` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
 ADD PRIMARY KEY (`id`), ADD KEY `from` (`from`), ADD KEY `whatsapp_id` (`whatsapp_id`);

--
-- Indexes for table `custom_message_fields`
--
ALTER TABLE `custom_message_fields`
 ADD PRIMARY KEY (`message_id`,`target`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_targets`
--
ALTER TABLE `message_targets`
 ADD PRIMARY KEY (`message_id`,`target`);

--
-- Indexes for table `numbers`
--
ALTER TABLE `numbers`
 ADD PRIMARY KEY (`group_id`,`target`);

--
-- Indexes for table `senders`
--
ALTER TABLE `senders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=302;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=420;
--
-- AUTO_INCREMENT for table `senders`
--
ALTER TABLE `senders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3952;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `users` (`username`, `password`, `email`, `roles`, `credits`, `ctime`, `dtime`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', '', 'ADMIN', 0, now(), 0);
