defmodule InsightElixir.ReportMacros do
  defmacro log_report_generation(report_type) do
    quote do
      IO.puts(
        "Generating report of type: #{unquote(report_type)} at #{DateTime.utc_now() |> DateTime.to_string() |> String.replace("-", "/") |> String.slice(0, 19)}"
      )
    end
  end
end
