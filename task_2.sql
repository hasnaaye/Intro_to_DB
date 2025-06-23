import mysql.connector
from mysql.connector import Error

def create_tables():
    try:
        # Connect to the MySQL server and select the database
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password_here',  # Replace with your actual password
            database='alx_book_store'
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL commands to create each table
            create_authors = """
            CREATE TABLE IF NOT EXISTS Authors (
                author_id INT AUTO_INCREMENT PRIMARY KEY,
                author_name VARCHAR(215) NOT NULL
            );
            """

            create_books = """
            CREATE TABLE IF NOT EXISTS Books (
                book_id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(130) NOT NULL,
                author_id INT,
                price DOUBLE,
                publication_date DATE,
                FOREIGN KEY (author_id) REFERENCES Authors(author_id)
            );
            """

            create_customers = """
            CREATE TABLE IF NOT EXISTS Customers (
                customer_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_name VARCHAR(215) NOT NULL,
                email VARCHAR(215),
                address TEXT
            );
            """

            create_orders = """
            CREATE TABLE IF NOT EXISTS Orders (
                order_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_id INT,
                order_date DATE,
                FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
            );
            """

            create_order_details = """
            CREATE TABLE IF NOT EXISTS Order_Details (
                orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
                order_id INT,
                book_id INT,
                quantity DOUBLE,
                FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                FOREIGN KEY (book_id) REFERENCES Books(book_id)
            );
            """

            # Execute all table creation queries
            cursor.execute(create_authors)
            cursor.execute(create_books)
            cursor.execute(create_customers)
            cursor.execute(create_orders)
            cursor.execute(create_order_details)

            print("All tables created successfully in 'alx_book_store' database!")

    except mysql.connector.Error as err:
        print(f"Error while creating tables: {err}")

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_tables()
