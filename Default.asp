<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "DSN=SQLite3 Datasource;Database=C:/src/vb-script-sql/company.db;"

Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "SELECT * FROM Employees", conn
%>

<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Position</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>

<%
Do Until rs.EOF
%>
  <tr>
    <td><%=rs("ID")%></td>
    <td><%=rs("Name")%></td>
    <td><%=rs("Position")%></td>
    <td><a href='edit.asp?id=<%=rs("ID")%>'>Edit</a></td>
    <td><a href='delete.asp?id=<%=rs("ID")%>'>Delete</a></td>
  </tr>
<%
  rs.MoveNext
Loop
rs.Close
conn.Close
%>

</table>