defmodule FreelaReport do
  alias FreelaReport.Parser

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report->
        sum_values(line, report)
     end)
  end

  def sum_values([name, hour_per_day, _, m, _], %{:all => all,:hpm => hpm} = report) do
  all = Map.put(all, name,all[name]  + hour_per_day)
  hpm = Map.put(hpm, name,hpm[name][m])
  report
  |> Map.put(:all, all)
  |> Map.put(:hpm, hpm)
  end

  def report_acc() do
  months = 
    [:janeiro, :fevereiro,:março, :abril, :maio, :junho, :julho, :agosto, :setembro, :outubro, :novembro, :dezembro]
    freelancers =
      [:Daniele, :Mayk, :Giuliano, :Cleiton, :Jakeliny, :Diego, :Danilo, :Rafael, :Vinicius, :Joseph]
    all = Enum.into(freelancers, %{}, &{&1, 0})
    hpm = Enum.into(months, %{}, &{&1, 0})
    freela_hpm = Enum.into(freelancers, %{}, &{&1, hpm})
    %{:all => all, :hpm => freela_hpm}
  end
end
