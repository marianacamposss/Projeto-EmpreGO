CREATE DATABASE emprego;

USE emprego;

CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    telefone CHAR(11) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(30) NOT NULL,
    status ENUM('ativa', 'inativa') DEFAULT 'ativa' NOT NULL
);

CREATE TABLE vaga (
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    formato ENUM('Presencial', 'Híbrido', 'Remoto') NOT NULL,
    tipo ENUM('CLT', 'PJ') NOT NULL,
    local VARCHAR(100),
    salario DECIMAL(10,2),
    id_empresa INT NOT NULL,
    status ENUM('ativa', 'inativa') DEFAULT 'ativa' NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa) ON DELETE CASCADE
);

CREATE TABLE candidato (
    id_candidato INT PRIMARY KEY AUTO_INCREMENT,
    nome_candidato VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    curriculo VARCHAR(50) NOT NULL,
    id_vaga INT NOT NULL,
    FOREIGN KEY (id_vaga) REFERENCES vaga (id_vaga) ON DELETE CASCADE
);

-- Inserções (Ajuste os valores de salário conforme necessário)
INSERT INTO empresa (nome_empresa, cnpj, telefone, email, senha, status)
VALUES
('Tech Solutions', '12345678000199', '11987654321', 'contato@techsolutions.com.br', 'senha123', 'ativa'),
('Innova Consulting', '98765432000177', '21987654321', 'info@innovaconsulting.com', 'senha456', 'ativa'),
('Future Devs', '45678912000188', '31987654321', 'hr@futuredevs.com', 'senha789', 'ativa');

-- Mock de 20 vagas
INSERT INTO vaga (titulo, descricao, formato, tipo, local, salario, id_empresa, status)
VALUES
-- Vagas para a empresa 1 (Tech Solutions)
('Desenvolvedor Frontend', 'Desenvolvimento de interfaces web com foco em usabilidade.', 'Remoto', 'CLT', 'Itapeva', 5000, 1, 'ativa'),
('Desenvolvedor Backend', 'Criação de APIs e integração com banco de dados.', 'Híbrido', 'CLT', 'São Paulo - SP', 6000, 1, 'ativa'),
('Analista de Dados', 'Análise de dados e geração de relatórios.', 'Presencial', 'CLT', 'São Paulo - SP', 5500, 1, 'ativa'),
('Gerente de Projetos', 'Planejamento e gestão de equipes.', 'Híbrido', 'PJ', 'São Paulo - SP', 8000, 1, 'ativa'),
('Designer UX/UI', 'Desenho de interfaces intuitivas.', 'Remoto', 'PJ', NULL, 4500, 1, 'ativa'),

-- Vagas para a empresa 2 (Innova Consulting)
('Consultor de TI', 'Consultoria em infraestrutura e suporte técnico.', 'Presencial', 'CLT', 'Rio de Janeiro - RJ', 7000, 2, 'ativa'),
('Especialista em Segurança da Informação', 'Segurança de dados corporativos.', 'Híbrido', 'CLT', 'Rio de Janeiro - RJ', 9000, 2, 'ativa'),
('DevOps Engineer', 'Gestão de infraestrutura e automação de processos.', 'Remoto', 'PJ', NULL, 8500, 2, 'ativa'),
('Scrum Master', 'Coordenação de equipes ágeis.', 'Remoto', 'PJ', NULL, 7000, 2, 'ativa'),
('Analista de Sistemas', 'Desenvolvimento e manutenção de sistemas.', 'Presencial', 'CLT', 'Rio de Janeiro - RJ', 6000, 2, 'ativa'),

-- Vagas para a empresa 3 (Future Devs)
('Programador Fullstack', 'Desenvolvimento de soluções completas.', 'Híbrido', 'CLT', 'Belo Horizonte - MG', 7000, 3, 'ativa'),
('Engenheiro de Software', 'Desenvolvimento e gestão de software.', 'Presencial', 'CLT', 'Belo Horizonte - MG', 9000, 3, 'ativa'),
('QA Tester', 'Garantia de qualidade de software.', 'Remoto', 'CLT', NULL, 6000, 3, 'ativa'),
('Arquiteto de Soluções', 'Definição de arquiteturas de sistemas.', 'Híbrido', 'PJ', 'Belo Horizonte - MG', 10000, 3, 'ativa'),
('Analista de Suporte', 'Atendimento ao cliente e suporte técnico.', 'Presencial', 'CLT', 'Belo Horizonte - MG', 4000, 3, 'ativa'),

-- Vagas adicionais para diversidade
('Product Owner', 'Gestão do backlog e definição de escopo.', 'Híbrido', 'PJ', 'Curitiba - PR', 9000, 1, 'ativa'),
('Engenheiro de Dados', 'Construção de pipelines de dados.', 'Remoto', 'CLT', NULL, 9500, 2, 'ativa'),
('Marketing Digital', 'Gestão de campanhas e mídias sociais.', 'Presencial', 'CLT', 'São Paulo - SP', 4500, 1, 'ativa'),
('Data Scientist', 'Modelagem estatística e aprendizado de máquina.', 'Híbrido', 'CLT', 'Florianópolis - SC', 11000, 3, 'ativa'),
('Técnico em Suporte', 'Manutenção e suporte a redes de computadores.', 'Presencial', 'CLT', 'Porto Alegre - RS', 3000, 2, 'ativa');

