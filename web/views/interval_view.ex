defmodule Menu.IntervalView do
  use Menu.Web, :view
  use Timex

  def render("index.json", %{intervals: intervals}) do
    render_many(intervals, Menu.IntervalView, "interval.json")
  end

  def render("interval.json", %{interval: i}) do
    %{
      id: i.id,
      duration: i.duration,
      kind: i.kind,
      title: i.title,
      start: i.start |> Elixir.DateTime.from_unix! |> Timex.format!("{D} {Mshort}({h24}:{m})"),
      human_duration: i.duration |> Duration.from_seconds |> Timex.format_duration(:humanized)
    }
  end

  def render("summary.json", %{interval: i}) do
    %{
      kind: i.kind,
      load_percent: i.load_percent,
      human_duration: i.duration |> Duration.from_seconds |> Timex.format_duration(:humanized)
    }
  end

end
