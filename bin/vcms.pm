package bin::vcms;
use Exporter qw(import);
our @EXPORT_OK = qw(vcms);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vcms {
sub yes { print BOLD WHITE," [",BOLD GREEN,"-",BOLD WHITE,"] Available to scan? : Yes\n"; }
sub not { print BOLD WHITE," [",BOLD GREEN,"-",BOLD WHITE,"] Available to scan? : Not\n"; }
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
$source = $c->get($ARGV[1])->content;#                                                         \
#-----------------------------------------------------------------------------------------------+
if($source eq ""){ print "\n", BOLD WHITE,"[", BOLD RED,"~", BOLD WHITE,"] Website offline, try again!\n"; exit(); }#                      |
if($source =~ /400 URL must be absolute/){ print "\n[", BOLD RED,"~", BOLD WHITE,"] ", BOLD RED,"Error 404!", BOLD WHITE,"\n\n"; exit(); }#             |
#-----------------------------------------------------------------------------------------------+

if (length($source) > 0){ }else{ print "\n[", BOLD RED,"~", BOLD WHITE,"] Error!\n"; exit(); }

if ($source =~ /<meta name="generator" content="Plone - (.*)\/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] Plone CMS identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/www.adaptcms.com">AdaptCMS (.*)<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] Adapt "; if ($1 > 0){ print "v".$1." "; } print "CMS identified!\n";
&yes;
exit();
}

if ($source =~ /<META NAME="GENERATOR" CONTENT="PHP-Nuke(.*)">/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] PHP-Nuke "; if ($1 > 0){ print "v".$1." "; } print "CMS identified!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="PostNuke (.*) - http:\/\/postnuke.com">/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] PostNuke "; if ($1 > 0){ print "v".$1." "; } print "CMS identified!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="b2evolution (.*)" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] b2evolution "; if ($1 > 0){ print "v".$1." "; } print "CMS identified!\n";
&yes;
exit();
}

if ($source =~ /<a href="\/about.php">About ATutor<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] ATutor CMS identified!\n";
&yes;
exit();
}

if ($source =~ /Powered By <a href="http:\/\/www.mybboard.net" target="_blank">MyBB<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS MyBB identified!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="Joomla!(.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Joomla confirmed!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="WordPress (.*)" \/>/ or $source =~ /<a href="http:\/\/wordpress.org\/">(.*) WordPress<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Wordpress confirmed !\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="WordPress.com">/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Wordpress identified!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="XOOPS" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS XOOPS confirmed !\n";
&yes;
exit();
}

if ($source =~ /<a href="http:\/\/www.simplemachines.org\/" title="Simple Machines Forum" target="_blank">Powered by SMF (.*)<\/a>/ or 
    $source =~ /<a href="http:\/\/www.simplemachines.org\/about\/copyright.php" title="Free Forum Software" target="_blank">SMF (.*)<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS SMF "; if ($1 > 0){ print "v".$1." "; } print "confirmed!\n";
&yes;
exit();
} 

