# 💇 Salon Appointment Scheduler

Project developed as part of the **Relational Databases** certification by [freeCodeCamp](https://www.freecodecamp.org/).

An interactive terminal-based appointment system for a hair salon, managed entirely through a Bash script backed by a PostgreSQL database.

---

## 🛠️ Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)

---

## 📁 Structure

```
salon_scheduler/
├── salon.sql    # Database schema (tables: customers, services, appointments)
└── salon.sh     # Interactive Bash script to manage appointments
```

---

## 💡 What this project demonstrates

- Relational modelling with three tables linked by foreign keys
- Interactive Bash script with menus and conditional flow
- Dynamic data insertion (customers and appointments) via `psql`
- Input validation and branching logic (new vs. existing customer)
- `JOIN` queries to display combined information

---

## 🚀 How to run locally

**Prerequisites:** PostgreSQL installed and running.

```bash
# 1. Create the database
createdb salon

# 2. Create the tables
psql -U postgres salon < salon.sql

# 3. Launch the app
bash salon.sh
```

The app displays a terminal menu where you can choose services, register customers, and book appointments.

---

## 📚 Context

Mandatory project for the freeCodeCamp **Relational Databases** certification, completed as part of my career transition into **Data Engineering**.
