<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="McGreen_prueba1.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Roboto;
            background-color: rgba(15, 70, 35, 0.90);
            color: #fff;
            overflow: hidden;
        }

        .contenedor {
            width: 100%;
            z-index: 1;
        }

        .contenedor::before {
            content: '';
            position: absolute;
            background-color: #fff;
            width: 100%;
            height: 40px;
            transform: translateX(200px) translateY(-120px) rotate(30deg);
            z-index: -1;
        }
        
        .form-usuario  {
            margin: 150px auto; 
            padding: 5px;
            width: 600px;
            height: 250px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.6);
            color: #fff;
            backdrop-filter: blur(100px);
            -webkit-backdrop-filter: blur(100px);
            background-color: rgba(70, 143, 95, 0.1);
            border-radius: 12px;
        }

        .form-usuario > h1 {
            text-align: center;
        }

        .input-form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .input-form > input[type="text"] {
            outline: none;
            border: none;
            padding: 8px 5px;
            width: 40%;
            
        }

        .input-form > label {
            font-weight: 500;
        }

        .btn-form {
            margin: 0 auto;
            padding: 10px;
            text-align: center;
            width: 100px;
            outline: none;
            border: none;
            font-size: 1em;
            border-radius: 5px;
            background: rgba(15, 70, 35, 0.90);
            color: #fff;
            transition: all 0.1s ease-in;
        }

        .btn-form:hover {
            cursor: pointer;
            box-shadow: 0px 5px 10px rgba(6, 35, 16, 0.90);
        }

        .text-center {
            text-align: center;
        }

    </style>
</head>
<body>
    <div class="contenedor">
        <form id="form1" runat="server" class="form-usuario">
            <h1>Iniciar sesión</h1>
            <div class="input-form">
                <label>Email:</label>
                <asp:TextBox runat="server" ID="email" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
            <div class="input-form">
                <label>Password:</label>
                <asp:TextBox runat="server" ID="pass" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btn_Entrar" Text="Entrar" CssClass="btn-form" OnClick="btn_Entrar_Click" />
        </form>
    </div>
    <footer class="text-center">
        <p> @<%= DateTime.Now.Year %> Derechos reservados <strong>Fluidos McGreen de México S.A de C.V</strong></p>
        <p>Fecha: <%= DateTime.Now.ToString("dd/MM/yyyy") %></p>
    </footer>
</body>
</html>
