package bin::vbulletin;
use Exporter qw(import);
our @EXPORT_OK = qw(vvb);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vvb {
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
#-----------------------------------------------------------------------------------------------+
if($source eq ""){ print "\n", BOLD WHITE,"[", BOLD RED,"~", BOLD WHITE,"] Website offline, try again!\n"; exit(); }#                      |
if($source =~ /400 URL must be absolute/){ print "\n[", BOLD RED,"~", BOLD WHITE,"] ", BOLD RED,"Error 404!", BOLD WHITE,"\n\n"; exit(); }#             |
#-----------------------------------------------------------------------------------------------+
$expN = 0;
if (length($source) > 0){ }else{ print "\n[", BOLD RED,"~", BOLD WHITE,"] Error!\n"; exit(); }

if ($source =~ /Powered by <a href="http:\/\/www.vbulletin.com" id="vbulletinlink">vBulletin&trade;<\/a> Version (.*) <br \/>/ or $source =~ /<meta name="generator" content="vBulletin (.*)" \/>/){ $v = $1; 
}else{ 
print BOLD WHITE,"Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if (lc($ynver) eq "n"){ print "\n"; }
if (lc($ynver) eq "y"){
 print BOLD WHITE,"Version: ";
 $v=<STDIN>; chomp $v;
}
}

 if ($v =~ /1.0/ or $v =~ /3.0/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 1.0/2.x/3.0 Index.PHP User Interface Spoofing Weakness\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/24124/\n\n";
 }
 
 if ($v =~ /1.0/ or $v =~ /1.1/ or $v =~ /2.0.(.*)/ or $v =~ /2.2.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 1.0/1.1/2.0.x/2.2.x Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23688/\n\n";
 }
 
 if ($v =~ /1.74/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin ImpEx <= 1.74 Remote Command Execution Exploit\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/1668/\n\n";
 }
 
 if ($v =~ /2.0/ or $v =~ /2.2.(.*)/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.0/2.2.x Cross Site Scripting Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/21946/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.0/2.2.x Memberlist.PHP Cross Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22030/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.0.x/2.2.x members2.php Cross Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22042/\n\n";
 }
 
 if ($v =~ /2.0.3/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.0.3 Calendar.PHP Command Execution Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/21874/\n\n";
 }

 if ($v =~ /2.3.(.*)/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.3.x Global.PHP SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28694/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 2.3 .x - SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11396/\n\n";
 } 
 
 if ($v =~ /2.(.*)/ or $v =~ /3.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 2.x/3.x Multiple Cross-Site Scripting Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28028/\n\n";
 }
 
 if ($v =~ /2.(.*)/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 2.x Private.PHP Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23865/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin 2.X sql injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2006100027\n\n";
 }

 if ($v =~ /2.2.7/ or $v =~ /2.2.8/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 2.2.7/2.2.8 HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22077/\n\n";
 }
 
 if ($v =~ /2.9.0/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin YUI 2.9.0 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014010064\n\n";
 }
 
 if ($v =~ /3.0/ or $v =~ /3.5/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0/3.5 Profile.PHP Email Field HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/27343/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0/3.5 Profile.PHP Email Field HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/27343/\n\n";
 }
 
 if ($v =~ /3.0/){ $expN = $expN + 5;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0 ForumDisplay.PHP Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23822/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0 ShowThread.PHP Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23823/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0 Search.PHP Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23691/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.0 Register.PHP HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22990/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.0 Private Message HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22599/\n\n";
 }
  
 if ($v =~ /3.0.0/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.0.0 XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11395/\n\n";
 }
 
 if ($v =~ /3.(.*).(.*)/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.x.x full path disclosure Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/18902\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.x.x vBExperience add-on Cross Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011050077\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011060014\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] New Include Redirect Bug XSS All vBulletin® v 3.x.x\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2007060081\n\n";
 }
 
 if ($v =~ /3.(.*)/ or $v =~ /4.(.*)/ or $v =~ /5.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin Announcements Cookie Steal Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19926\n\n";
 }
 
 if ($v =~ /3.0.1/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0.1 newreply.php WYSIWYG_HTML Parameter XSS\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/24234/\n\n";
 }
 
 if ($v =~ /3.0.4/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.0.4 'forumdisplay.php' Code Execution\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/818/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.0.4 'forumdisplay.php' Code Execution (part 2)\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/820/\n\n";
 }

 if ($v =~ /3.0.6/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.0.6 (Template) Command Execution Exploit (metasploit)\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/1133/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.0.6 php Code Injectionz\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/832/\n\n";
 }

 if ($v =~ /3.0.8/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.0.8 Accessible Database Backup Searcher (update 3)\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/1189/\n\n";
 }

 if ($v =~ /3.0.9/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin 3.0.9/3.5.x Member.PHP Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28076/\n\n";
 }
  
 if ($v =~ /3.0.10/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.0.10 Portal.PHP SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/27929/\n\n";
 }
 
 if ($v =~ /3.0.14/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.0.14 global.php Encoded URL XSS\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28342/\n\n";
 }
 
 if ($v =~ /3.6.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] XSS vBulletin 3.6.X Admin Control Painel\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2006110105\n\n";
 }
 
 if ($v =~ /3.6.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin v3.6.5 admincp/index.php ( rss feed ) xss vuln\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2007030094\n\n";
 }
 
 if ($v =~ /3.6.6/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vbulletin < 3.6.6 [permanent xss]\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2007060013\n\n";
 }
 
 if ($v =~ /3.6.8/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] cChatBox for vBulletin 3.6.8 and 3.7.x SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/15531\n\n";
 } 
 
 if ($v =~ /3.7.4/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Multiple Sql Injection in vBulletin 3.7.4\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2009020265\n\n";
 }
 
 if ($v =~ /3.7.6/ or $v =~ /3.6.12/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.4, 3.7.6, and 3.6.12 cross site scripting \n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2009100019\n\n";
 }
 
 if ($v =~ /3.8.(.*)/ or $v =~ /4.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.* - 4.* DownloadsII poison nullbyte\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/11737\n\n";
 }
 
 if ($v =~ /3.8.(.*)/ or $v =~ //  or $v =~ /4.(.*).(.*)/  or $v =~ /5.(.*).(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin vBShout Mod - Stored XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/20983\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013070076\n\n";
 }
 
 if ($v =~ /3.8.4/){ $expN = $expN + 4;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.8.4 XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010040069\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin Version 3.8.4 File Include Vulnerability [ Disputed / BOGUS ]\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010030006\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.4 Modcp Cross-Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010020022\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin adminCP 3.8.4 cross site scripting \n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010010039\n\n";
 }
 
 if ($v =~ /3.8.4/ or $v =~ /3.8.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.4 & 3.8.5 Registration Bypass Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/13911\n\n";
 }
 
 if ($v =~ /3.8.6/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.6 faq.php Information Disclosure Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/13459\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/14455/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010070136\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.6 database credential disclosure \n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010070126\n\n";
 }
 
 if ($v =~ /3.5.(.*)/ or $v =~ /3.6.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.5.x/3.6.x SWF Script Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/29338/\n\n";
 } 
 
 if ($v =~ /3.5.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin<<--v3.5.X 'member.php' Cross Site Scripting [ Disputed / BOGUS ]\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2006060159\n\n";
 } 
 
 if ($v =~ /3.5.2/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.5.2 - XSS Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11394/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] VBulletin 3.5.2 Event Title HTML Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/27019/\n\n";
 }
 
 if ($v =~ /3.5.4/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin <= 3.5.4 Multiple Cross Site Scripting Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/33624/\n\n";
 }
 
 if ($v =~ /3.6.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] RFI ====> vBulletin v3.6.5 [ Disputed / BOGUS ]\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2007080008\n\n";
 }
 
 if ($v =~ /3.7.0/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin 3.7.0 Gold >> Sql injection on faq.php\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2008050095\n\n";
 }
 
 if ($v =~ /3.7.1/ or $v =~ /3.6.10/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Exploit for vBulletin 'obscure' XSS (3.7.1 & 3.6.10)\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2008060101\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2008060045\n\n";
 } 
 
 if ($v =~ /3.8.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.8.x EggAvatar SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/15549\n\n";
 }

 if ($v =~ /4.0.0 Beta 5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.0 Beta 5 Remote Denial of Service\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/18899\n\n";
 }

 if ($v =~ /4.0.(.*)/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.x SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/21029\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.x (Search) SQLi / Cross-Site Request Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/16160\n\n";
 }
 
 if ($v =~ /4.0.(.*)/ or $v =~ /4.1.2/){
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.x - 4.1.2 (search.php, cat param) - SQL Injection Exploit\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/34526/\n\n";
 }
   
 if ($v =~ /4.(.*)/ or $v =~ /5.(.*)/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.x/5.x multiple Full Puth Disclosure Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19898\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.X and 5.X uploader.swf XSS\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014010042\n\n";
 }
 
 if ($v =~ /4.0.1/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.1 'misc.php' SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/33547/\n\n";
 } 
 
 if ($v =~ /4.0.3/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin [4.0.3] adminCP Cross-Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010050027\n\n";
 }
 
 if ($v =~ /4.0.2/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin Blog 4.0.2 Title XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11871/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.2 Search Cross Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/33784/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.2 Multiple Cross Site Scripting Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/33660/\n\n";
 }
 
 if ($v =~ /4.0.4/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin v4.0.4 adserver Javascript (forumdisplay.php) Code Execution\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/13743\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.4 code execution vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010080064\n\n";
 }
  
 if ($v =~ /4.0.8/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.8 - Persistent XSS via Profile Customization\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/14877\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.8 PL1 XSS Filter Bypass within Profile Customization\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/14924\n\n";
 }
 
 if ($v =~ /4.1.(.*)/ or $v =~ /5.(.*).(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.1.x / 5.x.x Administrative User Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013100192\n\n";
 }
 
 if ($v =~ /4.1.2/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.1.2 SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011050078\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.x => 4.1.2 (search.php) SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/16147\n\n";
 }
  
 if ($v =~ /4.1.3/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin 4.0.x => 4.1.3 (messagegroupid) SQL injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/16548\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.1.3 Open Redirect\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011060015\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.1.3 SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011070063\n";
 }
 
 if ($v =~ /4.1.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vbulletin 4.1.5 attachment SQLI\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013030192\n\n";
 }
 
 if ($v =~ /4.1.7/ or $v =~ /4.1.8/ or $v =~ /4.1.9/ or $v =~ /4.1.10/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.1.7 => 4.1.10 XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/17824\n\n";
 }
 
 if ($v =~ /4.1.12/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Vbulletin (blog_plugin_useradmin) 4.1.12 SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012090173\n\n";
 }
 
 if ($v =~ /4.2.0/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 3.x <= 4.2.0 FAQ (Echo config) trick\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19862\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.2.0 Full Path Disclosure Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19874\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.2.0 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012060246\n\n";
 }
 
 if ($v =~ /5.0.0/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin index.php/ajax/api/reputation/vote nodeid Parameter SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/21648\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/30212/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 4.0.0 Beta 5 Remote Denial of Service\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/18899\n\n"; 
 }
 
 if ($v =~ /5.0.0 Beta 19/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.0.0 Beta 19 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012110178\n\n";
 }
 
 if ($v =~ /5.0.0 Beta 11/ or $v =~ /5.0.0 Beta 28/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.0.0 Beta 11 - 5.0.0 Beta 28 - SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/24882/\n\n";
 }
 
 if ($v =~ /5.0.0 Beta 28/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5b SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013050179\n\n";
 }
 
 if ($v =~ /5.0.0 Beta /){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.0.0 all Beta releases SQL Injection Exploit 0day\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013030193\n\n";
 }
 
 if ($v =~ /5.(.*)/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin Announcements Cookie Steal Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19956\n\n";
 }
 
 if ($v =~ /5.1/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.1 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014040129\n\n";
 }
 
 if ($v =~ /5.1.2/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.1.2 SQL Injection Exploit 0day\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/22452\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014070115\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] vBulletin 5.1.2 SQL Injection *youtube\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014070101\n\n";
 } 
  
 if ($expN==0){ print "\n[", BOLD RED,"~", BOLD WHITE,"] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ",BOLD MAGENTA $expN."",BOLD WHITE,"\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
