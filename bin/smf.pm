package bin::smf;
use Exporter qw(import);
our @EXPORT_OK = qw(vsmf);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vsmf {
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

if ($source =~ /<a href="http:\/\/www.simplemachines.org\/" title="Simple Machines Forum" target="_blank">Powered by SMF (.*)<\/a>/){ 
$v = $1; 
}else{ 
print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
if ($ynver eq "y" or $ynver eq "Y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}
}

 if ($v =~ /1.1.11/){ $expN = $expN + 3;
 print "+-[|] Simple Machines Forums Cross-Site Scripting Vulnerability \n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010020012\n|\n";
 print "+-[|] Simple Machines Forum 1.1.11 cross site scripting \n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009120067\n|\n";
 print "+-[|] Simple Machines Forums (SMF 1.1.11) Multiple Search DDOS\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010020076\n\n";
 }

 if ($v =~ /1.1.5/){ $expN = $expN + 1;
 print "+-[|] Simple Machines Forum <= 1.1.5 Admin Reset Password Exploit (win32)\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009080123\n\n";
 }

 if ($v =~ /1.0.2/){ $expN = $expN + 1;
 print "+-[|] SMF Mod Member Awards 1.0.2 Blind SQL Injection Exploit\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009070106\n";
 print "+--[-] http://www.1337day.com/exploit/5436\n\n";
 }

 if ($v =~ /1.1.4/){ $expN = $expN + 2;
 print "+-[|] Simple Machines Forum <= 1.1.4 Remote SQL Injection Exploit\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009040221\n|\n";
 print "+-[|] SMF <= 1.1.4 - Audio CAPTCHA Security Bypass Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31678/\n\n";
 }

 if ($v =~ /1.1.6/){ $expN = $expN + 2;
 print "+-[|] Simple Machines Forum <= 1.1.6 (LFI) Code Execution Exploit\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009040145\n|\n";
 print "+-[|] Simple Machines Forum (SMF) 1.1.6 Code Execution Exploit\n";
 print "+--[-] http://www.1337day.com/exploit/4070\n";
 print "+--[-] http://www.exploit-db.com/exploits/6993/\n\n";
 
 }

 if ($v =~ /1.1.7/){ $expN = $expN + 1;
 print "+-[|] SMF 1.1.7 Persistent XSS (requires permision to edit censor)\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009020005\n\n";
 }

 if ($v =~ /1.0.7/){ $expN = $expN + 1;
 print "+-[|] SMF 1.0.7 and lower plus 1.1rc2 and lower - IP spoofing vulnerability/IP ban evasion vulnerability [ Disputed / BOGUS ]\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2007020059\n\n";
 }

 if ($v =~ /1.0.6/){ $expN = $expN + 1;
 print "+-[|] Simple Machines Forum - SMF 'X-Forwarded-For' XSS Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006030042\n|\n";

 }

 if ($v =~ /1.1/){ $expN = $expN + 2;
 print "+-[|] Simple Machines Forum 'SMF Shoutbox' Mod Persistent XSS\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008020053\n|\n";
 print "+-[|] SMF 1.1 Index.PHP HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29499/\n\n";
 }

 if ($v =~ /2.0/){ $expN = $expN + 2;
 print "+-[|] Simple Machines forum (SMF) 2.0 session hijacking\n";
 print "+--[-] http://www.1337day.com/exploit/16628\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011080055\n";
 print "+--[-] http://www.exploit-db.com/exploits/17637/\n|\n";
 print "+-[|] SMF 2.0 / 1.1.14 XSRF Filter Bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011080168\n\n";
 }

 if ($v =~ /1.3.1.3/){ $expN = $expN + 1;
 print "+-[|] SMF Forum Mambo Component <= 1.3.1.3 Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/2021/\n";
 print "+--[-] http://www.1337day.com/exploit/583\n\n";
 }

 if ($v =~ /3.1.1/){ $expN = $expN + 1;
 print "+-[|] eFiction <= 3.1.1 (path_to_smf) Remote File Include Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/3361/\n";
 print "+--[-] http://www.1337day.com/exploit/1534\n\n";
 }

 if ($v =~ /1.1.19/ or $v =~ /2.0.6/){ $expN = $expN + 1;
 print "+-[|] SMF 1.1.19, 2.0.6 Multiple Vulns\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013120190\n\n";
 }

 if ($v =~ /2.0.5/){ $expN = $expN + 3;
 print "+-[|] SMF 2.0.5 Remote Shell Upload Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013100157\n|\n";
 print "+-[|] SMF 2.0.5 Cross Site Request Forgery [ Disputed / BOGUS ]\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013090165\n|\n";
 print "+-[|] Simple Machines Forum (SMF) <= 2.0.5 multiple vulnerabilities\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080129\n\n";
 }

 if ($v =~ /2.0.1/){ $expN = $expN + 1;
 print "+-[|] SMF <= 2.0.1 - SQL Injection, Privilege Escalation\n";
 print "+--[-] http://www.exploit-db.com/exploits/18214/\n";
 print "+--[-] http://www.1337day.com/exploit/17249\n\n";
 }

 if ($v =~ /2.0.4/){ $expN = $expN + 3;
 print "+-[|] SMF 2.0.4 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013090110\n|\n";
 print "+-[|] SMF 2.0.4 admin payload code execution\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013040163\n|\n";
 print "+-[|] SMF 2.0.4 Fake php code injection [ Disputed / BOGUS ]\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013090164\n\n";
 }

 if ($v =~ /1.1.15/){ $expN = $expN + 1;
 print "+-[|] SMF <= 1.1.15 captach bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011120073\n\n";
 }

 if ($v =~ /1.1.16/){ $expN = $expN + 1;
 print "+-[|] SMF Portal 1.1.16 (fckeditor) Arbitrary File Upload Vulnerability [ Disputed / BOGUS ]\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012010174\n\n";
 }

 if ($v =~ /1.1.8/){ $expN = $expN + 1;
 print "+-[|] Simple Machines Forum 1.1.8 avatar related remote php file\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010030137\n";
 print "+--[-] http://www.exploit-db.com/exploits/11905/\n\n";
 }

 if ($v =~ /1.1.14/){ $expN = $expN + 1;
 print "+-[|] SMF 2.0 / 1.1.14 XSRF Filter Bypass\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011080168\n\n";
 }
 
 if ($v =~ /2.0 RC5/ or $v =~ /2.0 rc5/ or $v =~ /2.0-RC5/ or $v =~ /2.0-rc/){ $expN = $expN + 1;
 print "+-[|] SMF 2.0 RC5 Remote Shell Upload Exploit\n";
 print "+--[-] http://www.1337day.com/exploit/15813\n\n";
 }
 
 if ($v =~ /1.1 RC2/ or $v =~ /1.1 rc2/ or $v =~ /1.1-RC2/ or $v =~ /1.1-rc2/){ $expN = $expN + 2;
 print "+-[|] [Xss] IN SMF 1.1 RC2\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006100134\n|\n";
 print "+-[|] Simple Machines Forum <=1.1RC2 unset() vulnerabilities\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006090003\n\n";
 }
 
 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
