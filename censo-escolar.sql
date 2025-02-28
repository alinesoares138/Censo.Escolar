-- Acessando o banco de dados
SELECT * FROM `basedosdados.br_inep_censo_escolar.turma` LIMIT 100;

-- Quantas escolas foram abertas por ano entre 2007 e 2020?
SELECT ano, count(id_escola) AS escolas
FROM `basedosdados.br_inep_censo_escolar.turma` 
GROUP BY ano;

-- Qual a media de novas escolas no ano?
WITH escolas AS (
  SELECT ano, count(id_escola) AS numEscolas
  FROM `basedosdados.br_inep_censo_escolar.turma`
  GROUP BY ano
)

SELECT AVG(numEscolas), ano
FROM escolas
GROUP BY ano;

-- Qual estado tem a maior quantidade de matrículas?
WITH base AS (
  SELECT sigla_uf, COUNT(quantidade_matriculas) AS matriculas
  FROM `basedosdados.br_inep_censo_escolar.turma` 
  GROUP BY sigla_uf)

SELECT sigla_uf, MAX(matriculas) AS max_matriculas
FROM base
GROUP BY sigla_uf
ORDER BY max_matriculas DESC;

--- Qual número de turmas por ano do estado de São Paulo?
SELECT 
  ano,
  sigla_uf,
  COUNT(id_turma)
FROM `basedosdados.br_inep_censo_escolar.turma` 
WHERE sigla_uf = 'SP'
GROUP BY ano, sigla_uf;