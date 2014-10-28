package bin::textpattern;
use Exporter qw(import);
our @EXPORT_OK = qw(vtp);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vtp {
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


 if ($v =~ /4.2.0/){ $expN = $expN + 3;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern CMS 4.2.0 cross site scripting vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010110030\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern CMS 4.2.0 remote file inclusion vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010080094\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/14823/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/13899\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern 4.2.0 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011040034\n\n";
 }
 
 if ($v =~ /4.3.0/){ $expN = $expN + 2;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern 4.3.0 Cross Site Request Forgery\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011050090\n",BOLD GREEN,"|\n";
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern 4.3.0 CMS XSRF Vulnerability (Change Admin's Password)\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/16158\n\n";
 }
 
 if ($v =~ /4.4.1/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern CMS 4.4.1 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012010035\n\n";
 } 
 
 if ($v =~ /1.19/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] TextPattern <= 1.19 (publish.php) Remote File Inclusion Vulnerability\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/2646/\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/1061\n\n";
 } 
 
 if ($v =~ /4.5.5/){ $expN = $expN + 1;
 print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] Textpattern 4.5.5 Cross Site Scripting\n";
 print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014100004\n\n";
 }

 if ($expN==0){ print "\n[", BOLD RED,"~", BOLD WHITE,"] Exploits not found :'( \n"; exit(); }
print BOLD WHITE,"-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ",BOLD MAGENTA $expN."",BOLD WHITE,"\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
