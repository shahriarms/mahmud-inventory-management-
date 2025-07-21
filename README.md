
# Smart Inventory POS - Development Guide

Welcome! This guide provides everything you need to work on the Smart Inventory and Point-of-Sale application, both in Firebase Studio and on your local computer.

## Part 1: Running in Firebase Studio (Recommended)

Firebase Studio is a cloud-based development environment. It automatically provides a database, so no local setup is needed.

### Step 1: Install Dependencies

The first time you open the project, or after any changes to `package.json`, you need to install the necessary libraries.

1.  Open a new terminal in the Studio.
2.  Run the command:
    ```bash
    npm install
    ```

### Step 2: Set Up the Cloud Database

The cloud database needs to have its tables created. You only need to do this **once**.

1.  Open a new terminal.
2.  Run the command:
    ```bash
    npm run db:setup
    ```
    You should see a success message indicating that tables were created.

### Step 3: Run the Application

You are all set! To start the web application, run the following command in the terminal:

```bash
npm run dev
```

This will start the development server. You can now open the app in the preview window to see your application live!

---

## Part 2: Running on Your Local Computer (Optional)

If you prefer to work on your own computer, you can clone this project and connect it to a local PostgreSQL database.

### Prerequisites

Before you begin, ensure you have the following installed on your machine:
- [Node.js](https://nodejs.org/en) (which includes `npm`)
- [PostgreSQL](https://www.postgresql.org/download/) (the database)
- [Git](https://git-scm.com/downloads) (for version control)
- (Recommended) [pgAdmin](https://www.pgadmin.org/download/) (a visual tool to manage your database)

### Step 1: Install Dependencies

Open your terminal in the project's root directory and run:

```bash
npm install
```

### Step 2: Set Up Your PostgreSQL Database

#### A. Create the Database
1.  Open **pgAdmin** and connect to your PostgreSQL instance.
2.  Right-click on **Databases** > **Create** > **Database...**
3.  For the **Database** name, enter `pos_db` and click **Save**.

#### B. Configure the Application
The application needs to know how to connect to your new database.

1.  In the root directory of your project, create a new file named `.env.local`.
2.  Copy and paste the following line into that file:
    ```
    POSTGRES_URL="postgresql://postgres:YOUR_PASSWORD_HERE@localhost:5432/pos_db"
    ```
3.  **IMPORTANT**: Replace `YOUR_PASSWORD_HERE` with the actual password for your `postgres` user.
4.  Save the `.env.local` file. This file is ignored by Git, so your password will remain private.

#### C. Create the Database Tables
Now that the application can connect, you need to create the tables.

In your terminal, run:

```bash
npm run db:setup
```

This command reads the `init.sql` file and creates all the necessary tables in your `pos_db` database.

### Step 3: Run the Application

To start the local web server, run:

```bash
npm run dev
```

You can now open your web browser and navigate to the URL shown in the terminal (usually `http://localhost:9002`) to see your application live!
