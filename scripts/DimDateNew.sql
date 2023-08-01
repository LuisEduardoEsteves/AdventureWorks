CREATE TABLE DimDateNew (
    DateKey INT PRIMARY KEY,
    FullDateAlternateKey DATE
);

DECLARE @StartDate DATE = '2019-01-01';
DECLARE @EndDate DATE = '2023-12-31';
DECLARE @CurrentDate DATE = @StartDate;
DECLARE @DateKey INT = YEAR(@StartDate) * 10000 + MONTH(@StartDate) * 100 + DAY(@StartDate);

WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO DimDateNew (DateKey, FullDateAlternateKey)
    VALUES (@DateKey, @CurrentDate);

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    SET @DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate);
END;

