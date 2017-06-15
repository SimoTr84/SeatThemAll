Operator.destroy_all
Floorplan.destroy_all

o1 = Operator.create(name: "Bill", surname: "Murray", email: "bill@ga.co", password:"chicken", password_confirmation: "chicken")
o2 = Operator.create(name: "Simone", surname: "Trucco", email: "simone@ga.co", password:"chicken", password_confirmation: "chicken")

p o1
p o2
