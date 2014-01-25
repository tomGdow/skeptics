<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html lang="en-US">
      <head>
        <meta charset="UTF-8"/>
        <title>Users XML (Natural Skeptics)</title>
        <link rel ="stylesheet" type ="text/css" href = "foundation.css" />
      </head>
      <body id = "xmlbody">
        <h2>Users XML File</h2>
        <table>
          <tr>
            <th>Email</th>
            <th>User Id</th>
            <th>Created At</th>
            <th>Updated At</th>
            <th>Sign-in Count</th>
            <th>Current Sign In</th>
            <th>Last Sign In</th>
            <th>Current IP</th>
            <th>Last IP</th>
          </tr>
          <xsl:for-each select="root/myUsers">
            <tr>
              <td><xsl:value-of select="email"/></td>
              <td><xsl:value-of select="userID"/></td>
              <td><xsl:value-of select="createdAT"/></td>
              <td><xsl:value-of select="updatedAT"/></td>
              <td><xsl:value-of select="signInCount"/></td>
              <td><xsl:value-of select="currSignInAt"/></td>
              <td><xsl:value-of select="lastSignInAt"/></td>
              <td><xsl:value-of select="currSignInIP"/></td>
              <td><xsl:value-of select="lastSignInIP"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
