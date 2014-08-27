package bin::frog;
use Exporter qw(import);
our @EXPORT_OK = qw(vfrog);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vfrog {
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

print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if (lc($ynver) eq "n"){ print "\n"; }
if (lc($ynver) eq "y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}

  if ($v =~ /0.7/){ $expN = $expN + 1;
  print "+-[|] Frogss CMS <= 0.7 - Remote SQL Injection Exploit\n";
  print "+--[-] http://www.exploit-db.com/exploits/3731/\n";
  print "+--[-] http://www.1337day.com/exploit/1752\n\n";  
  }

  if ($v =~ /0.9.5/){ $expN = $expN + 5;
  print "+-[|] Frog CMS 0.9.5 Cross Site Request Forgery / Cross Site Scripting\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2010110113\n|\n";
  print "+-[|] Frog 0.9.5 - CSRF Vulnerability\n";
  print "+--[-] http://www.exploit-db.com/exploits/10414/\n";
  print "+--[-] http://www.1337day.com/exploit/10223\n";
  print "+--[-] http://www.1337day.com/exploit/10204\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2010060052\n|\n";  
  print "+-[|] Frog CMS 0.9.5 - Multiple CSRF Vulnerabilities\n";
  print "+--[-] http://www.exploit-db.com/exploits/14329/\n";
  print "+--[-] http://www.1337day.com/exploit/13291\n";
  print "+--[-] http://cxsecurity.com/issue/WLB-2010070075\n|\n";
  print "+-[|] frog cms 0.9.5 - Multiple Vulnerabilities\n";
  print "+--[-] http://www.exploit-db.com/exploits/15615/\n";
  print "+--[-] http://www.1337day.com/exploit/14966\n|\n";
  print "+-[|] Frog CMS 0.9.5 - Arbitrary File Upload\n";
  print "+--[-] http://www.exploit-db.com/exploits/33983/\n\n";
  }

  if ($v =~ /0.4/){ $expN = $expN + 1;
  print "+-[|] CMS Frogss <= 0.4 (podpis) Remote SQL Injection Exploit\n";
  print "+--[-] http://www.1337day.com/exploit/750\n";
  print "+--[-] http://www.exploit-db.com/exploits/2262/\n\n";  
  }

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
