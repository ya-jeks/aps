team = Menu.Team.changeset(%Menu.Team{}, %{title: "title"}) |> Menu.Repo.insert!
user = Menu.User.changeset(%Menu.User{},
  %{name: "User", email: "yame@example.com", password: "password", password_confirmation: "password", settings: %{current_team_id: team.id}}
) |> Menu.Repo.insert!

_membership = Menu.TeamMember.changeset(%Menu.TeamMember{}, %{team_id: team.id, member_id: user.id}) |> Menu.Repo.insert!

q1 = Menu.Repo.insert! %Menu.Product{title: "Пластик Hpl 78001FX, лист", kind: "СМТ", price: 1800, duration: 5, team_id: team.id}
q6 = Menu.Repo.insert! %Menu.Product{title: "Кромка ПВХ 2мм, м", kind: "СМТ", price: 10, duration: 5, team_id: team.id}
q9 = Menu.Repo.insert! %Menu.Product{title: "Кромка ПВХ 0.4мм, м", kind: "СМТ", price: 2.5, duration: 5, team_id: team.id}
q11 = Menu.Repo.insert! %Menu.Product{title: "ЛДСП Белый, лист", kind: "СМТ", price: 1000, duration: 5, team_id: team.id}
q14 = Menu.Repo.insert! %Menu.Product{title: "Гофрокартон, лист", duration: 5, price: 25, kind: "СМТ", team_id: team.id}
q15 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.3, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q16 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.8, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q17 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.0, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q18 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.2, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q19 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.75, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q20 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.76, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q21 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.02, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q22 = Menu.Repo.insert! %Menu.Product{title: "Коробка 2.5, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q23 = Menu.Repo.insert! %Menu.Product{title: "Коробка 0.4, шт", duration: 50, price: 0, kind: "УПК", team_id: team.id}
q24 = Menu.Repo.insert! %Menu.Product{title: "Уголок БН, шт", kind: "СФР", price: 1.1, duration: 50, team_id: team.id}
q25 = Menu.Repo.insert! %Menu.Product{title: "Косынка, шт", duration: 5, price: 6, kind: "СФР", team_id: team.id}
q26 = Menu.Repo.insert! %Menu.Product{title: "Шуруп 4х16, шт", duration: 5, price: 0.14, kind: "СФР", team_id: team.id}
q27 = Menu.Repo.insert! %Menu.Product{title: "Шуруп 4х25, шт", duration: 5, price: 0.13, kind: "СФР", team_id: team.id}
q28 = Menu.Repo.insert! %Menu.Product{title: "Шуруп 4х30, шт", duration: 5, price: 0.13, kind: "СФР", team_id: team.id}
q29 = Menu.Repo.insert! %Menu.Product{title: "Шуруп 2,5х25, шт", duration: 5, price: 0.1, kind: "СФР", team_id: team.id}
q30 = Menu.Repo.insert! %Menu.Product{title: "Крючок, шт", duration: 5, price: 3.7, kind: "СФР", team_id: team.id}
q31 = Menu.Repo.insert! %Menu.Product{title: "Евровинт, шт", duration: 5, price: 0.5, kind: "СФР", team_id: team.id}
q32 = Menu.Repo.insert! %Menu.Product{title: "Заглушка под евровинт, шт", duration: 5, price: 0.1, kind: "СФР", team_id: team.id}
q33 = Menu.Repo.insert! %Menu.Product{title: "Шкант металлический, шт", duration: 5, price: 2.6, kind: "СФР", team_id: team.id}
q34 = Menu.Repo.insert! %Menu.Product{title: "Петля ломберная, шт", duration: 5, price: 12, kind: "СФР", team_id: team.id}
q35 = Menu.Repo.insert! %Menu.Product{title: "Футорка, шт", duration: 5, price: 1.3, kind: "СФР", team_id: team.id}
q36 = Menu.Repo.insert! %Menu.Product{title: "Болт М6, шт", duration: 5, price: 0.55, kind: "СФР", team_id: team.id}
q37 = Menu.Repo.insert! %Menu.Product{title: "Шайба М6, шт", duration: 5, price: 0.1, kind: "СФР", team_id: team.id}
q38 = Menu.Repo.insert! %Menu.Product{title: "Петля книжная, шт", duration: 5, price: 4, kind: "СФР", team_id: team.id}
q39 = Menu.Repo.insert! %Menu.Product{title: "Петля накладная, шт", duration: 5, price: 7, kind: "СФР", team_id: team.id}
q40 = Menu.Repo.insert! %Menu.Product{title: "Ручка, шт", duration: 5, price: 8, kind: "СФР", team_id: team.id}
q41 = Menu.Repo.insert! %Menu.Product{title: "Винт потайной, шт", duration: 5, price: 0.1, kind: "СФР", team_id: team.id}
q42 = Menu.Repo.insert! %Menu.Product{title: "Подпятник, шт", duration: 5, price: 0.1, kind: "СФР", team_id: team.id}
q43 = Menu.Repo.insert! %Menu.Product{title: "Полкодержатель, шт", duration: 5, price: 0.25, kind: "СФР", team_id: team.id}
q44 = Menu.Repo.insert! %Menu.Product{title: "Рол.направл.300,ключ, компл", duration: 5, price: 21, kind: "СФР", team_id: team.id}
q45 = Menu.Repo.insert! %Menu.Product{title: "Стяжка табурета, шт", duration: 5, price: 20, kind: "СФР", team_id: team.id}
q46 = Menu.Repo.insert! %Menu.Product{title: "ДСП, лист", duration: 5, price: 800, kind: "СМТ", team_id: team.id}
q47 = Menu.Repo.insert! %Menu.Product{title: "Клей ПВА, кг", duration: 5, price: 58, kind: "СМТ", team_id: team.id}
q48 = Menu.Repo.insert! %Menu.Product{title: "ОДВП, лист", duration: 5, price: 320, kind: "СМТ", team_id: team.id}
q49 = Menu.Repo.insert! %Menu.Product{title: "Бумага, м2", duration: 5, price: 1, kind: "СМТ", team_id: team.id}
q50 = Menu.Repo.insert! %Menu.Product{title: "Ножки стола белые, компл", duration: 5, price: 400, kind: "СМТ", team_id: team.id}
q51 = Menu.Repo.insert! %Menu.Product{title: "Ножки стола хром, компл", duration: 5, price: 600, kind: "СМТ", team_id: team.id}
q52 = Menu.Repo.insert! %Menu.Product{title: "Заготовка планки ломберного каркаса, шт", duration: 5, price: 2.8, kind: "РСП", team_id: team.id}
q53 = Menu.Repo.insert! %Menu.Product{title: "Заготовка планки ломберного каркаса со сверловкой, шт", duration: 2, price: 0.8, kind: "СВР", team_id: team.id}
q54 = Menu.Repo.insert! %Menu.Product{title: "Планка ломберного каркаса, шт", duration: 50, price: 4, kind: "КРМ04", team_id: team.id}
q55 = Menu.Repo.insert! %Menu.Product{title: "Каркас ломберный, шт", duration: 60, price: 12.2, kind: "СБР", team_id: team.id}
q56 = Menu.Repo.insert! %Menu.Product{title: "Ломберная заготовка Hpl, шт", duration: 50, price: 0, kind: "РСП", team_id: team.id}
q57 = Menu.Repo.insert! %Menu.Product{title: "Ломберная заготовка ДСП, шт", duration: 50, price: 2.066, kind: "РСП", team_id: team.id}
q58 = Menu.Repo.insert! %Menu.Product{title: "Заготовка ломберного щита, шт", duration: 60, price: 7, kind: "ПРС", team_id: team.id}
q59 = Menu.Repo.insert! %Menu.Product{title: "Ломберный щит, шт", duration: 11, price: 7.2, kind: "РСП", team_id: team.id}
q60 = Menu.Repo.insert! %Menu.Product{title: "Отфрезерованный ломберный щит, шт", duration: 11, price: 4.8, kind: "ФРЗ", team_id: team.id}
q61 = Menu.Repo.insert! %Menu.Product{title: "Ломберная столешница, шт", duration: 80, price: 28, kind: "КРМ20", team_id: team.id}
q62 = Menu.Repo.insert! %Menu.Product{title: "Ломберная столешница на каркасе, шт", duration: 50, price: 24, kind: "СБР", team_id: team.id}
q63 = Menu.Repo.insert! %Menu.Product{title: "Стол ломберный, шт", duration: 10, price: 2380, kind: "СГП", team_id: team.id}

Menu.Repo.insert! %Menu.ProductPart{product_id: q23.id, part_id: q14.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q52.id, part_id: q11.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q53.id, part_id: q52.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q54.id, part_id: q9.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q54.id, part_id: q53.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q55.id, part_id: q54.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q55.id, part_id: q25.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q55.id, part_id: q26.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q55.id, part_id: q31.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q55.id, part_id: q32.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q56.id, part_id: q1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q57.id, part_id: q46.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q58.id, part_id: q56.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q58.id, part_id: q56.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q58.id, part_id: q57.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q58.id, part_id: q47.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q59.id, part_id: q58.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q60.id, part_id: q59.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q61.id, part_id: q60.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q61.id, part_id: q1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q55.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q61.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q34.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q35.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q36.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q37.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q27.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q62.id, part_id: q29.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q63.id, part_id: q62.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q63.id, part_id: q51.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: q63.id, part_id: q16.id, team_id: team.id}

Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Склад гп", kind: "СГП", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Склад мат", kind: "СМТ", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Склад фурн", kind: "СФР", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Пила", kind: "РСП", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Фрезер", kind: "ФРЗ", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Кромка04", kind: "КРМ04", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Кромка2", kind: "КРМ20", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Сборка", kind: "СБР", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Пресс", kind: "ПРС", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Упаковка", kind: "УПК", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Сверловка", kind: "СВР", duration: 24000, start: 1498985000}

Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный a", price: 4500, qty: 10, product_id: q63.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный b", price: 4500, qty: 20, product_id: q63.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный c", price: 4500, qty: 30, product_id: q63.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный d", price: 4500, qty: 40, product_id: q63.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный e", price: 4500, qty: 50, product_id: q63.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Стол ломберный f", price: 4500, qty: 60, product_id: q63.id}
