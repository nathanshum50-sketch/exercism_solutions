defmodule Username do
  def sanitize([]) do
    []
  end
  def sanitize([first_letter | rest]) do
    sanitized_first = case first_letter do
      ?_ -> [?_]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      first_letter when first_letter in ?a..?z -> [first_letter]
      _ -> []
    end
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    sanitized_first ++ sanitize(rest)
  end
end
