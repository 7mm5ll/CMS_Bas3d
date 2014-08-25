package bin::joomla;
use Exporter qw(import);
our @EXPORT_OK = qw(vjoomla);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vjoomla {

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

if ($source =~ /<meta name="generator" content="Joomla!(.*)/){ $v = $1; 
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
#VERSÂO JOOMLA ------------------------------------------------------------------------
 if ($v =~ /1.0.7/){ $expN = $expN + 1;
 print "+-[|] Mambo <= 4.5.3 & Joomla <= 1.0.7 - (feed) Denial of Service Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/1698/\n\n";
 }
 
 if($v =~ /1.5.0 Beta/){ $expN = $expN + 1;
 print "+-[|] Joomla 1.5.0 Beta (pcltar.php) Remote File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/3781/\n\n"; 
 }
 
 if ($v =~ /1.5 RC3/){ $expN = $expN + 1;
 print "+-[|] Joomla 1.5 RC3 com_content index.php view Parameter SQL Injection \n";
 print "+--[-] http://www.exploit-db.com/exploits/30848/\n\n";
 }
 
 if($v =~ /1.5.12/){$expN = $expN + 3;
 print "+-[|] Joomla 1.5.12 connect back exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/11262/\n|\n"; 
 print "+-[|] Joomla 1.5.12 read/exec remote files\n";
 print "+--[-] http://www.exploit-db.com/exploits/11263/\n|\n";
 print "+-[|] Joomla 1.5.12 - tinybrowser Remote File Upload/Execute Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/9926/\n\n"; 
 }
 
 if($v =~ /1.5.26/ or $v =~ /2.5.11/ or $v =~ /3.1.1/){$expN = $expN + 1;
 print "+-[|] Joomla 1.5.26, 2.5.11, 3.1.1 crypto vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013060146\n\n";
 } 
 
 if($v =~ /1.5 Beta 2/){
 print "+-[|] Joomla! CMS 1.5 beta 2 (search) Remote Code Execution Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4212/\n\n";
 }
 
 if($v =~ /1.5 Beta 1/ or $v =~ /1.5 Beta 2/ $v =~ /1.5 RC1/){
 print "+-[|] Joomla! 1.5 Beta1/Beta2/RC1 Remote SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/4350/\n\n";
 }
 
 if($v =~ /1.5.(.*)/){$expN = $expN + 4;
 print "+-[|] Joomla! 1.5.x 404 Error Page Cross Site Scripting Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/33378/\n|\n";
 print "+-[|] Joomla! 1.5.x Cross Site Scripting and Information Disclosure Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/33061/\n|\n";
 print "+-[|] Joomla 1.5.x (Token) Remote Admin Change Password Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/6234/\n|\n";
 print "+-[|] Joomla! 1.5.x Multiple Modules 'search' Parameter Cross-Site Scripting Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/34056/\n\n";
 }

 if($v =~ /1.5.8/){$expN = $expN + 1;
 print "+-[|] Joomla <= 1.5.8 (xstandard editor) Local Directory Traversal Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/7691/\n\n"; 
 }
 
 if($v =~ /1.5/ or $v =~ /1.6/){$expN = $expN + 1;
 print "+-[|] Joomla! 1.5 & 1.6 - JFilterInput XSS Bypass\n";
 print "+--[-] http://www.exploit-db.com/exploits/16091/\n\n";
 }
 
 if($v =~ /1.6.0-Alpha2/){ $expN = $expN + 1;
 print "+-[|] Joomla_1.6.0-Alpha2 XSS Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/12489/\n\n";
 }
 
 if($v =~ /1.6/){ $expN = $expN + 1;
 print "+-[|] Joomla! 1.6 - Multiple SQL Injection Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/16992/\n\n";
 } 
 
 if($v =~ /1.6.3/){ $expN = $expN + 1;
 print "+-[|] Joomla 1.6.3 CSRF Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/17496/\n\n";
 }
 
 if ($v =~ /1.0.9/){$expN = $expN + 1;
 print "+-[|] Joomla  <= 1.0.9 Weblinks blind SQL injection / admin credentials\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012090162\n\n";
 }
 
 if($v =~ /2.1.6/){ $expN = $expN + 1;
 print "+-[|] Mosets Tree 2.1.6 (Joomla) Template Overwrite CSRF\n";
 print "+--[-] http://www.exploit-db.com/exploits/15570/\n\n";
 }
 
 if($v =~ /2.5.0/ or $v =~ /2.5.1/){$expN = $expN + 1;
 print "+-[|] Joomla 2.5.0-2.5.1 Time Based SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/18618/\n\n";
 }  
 
 if($v =~ /2.5/ or $v =~ /2.5.13/){$expN = $expN + 1;
 print "+-[|] Joomla Media Manager File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27610/\n";
 print "+--[-] http://www.1337day.com/exploit/21108\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080120\n\n";
 } 
 
 if($v =~ /2.5.6/){$expN = $expN + 1;
 print "+-[|] Joomla 2.5.6 Multiple Cross-site scripting vulnerabilities\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012110005\n\n"; 
 }
 
 if($v =~ /2.5.8/){$expN = $expN + 1;
 print "+-[|] Joomla <=2.5.8,<=3.0.2 remote tcp connections opener\n";
 print "+--[-] http://www.1337day.com/exploit/20434\n\n";
 } 

 if($v =~ /2.5.8/ or $v =~ /2.5.7/ or $v =~ /2.5.6/ or $v =~ /2.5.5/ or $v =~ /2.5.4/ or $v =~ /2.5.3/ or $v =~ /2.5.2/ or $v =~ /2.5.1/ or $v =~ /2.5/){ $expN = $expN + 1;
 print "+-[|] Joomla! <= 3.0.2 (highlight.php) PHP Object Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24551/\n\n";
 } 
 
 if($v =~ /2.5.9/ or $v =~ /2.5.8/ or $v =~ /2.5.7/ or $v =~ /2.5.6/ or $v =~ /2.5.5/ or $v =~ /2.5.4/ or $v =~ /2.5.3/ or $v =~ /2.5.2/ or $v =~ /2.5.1/ or $v =~ /2.5/ or $v =~ /2.5.0/){ $expN = $expN + 1;
 print "+-[|] Joomla! <= 3.0.3 (remember.php) - PHP Object Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25087/\n\n";
 } 
 
 if($v =~ /3.0.3/ or $v =~ /3.0.2/ or $v =~ /3.0.1/ or $v =~ /3/ or $v =~ /3.0/){ $expN = $expN + 1;
 print "+-[|] Joomla! <= 3.0.3 (remember.php) - PHP Object Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/25087/\n";
 } 
 
 if($v =~ /3.0.2/){ $expN = $expN + 1;
 print "+[|] Joomla! <= 3.0.2 (highlight.php) PHP Object Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24551/\n\n";
 }
 
 if($v =~ /3.0.2/ or $v =~ /2.5.8/){ $expN = $expN + 1;
 print "+-[|] Joomla <=2.5.8,<=3.0.2 remote tcp connections opener\n";
 print "+--[-] http://www.1337day.com/exploit/20434\n\n";
 }
  
 if($v =~ /3.0.3/){ $expN = $expN + 1;
 print "+-[|] Joomla! <= 3.0.3 (remember.php) PHP Object Injection Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013040199\n\n"; 
 }
 
 if($v =~ /3.1.5/){ $expN = $expN + 1;
 print "+-[|] Joomla 3.1.5 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080045\n\n";
 } 
 
 if($v =~ /3.2/){  $expN = $expN + 1;
 print "+-[|] Joomla 3.2.1 sql injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/31459/\n\n";
 } 
 
 if($v =~ /3.2.2/){ $expN = $expN + 1;
 print "+-[|] Joomla 3.2.2 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014030030\n\n";
 }
 
 #COMPONENTES --------------------------------------------------------------------------
 if ($source =~ /(.*)?option=com_collector(.*)&/){  $expN = $expN + 2;
 print "+-[|] Joomla com_collector Component Arbitrary File Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24228/\n|\n";
 print "+-[|] Joomla Collector Shell Upload\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013010159\n\n";
  
 } 
 
 if ($source =~ /(.*)?option=com_youtubegallery/){  $expN = $expN + 3;
 print "+-[|] Joomla component com_youtubegallery - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/34087/\n";
 print "+--[-] http://www.1337day.com/exploit/22441\n|\n";
 print "+-[|] Joomla Youtube Gallery 4.1.7 SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014070085\n|\n";
 print "+-[|] Joomla Youtube Gallery 3.4.0 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014030120\n\n";
 }
 
 if ($source =~ /(.*)?mode=getshouts&jal_lastID=(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla AJAX Shoutbox remote SQL Injection vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/32331/\n";
 print "+--[-] http://www.1337day.com/exploit/22032\n\n";
 }
 
 if ($source =~ /(.*)option=com_community(.*)/){ $expN = $expN + 3;
 print "+-[|] Joomla JomSocial Component 2.6 - Code Execution Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/31435/\n";
 print "+--[-] http://www.1337day.com/exploit/21846\n|\n";
 print "+-[|] Joomla Template BizWeb com_community Persistent XSS Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/13955/\n|\n";
 print "+-[-] Joomla JomSocial Remote Code Execution Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014020124\n\n"; 
 }

 if ($source =~ /(.*)?option=com_komento(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Komento Extension 1.7.2 - Stored XSS Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/31174/\n";
 print "+--[-] http://www.1337day.com/exploit/21800\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010162\n\n";
 }
 
 if ($source =~ /(.*)=com_jvcomment(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla JV Comment Extension 3.0.2 (index.php, id param) - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/31175/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014010163\n\n";
 } 
 
 if ($source =~ /(.*)?option=com_virtuemart&(.*)/){  $expN = $expN + 3;
 print "+-[|] Joomla! VirtueMart Component 2.0.22a - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/27879/\n";
 print "+--[-] http://www.1337day.com/exploit/21159n\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080187\n|\n";
 print "+-[|] Joomla 1.5 com_virtuemart <= 1.1.7 - Blind time-based SQL Injection (MSF)\n";
 print "+--[-] http://www.exploit-db.com/exploits/17579/\n|\n";
 print "+-[|] Joomla! com_virtuemart <= 1.1.7 - Blind SQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/17132/\n\n";
 } 
  
 if ($source =~ /(.*)tmpl=component&option=com_redshop&(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla redSHOP Component 1.2 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/27532/\n".
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080091\n|\n";
 print "+-[|] Joomla Component redSHOP Local File Inclusion Vulnerability&#9830;\n";
 print "+--[-] http://www.exploit-db.com/exploits/12054/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_sectionex(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla Sectionex Component 2.5.96 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/27405/\n";
 print "+--[-] http://www.1337day.com/exploit/21072\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013080053\n|\n";
 print "+-[|] Joomla Component com_sectionex - Local File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/11759/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_s5clanroster(.*)/){ $expN = $expN + 3;
 print "+-[|] Joomla S5 Clan Roster com_s5clanroster (index.php, id param) - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/25410/\n|\n";
 print "+-[|] Joomla Component com_s5clanroster Sql Injection Vulnerability\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013050101\n|\n";
 print "+-[|] Joomla Component S5 Clan Roster com_s5clanroster Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/12231/\n\n";
 }
 
 if ($source =~ /(.*)index.php\/dj-classifieds\// or $source =~ /\/dj-classifieds\//){ $expN = $expN + 1;
 print "+-[|] Joomla - DJ Classifieds - Time-Based Blind SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/25248/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_rsfiles&(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla RSfiles Component (cid param) - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/24851/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2013030147\n|\n";
 print "+-[|] Joomla Component RSfiles <= 1.0.2 (path) File Download Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4307/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_spidercalendar(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Spider Calendar (index.php, date param) Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/23782/\n\n";
 } 
 
 if ($source =~ /(.*)?option=com_jooproperty(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla JooProperty 1.13.0 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/23286/\n|\n";
 print "+-[|] Joomla Jooproperty SQL Injection &Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012120084\n\n";
 }
 
 if ($source =~ /(.*)?option=com_spidercatalog(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Spider Catalog (index.php, product_id parameter) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/22403/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_commedia(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla Commedia Plugin (index.php, task parameter) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22152/\n|\n";
 print "+-[|] Joomla Commedia 3.1 SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012100160\n\n";
 }
 
 if ($source =~ /(.*)?option=com_kunena&(.*)/){ $expN = $expN + 6;
 print "+-[|] Joomla Kunena Component (index.php, search parameter) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22153/\n|\n";
 print "+-[|] Joomla Kunena Forum 3.0.5 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014070180\n|\n";
 print "+-[|] Joomla Kunena Forum 3.0.5 SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014070179\n|\n";
 print "+-[|] Joomla Kunena 3.0.4 Cross Site Scripting\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2014030234\n|\n";
 print "+-[|] Joomla Component com_kunena Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/11279/\n|\n";
 print "+-[|] Joomla Component Kunena Forums (com_kunena) bSQL Injection Exploit\n";
 print "+--[-] http://www.exploit-db.com/exploits/9408/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_fss(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla Freestyle Support 1.9.1.1447 (com_fss) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22097/\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012100161\n|\n";
 print "+-[|] Joomla Freestyle FAQ Lite Component 1.3 com_fss (faqid) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/12078/\n\n"; 
 }
 
 if ($source =~ /(.*)?option=com_tag(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla Tags (index.php, tag parameter) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/22098/\n|\n";
 print "+-[|] Joomla Tag SQL Injection\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012100162\n\n";
 }
 
 if ($source =~ /(.*)?option=com_icagenda(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla iCagenda Component - (id parameter) Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/22004/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_rokmodule(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla RokModule Component (index.php, module parameter) Blind SQLi\n";
 print "+--[-] http://www.exploit-db.com/exploits/21221/\n|\n";
 print "+-[|] Joomla Component RokModule Blind SQLi [moduleid] Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/12148/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_spidercalendar(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Spider Calendar Lite (com_spidercalendar) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/20983/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_fireboard(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla FireBoard Component (com_fireboard) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/20390/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_enmasse(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla En Masse Component 1.2.0.4 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/20343/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_joomgalaxy(.*)/){ $expN = $expN + 1;
 print "+-[|] joomla joomgalaxy 1.2.0.4 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/20197/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_niceajaxpoll(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla com_niceajaxpoll <= 1.3.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/20166/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_movm(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Movm Extension (com_movm) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/20170/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_ksadvertiser(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla KISS Advertiser Remote File & Bypass Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/19792/\n|\n";
 print "+-[|] Joomla Component com_ksadvertiser SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/11068/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_ponygallery(.*)/){ $expN = $expN + 2;
 print "+-[|] joomla component (com_ponygallery) SQL injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18741/\n|\n";
 print "+-[|] Joomla Component Pony Gallery <= 1.5 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/4201/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_bearleague(.*)/){ $expN = $expN + 1;
 print "+-[|] joomla component (com_bearleague) SQL injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18729/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_estateagent(.*)/){ $expN = $expN + 1;
 print "+-[|] joomla component The Estate Agent (com_estateagent) SQL injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18728/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_discussions(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Discussions Component (com_discussions) SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18380/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_dshop(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component (com_dshop) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18251/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_qcontacts&(.*)/){ $expN = $expN + 2;
 print "+-[|] QContacts 1.0.6 (Joomla component) SQL injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18218/\n|\n";
 print "+-[|] Joomla Component QContacts (com_qcontacts) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/14350/\n\n";
 } 
  
 if ($source =~ /(.*)?option=com_jobprofile&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Jobprofile Component (com_jobprofile) - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18192/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_alameda(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component Alameda (com_alameda) 1.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/18058/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_hmcommunity(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla HM-Community (com_hmcommunity) Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18050/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_vikrealestate(.*)/){ $expN = $expN + 1;
 print "+-[|] Vik Real Estate 1.0 Joomla Component Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18048/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_jeemasms(.*)/){ $expN = $expN + 1;
 print "+-[|] JEEMA SMS 3.2 Joomla Component Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18047/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_listing(.*)/){ $expN = $expN + 1;
 print "+-[|] Barter Sites 1.3 Joomla Component Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/18046/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_techfolio(.*)/){ $expN = $expN + 1;
 print "+-[|] Techfolio 1.0 Joomla Component SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18042/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_yjcontactus(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla YJ Contact us Component Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/18033/\n\n";
 }
  
 if ($source =~ /(.*)?nn_qp=(.*)&(.*)/ or $source =~ /(.*)?nn_qp=(.*)&file=(.*)/){ $expN = $expN + 1;
 print "+-[|] NoNumber Framework Joomla! Plugin Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/17995/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_timereturns(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component Time Returns (com_timereturns) 2.0 - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17944/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_content/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_content 1.0.0 (ItemID) SQL Injection Vuln\n";
 print "+--[-] http://www.exploit-db.com/exploits/6025/\n\n";
 }
 
 if ($souce =~ /(.*)?view=article(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Front-End Article Manager System Upload Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/14209/\n\n";
 }
 
 if ($source =~ /(.*)?option=com_joomdocs$(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_joomdocs XSS Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/13922/\n\n"; 
 }
 
 if ($source =~ /(.*)?option=com_bch&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla bch and Content Shell Upload\n";
 print "+--[-] http://cxsecurity.com/issue/WLB-2012120218\n\n";
 }
 
 if ($source =~ /(.*)?option=com_eventmanager&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component Event Manager Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/10549/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_jce&(.*)/){ $expN = $expN + 2;
 print "+-[|] JCE Joomla Extension <= 2.0.10 - Multiple Vulnerabilities\n";
 print "+--[-] http://www.exploit-db.com/exploits/17734/\n|\n";
 print "+-[|] Joomla JCE Component (com_jce) Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17136/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_joomtouch(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla JoomTouch Component Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17674/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_obsuggest(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component (com_obSuggest) Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17591/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_jesubmit(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component JE K2 Story Submit Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17556/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_rsappt_pro2(.*)/){ $expN = $expN + 1;
 print "+-[|] Appointment Booking Pro Joomla Component LFI Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17553/\n\n";
 }
  
 if ($source =~ /(.*)option=com_sobi2(.*)/){ $expN = $expN + 1;
 print "+-[|] SOBI2 2.9.3.2 Joomla! Component Blind SQL Injections\n";
 print "+--[-] http://www.exploit-db.com/exploits/17530/\n\n";
 }
  
 if ($source =~ /(.*)option=com_xmap(.*)/){ $expN = $expN + 1;
 print "+-[|] Xmap 1.2.11 Joomla Component Blind SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/17525/\n\n";
 }
  
 if ($source =~ /(.*)option=com_calcbuilder(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component Calc Builder (id) Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17414/\n\n";
 }

 if ($source =~ /(.*)?task=person(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component (com_team) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17412/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_acooldebate(.*)/){ $expN = $expN + 1;
 print "+-[|] A Cool Debate 1.0.3 Component Joomla Local File Inclusion\n";
 print "+--[-] http://www.exploit-db.com/exploits/17411/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_joomnik(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_joomnik SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17341/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_jmsfileseller(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_jmsfileseller Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17338/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_question(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_question - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17288/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_versioning(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla Component com_versioning SQLi Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17264/\n|\n";
 print "+-[|] Joomla Component versioning 1.0.2 (id) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/5989/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_hello&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla Component com_hello SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/17265/\n\n";
 }
  
 if ($source =~ /(.*)option=com_booklibrary&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla com_booklibrary - SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/16995/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_b2portfolio&(.*)/){ $expN = $expN + 1;
 print "+-[|] Joomla B2 Portfolio Component 1.0.0 - Multiple SQL Injection\n";
 print "+--[-] http://www.exploit-db.com/exploits/16039/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_allcinevid&(.*)/){ $expN = $expN + 1;
 print "+-[|] allCineVid Joomla Component 1.0.0 - Blind SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/16010/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_people&(.*)/){ $expN = $expN + 2;
 print "+-[|] People Joomla Component 1.0.0 - Local File Inclusion Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/16001/\n|\n";
 print "+-[|] People Joomla Component 1.0.0 - SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/15989/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_mailto&(.*)/){ $expN = $expN + 2;
 print "+-[|] Joomla! Spam Mail Relay Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/15979/\n|\n";
 print "+-[|] Joomla Component MailTo (article) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/8366/\n\n";
 }
  
 if ($source =~ /(.*)?option=com_idoblog&(.*)/){ $expN = $expN + 3;
 print "+-[|] Joomla Component (com_idoblog) SQL Injection Vulnerability\n";
 print "+--[-] http://www.exploit-db.com/exploits/15827/\n|\n";
 print "+-[|] 
