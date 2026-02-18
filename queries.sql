USE support_ticket_db;

-- 1) Total Tickets
SELECT COUNT(*) AS total_tickets
FROM tickets;

-- 2) Ticket Distribution by Type
SELECT type, COUNT(*) AS total
FROM tickets
GROUP BY type
ORDER BY total DESC;

-- 3) Ticket Distribution by Queue (Support Team)
SELECT queue, COUNT(*) AS total
FROM tickets
GROUP BY queue
ORDER BY total DESC;

-- 4) Queue + Type Analysis
SELECT queue, type, COUNT(*) AS total
FROM tickets
GROUP BY queue, type
ORDER BY total DESC;

-- 5) Top 10 Most Common Subjects
SELECT subject, COUNT(*) AS total
FROM tickets
GROUP BY subject
ORDER BY total DESC
LIMIT 10;

-- 6) Tickets with No Answer Provided
SELECT COUNT(*) AS unanswered_tickets
FROM tickets
WHERE answer IS NULL OR answer = '';

-- 7) Tickets with Short Answers (Low Quality Support)
SELECT subject, answer
FROM tickets
WHERE answer IS NOT NULL
AND LENGTH(answer) < 50;

-- 8) Tickets with Long Description (High Complexity)
SELECT subject, LENGTH(body) AS body_length
FROM tickets
ORDER BY body_length DESC
LIMIT 10;

-- 9) Urgent Tickets
SELECT subject, body
FROM tickets
WHERE subject LIKE '%urgent%' OR body LIKE '%urgent%';

-- 10) AWS Related Tickets
SELECT subject, body
FROM tickets
WHERE subject LIKE '%AWS%' OR body LIKE '%AWS%';

-- 11) Login Related Tickets
SELECT subject, body
FROM tickets
WHERE body LIKE '%login%'
   OR body LIKE '%password%'
   OR body LIKE '%sign in%';

-- 12) Payment / Billing Related Tickets
SELECT subject, body
FROM tickets
WHERE body LIKE '%payment%'
   OR body LIKE '%billing%'
   OR body LIKE '%invoice%'
   OR body LIKE '%refund%';

-- 13) Error / Crash Related Tickets
SELECT subject, body
FROM tickets
WHERE body LIKE '%error%'
   OR body LIKE '%crash%'
   OR body LIKE '%failed%';

-- 14) Keyword Frequency Summary
SELECT 
    SUM(CASE WHEN body LIKE '%refund%' THEN 1 ELSE 0 END) AS refund_issues,
    SUM(CASE WHEN body LIKE '%payment%' THEN 1 ELSE 0 END) AS payment_issues,
    SUM(CASE WHEN body LIKE '%login%' THEN 1 ELSE 0 END) AS login_issues,
    SUM(CASE WHEN body LIKE '%error%' THEN 1 ELSE 0 END) AS error_issues,
    SUM(CASE WHEN body LIKE '%urgent%' THEN 1 ELSE 0 END) AS urgent_issues
FROM tickets;

-- 15) Tickets Missing Queue Assignment
SELECT COUNT(*) AS missing_queue
FROM tickets
WHERE queue IS NULL OR queue = '';
