defmodule FreelaReport do
  alias FreelaReport.Parser

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn [name, hour_per_day,_,_,_],report->
      Map.put(report, name, report[name] + hour_per_day)
     end)
  end

  def report_acc() do
    freelancers =
      ["Daniele", "Mayk", "Giuliano", "Cleiton", "Jakeliny", "Diego", "Danilo", "Rafael", "Vinicius", "Joseph"]
    Enum.into(freelancers, %{}, &{&1, 0})
  end
end
