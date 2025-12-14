import mysql.connector

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="YOUR_PASSWORD_HERE"
    )

    cursor = connection.cursor()

    # Create database (won't fail if it already exists)
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print("Error connecting to MySQL:", err)

finally:
    # Close cursor and connection safely
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
