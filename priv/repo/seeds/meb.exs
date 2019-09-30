team = Menu.Team.changeset(%Menu.Team{}, %{title: "Meb"}) |> Menu.Repo.insert!
user = Menu.User.changeset(%Menu.User{},
  %{name: "Name", email: "meb@example.com", password: "password", password_confirmation: "password", settings: %{current_team_id: team.id}}
) |> Menu.Repo.insert!

membership = Menu.TeamMember.changeset(%Menu.TeamMember{}, %{team_id: team.id, member_id: user.id}) |> Menu.Repo.insert!

z1 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Торцовка стеновой панели, шт", kind: "H", price: 0, duration: 30}
z2 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ЛДВП, шт", kind: "H", price: 0, duration: 22}
z3 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ЛДВП однотонный, шт", kind: "H", price: 0, duration: 25}
z4 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка пластика на стеновые и столешницы, деталь", kind: "H", price: 0, duration: 12}
z5 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДСП 16мм на щиты, щит", kind: "H", price: 0, duration: 20}
z6 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДСП 26мм и 38мм на полосы, полоса", kind: "H", price: 0, duration: 56}
z7 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДСП 26мм и 38мм на щит (нестандарт), щит", kind: "H", price: 0, duration: 139}
z8 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДВП 4мм на стеновые, деталь", kind: "H", price: 0, duration: 23}
z9 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка фасадов из МДФ 16мм, деталь", kind: "H", price: 0, duration: 23}
z10 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка фасадов из МДФ 16мм по браку, деталь", kind: "H", price: 0, duration: 33}
z11 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка МДФ на щиты (10,12,16мм), щит", kind: "H", price: 0, duration: 13}
z12 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка МДФ 8мм на щиты, щит", kind: "H", price: 0, duration: 13}
z13 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка МДФ 3мм на щиты, щит", kind: "H", price: 0, duration: 14}
z14 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка МДФ 3 и ДВП 4мм заготовки радиусных  дверей, заготовка", kind: "H", price: 0, duration: 2}
z15 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка щитов на погонаж, щит", kind: "H", price: 0, duration: 162}
z16 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка заготовок для багета МДФ 16мм (152, 168 мм), шт", kind: "H", price: 0, duration: 9}
z17 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка МДФ 6 мм на молдинг для «Беллы», шт.", kind: "H", price: 0, duration: 6}
z18 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДСП 16мм на ящики для Т1, деталь", kind: "H", price: 0, duration: 23}
z19 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка ДСП 16мм на ящики для Т2, деталь", kind: "H", price: 0, duration: 9}
z20 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка пленки ПВХ на полосы, шт.", kind: "H", price: 0, duration: 2160}
z21 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Распиловка щитов на заготовки для рад.колонн «Белла», щит", kind: "H", price: 0, duration: 86}

az1 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Изготовление R двери, 2шт.", duration:	480, kind: "SCH", price: 0}
az2 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Изготовление R двери «Аркада», 2шт.", duration: 480, kind: "SCH", price: 0}
az3 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты с акриловым пластиком, щит", duration: 249, kind: "SCH", price: 0}
az4 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты пластиковые, щит", duration: 141, kind: "SCH", price: 0}
az5 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты пластиковые 2-х сторонние, щит", duration: 200, kind: "SCH", price: 0}
az6 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Стеновые панели, шт.", duration:	124, kind: "SCH", price: 0}
az7 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Столешницы, шт.", duration: 109, kind: "SCH", price: 0}
az8 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты «Парма», «Кредо», «Флер», щит", duration: 89, kind: "SCH", price: 0}
az9 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты под колонны «Аркада», щит", duration: 106, kind: "SCH", price: 0}
az10 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты под колонны «Изабель», щит", duration: 106, kind: "SCH", price: 0}
az11 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты под колонны «Белла», щит", duration: 106, kind: "SCH", price: 0}
az12 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "Поклейка Щиты под гнутые багеты «Бэлла», щит", duration: 101, kind: "SCH", price: 0}

Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Торцовка стеновой панели, шт", price: 0, qty: 42, product_id: z1.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка ЛДВП, шт", price: 0, qty: 327, product_id: z2.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка пластика на стеновые и столешницы, деталь", price: 0, qty: 66, product_id: z4.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка ДСП 16мм на щиты, щит", price: 0, qty: 65, product_id: z5.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка ДВП 4мм на стеновые, деталь", price: 0, qty: 16, product_id: z8.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка фасадов из МДФ 16мм, деталь", price: 0, qty: 184, product_id: z9.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка МДФ 6 мм на молдинг для «Беллы», шт.", price: 0, qty: 290, product_id: z17.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "Распиловка ДСП 16мм на ящики для Т1, деталь", price: 0, qty: 150, product_id: z18.id}

Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Holzma", kind: "H", duration: 11700, start: 1498983300}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Holzma", kind: "H", duration: 12300, start: 1498998900}

Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Gl", kind: "SCH", duration: 11700, start: 1498983300}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "Gl", kind: "SCH", duration: 12300, start: 1498998900}

