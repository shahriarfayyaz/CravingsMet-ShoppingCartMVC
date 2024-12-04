/* overall order's */
create view getallorders as 
select tblInvoice.InvoiceId, tblUser.Name as 'user', tblProducts.Name as 'pro_name', 
tblOrder.Contact, tblOrder.Address, tblOrder.Unit , tblOrder.Qty, tblOrder.Total, tblInvoice.Bill,tblInvoice.Payment
, tblInvoice.InvoiceDate from tblInvoice
inner join tblUser on tblUser.UserId = tblInvoice.UserId
inner join tblOrder on tblOrder.InvoiceId = tblOrder.InvoiceId
inner join tblProducts on tblProducts.ProID = tblOrder.ProID

/* user's order  */
create view getallorderusers as
select tblInvoice.InvoiceId, tblUser.UserId, tblUser.Name as 'user', 
 tblInvoice.Bill,tblInvoice.Payment, tblInvoice.InvoiceDate
 from tblInvoice
inner join tblUser on tblUser.UserId = tblInvoice.UserId


/* in case any changes or drop view */
drop view getallorderusers

/* call for view */
select * from getallorders