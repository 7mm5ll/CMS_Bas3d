package bin::phpbb;
use Exporter qw(import);
our @EXPORT_OK = qw(vbb);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vbb {
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

 if ($v =~ /2.0.21/){ $expN = $expN + 2;
 print "+-[|] phpBB <= 2.0.21 (Poison NULL Byte) Remote Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2348/\n|\n";
 print "+-[|] phpBB 2.0.21 Privmsg.PHP HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29442/\n\n";
 }
 
 
 if ($souce =~ /(.*)kb.php?mode=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB2 Plus 1.53 'kb.php' SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33772/\n\n";
 }
 
 if ($souce =~ /(.*)mypage.php?id=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB MyPage Plugin SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18212/\n\n";
 }
 
 if ($souce =~ /(.*)profile.php?mode=register/){ $expN = $expN + 1;
 print "+-[|] PHPBB MOD [2.0.19] Invitation Only (PassCode Bypass vulnerability)\n";
 print "+--[-] http://www.exploit-db.com/exploits/14440/\n\n";
 }
 
 if ($souce =~ /(.*)viewtopic.php?topic=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB viewtopic.php Arbitrary Code Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/16890/\n\n";
 }
 
 if ($souce =~ /(.*)newtopic.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] Claroline 1.8.9 phpbb/newtopic.php URL XSS \n";
 print "+--[-] http://www.exploit-db.com/exploits/32066/\n\n";
 }
 
 if ($souce =~ /(.*)viewtopic.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] Claroline 1.8.9 phpbb/viewtopic.php URL XSS \n";
 print "+--[-] http://www.exploit-db.com/exploits/32068/\n\n";
 }
 
 if ($souce =~ /(.*)functions_portal.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Add-on Fishing Cat Portal Remote File Inclusion Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5417/\n\n";
 }
 
 if ($souce =~ /(.*)irc.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB PJIRC Module 0.5 - 'irc.php' Local File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31535/\n\n";
 }
 
 if ($souce =~ /(.*)kb.php?mode=article&(.*)/){ $expN = $expN + 1;
 print "+-[|] Fully Modded phpBB (kb.php) Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5243/\n\n";
 }
 
 if ($souce =~ /(.*)filebase.php?d=(.*)&(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Mod FileBase (id) Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5236/\n\n";
 }
 
 if ($souce =~ /(.*)garage.php?mode=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Garage 1.2.0 Beta3 Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4686/\n\n";
 }
 
 if ($souce =~ /(.*)links.php?t=search&(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Links MOD 1.2.2 - Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4346/\n\n";
 }
 
 if ($souce =~ /(.*)index.php?name=PNphpBB2&(.*)/){ $expN = $expN + 1;
 print "+-[|] PNphpBB2 <= 1.2 - (index.php c) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4026/\n\n";
 }
 
 if ($souce =~ /(.*)forum.php?c=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Minerva Mod <= 2.0.21 build 238a SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3519/\n\n";
 }
 
 if ($souce =~ /(.*)lat2cyr.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB lat2cyr Mod 1.0.1 (lat2cyr.php) Remote File Include Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2546/\n\n";
 }
 
 if ($souce =~ /(.*)functions_rpg_events.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB RPG Events 1.0 functions_rpg_events Remote File Include Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2548/\n\n";
 }
 
 if ($souce =~ /(.*)phpbb_security.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB Security <= 1.0.1 (php_security.php) Remote File Include Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2552/\n\n";
 }
 
 if ($souce =~ /(.*)lat2cyr.php?(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB lat2cyr Mod 1.0.1 (lat2cyr.php) Remote File Include Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2546/\n\n";
 }
 
 if ($souce =~ /(.*)alltopics.php?mode=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpBB All Topics Mod <= 1.5.0 (start) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/2248/\n\n";
 }
 
 if ($souce =~ /(.*)auction_room.php?ar=(.*)/ or $souce =~ /(.*)auction_room.php?order=(.*)/){ $expN = $expN + 1;
 print "+-[|] phpbb-auction 1.x auction_room.php ar Parameter SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/28281/\n\n";
 }
 
 if ($souce =~ /(.*)auction_store.php?mode=store&(.*)/){ $expN = $expN + 1;
 print "+-[|] phpbb-auction 1.x auction_store.php u Parameter SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/28282/\n\n";
 }
 
 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
