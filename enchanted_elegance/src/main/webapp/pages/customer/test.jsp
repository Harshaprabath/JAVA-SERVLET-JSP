<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Auto-Filter Dataset Example</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .filter-form {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
    </style>
    <script>
        function autoSubmit() {
            document.getElementById('filterForm').submit();
        }
    </script>
</head>
<body>
    <h1>Department Data Filter</h1>

    <%
    // Create sample dataset (usually this would come from a database)
    List<Map<String, String>> dataset = new ArrayList<>();

    Map<String, String> row1 = new HashMap<>();
    row1.put("id", "1");
    row1.put("name", "John Smith");
    row1.put("department", "IT");
    row1.put("salary", "65000");
    dataset.add(row1);

    Map<String, String> row2 = new HashMap<>();
    row2.put("id", "2");
    row2.put("name", "Sarah Johnson");
    row2.put("department", "HR");
    row2.put("salary", "55000");
    dataset.add(row2);

    Map<String, String> row3 = new HashMap<>();
    row3.put("id", "3");
    row3.put("name", "Michael Brown");
    row3.put("department", "IT");
    row3.put("salary", "70000");
    dataset.add(row3);

    Map<String, String> row4 = new HashMap<>();
    row4.put("id", "4");
    row4.put("name", "Emily Davis");
    row4.put("department", "Marketing");
    row4.put("salary", "60000");
    dataset.add(row4);

    Map<String, String> row5 = new HashMap<>();
    row5.put("id", "5");
    row5.put("name", "Robert Wilson");
    row5.put("department", "HR");
    row5.put("salary", "52000");
    dataset.add(row5);

    // Get filter parameter
    String deptFilter = request.getParameter("deptFilter");

    // Create filtered dataset
    List<Map<String, String>> filteredData = new ArrayList<>();

    if (deptFilter == null || deptFilter.isEmpty()) {
        // If no filter is selected, show all data
        filteredData = dataset;
    } else {
        // Filter data by department
        for (Map<String, String> row : dataset) {
            if (row.get("department").equals(deptFilter)) {
                filteredData.add(row);
            }
        }
    }
    %>

    <!-- Filter Form - Auto-submits when dropdown changes -->
    <div class="filter-form">
        <form id="filterForm" method="get">
            <label for="deptFilter">Select Department:</label>
            <select id="deptFilter" name="deptFilter" onchange="autoSubmit()">
                <option value="">All Departments</option>
                <option value="IT" <%= "IT".equals(deptFilter) ? "selected" : "" %>>IT</option>
                <option value="HR" <%= "HR".equals(deptFilter) ? "selected" : "" %>>HR</option>
                <option value="Marketing" <%= "Marketing".equals(deptFilter) ? "selected" : "" %>>Marketing</option>
            </select>
        </form>
    </div>

    <!-- Results Table -->
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
        </tr>
        <% if (filteredData.isEmpty()) { %>
            <tr>
                <td colspan="4">No records found matching your criteria.</td>
            </tr>
        <% } else { %>
            <% for (Map<String, String> row : filteredData) { %>
                <tr>
                    <td><%= row.get("id") %></td>
                    <td><%= row.get("name") %></td>
                    <td><%= row.get("department") %></td>
                    <td>$<%= row.get("salary") %></td>
                </tr>
            <% } %>
        <% } %>
    </table>

    <p>Total records displayed: <%= filteredData.size() %></p>
</body>
</html>