defmodule ExMon.Player do
  @requeired_keys [:life, :moves, :name]

  @enforce_keys @requeired_keys
  defstruct @requeired_keys

  @max_life 100

  def build(name, move_avg, move_rnd, move_heal) do
    %ExMon.Player{
      name: name,
      moves: %{
        move_avg: move_avg,
        move_rnd: move_rnd,
        move_heal: move_heal
      },
      life: @max_life
    }
  end
end
