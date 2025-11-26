

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Eligibility Result</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: "Poppins", Arial, sans-serif;
      background: linear-gradient(135deg,#0b0b0b,#2a0000);
      color: #fff;
      padding: 32px;
    }

    .card {
      width: 680px;
      max-width: 95%;
      background: rgba(24,24,24,0.95);
      border: 1px solid rgba(255,76,76,0.18);
      border-radius: 14px;
      padding: 28px 30px;
      box-shadow: 0 12px 40px rgba(0,0,0,0.6), inset 0 0 18px rgba(255,0,0,0.03);
      backdrop-filter: blur(6px);
    }

    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      margin-bottom: 18px;
    }

    .title {
      font-size: 20px;
      color: #ffb3b3;
      font-weight: 700;
      letter-spacing: .4px;
    }

    .status {
      font-size: 14px;
      color: #ffdede;
      opacity: 0.9;
    }

    .content {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 18px 28px;
      margin-top: 10px;
      align-items: start;
    }

    .field {
      background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
      padding: 14px;
      border-radius: 10px;
      border: 1px solid rgba(255,76,76,0.06);
    }

    .label {
      display:block;
      font-size: 12px;
      color: #e6e6e6;
      opacity: 0.8;
      margin-bottom: 8px;
      font-weight: 600;
    }

    .value {
      font-size: 16px;
      color: #fff;
      font-weight: 600;
      word-break: break-word;
    }

    .result {
      grid-column: 1 / -1;
      margin-top: 18px;
      padding: 16px;
      border-radius: 10px;
      display:flex;
      align-items:center;
      gap:14px;
      border: 1px solid rgba(255,76,76,0.12);
      background: linear-gradient(90deg, rgba(255,76,76,0.04), rgba(255,0,0,0.02));
    }

    .badge {
      min-width: 56px;
      height: 56px;
      border-radius: 10px;
      display:flex;
      align-items:center;
      justify-content:center;
      font-weight:700;
      font-size:18px;
      color:#fff;
      background: linear-gradient(180deg,#ff4c4c,#b30000);
      box-shadow: 0 6px 18px rgba(179,0,0,0.28);
    }

    .result-text {
      font-size: 16px;
      color: #fff;
      line-height: 1.3;
      font-weight: 600;
    }

    .muted {
      display:block;
      margin-top:6px;
      font-size:13px;
      color:#ffdede;
      opacity:0.85;
      font-weight:500;
    }

    .actions {
      margin-top: 20px;
      display:flex;
      gap:12px;
    }

    .btn {
      padding: 10px 14px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
      font-weight:700;
      letter-spacing: .2px;
    }

    .btn-primary {
      background: linear-gradient(90deg,#ff4c4c,#b30000);
      color: #fff;
      box-shadow: 0 8px 20px rgba(179,0,0,0.18);
    }

    .btn-outline {
      background: transparent;
      border: 1px solid rgba(255,255,255,0.06);
      color: #ffdede;
    }

    @media (max-width:600px){
      .content { grid-template-columns: 1fr; }
      .badge { min-width:48px; height:48px; font-size:16px; }
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="header">
      <div class="title">Valid User Data</div>
      <div class="status">Result generated</div>
    </div>

    <div class="content">
      <div class="field">
        <span class="label">Name</span>
        <span class="value"><%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %></span>
      </div>

      <div class="field">
        <span class="label">Age</span>
        <span class="value"><%= request.getAttribute("age") != null ? request.getAttribute("age") : "" %></span>
      </div>

      <div class="field">
        <span class="label">Country</span>
        <span class="value"><%= request.getAttribute("country") != null ? request.getAttribute("country") : "" %></span>
      </div>

      <div class="field">
        <span class="label">Aadhar Number</span>
        <span class="value"><%= request.getAttribute("adhar") != null ? request.getAttribute("adhar") : "" %></span>
      </div>

      <div class="result">
        <div class="badge">
          <% 
             String gender = (String)request.getAttribute("gender");
             String message = (String)request.getAttribute("message");
             String name = (String)request.getAttribute("name");
             boolean eligible = message != null && message.toLowerCase().contains("eligible");
          %>
          <%= eligible ? "OK" : "NO" %>
        </div>

        <div>
          <div class="result-text">
            <%
              if (gender != null && name != null && message != null) {
                  String salutation = gender.equalsIgnoreCase("male") ? "Mr." : "Ms.";
            %>
              <%= salutation %> <%= name %> — <%= message %>
            <%
              } else {
            %>
              <%= message != null ? message : "Result unavailable" %>
            <%
              }
            %>
          </div>
          <span class="muted">Checked using basic eligibility rules (age & gender).</span>
        </div>
      </div>

      <div class="actions" style="grid-column:1 / -1;">
        <form action="person.html" method="get" style="display:inline;">
          <button class="btn btn-outline">Back to Form</button>
        </form>
        <form action="ValidationServlet" method="post" style="display:inline;">
          <!-- re-submit would require fields; using Back is simpler -->
          <button class="btn btn-primary" type="button" onclick="window.location='person.html'">Submit New</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
