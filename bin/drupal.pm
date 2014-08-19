package bin::drupal;
use Exporter qw(import);
our @EXPORT_OK = qw(vdru);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vdru {
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                                                
$NA    = int(rand(12));#                                                      ______           /
$A[0]  = 'Mozilla/4.0 (compatible; MSIE 5.0; Windows ME) Opera 5.11 [en]';#   \    0\         /
$A[1]  = 'Mozilla/4.8 [en] (Windows NT 6.0; U)';#                              +-----+ +-----+ 
$A[2]  = 'Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.10 sun4u; X11)';#                /\/\/\/
$A[5]  = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)';#                      /    
$A[6]  = 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)';#                    /     
$A[7]  = 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.6)';#           /      
$A[8]  = 'Microsoft Internet Explorer/4.0b1 (Windows 95)';#                       /       
$A[9]  = 'Opera/8.00 (Windows NT 5.1; U';#                                       /        
$A[10] = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)';#                     /               
$A[11] = 'Mozilla/4.0 (compatible; MSIE 5.0; AOL 4.0; Windows 95; c_athome)';# /
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
$c = LWP::UserAgent->new(agent => $A[$NA]);#                                   \ /\/\/\/\/\/\
$c->timeout(30);#                                                               +------------+
$c->env_proxy;#                                                                               \
$source = $c->get($ARGV[0])->content;#                                                         \
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
if($source eq ""){ print "\n[~] Website offline, try again!\n"; exit(); }#                      |
if($source =~ /400 URL must be absolute/){ print "\n[~] Error 404!\n\n"; exit(); }#             |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
$expN = 0;
if (length($source) > 0){ }else{ print "\n[~] Error!\n"; exit(); }

