<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Hotel IN</title>

<LINK HREF='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' REL='stylesheet' TYPE='text/css'>
  <LINK HREF ="styleHOME.css" REL="stylesheet">
   <LINK HREF ="style.css" REL="stylesheet">
    <LINK HREF ="style_login.css" REL="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>  
  <div class="container">
<NAV>

  <DIV ID="div_logo">
<A HREF="HOME.html">
<IMG SRC="img/logo.png" ALT="LOGO HOTEL IN" ID="logo">
</A>

<DIV ID="div_opcoes" CLASS="op">

<DIV ID="home">
<A HREF="HOME.html">
<SPAN >HOME</SPAN>
</A>
</DIV>


<DIV ID="sobre" CLASS="op">
<A HREF="sobre.html">
<SPAN >SOBRE</SPAN>
</A>
</DIV>

<DIV ID="login" CLASS="op">
<A HREF="login.html">
<SPAN >LOGIN</SPAN>
</A>
</DIV>

<DIV ID="drop" CLASS="op">
<LI  CLASS="dropdown"> 
              <A HREF="#" CLASS="dropdown-toggle" data-toggle="dropdown" ROLE="button" ARIA-HASPOPUP="true" ARIA-EXPANDED="false"><SPAN>INFORMAÇÕES</SPAN><SPAN CLASS="caret"></SPAN></A> 
              <UL CLASS="dropdown-menu"> 
                <LI CLASS="dropdown-header">Apartamento</LI> 
                <LI><A HREF="#">Classic</A></LI> 
                <LI><A HREF="#">Superior</A></LI> 
                <LI><A HREF="#">Luxo</A></LI> 
                <LI><A HREF="#">HipoAlergênico</A></LI> 
                <LI CLASS="dropdown-header">Suíte</LI> 
                <LI><A HREF="#">Classic </A></LI> 
                <LI><A HREF="#">Master </A></LI> 
              </UL> 
            </LI> 
</DIV>

</DIV>

</NAV>


<?php
  
  $nome = $_POST['nome'];
  $senha = crypt($_POST['senha']);
  $email = $_POST['email'];
  $cpf = $_POST['cpf'];
  $cep = $_POST['cep'];
  $ddd = $_POST['ddd'];
  $tel = $_POST['numero'];
  $tipo= 0 ;
  
  $link = new mysqli('localhost','root','','hotel');  //abre conexao com banco
      if (!$link) { //testa se a conexão existe
        die('Não foi possível conectar. '); 
      }
      else{
        mysqli_set_charset($link, 'utf8');
        $sql = "insert into usuario (nome,senha,email,cpf,tipo,cep) values (?,?,?,?,?,?)";
        $stmt = $link->prepare($sql);
      
        $stmt->bind_param('ssssis',$nome,$senha,$email,$cpf,$tipo,$cep);
        
        $ok = $stmt->execute(); #execute retorna um boolean
        
        if($ok){  #testa se a inserção foi concluída com sucesso   
            echo '<div id="formulario">Os dados foram inseridos com sucesso!</div>';
            }
            else{
            echo "<div id='formulario'>Não foi possível realizar a inserção dos dados"
            ."<br><a href=\"formulario.html\">clique aqui para tentar novamente</a></div>";
          }
      }
  ?>
    
<FOOTER>
    <SPAN>COPYRIGHT</SPAN>
    <DIV ID="redes_sociais">
        <A HREF="#linkface">
            <IMG SRC="img/Face.png" class="face">
        </A>
        <A HREF="#linkInsta">
            <IMG SRC="img/Inst.png" class="face">
        </A>
        <A HREF="#linkTwitter">
            <IMG SRC="img/Twitter.png" class="face">
        </A>
    
</FOOTER>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</div>
</html>