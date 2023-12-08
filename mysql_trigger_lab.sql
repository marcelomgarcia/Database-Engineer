DELIMITER $$

-- Insert ---

CREATE TRIGGER ProductSellPriceInsertCheck AFTER INSERT ON Products FOR EACH ROW
BEGIN
  IF NEW.SellPrice < NEW.BuyPrice THEN
    INSERT INTO Notifications VALUES 
    (NULL, CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW());
  END IF;
END$$

-- Update --

CREATE TRIGGER ProductSellPriceUpdateCheck AFTER UPDATE ON Products FOR EACH ROW
BEGIN
  IF NEW.SellPrice < NEW.BuyPrice THEN
    INSERT INTO Notifications VALUES 
    (NULL, CONCAT(NEW.ProductID, " was updated with a SellPrice of ", NEW.SellPrice, " which is the same or less than the BuyPrice"), NOW());
  END IF;
END$$

-- Delete --

CREATE TRIGGER NotifyProductDelete AFTER DELETE ON Products FOR EACH ROW
BEGIN
  INSERT INTO Notifications VALUES 
  (NULL, CONCAT("The product with a ProductID ", OLD.ProductID, " was deleted"), NOW());
END$$

-- End of triggers.
DELIMITER ;
