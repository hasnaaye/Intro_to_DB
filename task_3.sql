import mysql.connector
from mysql.connector import Error

def list_tables():
    try:
        # Connect to MySQL and select the database
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password_here',  # Replace with your actual MySQL password
            database='alx_book_store'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("SHOW TABLES")

            tables = cursor.fetchall()

            if tables:
                print("Tables in 'alx_book_store' database:")
                for table in tables:
                    print(f"- {table[0]}")
            else:
                print("No tables found in 'alx_book_store'.")

    except mysql.connector.Error as err:
        print(f"Error while listing tables: {err}")

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    list_tables()
