/*Which countries have the most Bills? */
select  BillingCountry Country , count(Quantity) TotalBills
from Invoice i
join InvoiceLine il
on i.InvoiceId =il.InvoiceId 
group by BillingCountry
order by  count(Quantity)   desc
limit 10;


/*Which artist has the most tracks?*/
select  a.Name Artist , count(Track.Name) TotalTrack
from Artist a
join Album alb
on a.ArtistId = alb.ArtistId
join Track on alb.AlbumId = Track.AlbumId
group by a.Name 
order by  count(Track.Name) desc
limit 10


/*What is the most popular music Genre on United Kingdom? */
select g.Name, count(*) TotalOfGenre,
	(select  Country
	from Customer c 
	where c.CustomerId = Invoice.CustomerId) as Country
from Genre g
join Track on Track.GenreId=g.GenreId
join InvoiceLine on InvoiceLine.TrackId = Track.TrackId
join Invoice on InvoiceLine.InvoiceId = Invoice.InvoiceId
where Country like "United Kingdom"
group by Country,  g.Name
order by  count(*) desc

/*What is the most expenditure incurred by a customer?*/
select (Customer.FirstName || " " || Customer.LastName) FullName, sum(UnitPrice*Quantity) as TotalPaid
from Invoice
join InvoiceLine on Invoice.InvoiceId = InvoiceLine.InvoiceId
join Customer on Customer.CustomerId = Invoice.CustomerId
group by Customer.CustomerId
order by TotalPaid desc
limit 20;


