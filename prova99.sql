-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/06/2024 às 02:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `prova99`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `nota` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notas`
--

INSERT INTO `notas` (`id`, `user_id`, `turma_id`, `nota`) VALUES
(1, 1, 1, 8.50),
(2, 1, 1, 7.00),
(3, 1, 1, 9.00),
(4, 1, 1, 6.50),
(5, 1, 1, 8.00),
(6, 1, 1, 7.50),
(7, 1, 1, 8.00),
(8, 1, 1, 9.00),
(9, 1, 1, 7.50),
(10, 1, 1, 8.50),
(11, 1, 2, 8.50),
(12, 1, 2, 7.00),
(13, 1, 2, 9.00),
(14, 1, 2, 6.50),
(15, 1, 2, 8.00),
(16, 1, 2, 7.50),
(17, 1, 2, 8.00),
(18, 1, 2, 9.00),
(19, 1, 2, 7.50),
(20, 1, 2, 8.50),
(21, 1, 3, 8.50),
(22, 1, 3, 7.00),
(23, 1, 3, 9.00),
(24, 1, 3, 6.50),
(25, 1, 3, 8.00),
(26, 1, 3, 7.50),
(27, 1, 3, 8.00),
(28, 1, 3, 9.00),
(29, 1, 3, 7.50),
(30, 1, 3, 8.50),
(31, 2, 1, 8.50),
(32, 2, 1, 7.00),
(33, 2, 1, 9.00),
(34, 2, 1, 6.50),
(35, 2, 1, 8.00),
(36, 2, 1, 7.50),
(37, 2, 1, 8.00),
(38, 2, 1, 9.00),
(39, 2, 1, 7.50),
(40, 2, 1, 8.50),
(41, 2, 2, 8.50),
(42, 2, 2, 7.00),
(43, 2, 2, 9.00),
(44, 2, 2, 6.50),
(45, 2, 2, 8.00),
(46, 2, 2, 7.50),
(47, 2, 2, 8.00),
(48, 2, 2, 9.00),
(49, 2, 2, 7.50),
(50, 2, 2, 8.50),
(51, 2, 3, 8.50),
(52, 2, 3, 7.00),
(53, 2, 3, 9.00),
(54, 2, 3, 6.50),
(55, 2, 3, 8.00),
(56, 2, 3, 7.50),
(57, 2, 3, 8.00),
(58, 2, 3, 9.00),
(59, 2, 3, 7.50),
(60, 2, 3, 8.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `nome`) VALUES
(1, 'Turma A'),
(2, 'Turma B'),
(3, 'Turma C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `isAdmin`) VALUES
(1, 'email1@example.com', 'password1', 'Usuário 1', 0),
(2, 'email2@example.com', 'password2', 'Usuário 2', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_turmas`
--

CREATE TABLE `user_turmas` (
  `user_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `user_turmas`
--

INSERT INTO `user_turmas` (`user_id`, `turma_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user_turmas`
--
ALTER TABLE `user_turmas`
  ADD PRIMARY KEY (`user_id`,`turma_id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `user_turmas`
--
ALTER TABLE `user_turmas`
  ADD CONSTRAINT `user_turmas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_turmas_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
