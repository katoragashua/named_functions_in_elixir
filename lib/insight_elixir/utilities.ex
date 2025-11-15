defmodule InsightElixir.Utilities do
  # def format_date(date) do
  #   date
  #   |> Date.to_string()
  #   |> String.replace("-", "/")
  # end

  def format_date(date), do: "#{date.day}/#{date.month}/#{date.year}"
end
