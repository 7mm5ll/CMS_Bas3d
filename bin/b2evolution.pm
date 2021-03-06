package bin::b2evolution;
use Exporter qw(import);
our @EXPORT_OK = qw(vb2);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vb2 {
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

if ($source =~ /<meta name="generator" content="b2evolution (.*)" \/>/){ 
$v = $1; 
}else{ 
print BOLD WHITE,"Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if (lc($ynver) eq "n"){ print "\n"; }
if (lc($ynver) eq "y"){
 print BOLD WHITE,"Version: ";
 $v=<STDIN>; chomp $v;
}
}

 if ($v =~ /4.1.6/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 4.1.6 - Multiple Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25298/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 4.1.6 SQL Injection Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/20723\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013050011\n\n";
 }

 if ($v =~ /4.0.3/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 4.0.3 Persistent XSS Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/16989/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/15628\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 4.0.3 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011030073\n\n";
 }

 if ($v =~ /3.3.3/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 3.3.3 Cross Site Request Forgery [CSRF]\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/14289/\n\n";
 }

 if ($v =~ /1.8.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 1.8.5 - 1.9b (import-mt.php) Remote File Include Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/2864/\n\n";
 }

 if ($v =~ /1.8.2/ or $v =~ /1.9/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 1.8.2/1.9 _404_not_found.page.php Multiple Parameter XSS\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/29198/\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 1.8.2/1.9 _referer_spam.page.php Multiple Parameter XSS\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/29200/\n\n";
 }
 
 if ($v =~ /1.8.5/ or $v =~ /1.9b/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 1.8.5 - 1.9b (import-mt.php) Remote File Include Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/1219\n\n";
 }

 if ($v =~ /5.0.6/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution CMS 5.0.6 - XSS & FPD Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/21815\n\n";
 }

 if ($v =~ /4.0.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] b2evolution 4.0.5 (default.php) Remote File inclusion Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/15936\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011040129\n\n";
 }

 if ($v =~ /4.1.3/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] B2Evolution CMS 4.1.3 SQL Injection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012030250\n\n";
 }

 if ($v =~ /1.6/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] http://cxsecurity.com/issue/WLB-2006120078\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2007050051\n\n";
 }

 if ($expN==0){ print "\n[", BOLD RED,"~", BOLD WHITE,"] Exploits not found :'( \n"; exit(); }
print BOLD WHITE,"-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ",BOLD MAGENTA $expN."",BOLD WHITE,"\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
