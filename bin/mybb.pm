package bin::mybb;
use Exporter qw(import);
our @EXPORT_OK = qw(vmbb);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vmbb {
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
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
if ($ynver eq "y" or $ynver eq "Y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}

 if ($v =~ /1.8 Beta 3/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.8 Beta 3 Cross Site Scripting / SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080095\n";
 print "+--[-] http://www.exploit-db.com/exploits/34381/\n\n";
 }

 if ($v =~ /1.6.12/){ $expN = $expN + 3;
 print "+-[|] MyBB 1.6.12 - Admin Panel FPD & Multiple XSS\n";
 print "+--[-] http://www.1337day.com/exploit/21746\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010065\n|\n";
 print "+-[|] MYBB 1.6.12 search.php Sql injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014020202\n|\n";
 print "+-[|] MyBB 1.6.12 POST Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014020018\n\n";
 }

 if ($v =~ /1.6.9/){ $expN = $expN + 2;
 print "+-[|] MyBB <1.6.9 (editpost.php, posthash) SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/20087\n|\n";
 print "+-[|] MyBB 1.6.9 full path disclosure\n";
 print "+--[-] http://www.1337day.com/exploit/20007\n\n";
 }

 if ($v =~ /1.6.8/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6.8 multiple full-path disclosure vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19975\n\n";
 }

 if ($v =~ /1.6.11/){ $expN = $expN + 1;
 print "+-[|] MyBB <= 1.6.11 - Remote Code Execution Using Admin Privileges\n";
 print "+--[-] http://www.exploit-db.com/exploits/29935/\n\n";
 }

 if ($v =~ /1.6.4/){ $expN = $expN + 1;
 print "+-[|] myBB 1.6.4 Backdoor Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/17949/\n\n";
 }

 if ($v =~ /1.6/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6 - Full Path Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/15325/\n\n";
 }

 if ($v =~ /1.4.8/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.4.8 'search.php' SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33232/\n\n";
 }

 if ($v =~ /1.4.6/){ $expN = $expN + 1;
 print "+-[|] MyBB <= 1.4.6 - Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/9001/\n\n";
 }

 if ($v =~ /1.4.5/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.4.5 Multiple Security Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/32966/\n\n";
 }

 if ($v =~ /1.2.10/){ $expN = $expN + 1;
 print "+-[|] MyBB <= 1.2.10 'moderation.php' Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/31034/\n\n";
 }

 if ($v =~ /1.1.3/){ $expN = $expN + 2;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.1.3 (usercp.php) Create Admin Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1950/\n|\n";
 print "+-[|] MyBulletinBoard (MyBB) < 1.1.3 - Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1909/\n\n";
 }

 if ($v =~ /1.4.10/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.4.10 'myps.php' Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33439/\n\n";
 }

 if ($v =~ /1.10/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.10 Member.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27633/\n\n";
 }

 if ($v =~ /1.2.10/){ $expN = $expN + 2;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.10 Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4927/\n|\n";
 print "+-[|] mybulletinboard (mybb) <= 1.2.10 Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/4928/\n\n";
 }

 if ($v =~ /1.03/){ $expN = $expN + 5;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.03 Multiple SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1499/\n|\n";
 print "+-[|] MyBB 1.0.3 Private.PHP Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/27236/\n|\n";
 print "+-[|] MyBB 1.0.3 Managegroup.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27242/\n|\n";
 print "+-[|] MyBulletinBoard (MyBB) <= 1.03 (misc.php COMMA) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/1539/\n|\n"; 
 print "+-[|] MyBB 1.0.3 Moderation.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27167/\n\n";
 }

 if ($v =~ /1.0.2/ or $v =~ /1.0.3/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.0.2/1.0.3 Managegroup.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27240/\n\n";
 }

 if ($v =~ /1.04/){ $expN = $expN + 1;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.04 (misc.php COMMA) SQL Injection (2)\n";
 print "+--[-] http://www.exploit-db.com/exploits/1548/\n\n";
 }

 if ($v =~ /1.1.1/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.1.1 Showthread.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27843/\n\n";
 }
 
 if ($v =~ /1.00 RC4/ or $v =~ /1.00 rc4/){ $expN = $expN + 2;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.00 RC4 SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1172/\n|\n";
 print "+-[|] MyBulletinBoard (MyBB) <= 1.00 RC4 SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1022/\n\n";
 }
 
 if ($v =~ /1.2.11/){ $expN = $expN + 2;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.11 private.php SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5070/\n|\n";
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.11 private.php SQL Injection Exploit (2)\n";
 print "+--[-] http://www.exploit-db.com/exploits/6316/\n\n";
 }
 
 if ($v =~ /1.2.3/){ $expN = $expN + 1;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.3 - Remote Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3653/\n\n";
 }
 
 if ($v =~ /1.2.2/){ $expN = $expN + 1;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.2 (CLIENT-IP) SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3719/\n\n";
 }
 
 if ($v =~ /1.1.5/){ $expN = $expN + 1;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.1.5 (CLIENT-IP) SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2012/\n\n";
 }
 
 if ($v =~ /1.4.2/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.4.2 'moderation.php' Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32535/\n\n";
 }

 if ($v =~ /1.1/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.1 Global Variable Overwrite Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27667/\n\n";
 }

 if ($v =~ /1.2.5/){ $expN = $expN + 1;
 print "+-[|] MyBulletinBoard (MyBB) <= 1.2.5 calendar.php Blind SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3780/\n\n";
 }

 if ($v =~ /1.0/ or $v =~ /1.1/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.0/1.1 Index.PHP Referrer Cookie SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27155/\n\n";
 }

 if ($v =~ /1.0/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.0 Globa.PHP Cookie Data SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/26990/\n\n";
 }

 if ($v =~ /1.0.2/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.0.2 - Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/27137/\n\n";
 }

 if ($v =~ /1.1.7/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.1.7 - Multiple HTML Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/28429/\n\n";
 }
 
 if ($v =~ /1.6.15/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6.15 - Full Path Disclosure\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080042\n\n";
 }
 
 if ($v =~ /1.6.14/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6.14 search.php Full Path Disclosure *youtube\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014070152\n\n";
 }
 
 if ($v =~ /1.1.2/){ $expN = $expN + 1;
 print "+-[|] MyBB Uploader 1.1.2 Shell Upload\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014030070\n\n";
 }
 
 if ($v =~ /1.6.10/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6.10 'url' Parameter Arbitrary Site Redirection Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080057\n\n";
 }
 
 if ($v =~ /1.6.08/){ $expN = $expN + 1;
 print "+-[|] MyBB 1.6.08 Xss Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013070149\n\n";
 }

 if ($source =~ /(.*)chat_frame.php?rs=getChats&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Ajax Chat SQL Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/20836\n\n";
 }

 if ($source =~ /(.*)usercp.php?(.*)/){ $expN = $expN + 2;
 print "+-[|] MyBB Profile Wii Friend Code Multiple Vulnerabilities\n";
 print "+--[-] http://www.1337day.com/exploit/20093\n|\n";
 print "+-[|] Social Sites MyBB Plugin 0.2.2 Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19970\n\n";
 }

 if ($source =~ /(.*)misc.php?action=hmflags&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB HM My Country Flags SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/20055\n";
 print "+--[-] http://www.exploit-db.com/exploits/23624/\n\n";
 }

 if ($source =~ /(.*)index.php?action=editAwlItem&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB AwayList Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/20043\n";
 print "+--[-] http://www.exploit-db.com/exploits/23625/\n\n";
 }

 if ($source =~ /(.*)userbarsettings.php(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Forum Userbar Plugin (Userbar v2.2) SQL Injection\n";
 print "+--[-] http://www.1337day.com/exploit/16994\n";
 print "+--[-] http://www.exploit-db.com/exploits/17962/\n\n";
 }

 if ($source =~ /(.*)signature.php(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Advanced Forum Signatures (afsignatures-2.0.4) SQL Injection\n";
 print "+--[-] http://www.1337day.com/exploit/16993\n";
 print "+--[-] http://www.exploit-db.com/exploits/17961/\n\n";
 }

 if ($source =~ /(.*)process-mystatus.php?action=delete&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB MyStatus 3.1 SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/16996\n\n";
 }

 if ($source =~ /(.*)misc.php?suscriberuser=yes&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Follower User Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19669\n\n";
 }

 if ($source =~ /(.*)bank.php(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Bank-v3 Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19945\n";
 print "+--[-] http://www.exploit-db.com/exploits/23284/\n\n";
 }

 if ($source =~ /(.*)member.php?action=profile&(.*)/){ $expN = $expN + 3;
 print "+-[|] MyBB Profile Blogs Plugin 1.2 Multiple Vulnerabilities\n";
 print "+--[-] http://www.1337day.com/exploit/19940\n";
 print "+--[-] http://www.exploit-db.com/exploits/23287/\n|\n";
 print "+-[|] MyBB Follower User Plugin - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22405/\n|\n";
 print "+-[|] MyBB Member.PHP SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/26204/\n\n";
 }

 if ($source =~ /(.*)kingchat.php?(.*)/){ $expN = $expN + 2;
 print "+-[|] MyBB KingChat Plugin Persistent XSS Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19930\n";
 print "+--[-] http://www.exploit-db.com/exploits/23249/\n|\n";
 print "+-[|] myBB KingChat Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19878\n";
 print "+--[-] http://www.exploit-db.com/exploits/23105/\n\n";
 }

 if ($source =~ /(.*)newreply.php?ajax=(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB DyMy User Agent Plugin (newreply.php) SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/19959\n";
 print "+--[-] http://www.exploit-db.com/exploits/23359/\n\n";
 }

 if ($source =~ /(.*)misc.php?tips=(.*)/){ $expN = $expN + 1;
 print "+-[|] TipsOfTheDay MyBB Plugin - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23322/\n\n";
 }

 if ($source =~ /(.*)albums.php?action=editimage&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Profile Albums Plugin 0.9 (albums.php, album parameter) - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22003/\n\n";
 }

 if ($source =~ /(.*)usercp.php?action=socialsites(.*)/){ $expN = $expN + 1;
 print "+-[|] Social Sites MyBB Plugin 0.2.2 - Cross Site Scripting\n";
 print "+--[-] http://www.exploit-db.com/exploits/23382/\n\n";
 }

 if ($source =~ /(.*)process-mystatus.php?action=delete&(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB MyStatus 3.1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17972/\n\n";
 }

 if ($source =~ /(.*)index.php?tab=(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB MyTabs (plugin) 0day SQL injection vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17595/\n\n";
 }

 if ($source =~ /(.*)pages.php?page=(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBB Plugin Custom Pages 1.0 - Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5379/\n\n";
 }

 if ($source =~ /(.*)tags.php?tag=(.*)/){ $expN = $expN + 1;
 print "+-[|] MyBb simple TagCloud Plugin XSS Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010076\n\n";
 }

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
