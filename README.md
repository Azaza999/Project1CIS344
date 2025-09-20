# Project1CIS344
### README: Antique Books Store Management System

This README provides an overview of the **Antique Books Store Management System**, a database project designed for a specialized retail business dealing with collectible books. It details the project's implementation, database schema, data population strategy, and the sources used for research.

---

### 1. Project Files

The repository contains the following key files:

* **`EER Diagram Digital.png`**: A digital image of the Enhanced Entity-Relationship (EER) diagram, visually representing the database schema.
* **`PROJECT 1 DOCUMENTATION - DURAN PAMELA.pdf`**: A PDF document containing comprehensive project documentation, including the thought process behind the design and implementation.
* **`Project1-Bookstore.mwb`**: The MySQL Workbench model file, which can be opened to view and modify the database schema.
* **`README.md`**: This file.
* **`Script.sql`**: The SQL script for creating the database schema and populating it with sample data.
* **`Hand-Drawn Diagram.png`**: A hand-drawn Chen diagram providing a visual representation of the database relationships.

---

### 2. Implementation Thought Process

The database was designed with a focus on comprehensive functionality and data integrity. The schema was structured to capture all aspects of an antique book store's operations excluding restoration, with special attention paid to attributes crucial to the rare/antique book market, such as **condition**, **edition**, and **rarity**.

The sample data was created to represent realistic scenarios, with book titles, authors, and publishers selected from diverse genres and time periods. The pricing structure was informed by research to reflect the premium nature of the items. Transactions were logically sequenced, with acquisitions occurring before sales, to maintain a realistic business flow.

---

### 3. Sources and Research

While the data is fictional, it was meticulously informed by research into the rare book market to ensure authenticity. The following resources were instrumental in the project's development:

* **Goodreads.com**: Used for researching book titles, publication years, and editions.
* **Isbnsearch.org**: Provided valid ISBN formats for creating realistic book identifiers.
* **Abebooks.com** and **Biblio.com**: Major marketplaces for rare books that offered critical insights into pricing based on factors like condition and rarity.
* **BookFinder.com**: Helped in comparing prices across various sellers to establish realistic market values.
* **Librarything.com**: A community-driven site that aided in understanding typical book metadata.
