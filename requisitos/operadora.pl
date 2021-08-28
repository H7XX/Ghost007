#!/usr/bin/perl
#--------------------------info------------------------------
#cada servidor possibilita apenas seis consultas ip/dia     -
#------------------------------------------------------------
use LWP::UserAgent;
use v5.10;
use warnings;
use strict;
 
my ($service,$num,$ua,$resp,$cont,$cdgvl,$cod,%tcod);
 
 printf "
	       `--              --`                                        
             `+dNd              dNd+`                                      
            -dMMMm.            .mMMMd-                                     
           `mMMMd:              :dMMMm`                                    
           oMMMm`                `mMMMo                                    
           oMMMN.                .NMMMo                                    
           .NMMMNyoosyyhhhhyysooyNMMMN.                                    
            -NMMMMMMMMMMMMMMMMMMMMMMN-                                     
             .NMMMMMMMMMMMMMMMMMMMMN.                                           
              .MMMMNMMMMMMMMMMNMMMM.                                       
               mMm/.-sNMMMMNs-./mMm                                        
               oM+    sMMMMs    +Mo                                        
               `ds    :NMMN:    sd`                                        
                .s+``.yMMMMy.``+s.                                         
                  -+shNMMMMNhs+-            
        Criado por: rafaelmspc
	Modificado por: ♤H7X♤ \n";
 
printf "-\n"x0;
printf "[!] Cada servidor possibilita apenas seis consultas ip/dia \n
{1} Servidor 1 
{2} Servidor 2
{3} Servidor 3\n";
$service = <STDIN> ; chomp($service);
printf "-"x30;
printf "\n";
printf "\nQual o nº do telefone com DDD 
Ex: 2199875140\n";
$num = <STDIN> ; chomp($num);
printf "-"x30;
printf "\n";
 %tcod =  (
  	12 =>  "Operadora:CTBC.",
    14 =>  "Operadora:Brasil Telecom.",
    20 =>  "Operadora:Vivo.",
    21 =>  "Operadora:Claro.",
    31 =>  "Operadora:Oi.",
    24 =>  "Operadora:Amazonia.",
    37 =>  "Operadora:Unicel.",
    41 =>  "Operadora:TIM.",
    77 =>  "Operadora:Nextel.",
    43 =>  "Operadora:SerComercio.",
    81 =>  "Operadora:Datora.",
    98 =>  "Telefone Fixo.",
    99 =>  "Nº nao encontrado.",
    999 =>  "Chave invalida!",
    995 => "IP excedeu 6 consultas/hora nas ultimas 24 horas",
    990 => "IP na lista negra." ); 
 
 
for (1..3){
	$ua = LWP::UserAgent->new();
	$ua-> agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.4) Gecko/2008102920 Firefox/3.0.4");  
	$ua->timeout( 15 );
	$resp = $ua->get("http://consultanumero$service.telein.com.br/sistema/consulta_numero.php?chave=senhasite&numero=$num");
	$cod = substr($resp->decoded_content, 0,2);
		if ($cod =~ m/\d/){
			printf "[+] Numero:$num\t$tcod{$cod}\n";
		exit
}else {$cod = substr($resp->decoded_content, 21,23);
	$_++;
	printf "[!] $tcod{$cod}\n[!] Tentando servidor n $_\n";}
}

