<span align="left">

# Censo Escolar 

</span>

<span align="left"> 

### Introdução 

</span>

O Censo Escolar é o principal instrumento de coleta de informações da educação básica e a mais importante pesquisa estatística educacional brasileira. É coordenado pelo Inep e realizado em regime de colaboração entre as secretarias estaduais e municipais de educação e com a participação de todas as escolas públicas e privadas do país.

Ele abrange as diferentes etapas e modalidades da educação básica e profissional:

Ensino regular (educação infantil, ensino fundamental e médio);
Educação especial – modalidade substitutiva;
Educação de Jovens e Adultos (EJA);
Educação profissional (cursos técnicos e cursos de formação inicial continuada ou qualificação profissional).
A coleta de dados das escolas tem caráter declaratório e é dividida em duas etapas. A primeira etapa consiste no preenchimento da Matrícula Inicial, quando ocorre a coleta de informações sobre os estabelecimentos de ensino, gestores, turmas, alunos e profissionais escolares em sala de aula. A segunda etapa ocorre com o preenchimento de informações sobre a Situação do Aluno, e considera os dados sobre o movimento e rendimento escolar dos alunos, ao final do ano letivo.

**Cobertura temporal**: 2007 - 2020

<span align="left"> 

### Extração de dados
  
</span>

```
**Acessando o banco de dados**
SELECT * FROM `basedosdados.br_inep_censo_escolar.turma` LIMIT 100

-- Quantas escolas foram abertas por ano entre 2007 e 2020?
SELECT ano, count(id_escola) AS escolas
FROM `basedosdados.br_inep_censo_escolar.turma` 
GROUP BY ano

-- Qual a media de novas escolas no ano?
WITH escolas AS (
  SELECT ano, count(id_escola) AS numEscolas
  FROM `basedosdados.br_inep_censo_escolar.turma`
  GROUP BY ano
)

SELECT AVG(numEscolas), ano
FROM escolas
GROUP BY ano

-- Qual estado tem a maior quantidade de matrículas?
WITH base AS (
  SELECT sigla_uf, COUNT(quantidade_matriculas) AS matriculas
  FROM `basedosdados.br_inep_censo_escolar.turma` 
  GROUP BY sigla_uf)

SELECT sigla_uf, MAX(matriculas) AS max_matriculas
FROM base
GROUP BY sigla_uf
ORDER BY max_matriculas DESC

--- Qual número de turmas por ano do estado de São Paulo?
SELECT 
  ano,
  sigla_uf,
  COUNT(id_turma)
FROM `basedosdados.br_inep_censo_escolar.turma` 
WHERE sigla_uf = 'SP'
GROUP BY ano, sigla_uf

--- Quantas escolas possuem sistema Braille?
      Essas escolas possuem mais matrículas em comparação às outras?
      Qual UF com mais displicina profissionalizante?
      
--- Quantas escolas possuem disciplina profissionalizante?
      Essas escolas possuem mais matrículas em comparação às outras?
      Qual UF com mais displicina profissionalizante?
      
--- Quantas escolas possuem recursos para baixa visão?
      Essas escolas possuem mais matrículas em comparação às outras?
      Qual UF com mais displicina profissionalizante?
--- 
```

<span align="left"> 

### Extração de dados
  
</span>
(em andamento)
<div align="left">
<img src="https://user-images.githubusercontent.com/71914264/192434774-6b8b1991-5a8c-4045-871f-fd0881d7aa33.png" width="700px" />
</div>

<span align="left"> 

### Análise
  
</span>
(em andamento)

<p> Base de dados: https://basedosdados.org/dataset/br-inep-censo-escolar?bdm_table=turma </p>
<p> Link do relatório: https://datastudio.google.com/reporting/34ac656d-a44f-45db-b2f9-46e2c056294a </p>
