package bin::silverstripe;
use Exporter qw(import);
our @EXPORT_OK = qw(vss);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vss {
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

print BOLD WHITE,"Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if (lc($ynver) eq "n"){ print "\n"; }
if (lc($ynver) eq "y"){
 print BOLD WHITE,"Version: ";
 $v=<STDIN>; chomp $v;
}

 if ($v =~ /2.4.0/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 2.4.0 remote shell upload \n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010060031\n\n";
 }
 
 if ($v =~ /2.4/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 2.4 File Renaming Security Bypass Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/34113/\n\n";
 }

 if ($v =~ /3.0.3/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 3.0.3 Information Disclosure\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013080024\n\n";
 }

 if ($v =~ /3.0.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe Framework CMS 3.0.5 Multiple Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2013100028\n\n";
 }

 if ($v =~ /3.0.2/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] silverstripe cms 3.0.2 - Multiple Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/23031/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19827\n",BOLD GREEN,"|\n";
 print "+-[|] SilverStripe CMS 3.0.2 Cross Site Request Forgery & Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012110235\n\n";
 }

 if ($v =~ /2.3.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Silverstripe <= 2.3.5 - CSRForgery and Open Redirection Vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11244/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/10720\n\n";
 }

 if ($v =~ /2.4.7/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 2.4.7 (install.php) Remote Command Execution\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/18139\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 2.4.7 <= Arbitrary URL Redirection\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012100250\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012100124\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe CMS 2.4.7 <= Persistent Cross Site Scripting Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012100251\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012100125\n\n"; 
 }

 if ($v =~ /2.3.4/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Silverstripe <= v2.3.4 XSS vulnerabilities\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010040305\n\n";
 }

 if ($v =~ /2.4.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] SilverStripe 2.4.5 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011100060\n\n";
 }

  $expN = $expN + 1;
  
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Silverstripe CMS Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012020002\n\n";

 if ($expN==0){ print "\n[", BOLD RED,"~", BOLD WHITE,"] Exploits not found :'( \n"; exit(); }
print BOLD WHITE,"-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ",BOLD MAGENTA $expN."",BOLD WHITE,"\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
