defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game.Status
  alias ExMon.Game

  @move_avg_power 18..25
  @move_rn_power 10..35

  def attack_opponent(oponnent, move) do
    damage = calculate_power(move)

    oponnent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(oponnent, damage)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rn_power)

  defp calculate_total_life(life, damage) when life - damage <0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent, damage) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent, damage)
  end

  defp update_game(player, opponent, damage) do
    Game.info()
    |> Map.put(opponent, player)
    |> Game.update()

    Status.print_move_menssage(opponent,:attack, damage)
  end
end
