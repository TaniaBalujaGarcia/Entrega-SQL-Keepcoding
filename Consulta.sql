select m.model, b.brand, comp.company, c.date_of_purchase, c.license_plate, cl.color, c.km_total, ic.insurance_company, i.insurance_number
	from tania_baluja_garcia.companies comp
	join tania_baluja_garcia.brands b on comp.id_company = b.id_company
	join tania_baluja_garcia.models m on b.id_brand = m.id_brand
	join tania_baluja_garcia.cars c on m.id_model = c.id_model
	join tania_baluja_garcia.colors cl on c.id_color = cl.id_color
	join tania_baluja_garcia.insurances i on i.id_car = c.id_car
	join tania_baluja_garcia.insurance_companies ic on i.id_insurance_company = ic.id_insurance_company