if ($source =~ /(.*)smf_(.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS SMF confimed!\n";
&yes;
exit();
}
 
if ($source =~ /Powered by <a href="http:\/\/www.vbulletin.com" id="vbulletinlink">vBulletin&trade;<\/a> Version (.*) <br \/>/ or 
    $source =~ /<meta name="generator" content="vBulletin (.*)" \/>/){ 
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS vBulletin"; if ($1 > 0){ print "v".$1." "; } print "confimed!\n";
&yes;
exit();
} 

if ($source =~ /powered by vBulletin/){ 
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS vBulletin confimed!\n";
exit();
}

if ($source =~ /(.*)Powered by <a href="http:\/\/www.phpbb.com\/">phpBB<\/a>(.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS phpBB confimed!\n";
&yes;
exit();
}

if ($source =~ /name="Generator" content="Drupal (.*) (.*)"/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Drupal "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&yes;
exit();
}

if ($source =~ /Drupal.settings/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Drupal identified!\n";
&yes;
exit();
}

if ($source =~ /<a href="http:\/\/www.modx.com" target="_blank"> Powered by MODx<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS MODx identified!\n";
&yes;
exit();
}

if ($source =~ /<meta name="generator" content="SilverStripe - http:\/\/silverstripe.org" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS SilverStripe identified!\n";
&yes;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/www.textpattern.com" title="Textpattern">Textpattern<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Textpattern identified!\n";
&yes;
exit();
}

if ($source =~ /Powered by (.*)Frog/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Frog identified!\n";
&yes;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/roller.apache.org">Apache Roller<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Apache Roller identified!\n";
&not;
exit();
}

if ($source =~ /Powered by openCMS v(.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] openCMS"; if ($1 > 0){ print "v".$1."\n"; } print "identified!\n";
&not;
exit();
}

if ($source =~ /<img src=(.*) width=(.*) alt="Powered By openCMS"><\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] openCMS identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a (.*) href="http:\/\/www.ametys.org\/">Ametys<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Ametys identified!\n";
&not;
exit();
}

if ($source =~ /<p>Powered by eXo Platform (.*)<\/p>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS eXo Platform"; if ($1 > 0){ print "v".$1."\n"; } print "identified!\n";
&not;
exit();
}

if ($source =~ /Powered by eXo Platform (.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS eXo Platform identified!\n";
&not;
exit();
}

if ($source =~ /Copyright &copy; 2013 eXo Platform SAS, All rights reserved/ or 
    $source =~ /Powered by eXo Platform/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS eXo Platform identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="Generator" content="DSpace (.*)" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS DSpace "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="Generator" content="DSpace" \/>/ or 
    $source =~ /<a (.*)href="http:\/\/www.dspace.org\/">DSpace Software<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS DSpace identified!\n";
&not;
exit();
}

if ($source =~ /Powered by DSpace software, Version (.*)/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS DSpace "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="(.*)">DotCMS<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] DotCMS identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="Generator" content="Composite C1 CMS - Free Open Source from http:\/\/composite.net\/" \/>/ or 
    $source =~ /<a href="http:\/\/www.composite.net\/">Powered by Composite C1, Free Open Source .NET CMS<\/a>/ or 
    $source =~ /<meta content="Composite C1 CMS - Free Open Source from http:\/\/composite.net\/" name="Generator" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Composite C1 identified!\n";
&not;
exit();
}

if ($source =~ /<font size=(.*)>Powered by DotNetNuke &reg;<\/font>/ or 
    $source =~ /<img alt="DotNetNuke Powered!" border=(.*) src=(.*) \/>/ or 
    $source =~ /<a href=(.*)>Powered by DotNetNuke<\/a>/ or 
    $source =~ /<a (.*)href="http:\/\/www.dotnetnuke.com"(.*)>Powered by DotNetNuke<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS DotNetNuke identified!\n";
&not;
exit();
}

if ($source =~ /<a href=(.*) >Powered by mojoPortal<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS mojoPortal identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="phpVibe (.*) ." \/>/ or 
    $source =~ /Powered by <a (.*)href="http:\/\/www.phprevolution.com\/">  phpVibe v(.*)<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS phpVibe "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="PHPVibe" \/>/ or
    $source =~ /Powered by <a (.*) href="http:\/\/www.phpvibe.com" (.*)>phpVibe&trade;<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS phpVibe identified!\n";
&not;
exit();
}

if ($source =~ /<a(.*) href="http:\/\/umbraco.org" (.*)>Powered by umbraco<\/a>/ or
    $source =~ /Powered by umbraco/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Umbraco identified!\n";
exit();
}

if ($source =~ /<meta name="generator" content="BEdita (.*)" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS BEdita "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /<a href="http:\/\/www.bedita.com"(.*)>Proudly powered by BEdita.<\/a>/ or 
    $source =~ /Powered by <a (.*) href="http:\/\/www.bedita.com" (.*)>BEdita (.*)<\/a>/){
print "[|] CMS BEdita identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="Chevereto (.*)" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Chevereto "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/chevereto.com\/"(.*)>Chevereto<\/a></){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Chevereto identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="CMSimple (.*) - www.cmsimple.org">/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS CMSimple "; if ($1 > 0){ print "v".$1."\n"; } print "identified!\n";

&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/www.cmsimple.org\/">CMSimple<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS CMSimple identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="CMSimple_XH (.*) - www.cmsimple-xh.org">/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS CMSimple_XH "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/www.cmsimple-xh.org\/">CMSimple_XH<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS CMSimple_XH identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="concrete5 - (.*)" \/>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS concrete5 "; if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /powered by <a href="http:\/\/concrete5.org">concrete5<\/a>/ or 
    $source =~ /Powered by concrete5/ or 
    $source =~ /<a href="http:\/\/www.concrete5.org" (.*)>concrete5 - open source CMS<\/a>/ or
    $source =~ /Powered by <a href="http:\/\/www.concrete5.org" (.*)>concrete5 CMS<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS concrete5 identified!\n";
&not;
exit();
}

if ($source =~ /<a href="http:\/\/www.cotonti.com">Powered by Cotonti<\/a>/ or 
    $source =~ /<meta name="generator" content="Cotonti http:\/\/www.cotonti.com" \/>/ or 
    $source =~ /<a href="http:\/\/www.cotonti.com"(.*)>POWERED BY COTONTI<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Cotonti identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/getdirectus.com">Directus (v(.*))<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Directus ";if ($1 > 0){ print "v".$1." "; } print "identified!\n";
&not;
exit();
}

if ($source =~ /<meta name="generator" content="DokuWiki Release 2009-12-25c &quot;Lemming&quot;" \/>/ or
    $source =~ /<meta name="generator" content="DokuWiki (.*)" \/>/ or
    $source =~ /<meta name="generator" content="DokuWiki Release (.*)" \/>/ or 
    $source =~ /Powered by: <a href="http:\/\/www.dokuwiki.org\/" (.*)>DokuWiki<\/a>/ or 
    $source =~ /Powered(.*)by Dokuwiki/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS DokuWiki identified!\n";
&not;
exit();
}

if ($source =~ /Powered by <a href="http:\/\/dotclear.org\/">Dotclear<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Dotclear identified!\n";
&not;
exit();
}

if ($source =~ /Powered by(.*)<a href="http:\/\/www.geeklog.net\/" (.*)>Geeklog<\/a>/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Geeklog identified!\n";
&not;
exit();
}

if ($source =~ /Powered By Magento/){
print BOLD WHITE,"[", BOLD GREEN,"|", BOLD WHITE,"] CMS Magento identified!\n";
&not;
exit();
}

if ($source =~ /<a href="http:\/\/www.cloudflare.com\/" target="_blank" style="(.*)">DDoS protection by CloudFlare<\/a>/){
print BOLD WHITE,"[", BOLD RED,"~", BOLD WHITE,"] CloudFlare detected!\n";
exit();
}

print BOLD WHITE,"\n[", BOLD RED,"~", BOLD WHITE,"] CMS unidentified!\n";

exit();
}

Marck;
