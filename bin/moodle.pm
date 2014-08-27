package bin::moodle;
use Exporter qw(import);
our @EXPORT_OK = qw(vmd);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vmd {
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
if (lc($ynver) eq "n"){ print "\n"; }
if (lc($ynver) eq "y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}
}

 if ($v =~ /1.6.9/ or $v =~ /1.7.7/ or $v =~ /1.8.9/ or $v =~ /1.9.5/){ $expN = $expN + 1;
 print "+-[|] Moodle < 1.6.9/1.7.7/1.8.9/1.9.5 File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/8297/\n";
 print "+--[-] http://www.1337day.com/exploit/4967\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009030056\n\n";
 }

 if ($v =~ /1.9.3/){ $expN = $expN + 1;
 print "+-[|] Moodle 1.9.3 - Remote Code Execution Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/7437/\n";
 print "+--[-] http://www.1337day.com/exploit/4431\n\n";
 }

 if ($v =~ /1.8.4/){ $expN = $expN + 1;
 print "+-[|] Moodle <= 1.8.4 - Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/6356/\n";
 print "+--[-] http://www.1337day.com/exploit/3592\n\n";
 }

 if ($v =~ /1.8.3/){ $expN = $expN + 1;
 print "+-[|] Moodle <= 1.8.3 'install.php' Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31020/\n\n";
 }

 if ($v =~ /1.7.1/){ $expN = $expN + 1;
 print "+-[|] Moodle 1.7.1 Index.PHP Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30261/\n\n";
 }

 if ($v =~ /1.5.2/){ $expN = $expN + 1;
 print "+-[|] Moodle <= 1.5.2 (moodledata) Remote Session Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3508/\n";
 print "+--[-] http://www.1337day.com/exploit/1610\n\n";
 }

 if ($v =~ /1.5/ or $v =~ /1.6/){ $expN = $expN + 1;
 print "+-[|] Moodle 1.5/1.6 mod/forum/discuss.php navtail Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/29284/\n\n";
 }

 if ($v =~ /1.18.2.2/ or $v =~ /1.6.2/){ $expN = $expN + 1;
 print "+-[|] Moodle Blog 1.18.2.2/1.6.2 Module SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28770/\n\n";
 }
 
 if ($v =~ /1.6.2/){ $expN = $expN + 1;
 print "+-[|] SQL injection - moodle 1.6.2\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006100064\n\n";
 }

 if ($v =~ /2.3.8/ or $v =~ /2.4.5/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.3.8, 2.4.5 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/28174/\n\n";
 }

 if ($v =~ /2.7/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.7 - Persistent XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/34169/\n";
 print "+--[-] http://www.1337day.com/exploit/22480\n\n";
 }

 if ($v =~ /2.5.2/ or $v =~ /2.2.3/){ $expN = $expN + 1;
 print "+-[|] Moodle Remote Command Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/29324/\n";
 print "+--[-] http://www.1337day.com/exploit/21422\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013100211\n\n";
 }

 if ($v =~ /1.6dev/){ $expN = $expN + 1;
 print "+-[|] Moodle <= 1.6dev SQL Injection / Command Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1312/\n";
 print "+--[-] http://www.1337day.com/exploit/197\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2005110029\n\n";
 }

 if ($v =~ /1.(.*)/){ $expN = $expN + 2;
 print "+-[|] Moodle 1.x 'post.php' Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24356/\n|\n";
 print "+-[|] Moodle Help Script 1.x Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24279/\n\n";
 }

 if ($v =~ /1.1/ or $v =~ /1.2/){ $expN = $expN + 1;
 print "+-[|] Moodle 1.1/1.2 Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24071/\n\n";
 }

 if ($v =~ /1.9.14.2/){ $expN = $expN + 1;
 print "+-[|] Moodle 1.9.14.2 Full Puth Disclosure Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19897\n\n";
 }

 if ($v =~ /0.8.8.4/){ $expN = $expN + 1;
 print "+-[|] MLE-Moodle 0.8.8.4 <= Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/20013\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012120155\n\n";
 }

 if ($v =~ /2.3.9/ or $v =~ /2.4.6/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.3.9, 2.4.6 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.1337day.com/exploit/21217\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013090073\n\n";
 }

 if ($v =~ /2.5.0-1/){ $expN = $expN + 1;
 print "+-[|] Moodle CMS 2.5.0-1 Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/21247\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013090118\n\n";
 }

 if ($v =~ /2.6.2/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.6.2 leak sensitive name and summary information\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014050138\n\n";
 }

 if ($v =~ /2.6.1/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.6.1 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014020247\n\n";
 }

 if ($v =~ /2.4.7/){ $expN = $expN + 1;
 print "+-[|] Moodle 2.4.7 Multiple Vulns\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010122\n\n";
 }

 if ($v =~ /2.2.1/){ $expN = $expN + 1;
 print "+-[|] Moodle CMS 2.2.1 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012080171\n\n";
 }

 if ($v =~ /1.6.1/){ $expN = $expN + 1;
 print "+-[|] Sql injection in Moodle\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006090142\n\n";
 }
 
 # Mam-Moodle Mambo Component alpha Remote Inclusion Vulnerability
 # http://www.1337day.com/exploit/604
 # http://www.exploit-db.com/exploits/2064/

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
