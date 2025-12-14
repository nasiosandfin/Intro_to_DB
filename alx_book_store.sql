import mysql.connector

try:
    # Establish connection to MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password=""
    )

    cursor = connection.cursor()

    # Create the database
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

    # Select the database
    cursor.execute("USE alx_book_store")

    # Create AUTHORS table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS AUTHORS (
            author_id INT PRIMARY KEY,
            author_name VARCHAR(215)
        )
    """)

    # Create BOOKS table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS BOOKS (
            book_id INT PRIMARY KEY,
            title VARCHAR(130),
            author_id INT,
            price DOUBLE,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
        )
    """)

    # Create CUSTOMERS table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS CUSTOMERS (
            customer_id INT PRIMARY KEY,
            customer_name VARCHAR(215),
            email VARCHAR(215),
            address TEXT
        )
    """)

    # Create ORDERS table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ORDERS (
            order_id INT PRIMARY KEY,
            customer_id INT,
            order_date DATE,
            FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
        )
    """)

    # Create ORDER_DETAILS table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
            orderdetailid INT PRIMARY KEY,
            order_id INT,
            book_id INT,
            quantity DOUBLE,
            FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
            FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
        )
    """)

    connection.commit()

except mysql.connector.Error as err:
    print("Error:", err)

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
