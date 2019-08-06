DELIMITER //
CREATE FUNCTION check_date_due_on_loan(x date) RETURNS date
	RETURN DATE_ADD(x, INTERVAL 21 DAY)
//


DELIMITER //
CREATE PROCEDURE item_table_data_insert(
    IN a CHAR(13), 
    IN b CHAR(11), 
    IN c VARCHAR(32))
    MODIFIES SQL DATA
	INSERT INTO items 
	   VALUES(a, b, c)
//


DELIMITER //
CREATE TRIGGER loan_insert 
BEFORE INSERT ON loans
FOR EACH ROW BEGIN
	IF (NEW.date_out > NEW.date_due) THEN
	SET NEW.date_due = order_dates(NEW.date_out);
	END IF;
END
//


DELIMITER //
CREATE TRIGGER fiction_insert
AFTER INSERT ON fiction
	FOR EACH ROW
	CALL data_insert(NEW.isbn, 'Fiction', NEW.publisher)
//


DELIMITER //
CREATE TRIGGER non_fiction_insert
AFTER INSERT ON non_fiction
	FOR EACH ROW
	CALL data_insert(NEW.isbn, 'Non-Fiction', NEW.publisher)
//


DELIMITER //
CREATE TRIGGER journals_insert
AFTER INSERT ON journals
	FOR EACH ROW
	CALL data_insert(NEW.isbn, 'Journal', NEW.publisher)
//


DELIMITER //
CREATE TRIGGER fiction_delete
AFTER DELETE
   ON fiction FOR EACH ROW

BEGIN
  
   DELETE FROM items WHERE 
   items.isbn = OLD.isbn;

END; //


DELIMITER //
CREATE TRIGGER non_fiction_delete
AFTER DELETE
   ON non_fiction FOR EACH ROW

BEGIN
  
   DELETE FROM items WHERE 
   items.isbn = OLD.isbn;

END; //


DELIMITER //
CREATE TRIGGER journals_delete
AFTER DELETE
   ON journals FOR EACH ROW

BEGIN
  
   DELETE FROM items WHERE 
   items.isbn = OLD.isbn;

END; //