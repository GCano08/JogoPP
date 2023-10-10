-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Set-2023 às 18:40
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `modelagem_3`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atrativos`
--

CREATE TABLE `atrativos` (
  `id_atrativos` int(11) NOT NULL,
  `nome_atrativo` varchar(45) DEFAULT NULL,
  `lat_atrativo` varchar(45) DEFAULT NULL,
  `long_atrativo` varchar(45) DEFAULT NULL,
  `desc_atrativo` varchar(45) DEFAULT NULL,
  `image_atrativo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `atrativos`
--

INSERT INTO `atrativos` (`id_atrativos`, `nome_atrativo`, `lat_atrativo`, `long_atrativo`, `desc_atrativo`, `image_atrativo`) VALUES
(1, 'Parque do povo', '456783', '234534', 'Lindo parque', 'img'),
(2, 'Balneario da amizade', '856789', '357479', 'Lindo lago', 'img');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins`
--

CREATE TABLE `coins` (
  `id_coin` int(11) NOT NULL,
  `nome_coin` varchar(45) DEFAULT NULL,
  `value_coin` float DEFAULT NULL,
  `image_coin` varchar(200) DEFAULT NULL,
  `gamers_id_gamer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `coins`
--

INSERT INTO `coins` (`id_coin`, `nome_coin`, `value_coin`, `image_coin`, `gamers_id_gamer`) VALUES
(1, 'fish coin', 5, 'img', 1),
(2, 'fish coin vermelho', 2, 'img', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `id_cupons` int(11) NOT NULL,
  `codigo_cupon` varchar(22) DEFAULT NULL,
  `nome_cupon` varchar(45) DEFAULT NULL,
  `validade_cupon` date DEFAULT NULL,
  `valor_cupon` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cupons`
--

INSERT INTO `cupons` (`id_cupons`, `codigo_cupon`, `nome_cupon`, `validade_cupon`, `valor_cupon`) VALUES
(1, '2708', 'Cupom de ferias', '2023-09-29', 90),
(2, '2762', 'Cupom de aniversario', '2023-09-13', 97);

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

CREATE TABLE `descontos` (
  ` id_desconto` int(11) NOT NULL,
  `valor_desconto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `descontos`
--

INSERT INTO `descontos` (` id_desconto`, `valor_desconto`) VALUES
(1, 67),
(2, 89);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gamers`
--

CREATE TABLE `gamers` (
  `id_gamer` int(11) NOT NULL,
  `nome_gamer` varchar(45) DEFAULT NULL,
  `senha_gamer` varchar(32) DEFAULT NULL,
  `email_gamer` varchar(60) DEFAULT NULL,
  `dtnasc_gamer` date DEFAULT NULL,
  `personagens_id_personagens` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `gamers`
--

INSERT INTO `gamers` (`id_gamer`, `nome_gamer`, `senha_gamer`, `email_gamer`, `dtnasc_gamer`, `personagens_id_personagens`) VALUES
(1, 'Laura S.', '12345678', 'aaa@gmail.com', '2017-09-21', 2),
(2, 'Eduarda H', '654321', 'aaaj@gmail.com', '2013-09-19', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_acessos`
--

CREATE TABLE `log_acessos` (
  `id_log_acesso` int(11) NOT NULL,
  `ultimo_acesso` date NOT NULL,
  `qtd_acesso` int(11) NOT NULL,
  `status_acesso` varchar(4) NOT NULL,
  `gamers_id_gamer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `log_acessos`
--

INSERT INTO `log_acessos` (`id_log_acesso`, `ultimo_acesso`, `qtd_acesso`, `status_acesso`, `gamers_id_gamer`) VALUES
(1, '2023-09-19', 2, '202', 2),
(2, '2023-09-18', 5, '202', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes`
--

CREATE TABLE `missoes` (
  `id_missao` int(11) NOT NULL,
  `nome_missao` varchar(45) DEFAULT NULL,
  `desc_missao` text DEFAULT NULL,
  `recompensa_missao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes`
--

INSERT INTO `missoes` (`id_missao`, `nome_missao`, `desc_missao`, `recompensa_missao`) VALUES
(1, 'Coletar fishcoins', 'Coletar 1000 fishcoins dentro do prazo de 2 hrs.', 456),
(2, 'Coletar fishcoins 2.0', 'Coletar 5000 fishcoins dentro de 1 hr.', 1000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes_has_personagens`
--

CREATE TABLE `missoes_has_personagens` (
  `missoes_id_missao` int(11) NOT NULL,
  `personagens_id_personagens` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes_has_personagens`
--

INSERT INTO `missoes_has_personagens` (`missoes_id_missao`, `personagens_id_personagens`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personagens`
--

CREATE TABLE `personagens` (
  `id_personagens` int(11) NOT NULL,
  `nome_personagem` varchar(45) NOT NULL,
  `genero_personaem` enum('M','F') NOT NULL,
  `tipo_personagem` enum('humano','coruja','mago') NOT NULL DEFAULT 'coruja',
  `totalcoin_personagem` varchar(45) NOT NULL,
  `start_latitude` varchar(30) NOT NULL DEFAULT '-22.093089',
  `start_longitude` varchar(30) NOT NULL DEFAULT ' -51.417634',
  `skins_id_skin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `personagens`
--

INSERT INTO `personagens` (`id_personagens`, `nome_personagem`, `genero_personaem`, `tipo_personagem`, `totalcoin_personagem`, `start_latitude`, `start_longitude`, `skins_id_skin`) VALUES
(1, 'Max', 'M', 'coruja', '0', '-22.093089', ' -51.417634', 1),
(2, 'Laura', 'F', 'humano', '0', '-22.093088', ' -51.417634', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id_promocao` int(11) NOT NULL,
  `nome_promocao` varchar(45) DEFAULT NULL,
  `dt_start_promocao` date DEFAULT NULL,
  `dt_end_promocao` date DEFAULT NULL,
  `descr_promocao` text DEFAULT NULL,
  `ativa_promoçao` enum('0','1') DEFAULT NULL,
  `descontos_ id_desconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id_promocao`, `nome_promocao`, `dt_start_promocao`, `dt_end_promocao`, `descr_promocao`, `ativa_promoçao`, `descontos_ id_desconto`) VALUES
(2, 'Promo de natal', '2023-09-04', '2023-09-28', 'Boas festas!', NULL, 1),
(3, 'Promo de pascoa', '2023-09-04', '2023-09-28', 'Encontre todos os ovos!', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `skins`
--

CREATE TABLE `skins` (
  `id_skin` int(11) NOT NULL,
  `categoria_skin` enum('acessorio','chapeu',' conjunto','manto','mochila') DEFAULT NULL,
  `descr_skin` text DEFAULT NULL,
  `genero_skin` enum('M','F') DEFAULT NULL,
  `valor_skin` float DEFAULT NULL,
  `raridade_skin` enum('comum','rara','epica','lendario') DEFAULT NULL,
  `foto1_skin` varchar(200) DEFAULT NULL,
  `foto2_skin` varchar(200) DEFAULT NULL,
  `promocoes_id_promocao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `skins`
--

INSERT INTO `skins` (`id_skin`, `categoria_skin`, `descr_skin`, `genero_skin`, `valor_skin`, `raridade_skin`, `foto1_skin`, `foto2_skin`, `promocoes_id_promocao`) VALUES
(1, 'chapeu', 'Chapeu de fogo', 'M', 45, 'lendario', 'img', 'img', 2),
(2, 'mochila', 'Mochila ovo de pascoa', 'F', 67, 'rara', 'img', 'img', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_vendas` int(11) NOT NULL,
  `hora_venda` time DEFAULT NULL,
  `dia_venda` date DEFAULT NULL,
  `skins_id_skin1` int(11) NOT NULL,
  `cupons_id_cupons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_vendas`, `hora_venda`, `dia_venda`, `skins_id_skin1`, `cupons_id_cupons`) VALUES
(1, '16:02:16', '2023-09-06', 2, 1),
(2, '16:02:16', '2023-09-08', 1, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atrativos`
--
ALTER TABLE `atrativos`
  ADD PRIMARY KEY (`id_atrativos`);

--
-- Índices para tabela `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id_coin`),
  ADD KEY `fk_coins_gamers1_idx` (`gamers_id_gamer`);

--
-- Índices para tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id_cupons`);

--
-- Índices para tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (` id_desconto`);

--
-- Índices para tabela `gamers`
--
ALTER TABLE `gamers`
  ADD PRIMARY KEY (`id_gamer`),
  ADD KEY `fk_gamers_personagens_idx` (`personagens_id_personagens`);

--
-- Índices para tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD PRIMARY KEY (`id_log_acesso`),
  ADD KEY `fk_log_acessos_gamers1_idx` (`gamers_id_gamer`);

--
-- Índices para tabela `missoes`
--
ALTER TABLE `missoes`
  ADD PRIMARY KEY (`id_missao`);

--
-- Índices para tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD PRIMARY KEY (`missoes_id_missao`,`personagens_id_personagens`),
  ADD KEY `fk_missoes_has_personagens_personagens1_idx` (`personagens_id_personagens`),
  ADD KEY `fk_missoes_has_personagens_missoes1_idx` (`missoes_id_missao`);

--
-- Índices para tabela `personagens`
--
ALTER TABLE `personagens`
  ADD PRIMARY KEY (`id_personagens`),
  ADD KEY `fk_personagens_skins1_idx` (`skins_id_skin`);

--
-- Índices para tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id_promocao`),
  ADD KEY `fk_promocoes_descontos1_idx` (`descontos_ id_desconto`);

--
-- Índices para tabela `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id_skin`),
  ADD KEY `fk_skins_promocoes1_idx` (`promocoes_id_promocao`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `fk_vendas_skins1_idx` (`skins_id_skin1`),
  ADD KEY `fk_vendas_cupons1_idx` (`cupons_id_cupons`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atrativos`
--
ALTER TABLE `atrativos`
  MODIFY `id_atrativos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `coins`
--
ALTER TABLE `coins`
  MODIFY `id_coin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id_cupons` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY ` id_desconto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gamers`
--
ALTER TABLE `gamers`
  MODIFY `id_gamer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  MODIFY `id_log_acesso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `missoes`
--
ALTER TABLE `missoes`
  MODIFY `id_missao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  MODIFY `missoes_id_missao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `personagens`
--
ALTER TABLE `personagens`
  MODIFY `id_personagens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id_promocao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `skins`
--
ALTER TABLE `skins`
  MODIFY `id_skin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `coins`
--
ALTER TABLE `coins`
  ADD CONSTRAINT `fk_coins_gamers1` FOREIGN KEY (`gamers_id_gamer`) REFERENCES `gamers` (`id_gamer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `gamers`
--
ALTER TABLE `gamers`
  ADD CONSTRAINT `fk_gamers_personagens` FOREIGN KEY (`personagens_id_personagens`) REFERENCES `personagens` (`id_personagens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD CONSTRAINT `fk_log_acessos_gamers1` FOREIGN KEY (`gamers_id_gamer`) REFERENCES `gamers` (`id_gamer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD CONSTRAINT `fk_missoes_has_personagens_missoes1` FOREIGN KEY (`missoes_id_missao`) REFERENCES `missoes` (`id_missao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_missoes_has_personagens_personagens1` FOREIGN KEY (`personagens_id_personagens`) REFERENCES `personagens` (`id_personagens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `personagens`
--
ALTER TABLE `personagens`
  ADD CONSTRAINT `fk_personagens_skins1` FOREIGN KEY (`skins_id_skin`) REFERENCES `skins` (`id_skin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
