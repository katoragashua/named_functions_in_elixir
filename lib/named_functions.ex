defmodule NamedFunctions do
  @moduledoc """
  Documentation for `NamedFunctions`.
  """
  def read_file(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        IO.puts("File read successfully!")
        content

      {:error, reason} ->
        IO.puts("Failed to read file: #{reason}")
        nil
    end
  end

  # def read_file_from_map(map) do
  #   with {:ok, file_path} <- Map.fetch(map, :file_path),
  #        {:ok, content} <- File.read(file_path) do
  #     content
  #   else
  #     _ -> nil
  #   end
  # end

  def read_file_from_map(map) do
    case Map.fetch(map, :file_path) do
      {:ok, file_path} ->
        case File.read(file_path) do
          {:ok, content} ->
            content

          {:error, reason} ->
            IO.puts("Failed to read file: #{reason}.")
            nil
        end

      :error ->
        "Key not found in map."
    end
  end

  def read_file_with(map) do
    with {:ok, file_path} <- Map.fetch(map, :file_path),
         {:ok, contents} <- File.read(file_path) do
      contents
    else
      :error ->
        "Key not found in map."

      {:error, reason} ->
        IO.puts("Failed to read file: #{reason}.")
        nil
    end
  end
end
