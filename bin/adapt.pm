package bin::adapt;
use Exporter qw(import);
our @EXPORT_OK = qw(vada);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vada {
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
if ($1 > 0){ $ok = "ok"; $v = $1; }
if (length($source) > 0){ }else{ print "\n[~] Error!\n"; exit(); }

if ($ok eq "ok"){
if ($source =~ /Powered by <a href="http:\/\/www.adaptcms.com">AdaptCMS (.*)<\/a>/){ $v = $1; }else{
print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
 if ($ynver eq "y" or $ynver eq "Y"){
  print "Version: ";
  $v=<STDIN>; chomp $v;
 }
}
}

 if ($v =~ /2.0.4/){ $expN = $expN + 2;
  print "+-[|] AdaptCMS 2.0.4 (config.php, question parameter) SQL Injection Vulnerability\n";
  print "+--[-] http://www.exploit-db.com/exploits/24452/\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2013020007\n";
  print "+--[-] http://www.1337day.com/exploit/20278\n|\n";  
  print "+-[|] AdaptCMS 2.0.4 CSRF Vulnerability\n";
  print "+--[-] http://www.1337day.com/exploit/19578\n\n";
  }
 
  if ($v =~ /1.3/){ $expN = $expN + 1;
  print "+-[|] AdaptCMS Lite <= 1.3 - Blind SQL Injection Exploit\n";
  print "+--[-] http://www.exploit-db.com/exploits/6662/\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2008100149\n\n";  
  }
 
  if ($v =~ /1.4/){ $expN = $expN + 1;
  print "+-[|] adaptcms lite 1.4 (xss/rfi) Multiple Vulnerabilities\n";
  print "+--[-] http://www.exploit-db.com/exploits/8016/\n";
  print "+--[-] http://www.1337day.com/exploit/4822\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2009020174\n\n";  
  }
 
  if ($v =~ /1.5/){ $expN = $expN + 2;
  print "+-[|] adaptcms lite 1.5 - Remote File Inclusion Vulnerability\n";
  print "+--[-] http://www.exploit-db.com/exploits/10249/\n";
  print "+--[-] http://www.1337day.com/exploit/10040\n|\n";  
  print "+-[|] AdaptCMS_Lite_1.5 change admin (user, passwd) & add new admin\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2010030121\n";
  print "+--[-] http://www.exploit-db.com/exploits/11899/\n\n";
  }
 
  if ($v =~ /2.0.0/){ $expN = $expN + 2;
  print "+-[|] AdaptCMS 2.0.0 Beta (init.php) Remote File Inclusion Vulnerability\n";
  print "+--[-] http://www.exploit-db.com/exploits/14016/\n";
  print "+--[-] http://www.1337day.com/exploit/12913\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2010070178\n|\n";  
  print "+-[|] AdaptCMS 2.0.0 CSRF Vulnerability (Add Admin)\n";
  print "+--[-] http://www.1337day.com/exploit/18249\n\n";
  }
 
  if ($v =~ /2.0.1/){ $expN = $expN + 2;
  print "+-[|] AdaptCMS 2.0.1 Beta Release Remote File Inclusion Vulnerability (msf)\n";
  print "+--[-] http://www.exploit-db.com/exploits/15237/\n";
  print "+--[-] http://www.1337day.com/exploit/14427\n|\n";  
  print "+-[|] AdaptCMS 2.0.1 Cross Site Scripting / Bypass\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2011090113\n\n";
  }
 
  if ($v =~ /3.0.1/){ $expN = $expN + 1;
  print "+-[|] AdaptCMS 3.0.1 Cross Site Scripting\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2013100073\n\n";  
  }
 
  if ($v =~ /2.0.2/){ $expN = $expN + 1;
  print "+-[|] http://cxsecurity.com/issue/WLB-2012060027\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2013100073\n\n";  
  }
  

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
