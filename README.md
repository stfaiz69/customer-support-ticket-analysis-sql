# customer-support-ticket-analysis-sql
SQL project to analyze customer support tickets using MySQL.
# Customer Support Ticket Analysis using SQL (MySQL)

## 📌 Project Overview
This project analyzes customer support tickets using SQL queries in MySQL Workbench.  
The goal is to understand issue trends, workload distribution across support queues, and response quality.

## 🛠 Tools & Technologies
- MySQL Workbench
- SQL
- Kaggle Dataset (Support Tickets)

## 📂 Dataset Columns Used
- subject
- body
- answer
- type
- queue

## 🎯 Objectives
- Analyze ticket distribution by type and support queue.
- Identify common customer issues using keyword search.
- Detect unanswered tickets and low-quality responses.
- Identify complex tickets using text length analysis.

## 🔍 SQL Concepts Used
- SELECT, WHERE
- GROUP BY, ORDER BY
- COUNT(), SUM()
- CASE WHEN
- LIKE operator
- NULL handling
- LENGTH() function

## 📊 Key Analysis Performed
- Total ticket count
- Ticket distribution by type
- Queue workload analysis
- Top frequent ticket subjects
- Keyword analysis (urgent, login, payment, error)
- Unanswered ticket detection
- Complex ticket detection based on body length

## 📁 Files Included
- `queries.sql`

