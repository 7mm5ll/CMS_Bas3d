package bin::textpattern;
use Exporter qw(import);
our @EXPORT_OK = qw(vtp);
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


 if ($v =~ /4.2.0/){ $expN = $expN + 3;
 print "+-[|] Textpattern CMS 4.2.0 cross site scripting vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010110030\n|\n";
 print "+-[|] Textpattern CMS 4.2.0 remote file inclusion vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2010080094\n";
 print "+--[-] http://www.exploit-db.com/exploits/14823/\n";
 print "+--[-] http://www.1337day.com/exploit/13899\n|\n";
 print "+-[|] Textpattern 4.2.0 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011040034\n|\n";
 }
 
 if ($v =~ /4.3.0/){ $expN = $expN + 2;
 print "+-[|] Textpattern 4.3.0 Cross Site Request Forgery\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2011050090\n|\n";
 print "+-[|] Textpattern 4.3.0 CMS XSRF Vulnerability (Change Admin's Password)\n";
 print "+--[-] http://www.1337day.com/exploit/16158\n\n";
 }
 
 if ($v =~ /4.4.1/){ $expN = $expN + 1;
 print "+-[|] Textpattern CMS 4.4.1 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012010035\n\n";
 } 
 
 if ($v =~ /1.19/){ $expN = $expN + 1;
 print "+-[|] TextPattern <= 1.19 (publish.php) Remote File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/2646/\n";
 print "+--[-] http://www.1337day.com/exploit/1061\n\n";
 } 

 if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
