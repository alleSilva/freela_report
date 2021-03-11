defmodule FreelaReport do
  #alias FreelaReport.Parser

  #@freelancers =
   # {Daniele, Mayk, Giuliano, Cleiton, Jakeliny, Diego, Danilo, Rafael, Vinicius, Joseph}

  def build(file_name) do
    "reports/#{file_name}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
    |> Enum.reduce(report_acc(), fn [name, hour_per_day,_,_,_],report->
      Map.put(report, name, report[name] + hour_per_day)
     end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
  end

  def report_acc() do
    freelancers =
      ["Daniele", "Mayk", "Giuliano", "Cleiton", "Jakeliny", "Diego", "Danilo", "Rafael", "Vinicius", "Joseph"]
    Enum.into(freelancers, %{}, &{&1, 0})
  end
end
