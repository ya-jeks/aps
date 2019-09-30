defmodule Menu.PlanView do
  use Menu.Web, :view
  use Timex
  import Ecto.Query

  def render("estimate.json", %{plan: plan, team: team}) do
    %{
      resources: resources(team.id),
      events: render_many(plan.planned, Menu.PlanView, "task.json"),
      planned: render_many(plan.planned, Menu.PlanView, "task.json"),
      proposed: plan.proposed,
      skipped: render_many(plan.skipped, Menu.PlanView, "skipped_task.json"),
      required: render_many(plan.required, Menu.IntervalView, "summary.json"),
      available: render_many(plan.available, Menu.IntervalView, "summary.json"),
      free: render_many(plan.free, Menu.IntervalView, "interval.json")
    }
  end

  def render("task.json", %{plan: t}) do
    %{
      id: t.uid,
      parent: t.parent_uid,
      resourceId: t.kind,
      qty: t.qty,
      start: t.start |> DateTime.from_unix! |> DateTime.to_iso8601,
      start_ts: t.start,
      end: (t.start + t.duration) |> DateTime.from_unix! |> DateTime.to_iso8601,
      duration: t.duration,
      human_start: t.start |> Elixir.DateTime.from_unix! |> Timex.format!("{D} {Mshort}({h24}:{m})"),
      human_end: (t.start + t.duration) |> Elixir.DateTime.from_unix! |> Timex.format!("{D} {Mshort}({h24}:{m})"),
      human_duration: t.duration |> Duration.from_seconds |> Timex.format_duration(:humanized),
      title: "#{t.title}-#{t.duration}"
    }
  end

  def render("skipped_task.json", %{plan: t}) do
    %{
      id: t.uid,
      qty: t.qty,
      resourceId: t.kind,
      parent: t.parent_uid,
      duration: t.duration,
      human_duration: t.duration |> Duration.from_seconds |> Timex.format_duration(:humanized),
      title: "#{t.title}-#{t.duration}"
    }
  end

  def resources(team_id) do
    query = from u in Menu.Interval, order_by: [u.kind, u.start], where: u.team_id == ^team_id
    _intervals = Menu.Repo.all(query) |> Enum.map(fn(i)->
      color = Enum.take_random(~w(green blue brown pink orange gray), 1)
      %{id: i.kind, title: i.title, eventColor: color}
    end)

    # [
    #   %{id: "H",title: "Holzma",eventColor: "green"},
    #   %{id: "СФР",title: "СФР",eventColor: "green"},
    #   %{id: "СМТ",title: "Материалы",eventColor: "green"},
    #   %{id: "РСП",title: "РСП",eventColor: "green"},
    #   %{id: "ПРС",title: "ПРС",eventColor: "green"},
    #   %{id: "ФРЗ",title: "ФРЗ",eventColor: "green"},
    #   %{id: "СВР",title: "Сверловка",eventColor: "green"},
    #   %{id: "K1",title: "Кром",eventColor: "green"},
    #   %{id: "К2",title: "Кром_т",eventColor: "blue"},
    #   %{id: "СБР",title: "Сборка",eventColor: "green"},
    #   %{id: "УПК",title: "УПК",eventColor: "green"},
    #   %{id: "СГП",title: "ГП",eventColor: "green"},
    #   %{
    #     id: "SCH",
    #     title: "Sch",
    #     eventColor: "green"
    #   },
    #   %{
    #     id: "S",
    #     title: "Sales",
    #     eventColor: "blue"
    #   },
    #   %{
    #     id: "A",
    #     title: "Assembly",
    #     eventColor: "brown"
    #   },
    #   %{
    #     id: "B",
    #     title: "B",
    #     eventColor: "pink"
    #   },
    #   %{
    #     id: "C",
    #     title: "C",
    #     eventColor: "orange"
    #   },
    #   %{
    #     id: "D",
    #     title: "D",
    #     eventColor: "gray"
    #   }
    # ]
  end

end
