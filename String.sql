use Practice
go

-- char       ---- ASCII    - 1byte
-- varchar    ---- ASCII    - 1byte
-- nchar      ---- UNICODE  - 2byte
-- nvarchar   ---- UNICODE  - 2byte

/*1.  Char */

--  # DataLength is the amount of data thart we assign for our variable
DECLARE @chrMycharacter as char(10)
set @chrMycharacter = 'Hello'
select @chrMycharacter , len(@chrMycharacter) as Mylength, DATALENGTH(@chrMycharacter) as myDataLength


DECLARE @chrMycharacters as char(10)
set @chrMycharacters = 'Hellothere'
select @chrMycharacters , len(@chrMycharacters) as Mylength, DATALENGTH(@chrMycharacters) as myDataLength


-- Notice here since our assign variable is only 10 but we put more than 10 and it tuncate upto ten only. 
DECLARE @chrMycharacter_2 as char(10)
set @chrMycharacter_2 = 'Hi,guys,whatsapp'
select @chrMycharacter_2 , len(@chrMycharacter_2) as Mylength, DATALENGTH(@chrMycharacter_2) as myDataLength


--Unicode/characters can be prited here.
/*2. varchar  has 2Byte additional */
DECLARE @chrMycharacter_3 as nvarchar(10)
set @chrMycharacter_3 = '#Hi,guys,w'
select @chrMycharacter_3 , len(@chrMycharacter_3) as Mylength, DATALENGTH(@chrMycharacter_3) as myDataLength


/*
NB:
Which of these is a valid NVARCHAR(10) string?
  a) N"hello"
  b) "hello"
  c) N'hello'
   ANswer: C  -  the N refers to the NVARCHAR (or NCHAR), and it uses apostrophes to surround the value.

   DECLARE @myvariable NVARCHAR(20) = N'hello'

How many bytes are used in N'hello'?
 a) 5
 b) 6 
 c) 10
 d) 12
 e) 20

 Anaswer: 12    Because  it is an NVARCHAR. It should be 1 byte for each letter of hello, then multiply by 2 for the "N", 
				plus 2 bytes because it is a "VAR". This makes (5*2)+2 = 12.
*/



/* 

String Function -Extraction

*/

DECLARE @chrASCII as varchar(10) = 'helloµ   '

DECLARE @chrUNICODE as nvarchar(10) = N'helloµ'

select  @chrASCII as myASCII, @chrUNICODE as myUNICODE

-- the first two and the last three
select  left(@chrASCII, 2) as myASCII, right(@chrUNICODE, 3) as myUNICODE

-- For the middle
select  substring(@chrASCII, 3, 2) as my_middle_later, substring(@chrUNICODE, 3, 3) as my_middle_letter

-- Spacing
select ltrim(rtrim(@chrASCII)) as both_lfet_and_right_trim

--Replace
select replace(@chrASCII, 'h','H')

select upper(@chrASCII) as myupper
select lower(@chrASCII) as mylower


/* 

Null

*/
DECLARE @myint AS int
SELECT @myint

DECLARE @mychar1 as NVARCHAR(10) = N'hello'
DECLARE @mychar2 as NVARCHAR(10)
SELECT LEFT(@mychar1 + @mychar2, 2)


declare @mynum decimal(5,2)
select CONVERT(decimal(5,2), 1000)

select try_CONVERT(decimal(5,2), 1000)

/*
JOIN
*/
declare @firstname as nvarchar(20)
declare @middlename as nvarchar(20)
declare @lastname as nvarchar(20)


set @firstname = 'Absalart'
set @middlename = 'Tazeb'
set @lastname = 'Alelign'

-- The correct one will be 
select @firstname + '  '  +  @middlename  + '  ' + @lastname as fullname

-- But the next will get The data types nvarchar and nvarchar are incompatible in the '&' operator. ERROR

select @firstname  & @middlename & @lastname as fullname




declare @firstname1 as nvarchar(20)
declare @middlename1 as nvarchar(20)
declare @lastname1 as nvarchar(20)


set @firstname1 = 'Absalart'
set @lastname1 = 'Alelign'
--select @firstname1 + '  '  +  @middlename1  + '  ' + @lastname1 as fullname
-- The answer is Null this is because adding Null to anything the resul will be null. 

-- The correct will be 

--select @firstname1 + IFF(@middlename1 is null, '', ' '+ @middlename1)  + '  ' + @lastname1 as fullname

select @firstname1 + CASE WHEN @middlename1 is null then '' else '' + @middlename1 end   + '  ' + @lastname1 as fullname

select CONCAT(@firstname1, ' ' + @middlename1, ' ' , @lastname1) as Fullname