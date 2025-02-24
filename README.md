# Data Visualization Dashboard

A web application built using **ASP.NET** for **data visualization** of database records. This project provides interactive charts and insights from structured data.

## Features
- Dynamic data visualization with charts and graphs
- Database connectivity for fetching and displaying records
- Filtering and sorting functionalities


## Tech Stack
- **Backend:** ASP.NET Core / ASP.NET MVC
- **Frontend:** HTML, CSS, JavaScript, Chart.js
- **Database:** SQL Server (Team127.sql)
- **IDE:** Visual Studio

## Database Setup
### 1. Import `Team127.sql` into SQL Server
1. Open **SQL Server Management Studio (SSMS)**.
2. Create a new database: `Team127_DB`.
3. Open the `Team127.sql` file and execute the script to set up the tables and data.

### 2. Configure Connection String
In `appsettings.json` or `web.config`, update the database connection string:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=your_server;Database=Team127_DB;User Id=your_username;Password=your_password;"
}
```

## Installation & Running
### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/Data-Visualization-Dashboard.git
```

### 2. Open in Visual Studio
1. Open `WebApplication1.sln` in **Visual Studio**.
2. Restore NuGet Packages: `Tools -> NuGet Package Manager -> Manage NuGet Packages for Solution -> Restore`.
3. Ensure **SQL Server** is set up correctly with `Team127.sql`.

### 3. Run the Application
Click on the **Run** button in Visual Studio or use:
```bash
dotnet run
```

## Future Improvements
- Add real-time data updates
- Implement machine learning-based analytics
- Enhance UI with React or Angular

## Contributing
Feel free to submit issues or pull requests.

## License
MIT License.

