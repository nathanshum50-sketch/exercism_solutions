defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0), do: Map.put(scores,name,score)

  def remove_player(scores, name), do: Map.delete(scores,name)
  
  def reset_score(scores, name), do: Map.put(scores,name,0)
  
  def update_score(scores, name, score) do
    scoring = scores[name] || 0
    new = scoring + score
    Map.put(scores,name,new)
  end
  def update_score(scores,name,score), do: add_player(scores,name,score)
  
  def get_players(scores), do: Map.keys(scores)
  
end