if ($source =~ /name="Generator" content="Drupal (.*) (.*)/){ $v = $1; 
}else{ 
print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
if ($ynver eq "y" or $ynver eq "Y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}
}


 if ($v =~ /7.(.*)/){ $expN = $expN + 11;
 print "+-[|]  Drupal Webform Template 7.x Access Bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014030101\n|\n";
 print "+-[|] Drupal Rules 7.x Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013030248\n|\n";
 print "+-[|] Drupal 7.x Node access user reference\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013050207\n|\n";
 print "+-[|] Drupal 7.x Apache Solr Autocomplete Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013060225\n|\n";
 print "+-[|] Drupal 7.x Fast Permissions Administration Access bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013060226\n|\n";
 print "+-[|] Drupal 7.x Fonecta verify Cross Site Scripting \n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013060244\n|\n";
 print "+-[|] Drupal 7.x Exposed Filter Data Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013060245\n|\n";
 print "+-[|] Drupal 7.x Bean Cross Site Scripting (XSS)\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013100167\n|\n";
 print "+-[|] Drupal 7.x Payment for Webform Access Bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013110044\n\n";
 print "+-[|] Drupla 7.x Node Access Keys Access Bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013110045\n|\n";
 print "+-[|] Drupal 7.x Ubercart Session Fixation Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013120137\n\n";
 }
 
 if ($v =~ /6.(.*)/ or $v =~ /7.(.*)/){ $expN = $expN + 2;
 print "+-[|] Drupal 6.x / 7.x PRNG / XSS / Open Redirect\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013110152\n|\n";
 print "+-[|] Drupal 6.x / 7.x Impersonation / Access Bypass / Hardening\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010102\n\n";
 }

 if ($v =~ /6.16/ or $v =~ /5.21/){ $expN = $expN + 1;
 print "+-[|]  Drupal <= 6.16 and 5.21 - DoS (0day)\n";
 print "+--[-] http://www.exploit-db.com/exploits/10826/\n\n"
 }

 if ($v =~ /6.15/){ $expN = $expN + 1;
 print "+-[|]  Drupal <= 6.15 Multiple Permanent XSS (0day)\n";
 print "+--[-] http://www.exploit-db.com/exploits/11060/\n|\n";
 print "+-[|] Drupal 6.15, 5.21 (API function drupal_goto) Open Redirect Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/11190\n\n";
 #Drupal 6.15 Twitter module v 6.x-2.6 clear text Vulnerability
 #http://www.1337day.com/exploit/10939
 }
 
 if ($v =~ /5.21/){ $expN = $expN + 2;
 print "+-[|] Drupal 6.15, 5.21 (API function drupal_goto) Open Redirect Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/11190\n|\n";
  print "+-[|]  0day Drupal DOS <= 6.16 and 5.21\n";
 print "+--[-] http://www.1337day.com/exploit/9816\n\n"
 }
 
 if ($v =~ /5.1/){ $expN = $expN + 1;
 print "+-[|]  Drupal < 5.1 - (post comments) Remote Command Execution Exploit (2)\n";
 print "+--[-] http://www.exploit-db.com/exploits/3312/\n";
 print "+--[-] http://www.1337day.com/exploit/1503\n\n"
 }

 if ($v =~ /5.2/){ $expN = $expN + 1;
 print "+-[|]  Drupal <= 5.2 PHP Zend Hash Vulnerability Exploitation Vector\n";
 print "+--[-] http://www.exploit-db.com/exploits/4510/\n";
 print "+--[-] http://www.1337day.com/exploit/2213\n\n"
 }

 if ($v =~ /4.7.6/){ $expN = $expN + 1;
 print "+-[|]  Drupal < 4.7.6 - (post comments) Remote Command Execution Exploit (2)\n";
 print "+--[-] http://www.exploit-db.com/exploits/3313/\n";
 print "+--[-] http://www.1337day.com/exploit/1504\n\n"
 }

 if ($v =~ /4.7/){ $expN = $expN + 1;
 print "+-[|]  Drupal <= 4.7 (attachment mod_mime) Remote Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1821/\n";
 print "+--[-] http://www.1337day.com/exploit/440\n\n"
 }

 if ($v =~ /4.5.3/ or $v =~ /4.6.1/){ $expN = $expN + 1;
 print "+-[|]  Drupal <= 4.5.3 & <= 4.6.1 Comments PHP Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1088/\n";
 print "+--[-] http://www.1337day.com/exploit/150\n\n"
 }

 if ($v =~ /4.1/ or $v =~ /4.2/){ $expN = $expN + 1;
 print "+-[|]  Drupal 4.1/4.2 Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22940/\n\n"
 }

 if ($v =~ /4.0/){ $expN = $expN + 1;
 print "+-[|]  Drupal 4.0 News Message HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/21863/\n\n"
 }

 if ($v =~ /7.12/){ $expN = $expN + 1;
 print "+-[|]  Drupal CMS 7.12 (latest stable release) Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18564/\n\n"
 }

 if ($v =~ /6.16/){ 
  if ($source =~ /(.*)index.php?q=(.*)/){ $expN = $expN + 1;
   print "+-[|]  Drupal Prior to 6.16 and 5.22 Multiple Security Vulnerabilities\n";
   print "+--[-] http://www.exploit-db.com/exploits/33706/\n\n"
  }
 }

 if ($v =~ /6.(.*)/){ $expN = $expN + 4;
 print "+-[|]  Drupal's <= v6.x-1.0 Realname User Reference Widget contributed module\n";
 print "+--[-] http://www.1337day.com/exploit/10946\n|\n";
 print "+-[|] Drupal 6.x Webform XSS\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013050214\n|\n";
 print "+-[|] Druapl 6.x Spaces Access bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013100166\n|\n";
 print "+-[|] Druapl 6.x Secure Pages Missing Encryption of Sensitive Data\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013110046\n\n";
 }

 if ($v =~ /7.15/){ $expN = $expN + 1;
 print "+-[|]  Drupal 7.15 Path Disclosure Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19456\n\n"
 }

 if ($v =~ /6.16/){ $expN = $expN + 1;
 print "+-[|]  0day Drupal DOS <= 6.16 and 5.21\n";
 print "+--[-] http://www.1337day.com/exploit/9816\n\n"
 }

 if ($v =~ /7.22/ or $v =~ /6.28/){ $expN = $expN + 1;
 print "+-[|]  Drupal 7.22 / 6.28 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080126\n\n"
 }

 if ($v =~ /7.26/){ $expN = $expN + 1;
 print "+-[|]  Drupal 7.26 Custom Search 7.x-1.13 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014040018\n\n"
 }

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
