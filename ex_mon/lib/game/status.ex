defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n====The game is started!!!====\n")
    IO.inspect((Game.info()))
    IO.puts("----------------------")
  end

  def print_gameover_message() do
    IO.puts("\n====Game Over!!!====\n")
    IO.puts("----------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n==== Invalid move: #{move}====\n")
    IO.puts("----------------------")
  end

  def print_move_menssage(:computer, :attack, damage) do
    IO.puts("\n==== Players attack computer dealing #{damage} damage ====\n")
    IO.puts("----------------------")
  end
  def print_move_menssage(:player, :attack, damage) do
    IO.puts("\n==== Computers attack player dealing #{damage} damage ====\n")
    IO.puts("----------------------")
  end

  def print_move_menssage(player, :heal, life) do
    IO.puts("\n==== The #{player} healled itself to #{life} ====\n")
    IO.puts("----------------------")
  end
end
