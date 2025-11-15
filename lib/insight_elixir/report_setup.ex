defmodule InsightElixir.ReportSetup do
  defmacro __using__(_) do
    quote do
      def header, do: "Report Header - Generated on #{DateTime.utc_now() |> DateTime.to_string() |> String.replace("-", "/") |> String.slice(0, 19)}"
      def footer, do: "Report Footer - Confidential"
    end
  end
end
