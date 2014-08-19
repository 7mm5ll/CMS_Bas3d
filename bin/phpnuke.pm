package bin::phpnuke;
use Exporter qw(import);
our @EXPORT_OK = qw(vphn);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vphn {
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
$v = $1; 
if (length($source) > 0){ }else{ print "\n[~] Error!\n"; exit(); }

print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
if ($ynver eq "y" or $ynver eq "Y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}

 if ($v =~ /8.2.4/){ $expN = $expN + 2;
 print "+-[|] PHP-Nuke 8.2.4 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/29733/\n|\n";
 print "+-[|] PHP-Nuke 8.2.4 Cross Site Scripting / File Inclusion Vulnerabilities\n";
 print "+--[-] http://www.1337day.com/exploit/21548\n\n";
 }

 if ($v =~ /7.0/ or $v =~ /8.1/ or $v =~ /8.1.35/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 7.0/8.1/8.1.35 - Wormable Remote Code Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/12510/\n";
 print "+--[-] http://www.1337day.com/exploit/12128\n\n";
 }

 if ($v =~ /8.1.0.3.5b/){ $expN = $expN + 3;
 print "+-[|] PHP-Nuke <= 8.1.0.3.5b (Downloads) Remote Blind SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18148/\n";
 print "+--[-] http://www.1337day.com/exploit/17077\n";
 print "+--[-] http://www.1337day.com/exploit/15481\n|\n";
 print "+-[|] PHP-Nuke <= 8.1.0.3.5b (Your_Account Module) Remote Blind SQL Injection (Benchmark Mode)\n";
 print "+--[-] http://www.exploit-db.com/exploits/14320/\n|\n";
 print "+-[|] PHP-Nuke <= 8.1.0.3.5b Remote Command Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/14319/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010070069\n\n";
 }

 if ($v =~ /8.1-seo-Arabic/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke-8.1-seo-Arabic Remote File Include\n";
 print "+--[-] http://www.exploit-db.com/exploits/14628/\n";
 print "+--[-] http://www.1337day.com/exploit/13683\n\n";
 }

 if ($v =~ /8.0/){ $expN = $expN + 14;
 print "+-[|] PHP-Nuke <= 8.0 (Web_Links Module) Remote Blind SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/14316/\n";
 print "+--[-] http://www.1337day.com/exploit/13256\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 - Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/14124/\n|\n";
 print "+-[|] PHP-Nuke 8.0 'main/tracking/userLog.php' SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33011/\n|\n";
 print "+-[|] PHP-Nuke 8.0 Downloads Module 'query' Parameter Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33021/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009010061\n";
 print "+--[-] http://www.1337day.com/exploit/10000\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 XSS & HTML Code Injection in News Module\n";
 print "+--[-] http://www.exploit-db.com/exploits/10293/\n";
 print "+--[-] http://www.1337day.com/exploit/10034\n|\n";
 print "+-[|] PHP-Nuke < 8.0 (sid) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4964/\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 Final (sid) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4965/\n|\n";
 print "+-[|] PHP-Nuke 8.0 autohtml.php Local File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30881/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006080107\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 Final (INSERT) Blind SQL Injection Exploit (mysql)\n";
 print "+--[-] http://www.exploit-db.com/exploits/3344/\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 Final (INSERT) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3345/\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 Final (HTTP Referers) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3346/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009050071\n|\n";
 print "+-[|] PHP-Nuke 8.0 (mod Surveys) SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/15794\n|\n";
 print "+-[|] PHP-Nuke <= 8.0 (News) Remote SQL Injection Exploit\n";
 print "+--[-] www.1337day.com/exploit/12874\n|\n";
 print "+-[|] Cross Site Scripting in PHP Nuke 8.0 Version [ Disputed / BOGUS ]";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009060009\n\n";
 }

 if ($v =~ /5.0/){ $expN = $expN + 1;
 print "+-[|] PHP-NUKE 5.0 - Viewslink Remote SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/12514/\n";
 print "+--[-] http://www.1337day.com/exploit/12135\n\n";
 }

 if ($v =~ /7.6.b.5/){ $expN = $expN + 3;
 print "+-[|] PHP-Nuke Platinium <= 7.6.b.5 - Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5986/\n";
 print "+--[-] http://www.1337day.com/exploit/3338\n|\n";
 print "+-[|] PHP-Nuke Platinum 7.6.b.5 (dynamic_titles.php) SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5295/\n|\n";
 print "+-[|] php-nuke platinum 7.6.b.5 - Remote File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4563/\n\n";
 }

 if ($v =~ /8.0.3.3b/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 8.0 .3.3b SQL Injection Protection Bypass and Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/29866/\n\n";
 }

 if ($v =~ /7.(.*)/){ $expN = $expN + 3;
 print "+-[|] PHP-Nuke 7.x Block-Old_Articles.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29453/\n|\n";
 print "+-[|] PHP-Nuke 7.x Journal Module Search.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28885/\n|\n";
 print "+-[|] PHP-Nuke 7.x Multiple Remote File Include Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/27927/\n\n";
 }

 if ($v =~ /2.0/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 2.0 AutoHTML Module Local File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28388/\n\n";
 }
 
 if ($v =~ /6.(.*)/ or $v =~ /7.9/){
 print "+-[|] Bypassing CAPTCHA in phpNuke 6.x-7.9\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006020061\n\n";
 }

 if ($v =~ /7.9/){ $expN = $expN + 3;
 print "+-[|] PHP-Nuke <= 7.9 Final (phpbb_root_path) Remote File Inclusions\n";
 print "+--[-] http://www.exploit-db.com/exploits/1866/\n|\n";
 print "+-[|] PHP-Nuke <= 7.9 Journal module (search.php) 'forwhat' SQL Injection vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006110015\n|\n";
 print "+-[|] PHP-Nuke <= 7.9 Old-Articles Block 'cat' SQL Injection vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2007010068\n\n";
 }

 if ($v =~ /7.8/){ $expN = $expN + 9;
 print "+-[|] PHP-Nuke 7.8 Mainfile.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27318/\n|\n";
 print "+-[|] PHP-Nuke 7.5 - 7.8 (Search) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1523/\n|\n";
 print "+-[|] PHP-Nuke <= 7.8 Search Module Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1326/\n|\n";
 print "+-[|] PHP-Nuke 7.8 - SQL Injection / Remote Command Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1270/\n|\n";
 print "+-[|] PHP-Nuke <= 7.8 (modules.php) SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1219/\n|\n";
 print "+-[|] Evading sql-injection filters in phpNuke 7.8\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006020100\n|\n";
 print "+-[|] Critical SQL Injection PHPNuke <= 7.8 - Your_Account module\n";
 print "+--[-] cxsecurity.com/issue/WLB-2006020046\n|\n";
 print "+-[|] XSS in phpNuke 7.8 and older versions\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006020034\n|\n";
 print "+-[|] PHP Nuke <= 7.8 Multiple SQL Injections\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2005090003\n\n";
 }

 if ($v =~ /7.5/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 7.5 - 7.8 (Search) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1523/\n\n";
 }

 if ($v =~ /7.6/){ $expN = $expN + 6;
 print "+-[|] PHP-Nuke 7.6 Surveys Module HTTP Response Splitting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25430/\n|\n";
 print "+-[|] PHP-Nuke 7.6 Web_Links Module Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/25360/\n|\n";
 print "+-[|] PHP-Nuke 6.x - 7.6 Top module Remote SQL Injection Exploit (working)\n";
 print "+--[-] http://www.exploit-db.com/exploits/921/\n|\n";
 print "+-[|] PHP-Nuke 7.6 Web_Links Module Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/25342/\n|\n";
 print "+-[|] PHP-Nuke 7.6 Banners.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25343/\n|\n";
 print "+-[|] PhpNuke 7.6=>x Multiple vulnerabilities\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2005090039\n\n";
 }

 if ($v =~ /6.(.*)/ or $v =~ /7.(.*)/){ $expN = $expN + 14;
 print "+-[|] PHP-Nuke 6.x/7.x Your_Account Module Username Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25339/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Downloads Module Lid Parameter Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25341/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/25103/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x FAQ Module categories Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24190/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Encyclopedia Module Multiple Function XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24191/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Reviews Module order Parameter SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/24192/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Score Subsystem score Variable DoS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24193/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Reviews Module Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24194/\n|\n";
 print "+-[|] PHP-Nuke 5.x/6.x/7.x Direct Script Access Security Bypass Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24166/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Modpath Parameter Potential File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24127/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x CookieDecode Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23990/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23998/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x 'Reviews' Module Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23669/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.x Public Message SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23670/\n\n";
 }
 
 if ($v =~ /6.(.*)/ or $v =~ /7.0/){ $expN = $expN + 2;
 print "+-[|] PHP-Nuke 6.x/7.0 'News' Module Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23663/\n|\n";
 print "+-[|] PHP-Nuke 6.x Multiple Module SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23631/\n\n";
 }
 
 if ($v =~ /5.(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 5.x/6.x/7.x Direct Script Access Security Bypass Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24166/\n\n";
 }

 if ($v =~ /7.4/){ $expN = $expN + 2;
 print "+-[|] PHP-Nuke 7.4 - Admin Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/801/\n|\n";
 print "+-[|] PHP-Nuke 7.4 - Remote Privilege Escalation\n";
 print "+--[-] http://www.exploit-db.com/exploits/436/\n\n";
 }

 if ($v =~ /1.0/ or $v =~ /2.5/ or $v =~ /3.0/ or $v =~ /4.(.*)/ or $v =~ /5.(.*)/ or $v =~ /6.(.*)/ or $v =~ /7.(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 1.0/2.5/3.0/4.x/5.x/6.x/7.x Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/24232/\n\n";
 }

 if ($v =~ /7.2/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 7.2 - Multiple Video Gallery Module SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/24060/\n\n";
 }

 if ($v =~ /6.(.*)/ or $v =~ /7.0/ or $v =~ /7.1/){ $expN = $expN + 2;
 print "+-[|] PHP-Nuke 6.x/7.0/7.1 Image Tag Admin Command Execution Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23835/\n|\n";
 print "+-[|] PHP-Nuke 6.x/7.0 Survey Module SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23484/\n\n";
 }

 if ($v =~ /6.9/){ $expN = $expN + 1;
 print "+-[|] PHP-NUKE version <= 6.9 - 'cid' SQL Injection Remote Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/138/\n\n";
 }

 if ($v =~ /6.6/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 6.6 admin.php SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23237/\n\n";
 }

 if ($v =~ /6.5/){ $expN = $expN + 2;
 print "+-[|] PHP-Nuke 6.5 Modules.PHP Username URI Parameter Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22595/\n|\n";
 print "+-[|] PHP-Nuke 6.5 - Multiple Downloads Module SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22597/\n\n";
 }

 if ($v =~ /6.0/ or $v =~ /6.5/){ $expN = $expN + 6;
 print "+-[|] PHP-Nuke 6.0/6.5 Web_Links Module Path Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22598/\n|\n";
 print "+-[|] PHP-Nuke 6.0 Modules.PHP Denial of Service Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22110/\n|\n";
 print "+-[|] PHP-Nuke 6.0 Web Mail Remote PHP Script Execution Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22089/\n|\n";
 print "+-[|] PHP-Nuke 6.0 Web Mail Script Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22090/\n|\n";
 print "+-[|] PHP-Nuke 6.0 - Multiple Path Disclosure Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22102/\n|\n";
 print "+-[|] PHP-Nuke 6.0 - Multiple Cross Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22103/\n\n";
 }

 if ($v =~ /6.5/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 6.5 Addon Viewpage.PHP File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22422/\n\n";
 }

 if ($v =~ /5.(.*)/ or $v =~ /6.0/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 5.x/6.0 Avatar HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22211/\n\n";
 }

 if ($v =~ /5.(.*)/ or $v =~ /6.0/ or $v =~ /6.5 BETA 1/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 5.x/6.0/6.5 BETA 1 Multiple Cross Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22037/\n\n";
 }

 if ($v =~ /5.6/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 5.6 Modules.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/21977/\n\n";
 }

 if ($v =~ /1.0/ or $v =~ /2.5/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 1.0/2.5 Administrative Privileges Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/20158/\n\n";
 }

 if ($v =~ /8.3.5/){ $expN = $expN + 1;
 print "+-[|] PHPnuke MT 8.3.5 ckfinder Shell Upload\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011070001\n\n";
 }

 if ($v =~ /8.(.*)/){ $expN = $expN + 3;
 print "+-[|] PHP-Nuke 8.x Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011030108\n\n";
 print "+-[|] PHP-Nuke 8.x Cross Site Request Forgery\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011030107\n\n";
 print "+-[|] PHP-Nuke 8.x Blind SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011030106\n\n";
 }

 if ($v =~ /7.0/ or $v =~ /8.1/ or $v =~ /8.1.35/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 7.0, 8.1 and 8.1.35 wormable remote code execution \n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010050021\n\n";
 }

 if ($v =~ /0.760-RC2/ or $v =~ /0.760 RC2/ or $v =~ /0.760-rc2/){ $expN = $expN + 1;
 print "+-[|] PostNuke Critical XSS x=>0.760-RC2\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2005090035\n\n";
 }

 if ($source =~ /"modules.php?op=modload&amp;name=SPChat&(.*)/ or $source =~ /"modules.php?op=modload&name=SPChat&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke module(SPChat) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19964/\n";
 print "+--[-] http://www.1337day.com/exploit/19035\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012070140\n\n";
 }

 if ($source =~ /(.*)friend.php?op=FriendSend&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 'friend.php' Module Remote SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/12525/\n";
 print "+--[-] http://www.1337day.com/exploit/12154\n\n";
 }

 if ($source =~ /(.*)modules.php?name=News&file=print&sid=(.*)/ or $source =~ /(.*)modules.php?name=News&amp;file=print&amp;sid=(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module print 6.0 (print&sid) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/13916/\n";
 print "+--[-] http://www.1337day.com/exploit/12766\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Downloads&d_op=Add&(.*)/ or $source =~ /modules.php?name=Downloads&amp;d_op=Add&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Downloads Module 'url' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32747/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Shopping_Cart&amp;file=category&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Emporium 2.3.0 (id_catg) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/10615/\n";
 print "+--[-] http://www.1337day.com/exploit/10370\n\n";
 }

 if ($source =~ /(.*)modules.php?view=(.*)&name=Folder Name&(.*)/ or $source =~ /(.*)modules.php?view=(.*)&amp;name=Folder+Name&(.*)/){ $expN = $expN + 1;
 print "+-[|] Php-Nuke - Local File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/11732/\n\n";
 }

 if ($source =~ /(.*)modules.php?view=(.*)&amp;name=downloads&amp;file=index&amp;d_op=ratedownload&(.*)/ or $source =~ /(.*)modules.php?view=(.*)&amp;name=downloads&amp;file=index&amp;d_op=ratedownload&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke ratedownload SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/11788/\n";
 print "+--[-] http://www.1337day.com/exploit/9707\n\n";
 }

 if ($source =~ /(.*)modules.php?name=League&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Nuke League Module 'tid' Parameter Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32538/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008100078\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Sarkilar&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Sarkilar Module 'id' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32497/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Kleinanzeigen&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Kleinanzeigen Module 'lid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32191/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008080016\n\n";
 }

 if ($source =~ /(.*)modules.php?name=BookCatalog&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Book Catalog Module 1.0 'catid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32140/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=4ndvddb&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 4ndvddb 0.91 Module 'id' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32015/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008070017\n\n";
 }

 if ($source =~ /(.*)modules.php?name=KuraniKerim&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 'KuiraniKerim' Module - 'sid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31805/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=NukeC30&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke NukeC30 3.0 Module - 'id_catg' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31383/\n\n";
 }

 if ($source =~ /(.*)modules.php?ZClassifieds&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke zClassifieds Module - 'cat' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31384/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008030029\n\n";
 }

 if ($source =~ /(.*)modules.php?name=modload&name=4nAlbum&(.*)/ or $source =~ /(.*)modules.php?name=modload&amp;name=4nAlbum&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 4nAlbum Module 0.92 - 'pid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31368/\n\n";
 }

 if ($source =~ /(.*)modules.php?modules.php?modload&name=Hadith&(.*)/ or $source =~ /(.*)modules.php?modules.php?modload&amp;name=Hadith&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Hadith Module - 'cat' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31377/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008030023\n\n";
 }

 if ($source =~ /(.*)modules.php?name=KutubiSitte&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke KutubiSitte Module - 'kid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31344/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008030015\n\n";
 }

 if ($source =~ /(.*)modules.php?name=modload&name=4nChat&(.*)/ or $source =~ /(.*)modules.php?name=modload&amp;name=4nChat&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 4nChat Module 0.91 - 'roomid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31351/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Yellow_Pages&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Yellow_Pages Module - 'cid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31339/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=eGallery&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke eGallery 3.0 Module - 'pid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31331/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=gaestebuch_v22&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Johannes Hass 'gaestebuch 2.2 Module - 'id' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31322/\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=My_eGallery&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke My_eGallery <= 2.7.9 - Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5203/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009080205\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Sell&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Sell Module - 'cid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31297/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Kose_Yazilari&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Kose_Yazilari (artid) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5186/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Recipe&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Recipe Module 1.3 - 'recipeid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31287/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2009090138\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Classifieds&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Classifieds Module - 'Details' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31281/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Downloads&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Downloads Module - 'sid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31283/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Manuales&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Modules Manuales 0.1 (cid) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5168/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Siir&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Siir (id) Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5169/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=NukeC&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module NukeC 2.1 (id_catg) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5172/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Okul&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Modules Okul 1.0 (okulid) Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5159/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Docum&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Docum (artid) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5161/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Inhalt&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Inhalt (cid) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5163/\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=Web_Links&(.*)/ or $source =~ /(.*)modules.php?op=modload&amp;name=Web_Links&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Web_Links Module - 'cid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31252/\n";
 print "+--[-] http://www.1337day.com/exploit/22268\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008020086\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014050094\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=EasyContent&(.*)/ or $source =~ /(.*)modules.php?op=modload&amp;name=EasyContent&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module EasyContent (page_id) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5155/\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=books&(.*)/ or $source =~ /(.*)modules.php?op=modload&amp;name=books&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module books SQL (cid) Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5147/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Sections&sop=printpage&(.*)/ or $source =~ /(.*)modules.php?name=Sections&amp;sop=printpage&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Gallery 1.3 Module - 'artid' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31289/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008120057\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Advertising(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Advertising Module 0.9 Modules.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30750/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Dance_Music-MM&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Dance Music Module Index.PHP Local File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30614/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Encyclopedia&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke <= 7.9 (Encyclopedia) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2617/\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=MyHeadlines&(.*)/ or $source =~ /(.*)modules.php?op=modload&amp;name=MyHeadlines&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke MyHeadlines 4.3.1 Module Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28487/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=MS_Analysis&(.*)/ or $source =~ /(.*)modules\/MS_Analysis\/(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke MS-Analysis Module Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23869/\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Recommend_Us&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke 7.1 Recommend_Us Module fname Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/23814/\n\n";
 }

 if ($source =~ /(.*)article.php?sid=(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke (article.php) Sql Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/16550\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Recipes&(.*)/){ $expN = $expN + 1;
 print "+-[|] Php-Nuke Module 'Recipes' SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/16045\n\n";
 }

 if ($source =~ /(.*)modules.php?op=modload&name=Pirtuk&(.*)/ or $source =~ /(.*)modules.php?op=modload&amp;name=Pirtuk&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-NUKE - 'Pirtuk' Module SQL injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/15933\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Surveys&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-NUKE CMS (Survey and Poll) SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/11168\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Current_Issue&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Current_Issue (summary&id) Remote SQL injection Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008100084\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Sectionsnew&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke Module Sectionsnew (printpage&artid) Remote SQL injection Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008100083\n\n";
 }

 if ($source =~ /(.*)modules.php?name=eWeather&(.*)/){ $expN = $expN + 1;
 print "+-[|] XSS in PHP-Nuke (eWeather module)\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2008030037\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Your_Account(.*)/){ $expN = $expN + 1;
 print "+-[|] Php-Nuke:users and admins password hashes vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2007100006\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Downloads&op=search&(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP-Nuke INP XSS\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2006080020\n\n";
 }

 if ($source =~ /(.*)modules.php?name=Downloads&d_op=viewdownloaddetails(.*)/){ $expN = $expN + 1;
 print "+-[|] Local File Inclusion in Dance Music module for phpNuke\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2007090085\n\n";
 }

# PhP-Nuke user.php SQL Injection
# http://www.exploit-db.com/exploits/11631/
# http://www.1337day.com/exploit/11171

# Test ~> http://www.soulsalike.nl/

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
