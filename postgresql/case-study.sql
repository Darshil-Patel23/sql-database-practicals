-- Case Study
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

bank_db=# \d customers;
                                  Table "public.customers"
    Column    |          Type          | Collation | Nullable |           Default
--------------+------------------------+-----------+----------+------------------------------
 customer_id  | integer                |           | not null | generated always as identity
 name         | character varying(100) |           | not null |
 email        | character varying(100) |           |          |
 phone_number | numeric(11,0)          |           | not null |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_email_key" UNIQUE CONSTRAINT, btree (email)
    "customers_phone_number_key" UNIQUE CONSTRAINT, btree (phone_number)


bank_db=# \d branches;
                                  Table "public.branches"
   Column    |          Type          | Collation | Nullable |           Default
-------------+------------------------+-----------+----------+------------------------------
 branch_id   | integer                |           | not null | generated always as identity
 branch_name | character varying(100) |           |          |
 city        | character varying(100) |           |          |
Indexes:
    "branches_pkey" PRIMARY KEY, btree (branch_id)


bank_db=# \d accounts;
                                  Table "public.accounts"
    Column    |         Type          | Collation | Nullable |           Default
--------------+-----------------------+-----------+----------+------------------------------
 account_id   | integer               |           | not null | generated always as identity
 customer_id  | integer               |           |          |
 branch_id    | integer               |           |          |
 account_type | character varying(50) |           |          |
 balance      | numeric(12,2)         |           |          |
Indexes:
    "accounts_pkey" PRIMARY KEY, btree (account_id)
Foreign-key constraints:
    "accounts_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)


bank_db=# \d transactions;
                                     Table "public.transactions"
      Column      |            Type             | Collation | Nullable |           Default
------------------+-----------------------------+-----------+----------+------------------------------
 transaction_id   | integer                     |           | not null | generated always as identity
 account_id       | integer                     |           |          |
 amount           | numeric(10,2)               |           |          |
 transaction_type | character varying(20)       |           |          |
 transaction_date | timestamp without time zone |           |          | CURRENT_TIMESTAMP
Indexes:
    "transactions_pkey" PRIMARY KEY, btree (transaction_id)
