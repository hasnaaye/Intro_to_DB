select column_name, data_type
from information_schema.columns
where table_name = 'books'
and table_schema = 'alx_book_store';
