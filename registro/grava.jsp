<%@page language="java" import="java.sql.*"%>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome  = request.getParameter("nome");
    String vsobrenome = request.getParameter("sobrenome");
    String vcpf = request.getParameter("cpf");
    String vdata = request.getParameter("data");
    String vgenero = request.getParameter("genero");
    String vemail = request.getParameter("email");
    String vtelefone = request.getParameter("telefone");
    String vsenha = request.getParameter("senha");
    String vConfirmarSenha = request.getParameter("confirmar-senha");

    // variaveis para o banco de dados
    String banco    = "projetopizzahut";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO registro (nome,sobrenome,cpf,data,genero,email,telefone,senha,confirmar_senha) values(?,?,?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vsobrenome);
    stm.setString(3, vcpf);
    stm.setString(4, vdata);
    stm.setString(5, vgenero);
    stm.setString(6, vemail);
    stm.setString(7, vtelefone);
    stm.setString(8, vsenha);
    stm.setString(9, vConfirmarSenha);
    

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='registro.html'>Voltar</a>");
%>