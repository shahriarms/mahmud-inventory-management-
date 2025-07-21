
# Smart Inventory POS - Local Development Guide

Welcome! This guide provides everything you need to run the Smart Inventory and Point-of-Sale application on your local computer using PostgreSQL.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:
- [Node.js](https://nodejs.org/en) (which includes `npm`)
- [PostgreSQL](https://www.postgresql.org/download/) (the database)
- [pgAdmin](https://www.pgadmin.org/download/) (a visual tool to manage your database, highly recommended)
- [Git](https://git-scm.com/downloads) (for version control)

## Step 1: Install Dependencies

First, you need to install all the necessary libraries and packages for the project. Open your terminal in the project's root directory and run:

```bash
npm install
```

## Step 2: Set Up Your PostgreSQL Database

This application requires a PostgreSQL database to store products, invoices, and contacts.

### A. Create the Database
1. Open **pgAdmin**.
2. In the left-hand "Browser" panel, right-click on **Servers** > **Create** > **Server...**
3. In the **General** tab, give it a name like `Local POS DB`.
4. In the **Connection** tab, use the following default settings:
   - **Host name/address**: `localhost`
   - **Port**: `5432`
   - **Username**: `postgres`
   - **Password**: The password you created when you installed PostgreSQL.
5. Click **Save**.
6. Now, expand your new server in the browser, right-click on **Databases** > **Create** > **Database...**
7. For the **Database** name, enter `pos_db` and click **Save**.

### B. Configure the Application

The application needs to know how to connect to your new database. You will do this using a special, private file.

1.  In the root directory of your project, create a new file named `.env.local`.
2.  Copy and paste the following line into that file:

    ```
    POSTGRES_URL="postgresql://postgres:YOUR_PASSWORD_HERE@localhost:5432/pos_db"
    ```

3.  **IMPORTANT**: Replace `YOUR_PASSWORD_HERE` with the actual password for your `postgres` user.
4.  Save the `.env.local` file. This file is ignored by Git, so your password will remain private to your computer.

### C. Create the Database Tables

Now that the application can connect to the database, you need to create the necessary tables (`products`, `invoices`, etc.). We have a script that does this for you automatically.

In your terminal, run:

```bash
npm run db:setup
```

You should see messages indicating that the tables were created and seeded with initial data successfully. You can verify this by opening `pos_db` in pgAdmin and looking under **Schemas** > **public** > **Tables**.

## Step 3: Run the Application

You are all set! To start the web application, run the following command in your terminal:

```bash
npm run dev
```

This will start the development server. You can now open your web browser and navigate to the URL shown in the terminal (usually `http://localhost:9002`) to see your application live!

## Development Workflow

-   **Frontend**: All React components and pages are in the `src/` directory.
-   **Database Logic**: All functions that interact with the database are located in `src/data/db.ts`.
-   **Database Schema**: The initial structure of the database is defined in `init.sql`. If you need to reset your database, you can run `npm run db:setup` again.

You are now ready to develop on your local machine. Happy coding!
