package bin::wordpress;
use Exporter qw(import);
our @EXPORT_OK = qw(vwp);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vwp {
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

if (length($source) > 0){ }else{ print "\n[~] Error!\n"; exit(); }

if ($source =~ /<meta name="generator" content="WordPress (.*)" \/>/){ $v = $1; 
}else{ 
print "Version not found! Want to enter manually?[y/n]: ";
$ynver=<STDIN>; chomp $ynver;
if ($ynver eq "n" or $ynver eq "N"){ print "\n"; }
if ($ynver eq "y" or $ynver eq "Y"){
 print "Version: ";
 $v=<STDIN>; chomp $v;
}
}
$expN = 0;

 if ($v =~ /3.9.1 /){ $expN = $expN + 1;
 print "+-[|] Wordpress 3.9.1 pluggable.php CSRF vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080072\n\n"; 
 }

 if ($v =~ /3.3.1/){ $expN = $expN + 2;
 print "+-[|] Wordpress 3.3.1 - Multiple CSRF Vulnerabilities \n";
 print "+--[-] http://www.exploit-db.com/exploits/18791/\n|\n";
 print "+-[|] wordpress <= 3.3.1 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18417/\n\n";
 }
 
 if ($v =~ /3.0.3/){ $expN = $expN + 1;
 print "+-[|] wordpress 3.0.3 - Stored XSS (ie7,6 ns8.1)\n"; 
 print "+--[-] http://www.exploit-db.com/exploits/15858/\n\n"; 
 }
 
 if ($v =~ /2.9/){ $expN = $expN + 2;
 print "+-[|] WordPress 2.9 - Failure to Restrict URL Access\n";
 print "+--[-] http://www.exploit-db.com/exploits/11441/\n|\n";
 print "+-[|] Wordpress <= 2.9 - DoS (0day)\n";
 print "+--[-] http://www.exploit-db.com/exploits/10825/\n";
 print "+--[-] http://www.1337day.com/exploit/9817\n\n";
 }
 
 if ($v =~ /2.8.5/){ $expN = $expN + 1;
 print "+-[|] WordPress <= 2.8.5 Unrestricted File Upload Arbitrary PHP Code Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/10089/\n\n"; 
 }
 
 if ($v =~ /2.0/ or $v =~ /2.7.1/){ $expN = $expN + 2;
 print "+-[|] WordPress 2.0 - 2.7.1 admin.php Module Configuration Security Bypass Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/10088/\n|\n"; 
 print "+-[|] WordPress 2.0 wp-register.php Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/30602/\n\n";
 }
 
 if ($v =~ /2.8.3/){ $expN = $expN + 2;
 print "+-[|] Wordpress <= 2.8.3 - Remote Admin Reset Password Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/9410/\n|\n"; 
 print "+-[|] Wordpress 2.8.1 (url) Remote Cross Site Scripting Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/9250/\n\n";
 }
 
 if ($v =~ /2.7.5/){ $expN = $expN + 1;
 print "+-[|] WordPress Disqus 2.7.5 CSRF / Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080055\n\n";
 }
 
 if ($v =~ /2.6.1/){ $expN = $expN + 2;
 print "+-[|] Wordpress 2.6.1 (SQL Column Truncation) Admin Takeover Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/6421/\n|\n"; 
 print "+-[|] Wordpress 2.PHPWordPress 3.0 - Multiple SQL Injection Vulnerabilities6.1 SQL Column Truncation Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/6397/\n\n";
 }
 
 if ($v =~ /2.5.1/){ $expN = $expN + 1;
 print "+-[|] WordPress <= 2.5.1 'press-this.php' Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/32053/\n\n"; 
 }
 
 if ($v =~ /2.3.3/){ $expN = $expN + 1;
 print "+-[|] WordPress <= 2.3.3 - 'cat' Parameter Directory Traversal Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31670/\n\n"; 
 }
 
 if ($v =~ /2.3.2/){ $expN = $expN + 2;
 print "+-[|] WordPress 2.3.2 - wp-admin/users.php inviteemail Parameter XSS \n";
 print "+--[-] http://www.exploit-db.com/exploits/31356/\n|\n"; 
 print "+-[|] WordPress 2.3.2 - wp-admin/invites.php to Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/31357/\n\n";
 }
 
 if ($v =~ /2.2.3/){ $expN = $expN + 3;
 print "+-[|] WordPress <= 2.2.3 wp-admin/page-new.php popuptitle Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/30978/\n|\n";
 print "+-[|] WordPress <= 2.2.3 - wp-admin/post.php popuptitle Parameter XSS \n";
 print "+--[-] http://www.exploit-db.com/exploits/30977/\n|\n";
 print "+-[|] WordPress <= 2.2.3 wp-admin/edit.php backup Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/30979/\n\n";
 }
 
 if ($v =~ /2.3.1/){ $expN = $expN + 2;
 print "+-[|] WordPress 2.3.1 Unauthorized Post Access Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30889/\n|\n"; 
 print "+-[|] Wordpress <= 2.3.1 Charset Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4721/\n\n";
 
 }
 
 if ($v =~ /2.3/){ $expN = $expN + 1;
 print "+-[|] WordPress 2.3 Edit-Post-Rows.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30715/\n\n"; 
 }
 
 if ($v =~ /2.2/){ $expN = $expN + 3;
 print "+-[|] WordPress 2.2 (wp-app.php) Arbitrary File Upload Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4113/\n|\n"; 
 print "+-[|] WordPress 2.2 Request_URI Parameter Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30166/\n|\n"; 
 print "+-[|] Wordpress 2.2 (xmlrpc.php) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4039/\n\n"; 
 }

 if ($v =~ /1.0.7/){ $expN = $expN + 1;
 print "+-[|] WordPress 1.0.7 Pool Index.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30520/\n\n"; 
 }
 
 if ($v =~ /2.1.3/){ $expN = $expN + 2;
 print "+-[|] Wordpress 2.1.3 admin-ajax.php SQL Injection Blind Fishing Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3960/\n|\n"; 
 print "+-[|] WordPress 2.1.3 Akismet Plugin Unspecified Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30036/\n\n"; 
 }
 
 if ($v =~ /2.1.2/){ $expN = $expN + 1;
 print "+-[|] Wordpress 2.1.2 (xmlrpc) Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3656/\n\n"; 
 }
 
 if ($v =~ /2.(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress 2.x PHP_Self Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29754/\n\n"; 
 }
 
 if ($v =~ /2.1.1/){ $expN = $expN + 4;
 print "+-[|] WordPress 2.1.1 wp-includes/feed.php ix Variable Arbitrary Command Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/29701/\n|\n"; 
 print "+-[|] WordPress 2.1.1 wp-includes/theme.php iz Variable Arbitrary Command Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/29702/\n|\n";
 print "+-[|] Wordpress 2.1.1 - Multiple Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/29684/\n|\n";
 print "+-[|] Wordpress 2.1.1 Post.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29682/\n\n";
 } 
 
 if ($v =~ /2.0.6/){ $expN = $expN + 1;
 print "+-[|] Wordpress <= 2.0.6 wp-trackback.php Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3109/\n\n"; 
 } 
 
 if ($v =~ /2.0.5/){ $expN = $expN + 2;
 print "+-[|] Wordpress 2.0.5 Trackback UTF-7 Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/3095/\n|\n"; 
 print "+-[|] WordPress 2.0.5 Functions.PHP Remote File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28980/\n\n";
 } 
 
 if ($v =~ /1.(.*)/ or $v =~ /2.0.(.*)/){ $expN = $expN + 3;
 print "+-[|] Wordpress 1.x/2.0.x Template.PHP HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29356/\n|\n"; 
 print "+-[|] WordPress 1.x/2.0.x Pingback SourceURI Denial of Service and Information Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29522/\n|\n"; 
 print "+-[|] Wordpress 1.x/2.0.x Templates.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29598/\n\n"; 
 } 
 
 if ($v =~ /1.6/ or $v =~ /1.7/){ $expN = $expN + 1;
 print "+-[|] WP-DB Backup For Wordpress 1.6/1.7 Edit.PHP Directory Traversal Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28382/\n\n"; 
 } 
 
 if ($v =~ /2.0.2/){ $expN = $expN + 1;
 print "+-[|] WordPress <= 2.0.2 (cache) Remote Shell Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/6\n\n"; 
 } 
 
 if ($v =~ /2.0/){ $expN = $expN + 1;
 print "+-[|] WordPress 2.0 Comment Post HTML Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27227/\n\n"; 
 } 
 
 if ($v =~ /3.0/){ $expN = $expN + 1;
 print "+-[|] PHPWordPress 3.0 - Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/26608/\n\n"; 
 } 
 
 if ($v =~ /1.5.13/){ $expN = $expN + 2;
 print "+-[|] Wordpress <= 1.5.1.3 - Remote Code Execution eXploit (metasploit)\n";
 print "+--[-] http://www.exploit-db.com/exploits/1145/\n|\n";
 print "+-[|] Wordpress <= 1.5.1.3 - Remote Code Execution 0Day\n";
 print "+--[-] http://www.exploit-db.com/exploits/1142/\n\n"; 
 } 
 
 if ($v =~ /1.5.1.2/){ $expN = $expN + 1;
 print "+-[|] Wordpress <= 1.5.1.2 xmlrpc Interface SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1077/\n\n"; 
 } 
 
 if ($v =~ /1.5.1.1/){ $expN = $expN + 2;
 print "+-[|] WordPress <= 1.5.1.1 - SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1033/\n|\n"; 
 print "+-[|] WordPress <= 1.5.1.1 'add new admin' SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1059/\n\n"; 
 } 
 
 if ($v =~ /1.2.1/ or $v =~ /1.2.2/){ $expN = $expN + 5;
 print "+-[|] WordPress 1.2.1/1.2.2 moderation.php item_approved Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24993/\n|\n"; 
 print "+-[|] WordPress 1.2.1/1.2.2 /wp-admin/post.php content Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24988/\n|\n";
 print "+-[|] WordPress 1.2.1/1.2.2 link-categories.php cat_id Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24991/\n|\n";
 print "+-[|] WordPress 1.2.1/1.2.2 link-manager.php Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24992/\n|\n";
 print "+-[|] WordPress 1.2.1/1.2.2 link-add.php Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24990/\n\n"; 
 } 
 
 if ($v =~ /1.2/){ $expN = $expN + 7;
 print "+-[|] Wordpress 1.2 Wp-login.PHP HTTP Response Splitting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24667/\n|\n"; 
 print "+-[|] WordPress 1.2 wp-login.php Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24641/\n|\n";
 print "+-[|] WordPress 1.2 admin-header.php redirect_url Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24642/\n|\n";
 print "+-[|] WordPress 1.2 bookmarklet.php Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24643/\n|\n";
 print "+-[|] WordPress 1.2 categories.php cat_ID Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24644/\n|\n";
 print "+-[|] WordPress 1.2 edit.php s Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24645/\n|\n";
 print "+-[|] WordPress 1.2 edit-comments.php Multiple Parameter XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/24646/\n\n";
 } 
 
 if ($v =~ /0.6/ or $v =~ /0.7/){ $expN = $expN + 1;
 print "+-[|] Wordpress 0.6/0.7 Blog.Header.PHP SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23213/\n\n"; 
 } 
 
 if ($v =~ /1.5/){ $expN = $expN + 1;
 print "+-[|] Wordpress 1.5 Post.PHP Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25682/\n\n"; 
 }
 
 if ($v =~ /2.0.3/){ $expN = $expN + 1;
 print "+-[|] WordPress 2.0.3 Denial of Service Exploit\n";
 print "+--[-] http://www.1337day.com/exploit/17164\n\n";
 }
 
 if ($v =~ /3.9.1/){ $expN = $expN + 1;
 print "+-[|] Wordpress 3.9.1 - CSRF Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22362\n\n";
 }

#VERSÂO WORDPRESS ------------------------------------------------------------------------
 if ($source =~ /(.*)\/plugins\/contus-video-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Video Gallery Plugin 2.5 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/34161/\n";
 }
 
 if ($source =~ /(.*)\/themes\/parallax\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress TimThumb 2.8.13 WebShot - Remote Code Execution (0-day)\n";
 print "+--[-] http://www.exploit-db.com/exploits/33851/\n";
 print "+--[-] http://www.1337day.com/exploit/22374\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/linenity\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Theme LineNity 1.20 - Local File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/32861/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/videowhisper-live-streaming-integration\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress VideoWhisper 4.27.3 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/31986/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/adrotate\/(.*)/){ $expN = $expN + 3;
 print "+-[|] Wordpress AdRotate Plugin 3.9.4 - (clicktracker.php, track param) - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/31834/\n|\n";
 print "+-[|] WordPress AdRotate plugin <= 3.6.6 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18114/\n|\n";
 print "+-[|] WordPress AdRotate plugin <= 3.6.5 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17888/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/dandelion\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Dandelion Theme - Arbitry File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/31424/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/dzs-videogallery\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Plugin DZS Video Gallery 3.1.3 - Remote and Local File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30063/\n|\n";
 print "+-[|] WordPress dzs-videogallery Plugins Remote File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29834/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/page-flip-image-gallery\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress page-flip-image-gallery plugins Remote File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/30084/\n|\n";
 print "+-[|] Wordpress Plugin Page Flip Image Gallery <= 0.2.2 - Remote FD Vuln\n";
 print "+--[-] http://www.exploit-db.com/exploits/7543/\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/agritourismo-theme\/(.*)/ or $source =~ /(.*)\/themes\/oxygen-theme\/(.*)/ or $source =~ /(.*)\/themes\/rockstar-theme\/(.*)/ or $source =~ /(.*)\/themes\/reganto-theme\/(.*)/ or $source =~ /(.*)\/themes\/bordeaux-theme\/(.*)/ or $source =~ /(.*)\/themes\/bulteno-theme\/(.*)/ or $source =~ /(.*)\/themes\/radial-theme\/(.*)/ or $source =~ /(.*)\/themes\/rayoflight-theme\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Orange Themes CSRF File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29946/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/highlight\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Highlight Premium Theme - CSRF File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29525/\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/euclid_v1\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Euclid Theme 1.x.x - CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29667/\n\n";
 }
 
 if ($source =~ /(.*)\/hemes\/dimension\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Dimension Theme - CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29668/\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/amplus\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Amplus Theme - CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29669/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/make_a_statement_v1\/(.*)/ or $source =~ /(.*)\/themes\/make_a_statement\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Make A Statement (MaS) Theme - CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29670/\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/kernel-theme\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Theme Kernel - Remote File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29482/\n|\n";
 print "+-[|] WordPress Theme Kernel - Arbitrary Code Execution Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/21507\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/curvo\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Curvo Themes - CSRF File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29211/\n|\n";
 print "+-[|] WordPress Curvo Themes - Arbitrary Code Execution Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/21508\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/switchblade\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Switchblade Themes Arbitrary 1.3 - File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29330/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/ThinkResponsive\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Think Responsive Themes 1.0 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29332/\n\n";
 }  
 
 if ($source =~ /(.*)\/themes\/saico\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SAICO Theme 1.0-1.0.2 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29150/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/area53\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Area53 theme Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/29068/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-realty\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Realty - Blind SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/29021/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/formcraft\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Formcraft Plugin - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/30002/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/lazy-seo\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Lazy SEO plugin 1.1.9 - Shell Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28452/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/complete-gallery-manager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Complete Gallery Manager 3.3.3 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/28377/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/booking\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Booking Calendar 4.1.4 - CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27399/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/spicy-blogroll-ajax\/(.*)/ or $source =~ /(.*)\/plugins\/spicy-blogroll\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Spicy Blogroll Plugin - File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/26804/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/proplayer\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress ProPlayer Plugin 4.7.9.1 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/25605/\n|\n";
 print "+-[|] WordPress ProPlayer plugin <= 4.7.7 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17616/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-filemanager\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress wp-FileManager - Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25440/\n|\n";
 print "+-[|] Wordpress Plugin Wp-FileManager 1.2 - Remote Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4844/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/count-per-day\/(.*)/){ $expN = $expN + 4;
 print "+-[|] WordPress Count per Day Plugin 3.2.5 (counter.php) - XSS Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24859/\n|\n";
 print "+-[|] Wordpress Count per Day Plugin 3.2.3 XSS Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/20862/\n\n";
 print "+-[|] Wordpress Count-per-day plugin Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18355/\n|\n";
 print "+-[|] WordPress Count per Day plugin <= 2.17 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17857/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/simply-poll\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Simply Poll Plugin 1.4.1 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/24850/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/leaguemanager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress LeagueManager Plugin 3.8 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/24789/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/comment-rating\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Comment Rating Plugin 2.9.32 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/24552/\n|\n";
 print "+-[|] http://www.exploit-db.com/exploits/16221/\n";
 print "+--[-] Comment Rating 2.9.23 Wordpress Plugin Multiple Vulnerabilities\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/solvemedia\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SolveMedia 1.1.0 CSRF Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24364/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ripe-hd-player\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin Ripe HD FLV Player SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24229/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/wp-property\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress WP-Property PHP File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23651/\n";
 print "+--[-] http://www.1337day.com/exploit/20051\n|\n";
 print "+-[|] Wordpress WP-Property Plugin 1.35.0 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18987/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/asset-manager\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Asset-Manager PHP File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23652/\n|\n";
 print "+-[|] Wordpress Asset Manager Plugin 0.2 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18993/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/portable-phpmyadmin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Portable phpMyAdmin Wordpress Plugin Authentication Bypass\n";
 print "+--[-] http://www.exploit-db.com/exploits/23356/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/plugin-dir\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Facebook Survey 1.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22853/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/all-video-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress All Video Gallery 1.1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22427/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/bbpress\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress bbpress Plugin - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22396/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/webinar_plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Easy Webinar Plugin Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22300/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/social-discussions\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress social discussions plugin 6.1.1 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22158/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/fs-real-estate-plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] FireStorm Professional Real Estate Wordpress Plugin 2.06.01 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22071/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/Calendar\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin spider calendar Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/21715/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/archin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Archin WordPress Theme 3.2 Unauthenticated Configuration Access\n";
 print "+--[-] http://www.exploit-db.com/exploits/21646/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/hd-webplayer\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress HD Webplayer 1.1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/20918/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/mini-mail-dashboard-widget\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress mini mail dashboard widget 1.42 - Stored XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/20358/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/wp-simplemail\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress simplemail plugin 1.0.6 - Stored XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/20361/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/threewp-email-reflector\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin ThreeWP Email Reflector 1.13 - Stored XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/20361/\n\n";
 }
 
 if ($source =~ /(.*)\/themes\/diary\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Diary/Notebook Site5 Theme Email Spoofing\n";
 print "+--[-] http://www.exploit-db.com/exploits/19862/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/resume-submissions-job-postings\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Resume Submissions & Job Postings 2.5.1 - Unrestricted File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19791/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/website-faq\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Website FAQ Plugin 1.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/19400/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/radykal-fancy-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Fancy Gallery Plugin 1.2.4 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19398/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-automatic\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Automatic Plugin 2.0.3 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/19187/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/foxypress\/(.*)/){ $expN = $expN + 3;
 print "+-[|] WordPress plugin Foxypress uploadify.php Arbitrary Code Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/19100/\n|\n";
 print "+-[|] Wordpress Foxypress Plugin 0.4.1.1 - 0.4.2.1 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18991/\n|\n";
 print "+-[|] Uploadify jQuery Generic File Upload (Metasploit)\n";
 print "+--[-] http://www.1337day.com/exploit/19984\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-gpx-maps\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress wp-gpx-map 1.1.21 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19050/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/user-meta\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress User Meta 1.1.1 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19052/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/topquark\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Top Quark Architecture 2.10 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19053/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/sfbrowser\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress SfBrowser 1.4.5 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19054/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/pica-photo-gallery\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Pica Photo Gallery 1.0 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19055/\n|\n";
 print "+-[|] Wordpress PICA Photo Gallery Plugin 1.0 - Remote File Disclosure\n";
 print "+--[-] http://www.exploit-db.com/exploits/19016/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/mac-dock-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Mac Photo Gallery 2.7 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19056/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/drag-drop-file-uploader\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress drag and drop file upload 0.1 - Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19057/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/custom-content-type-manager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Custom Content Type Manager 0.9.5.13-pl Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19058/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/content-flow3d\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Content Flow 3D Plugin 1.0.0 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19036/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/front-file-manager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Front File Manager Plugin 0.1 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19012/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/easy-contact-forms-exporter\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Easy Contact Forms Export Plugin 1.1.0 Information Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19013/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/plugin-newsletter\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin: Newsletter 1.5 - Remote File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19018/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/rbxgallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress RBX Gallery Plugin 2.1 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19019/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/simple-download-button-shortcode\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Simple Download Button Shortcode Plugin 1.0 - Remote File Disclosure\n";
 print "+--[-] http://www.exploit-db.com/exploits/19020/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/thinkun-remind\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Thinkun Remind Plugin 1.1.3 - Remote File Disclosure\n";
 print "+--[-] http://www.exploit-db.com/exploits/19021/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/tinymce-thumbnail-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Tinymce Thumbnail Gallery Plugin 1.0.7 - Remote File Disclosure\n";
 print "+--[-] http://www.exploit-db.com/exploits/19022/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wpstorecart\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress wpStoreCart Plugin 2.5.27-2.5.29 Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19023/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/omni-secure-files\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Omni Secure Files Plugin 0.1.13 Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19009/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/front-end-upload\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Front End Upload 0.5.3 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/19008/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/gallery-plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Gallery Plugin 3.06 Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18998/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/mm-forms-community\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress MM Forms Community Plugin 2.2.6 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18997/\n|\n";
 print "+-[|] WordPress MM Forms Community plugin <= 1.2.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17725/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/font-uploader\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Font Uploader Plugin 1.2.4 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18994/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/html5avmanager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress HTML5 AV Manager Plugin 0.2.7 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18990/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-autoyoutube\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress wp-autoyoutube plugin Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18353/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/store-locator-le\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Google Maps via Store Locator Plugin 2.7.1 - 3.0.1 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18989/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wpmarketplace\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Marketplace Plugin 1.5.0 - 1.6.1 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18988/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/kish-guest-posting\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Kish Guest Posting Plugin 1.0 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18412/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/allwebmenus-wordpress-menu-plugin\/(.*)/){ $expN = $expN + 2;
 print "+-[|] AllWebMenus < 1.1.9 WordPress Menu Plugin Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/18407/\n|\n";
 print "+-[|] Wordpress AllWebMenus Plugin 1.1.3 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17861/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/ucan-post\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress ucan post plugin <= 1.0.09 - Stored XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/18390/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/age-verification\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Age Verification Plugin <= 0.4 Open Redirect\n";
 print "+--[-] http://www.exploit-db.com/exploits/18350/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/pay-with-tweet.php\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress pay with tweet plugin <= 1.1 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18330/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/mailz\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Mailing List Plugin Arbitrary File Download\n";
 print "+--[-] http://www.exploit-db.com/exploits/18276/\n|\n";
 print "+-[|] Wordpress Mailing List Plugin 1.3.2 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17866/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/jetpack\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress jetpack Plugin - 'sharedaddy.php' ID SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18126/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-glossary\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Glossary - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18055/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/wptouch\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress wptouch plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18039/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/zingiri-web-shop\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Zingiri Web Shop Plugin <= 2.4.0 - Multiple XSS Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18787/\n|\n";
 print "+-[|] Wordpress Zingiri Web Shop Plugin <= 2.4.2 Persistent XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/18806/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/contact-form-wordpres\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Contact Form plugin <= 2.7.5 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17980/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/gd-star-rating\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress GD Star Rating plugin <= 1.9.10 SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17973/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/wp-spamfree\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WP-SpamFree WordPress Spam Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17970/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-bannerize\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Bannerize <= 2.8.7 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17906/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/mingle-forum\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Mingle Forum plugin <= 1.0.31 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17894/\n|\n";
 print "+-[|] mingle forum (wordpress plugin) <= 1.0.26 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/15943/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/cevhershare\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress CevherShare Plugin 2.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17891/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/link-library\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Link Library plugin <= 5.2.1 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17887/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/category-grid-view-gallery\/(.*)/ 
  or $source =~ /(.*)\/plugins\/auto-attachments\/(.*)/ 
  or $source =~ /(.*)\/plugins\/wp-marketplace\/(.*)/ 
  or $source =~ /(.*)\/plugins\/dp-thumbnail\/(.*)/ 
  or $source =~ /(.*)\/plugins\/vk-gallery\/(.*)/ 
  or $source =~ /(.*)\/plugins\/rekt-slideshow\/(.*)/ 
  or $source =~ /(.*)\/plugins\/cac-featured-content\/(.*)/ 
  or $source =~ /(.*)\/plugins\/rent-a-car\/(.*)/ 
  or $source =~ /(.*)\/plugins\/lisl-last-image-slider\/(.*)/ 
  or $source =~ /(.*)\/plugins\/islidex\/(.*)/ 
  or $source =~ /(.*)\/plugins\/kino-gallery\/(.*)/ 
  or $source =~ /(.*)\/plugins\/a-gallery\/(.*)/ 
  or $source =~ /(.*)\/plugins\/category-list-portfolio-page\/(.*)/
  or $source =~ /(.*)\/plugins\/really-easy-slider\/(.*)/ 
  or $source =~ /(.*)\/plugins\/verve-meta-boxes\/(.*)/ 
  or $source =~ /(.*)\/plugins\/extend-wordpress\/(.*)/){ $expN = $expN + 1;  
 print "+-[|] Multiple Wordpress Plugin timthumb.php Vulnerabilites\n"; 
 print "+--[-] http://www.exploit-db.com/exploits/17872/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/mini-mail-dashboard-widgetwp-mini-mail(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Mini Mail Dashboard Widget Plugin 1.36 Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17868/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/zingiri-web-shop\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Zingiri Web Shop Plugin 2.2.0 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17867/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/disclosure-policy-plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Disclosure Policy Plugin 1.0 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17865/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/livesig\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Livesig Plugin 0.4 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17865/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/annonces\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Annonces Plugin 1.2.0.0 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17863/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wpeasystats\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress WPEasyStats Plugin 1.8 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17862/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/thecartpress\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress TheCartPress Plugin 1.1.1 - Remote File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17860/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/filedownload\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Filedownload Plugin 0.1 (download.php) Remote File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17858/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/forum-server\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Plugin Forum Server <= 1.7 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17828/\n|\n";
 print "+-[|] Wordpress Plugin Forum Server 1.6.5 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/16235/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/tune-library\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Tune Library plugin <= 2.17 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17816/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/a-to-z-category-listing\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress A to Z Category Listing plugin <= 1.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17809/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-filebase\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress WP-Filebase Download Manager plugin <= 0.2.9 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17808/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/1-flash-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress 1 Flash Gallery Plugin Arbiraty File Upload Exploit (MSF)\n";
 print "+--[-] http://www.exploit-db.com/exploits/17801/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/community-events\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Community Events plugin <= 1.2.1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17798/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/paid-downloads\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Paid Downloads plugin <= 2.01 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17797/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/eventify\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Eventify - Simple Events plugin <= 1.7.f SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17794/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/scormcloud\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SCORM Cloud plugin <= 1.0.6.6 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17793/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/knr-author-list-widget\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress KNR Author List Widget plugin <= 2.0.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17791/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/post-highlights\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress post highlights plugin <= 2.2 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17790/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/oqey-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress oQey Gallery plugin <= 0.4.8 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17779/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/zotpress\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Zotpress plugin <= 4.4 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17778/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/facebook-opengraph-meta-plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Facebook Opengraph Meta Plugin plugin <= 1.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17773/\n\n";
 }
 
 if ($source =~ /(.*)\/plugins\/videowhisper-video-presentation\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress VideoWhisper Video Presentation plugin <= 1.1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17771/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/search-autocomplete\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SearchAutocomplete plugin <= 1.0.8 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17767/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-bannerize\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Bannerize <= 2.8.6 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17764/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wordpress-donation-plugin-with-goals-and-paypal-ipn-by-nonprofitcmsorg\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Donation plugin <= 1.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17763/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/image-gallery-with-slideshow\/(.*)/){ $expN = $expN + 1;
 print "+-[|] wordpress image gallery with slideshow plugin <= 1.5 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/17761/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/grapefile\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress grapefile plugin <= 1.1 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/17760/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/couponer\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Couponer plugin <= 1.2 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17759/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/pure-html\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress PureHTML plugin <= 1.0.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17758/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/yolink-search\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress yolink Search plugin <= 1.1.4 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17757/\n\n";
 }  

 if ($source =~ /(.*)\/plugins\/wp-audio-gallery-playlist\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin audio gallery playlist <= 0.12 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17756/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/crawlrate-tracker\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Crawl Rate Tracker plugin <= 2.0.2 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17755/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/event-registration\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Event Registration plugin <= 5.4.3 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17751/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/advertizer\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Advertizer plugin <= 1.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17750/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/copyright-licensing-tools\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress iCopyright(R) Article Tools plugin <= 1.1.4 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17749/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/sh-slideshow\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SH Slideshow plugin <= 3.1.4 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17748/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/mystat\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress mySTAT plugin <= 2.6 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17740/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/evarisk\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Evarisk plugin <= 5.1.3.6 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17738/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/profiles\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Profiles plugin <= 2.0 RC1 SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17739/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/fbpromotions\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Facebook Promotions plugin <= 1.3.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17737/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/photoracer\/(.*)/){ $expN = $expN + 3;
 print "+-[|] WordPress Photoracer Plugin <= 1.0 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/17731/\n|\n";
 print "+-[|] WordPress Photoracer plugin <= 1.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17720/\n|\n";
 print "+-[|] WordPress Plugin Photoracer 1.0 (id) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/8961/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/oqey-headers\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress oQey Headers plugin <= 0.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17730/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/js-appointment\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Js-appointment plugin <= 1.5 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17724/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/sendit\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress SendIt plugin <= 1.5.9 - Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17716/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ungallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress UnGallery plugin <= 1.5.8 - Local File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17704/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/global-content-blocks\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Global Content Blocks plugin <= 1.2 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17687/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ajaxgallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Ajax Gallery plugin <= 3.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17686/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wpforum\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Forum <= 1.7.8 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17684/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-ds-faq\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin DS FAQ <= 1.3.2 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17683/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/odihost-newsletter-plugin\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress OdiHost Newsletter plugin <= 1.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17681/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/easy-contact-form-lite\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Easy Contact Form Lite Plugin <= 1.0.7 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17680/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-symposium\/(.*)/){ $expN = $expN + 1;
 print "+-[|] http://www.exploit-db.com/exploits/17679/\n";
 print "+--[-] Wordpress Plugin Symposium <= 0.64 - SQL Injection Vulnerability\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/contus-hd-flv-player\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Contus HD FLV Player plugin <= 1.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17678/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/allow-php-in-posts-and-pages\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Allow PHP in Posts and Pages plugin <= 2.0.0.RC1 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17688/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-menu-creator\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Menu Creator plugin <= 1.1.7 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17689/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/file-groups\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress File Groups plugin <= 1.1.2 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17677/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ip-logger\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress IP-Logger Plugin <= 3.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17673/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/media-library-categories\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Media Library Categories plugin <= 1.0.6 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17628/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/upm-polls\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress UPM Polls plugin <= 1.0.3 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17627/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-e-commerce\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin E-commerce <= 3.8.4 - SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/17613/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/social-slider-2\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Social Slider plugin <= 5.6.5 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17617/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/is-human\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Is-human <= 1.4.2- Remote Command Execution Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17299/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/editormonkey\/(.*)/){ $expN = $expN + 1;
 print "+-[|] EditorMonkey WordPress Plugin (FCKeditor) 2.5 - Arbitrary File Upload\n";
 print "+--[-] http://www.exploit-db.com/exploits/17284/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ajax-category-dropdown\/(.*)/){ $expN = $expN + 1;
 print "+-[|] ajax category dropdown wordpress plugin 0.1.5 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/17207/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-custom-pages\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Custom Pages 0.5.0.1 - LFI Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17119/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/flash-album-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] GRAND Flash Album Gallery 0.55 Wordpress Plugin Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/16947/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/php_speedy_wp\/(.*)/){ $expN = $expN + 1;
 print "+-[|] PHP Speedy <= 0.5.2 Wordpress Plugin (admin_container.php) Remote Code Exec Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/16273/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/old-post-spinner\/(.*)/){ $expN = $expN + 1;
 print "+-[|] OPS Old Post Spinner 2.2.1 Wordpress Plugin LFI Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/16251/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/jquery-mega-menu\/(.*)/){ $expN = $expN + 1;
 print "+-[|] jQuery Mega Menu 1.0 Wordpress Plugin Local File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/16250/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/iwant-one-ihave-one\/(.*)/){ $expN = $expN + 1;
 print "+-[|] IWantOneButton 3.0.1 Wordpress Plugin Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/16236/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/nextgen-smooth-gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress NextGEN Smooth Gallery 0.12 - Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/14541/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/firestats\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Firestats Remote Configuration File Download\n";
 print "+--[-] http://www.exploit-db.com/exploits/14308/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/accept-signups\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WORDPRESS Plugin Accept Signups 0.1 XSS\n";
 print "+--[-] http://www.exploit-db.com/exploits/15808/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/cimy-counter\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Cimy Counter - Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/14057/\n|\n";
 print "+-[|] Cimy Counter for WordPress 0.9.4 HTTP Response Splitting and Cross Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/34195/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/nextgen-gallery\/(.*)/){ $expN = $expN + 2;
 print "+-[|] Wordpress Plugin NextGEN Gallery <= 1.5.1 - XSS Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/12098/\n|\n";
 print "+-[|] WordPress NextGEN Gallery 2.0.63 Shell Upload Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22409\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/cpl\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Copperleaf Photolog 0.16 - SQL injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/11458/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/events-calendar\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Events Plugin SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/10929/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/ImageManager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Image Manager Plugins Shell Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/10325/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-cumulus\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress WP-Cumulus <= 1.20 - Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/10228/\n|\n";
 print "+-[|] WordPress WP-Cumulus Plugin 1.x 'tagcloud.swf' Cross-Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33371/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-syntax\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin WP-Syntax <= 0.9.1 - Remote Command Execution\n";
 print "+--[-] http://www.exploit-db.com/exploits/9431/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/dm-albums\/(.*)/){ $expN = $expN + 2;
 print "+-[|] WordPress Plugin DM Albums 1.9.2 - Remote File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/9048/\n|\n";
 print "+-[|] WordPress Plugin DM Albums 1.9.2 - Remote File Inclusion Vuln\n";
 print "+--[-] http://www.exploit-db.com/exploits/9043/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/related-sites\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Plugin Related Sites 2.1 - Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/9054/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-lytebox\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Lytebox (wp-lytebox) Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/8791/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/fmoblog\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin fMoblog 2.1 (id) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/8229/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-forum\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin WP-Forum 1.7.8 - Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/7738/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-shopping-cart\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin e-Commerce <= 3.4 - Arbitrary File Upload Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/6867/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/st_newsletter\/(.*)/){ $expN = $expN + 3;
 print "+-[|] Wordpress Plugin st_newsletter (stnl_iframe.php) SQL Injection Vuln\n";
 print "+--[-] http://www.exploit-db.com/exploits/6777/\n|\n";
 print "+-[|] Wordpress Plugin st_newsletter Remote SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5053/\n|\n";
 print "+-[|] WordPress Plugin ShiftThis Newsletter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31096/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/downloads-manager\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Download Manager 0.2 - Arbitrary File Upload Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/6127/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wpSS\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Spreadsheet <= 0.6 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5486/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/sniplets\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Sniplets 1.1.2 (RFI/XSS/RCE) Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/5194/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/recipe\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Recipes Blog Plugin 'id' Parameter SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31228/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-people\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress wp-people Plugin 2.0 'wp-people-popup.php' SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31230/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-adserve\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Adserve 0.2 adclick.php SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5013/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wassup\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin WassUp 1.4.3 (spy.php to_date) SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/5017/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-cal\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin WP-Cal 0.3 editevent.php SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4992/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/fgallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin fGallery 2.4.1 fimrss.php SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4993/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/pictpress\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin PictPress <= 0.91 Remote File Disclosure Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4695/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-footnotes\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WP-Footnotes 2.2 WordPress Plugin Multiple Remote Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/31092/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wp-table\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin wp-Table <= 1.43 (inc_dir) RFI Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3824/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/wordtube\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin wordTube <= 1.43 (wpPATH) RFI Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3825/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/myflash\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress plugin myflash <= 1.00 (wppath) RFI Vulnerability\n";
 print "+--[-] www.exploit-db.com/exploits/3828/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/enigma2\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Enigma 2 WordPress Bridge (boarddir) Remote File Include Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3051/\n\n";
 }  
 
 if ($source =~ /(.*)\/plugins\/spambam\/(.*)/){ $expN = $expN + 1;
 print "+-[|] SpamBam WordPress Plugin Key Calculation Security Bypass Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/31030/\n\n";
 }  

 if ($source =~ /(.*)\/themes\/gamespeed\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress Gamespeed Theme Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080008\n\n";
 } 
 
 if ($source =~ /(.*)\/plugins\/si-captcha-for-wordpress\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress SI CAPTCHA Anti-Spam Plugin Cross site scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080003\n\n";
 } 
 
 if ($source =~ /(.*)\/plugins\/player\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Spider Video Player plugin Cross site scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080002\n\n";
 } 
 
 if ($source =~ /(.*)\/themes\/myband\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress MyBand Theme Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014080014\n\n";
 }  

 if ($source =~ /(.*)\/themes\/sandbox\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress theme sandbox Arbitrary File Upload Vulnerability (msf)\n";
 print "+--[-] http://www.1337day.com/exploit/20232\n\n";
 }

 if ($source =~ /(.*)\/plugins\/sintic_gallery\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress plugins sintic_gallery File Upload (metasploit)\n";
 print "+--[-] http://www.1337day.com/exploit/20065\n\n";
 }

 if ($source =~ /(.*)\/plugins\/compfight\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress BSK PDF Manager 1.3.2 Authenticated SQL Injection Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22428\n\n";
 }

 if ($source =~ /(.*)\/themes\/ProjectTheme\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme ProjectTheme Shell Upload Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22420\n\n";
 }

 if ($source =~ /(.*)\/themes\/PricerrTheme\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme PricerrTheme Shell Upload Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22421\n\n";
 }

 if ($source =~ /(.*)\/plugins\/image-symlinks\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress image-symlinks Plugin Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22364\n\n";
 }

 if ($source =~ /(.*)\/plugins\/maxgalleria-lite\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Plugin Maxgalleria Lite Wordpress Post Title Edit Vulnerbility\n";
 print "+--[-] http://www.1337day.com/exploit/22371\n\n";
 }

 if ($source =~ /(.*)\/plugins\/bib2html\/(.*)/){ $expN = $expN + 1;
 print "+-[|] WordPress bib2html 0.9.3 Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22281\n\n";
 }

 if ($source =~ /(.*)\/themes\/elegance\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Elegance Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22355\n\n";
 }

 if ($source =~ /(.*)\/themes\/construct\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Construct Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22357\n\n";
 }

 if ($source =~ /(.*)\/themes\/dejavu\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Dejavu Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22358\n\n";
 }

 if ($source =~ /(.*)\/themes\/echelon\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Echelon Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22356\n\n";
 }

 if ($source =~ /(.*)\/themes\/awake\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Awake Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22359\n\n";
 }

 if ($source =~ /(.*)\/themes\/fusion\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Fusion Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22354\n\n";
 }

 if ($source =~ /(.*)\/themes\/method\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Method Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22350\n\n";
 }

 if ($source =~ /(.*)\/themes\/modular\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Modular Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22351\n\n";
 }

 if ($source =~ /(.*)\/themes\/infocus\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Infocus Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22352\n\n";
 }

 if ($source =~ /(.*)\/themes\/myriad\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Myriad Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22353\n\n";
 }

 if ($source =~ /(.*)\/themes\/manbiz2\/(.*)/){ $expN = $expN + 1;
 print "+-[|] Wordpress Theme Manbiz2 Arbitrary File Download Vulnerability\n";
 print "+--[-] http://www.1337day.com/exploit/22360\n\n";
 }

  if ($expN==0){ print "\n[~] Exploits not found :'( \n"; exit(); }
print "-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ".$expN."\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
