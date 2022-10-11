-- Assessment 2

--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
SELECT * 
FROM cd.facilities 
WHERE membercost >0 AND 
membercost < (monthlymaintenance/50.0)


-- How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT * FROM cd.facilities 
WHERE name LIKE '%Tennis%'


-- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT * FROM cd.facilities 
WHERE facid IN (1,5)


-- How can you produce a list of members who joind after the start of September 2012? Return the memid, surname, firstname, and JOINdate of the members in question.
SELECT * FROM cd.members
WHERE joindate >= '2012-09-01'


-- How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10


-- You'd like to get the signup date of your last member. How can you retrieve this information?
SELECT surname, firstname, JOINdate FROM cd.members
ORDER BY joindate desc
LIMIT 1


-- Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT count(*) FROM cd.facilities
WHERE guestcost >= 10 

-- Produce a list of the total number of slots booked per facility in the month of September 2012. 
-- Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, SUM(slots) FROM cd.bookings
WHERE EXTRACT(month FROM starttime) = '09'
GROUP BY facid
ORDER BY SUM(slots)

-- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
WHERE SUM(slots) >1000
GROUP BY facid
ORDER BY facid


-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
-- Return a list of start time and facility name pairings, ordered by the time.
SELECT bookings.starttime, bookings.facid, facilities.name
FROM cd.bookings
LEFT JOIN cd.facilities cd.facilities.facid = cd.bookings.facid
WHERE date(bookings.starttime) = '2012-09-21' 
AND facilities.name LIKE '%Tennis Court%'
ORDER BY bookings.starttime


-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime, firstname || ' ' || surname AS fullname 
FROM cd.members
INNER JOIN cd.bookings ON bookings.memid = members.memid
WHERE firstname || ' ' || surname = 'David Farrell'

