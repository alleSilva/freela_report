# Desafio 01 - Gerando relatórios

## Sobre o desafio

Nesse desafio, você deverá gerar um relatório a partir de um arquivo .csv.

Dez pessoas fizeram freelas para uma empresa X durante cinco anos e o histórico com todos os dados de cada uma dessas pessoas (nome, horas trabalhadas, dia, mês e ano) foram passadas para um arquivo CSV na seguinte ordem: nome, horas de trabalho no dia (que vai variar de 1 a 8 hrs), dia (que vai variar de 1 a 30 mesmo para o mês de fevereiro e sem considerar anos bissextos) referente às horas de trabalho, mês e ano (que vai de 2016 a 2020). Resumindo: **nome**, **quantidade de horas**, **dia**, **mês** e **ano**.

O relatório gerado a partir do arquivo (que está disponível para download logo abaixo) deve estar no seguinte formato:

```elixir
%{
  all_hours: %{
        danilo: 500,
        rafael: 854,
        ...
    },
  hours_per_month: %{
        danilo: %{
            janeiro: 40,
            fevereiro: 64,
            ...
        },
        rafael: %{
            janeiro: 52,
            fevereiro: 37,
            ...
        }
    },
  hours_per_year: %{
        danilo: %{
            2016: 276,
            2017: 412,
            ...
        },
        rafael: %{
            2016: 376,
            2017: 348,
            ...
        }
    }
}
```
Os caracteres ... é o espaço onde ficaria o resto dos dados. Esse é apenas um exemplo visual do que o retorno da função deve possuir, beleza?

Se quiser testar a sua implementação a partir do terminal, rode `iex -S mix` dentro do diretório raiz do projeto 🚀

## Testes

Para rodar o teste da função FreelaReport.Parser.parse_file/1 e da função FreelaReport.build/1, executar o comando no terminal:

`mix test`


