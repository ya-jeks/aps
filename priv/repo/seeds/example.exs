team = Menu.Team.changeset(%Menu.Team{}, %{title: "Example team"}) |> Menu.Repo.insert!
user = Menu.User.changeset(%Menu.User{},
  %{name: "User", email: "user@example.com", password: "password", password_confirmation: "password", settings: %{current_team_id: team.id}}
) |> Menu.Repo.insert!

_membership = Menu.TeamMember.changeset(%Menu.TeamMember{}, %{team_id: team.id, member_id: user.id}) |> Menu.Repo.insert!

q = Menu.Repo.insert!   %Menu.Product{team_id: team.id, title: "Q", price: 100, duration: 5,  kind: "S"} #, parts: [d2]}
p = Menu.Repo.insert!   %Menu.Product{team_id: team.id, title: "P", price: 90, duration: 5, kind: "S"} #, parts: [pp, d1]}
pp = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "PP", price: 5, duration: 5, kind: "R"} #, parts: []}
rm1 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "RM1", price: 20, duration: 5, kind: "R"} #, parts: []}
rm2 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "RM2", price: 20, duration: 5, kind: "R"} #, parts: []}
rm3 = Menu.Repo.insert! %Menu.Product{team_id: team.id, title: "RM3", price: 20, duration: 5, kind: "R"} #, parts: []}
a1 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "A1", price: 0, duration: 15, kind: "A"} #, parts: [rm1]}
a2 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "A2", price: 0, duration: 10, kind: "A"} #, parts: [rm3]}
b1 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "B1", price: 0, duration: 15, kind: "B"} #, parts: [rm2]}
b2 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "B2", price: 0, duration: 15, kind: "B"} #, parts: [a2]}
c1 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "C1", price: 0, duration: 10, kind: "C"} #, parts: [a1]}
c2 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "C2", price: 0, duration:  5, kind: "C"} #, parts: [b1]}
d1 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "D1", price: 0, duration: 15, kind: "D"} #, parts: [c1, c2]}
d2 = Menu.Repo.insert!  %Menu.Product{team_id: team.id, title: "D2", price: 0, duration:  5, kind: "D"} #, parts: [c2, b2]}

Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "p1", price: 90, qty: 100, product_id: p.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "q1", price: 100, qty: 40, product_id: q.id}
Menu.Repo.insert! %Menu.Demand{team_id: team.id, title: "q2", price: 72, qty: 50, product_id: q.id}

Menu.Repo.insert! %Menu.ProductPart{product_id: q.id, part_id: d2.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: p.id, part_id: pp.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: p.id, part_id: d1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: a1.id, part_id: rm1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: a2.id, part_id: rm3.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: b1.id, part_id: rm2.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: b2.id, part_id: a2.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: c1.id, part_id: a1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: c2.id, part_id: b1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: d1.id, part_id: c1.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: d1.id, part_id: c2.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: d2.id, part_id: c2.id, team_id: team.id}
Menu.Repo.insert! %Menu.ProductPart{product_id: d2.id, part_id: b2.id, team_id: team.id}

Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "r1", kind: "R", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "s1", kind: "S", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "a1", kind: "A", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "b1", kind: "B", duration: 3500,  start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "c1", kind: "C", duration: 24000, start: 1498985000}
Menu.Repo.insert! %Menu.Interval{team_id: team.id, title: "d1", kind: "D", duration: 24000, start: 1498985000}

