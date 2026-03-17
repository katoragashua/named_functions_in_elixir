defmodule InsightElixir.AnalyticsReport do
  @moduledoc """
  This module handles the generation of reports
  """
  import InsightElixir.Utilities, only: [format_date: 1]
  alias Calculations.EngagementCalculator, as: EC
  require InsightElixir.ReportMacros
  use InsightElixir.ReportSetup

  @fullname "Kator Jason Agashua"
  # The idea is to make use of pattern matching to generate different types of reports
  # How you place the function clauses matters
  # More specific clauses should come before more general ones
  # This way, the most specific match is found first
  # Elixir will try to match the function clauses from top to bottom
  # Once a match is found, that clause is executed
  # If no match is found, a FunctionClauseError is raised
  # Generally you want to order the function with the most arguments or most specific patterns first

  def generate_report(:traffic, :weekly) do
    formatted_date = format_date(DateTime.utc_now())
    "Weekly traffic report generated for #{formatted_date}."
  end

  def generate_report(:user_engagement, :monthly) do
    engagements = EC.calculate_engagements()
    "Monthly user engagement report generated with data: #{engagements}."
  end

  def generate_report(:sales, range = %{from: _, to: _}) do
    "Sales report generated for the given range #{range.from} to #{range.to}."
    # "Sales report generated for the given range #{inspect(range)}."
  end

  def generate_report(:traffic, range = %{day: _, month: _, year: _}) do
    "Traffic report generated for the given date #{range.day}/#{range.month}/#{range.year}."
  end

  def generate_report(_, _), do: "Default report generated for arity 2 functions."

  def generate_report(:sales) do
    InsightElixir.ReportMacros.log_report_generation(:sales)
    # "Sales report generated."
  end

  def generate_report(:user_engagement) do
    "User engagement report generated."
  end

  def generate_report(:traffic) do
    "Traffic report generated."
  end

  # This is like a catch-all clause
  def generate_report(_), do: "Default report generated for arity 1 functions."
  def generate_report, do: "Default report generated for arity 0 function."

  def get_fullname, do: @fullname

  def generate_report_header, do: header()
end
