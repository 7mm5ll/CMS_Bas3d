#!/usr/bin/perl
#\________________|CMS Bas3d developed by Marck|________________/
# \____________________________________________________________/
#                           @7mm5l
#
#                          Greets: 
#                 Rei_Gelado ~~ Beta Tester
#              All members of caveiratech.com/forum/
#                          _____
#                        </  U  \>
#                       </ _ . _ \>
#                      <[|( )~( )|]>
#                       <\.| | |./>
#                        <|_____|>
#                         __|.|__
#                        |_______|
use File::Copy;
use File::Path;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib dirname(dirname abs_path $0).'/bin';
use bin::joomla qw(vjoomla);
use bin::wordpress qw(vwp);
use bin::xoops qw(vxp);
use bin::smf qw(vsmf);
use bin::vbulletin qw(vvb);
use bin::phpbb qw(vbb);
use bin::vcms qw(vcms);
use bin::mybb qw(vmbb);
use bin::drupal qw(vdru);
use bin::modx qw(vmod);
use bin::frog qw(vfrog);
use bin::silverstripe qw(vss);
use bin::textpattern qw(vtp);
use bin::adapt qw(vada);
use bin::atutor qw(vatu);
use bin::b2evolution qw(vb2);
use bin::moodle qw(vmd);
use bin::phpnuke qw(vphn);
use bin::postnuke qw(vpn);

if($^O =~/Win32/ig) { print "Only for linux!"; exit(); }else{ system("clear"); }
if(length($ARGV[0])==""){ &banner; &use; exit();}

if (lc($ARGV[0]) eq "help"){ &help; }

if (lc($ARGV[0]) eq "update"){
&banner;
print "\nUpdate initiated\n--------------------------------------------------------------------------------\n[|] Realizing download starting the repository...\n";

system("git clone https://github.com/7mm5ll/CMS_Bas3d.git CMS_Bas3d");
$dir = "CMS_Bas3d/bin";
unless(-d $dir){ print "\n[~] Error downloading files from the repository... Please try again\n"; exit(); }
print " [-] Download completed\n[|] Updating files...";

system("rm -rf bin"); system("mkdir bin");
$source = "CMS_Bas3d/bin"; $destino = "./bin"; &update($source,$destino); print ""; #P.O.G
$source = "CMS_Bas3d";  $destino = "./";       &update($source,$destino);

sub update {
opendir(DIR, $source);

@files = grep {!/^\.+$/} readdir(DIR); close(DIR);
 
foreach my $file (@files) { my $old = "$source/$file"; move($old, $destino); }

opendir(DIR, $source);
 
foreach my $file (@files) {   
   my $old = "$source/$file";  move($old, $destino);
  }
 }
print "\n [-] Updated files successfully!\n";
system("rm -rf CMS_Bas3d");
exit();
}

if(lc($ARGV[0]) eq "vcms"){
&banner;
print "\n\nVerification of CMS initiated!\n";
if($ARGV[1] !~ /^http/){ $ARGV[1]='http://'.$ARGV[1]; }
&ini2;
vcms($ARGV[1]);
}

if($ARGV[0] !~ /^http/){ $ARGV[0]='http://'.$ARGV[0]; }

#if($ARGV[0] !~ /\/$/ ){ $ARGV[0] = $ARGV[0].'/'; }
if(lc($ARGV[0]) eq "help"){ &help; exit();}

&banner;
&ini;

#-----------------------------------------------------------------------------------------------+
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
if($source eq ""){ print "\n[~] Website offline, try again!\n"; exit(); }#                      |
if($source =~ /400 URL must be absolute/){ print "\n[~] Error 404!\n\n"; exit(); }#             |
#-----------------------------------------------------------------------------------------------+

if (length($source) > 0){}else{ print "\n[~] Error!\n"; exit(); }

if ($source =~ /<meta name="generator" content="Joomla!(.*)/){
print "[|] Joomla CMS identified!\n-------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vjoomla($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="WordPress (.*)" \/>/ or $source =~ /<a href="http:\/\/wordpress.org\/">(.*) WordPress<\/a>/){
print "[|] Wordpress CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";

vwp($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="WordPress.com">/ or $source =~ /<meta name="generator" content="WordPress.com" \/>/ or $source =~ /(.*)src=(.*)\/wp-content\/uploads\/(.*)/){
print "[|] Wordpress CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vwp($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="XOOPS" \/>/){
print "[|] XOOPS CMS identified!\n-------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vxp($ARGV[0]);
}

if ($source =~ /<a href="http:\/\/www.simplemachines.org\/" title="Simple Machines Forum" target="_blank">Powered by SMF (.*)<\/a>/){
print "[|] SMF CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vsmf($ARGV[0]);
}

if ($source =~ /(.*)smf_(.*)/ or $source =~ /<a href="http:\/\/www.simplemachines.org\/about\/copyright.php" title="Free Forum Software" target="_blank">SMF (.*)<\/a>/){ 
print "[|] SMF CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vsmf($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="vBulletin (.*)" \/>/){
print "[|] vBulletin CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vvb($ARGV[0]);
} 

if ($source =~ /Powered by <a href="http:\/\/www.vbulletin.com" id="vbulletinlink">vBulletin&trade;<\/a> Version (.*) <br \/>/){ 
print "[|] vBulletin CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vvb($ARGV[0]);
} 

if ($source =~ /powered by vBulletin/){ 
print "[|] vBulletin CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vvb($ARGV[0]);
}

if ($source =~ /(.*)Powered by <a href="http:\/\/www.phpbb.com\/">phpBB<\/a>(.*)/){
print "[|] phpBB CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vbb($ARGV[0]);
}

if ($source =~ /Powered By <a href="http:\/\/www.mybboard.net" target="_blank">MyBB<\/a>/){
print "[|] MyBB CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vbb($ARGV[0]);
}

if ($source =~ /name="Generator" content="Drupal (.*) (.*)"/){
print "[|] Drupal CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vdru($ARGV[0]);
}

if ($source =~ /Drupal.settings/){
print "[|] Drupal CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vdru($ARGV[0]);
}

if ($source =~ /<a href="http:\/\/www.modx.com" target="_blank"> Powered by MODx<\/a>/){
print "[|] MODx CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vmod($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="SilverStripe - http:\/\/silverstripe.org" \/>/){
print "[|] SilverStripe CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vss($ARGV[0]);
}

if ($source =~ /Powered by <a href="http:\/\/www.textpattern.com" title="Textpattern">Textpattern<\/a>/){
print "[|] Textpattern CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vtp($ARGV[0]);
}

if ($source =~ /Powered by (.*)Frog/){
print "[|] Frog CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vfrog($ARGV[0]);
}

if ($source =~ /Powered by <a href="http:\/\/www.adaptcms.com">AdaptCMS (.*)<\/a>/){
print "[|] Adapt CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vada($ARGV[0],$1);
}

if ($source =~ /<a href="\/about.php">About ATutor<\/a>/){
print "[|] ATutor CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vatu($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="b2evolution (.*)" \/>/){
print "[|] b2evolution CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vb2($ARGV[0]);
}

if ($source =~ /Powered by <a href="http:\/\/moodle.org" title="Moodle">Moodle<\/a>/ || $source =~ /<meta name="keywords" content="moodle, Course Management System " \/>/ || $ARGV =~ /:\/\/moodle./ || $ARGV =~ /:\/\/www.moodle./){
print "[|] Moodle CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vmd($ARGV[0]);
}

if ($source =~ /<META NAME="GENERATOR" CONTENT="PHP-Nuke(.*)">/){
print "[|] ATutor CMS identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vphn($ARGV[0]);
}

if ($source =~ /<meta name="generator" content="PostNuke (.*) - http:\/\/postnuke.com">/){
print "[|] PostNuke CMS "; if ($1 > 0){ print "v".$1." "; } print "identified!\n--------------------------------------------------------------------------------\nStarting the search for possible exploits!\n-------------------------------------------------------------------------------\n";
vpn($ARGV[0]);
}

if ($source =~ /<a href="http:\/\/www.cloudflare.com\/" target="_blank" style="(.*)">DDoS protection by CloudFlare<\/a>/){
print "[~] CloudFlare detected!\n";
exit();
}

print "\n[~] CMS unidentified!\n";

sub ini {
print "-------------------------------------------------------------------------------
Target: ".$ARGV[0]."\n";
print "Started in ".localtime();
print"\n-------------------------------------------------------------------------------\n[|]Loading... \n";
}
sub ini2 {
print "-------------------------------------------------------------------------------
Target: ".$ARGV[1]."\n";
print "Started in ".localtime();
print"\n-------------------------------------------------------------------------------\n[|]Loading... \n";
}

sub use { print "        Use: $0  help \n"; }

sub banner {
$NRB = int(rand(8));
$banner[0] = "   ******  ****     ****  ********   ******                      ****       **\n  **////**/**/**   **/** **//////   /*////**                    */// *     /**\n **    // /**//** ** /**/**         /*   /**   ******    ******/    /*     /**\n/**       /** //***  /**/*********  /******   //////**  **////    ***   ******\n/**       /**  //*   /**////////**  /*//// **  ******* //*****   /// * **///**\n//**    **/**   /    /**       /**  /*    /** **////**  /////** *   /*/**  /**\n //****** /**        /** ********   /******* //******** ****** / **** //******\n  //////  //         // ////////    ///////   //////// //////   ////   //////\n";
$banner[1] = " #####  #     #  #####     ######                 #####\n#     # ##   ## #     #    #     #   ##    ####  #     # #####\n#       # # # # #          #     #  #  #  #            # #    #\n#       #  #  #  #####     ######  #    #  ####   #####  #    #\n#       #     #       #    #     # ######      #       # #    #\n#     # #     # #     #    #     # #    # #    # #     # #    #\n #####  #     #  #####     ######  #    #  ####   #####  #####\n";
$banner[2] = " ######  ##     ##  ######     ########     ###     ######   #######  ########\n##    ## ###   ### ##    ##    ##     ##   ## ##   ##    ## ##     ## ##     ##\n##       #### #### ##          ##     ##  ##   ##  ##              ## ##     ##\n##       ## ### ##  ######     ########  ##     ##  ######   #######  ##     ##\n##       ##     ##       ##    ##     ## #########       ##        ## ##     ##\n##    ## ##     ## ##    ##    ##     ## ##     ## ##    ## ##     ## ##     ##\n ######  ##     ##  ######     ########  ##     ##  ######   #######  ########\n";
$banner[3] = "  ____              ____        ____                        __       __     \n /\\  _`\\    /'\\_/`\\/\\  _`\\     /\\  _`\\                    /'__`\\    /\\ \\    \n \\ \\ \\/\\_\\ /\\      \\ \\,\\L\\_\\   \\ \\ \\L\\ \\     __      ____/\\_\\L\\ \\   \\_\\ \\   \n  \\ \\ \\/_/_\\ \\ \\__\\ \\/_\\__ \\    \\ \\  _ <'  /'__`\\   /',__\\/_/_\\_<_  /'_` \\  \n   \\ \\ \\L\\ \\\\ \\ \\_/\\ \\/\\ \\L\\ \\   \\ \\ \\L\\ \\/\\ \\L\\.\\_/\\__, `\\/\\ \\L\\ \\/\\ \\L\\ \\ \n    \\ \\____/ \\ \\_\\\\ \\_\\ `\\____\\   \\ \\____/\\ \\__/.\\_\\/\\____/\\ \\____/\\ \\___,_\\\n     \\/___/   \\/_/ \\/_/\\/_____/    \\/___/  \\/__/\\/_/\\/___/  \\/___/  \\/__,_ /\n";
$banner[4] = "    O))   O))       O))  O)) O)   O)) O))                                  O))\n O))   O))O) O))   O)))O))    O)) O)    O))                  O)) O))       O))\nO))       O)) O)) O O)) O))       O)     O))   O))     O))))    O))        O))\nO))       O))  O))  O))   O))     O))) O)    O))  O)) O))     O))      O)) O))\nO))       O))   O)  O))      O))  O)     O))O))   O))   O)))     O))  O)   O))\n O))   O))O))       O))O))    O)) O)      O)O))   O))     O))      O))O)   O))\n   O))))  O))       O))  O)) O)   O)))) O))   O)) O)))O)) O))O)))))    O)) O))\n";
$banner[5] = "  _____ ___  ___ _____  ______            _____     _ \n /  __ \\|  \\/  |/  ___| | ___ \\          |____ |   | |\n | /  \\/| .  . |\\ `--.  | |_/ / __ _ ___     / / __| |\n | |    | |\\/| | `--. \\ | ___ \\/ _` / __|    \\ \\/ _` |\n | \\__/\\| |  | |/\\__/ / | |_/ / (_| \\__ \\.___/ / (_| |\n  \\____/\\_|  |_/\\____/  \\____/ \\__,_|___/\\____/ \\__,_|\n";
$banner[6] = " _________     _____    _________ __________               ________      .___\n \\_   ___ \\   /     \\  /   _____/ \\______   \\_____    _____\\_____  \\   __| _/\n /    \\  \\/  /  \\ /  \\ \\_____  \\   |    |  _/\\__  \\  /  ___/ _(__  <  / __ |\n \\     \\____/    Y    \\/        \\  |    |   \\ / __ \\_\\___ \\ /       \\/ /_/ | \n  \\______  /\\____|__  /_______  /  |______  /(____  /____  >______  /\\____ | \n         \\/         \\/        \\/          \\/      \\/     \\/       \\/      \\/\n"; 
$banner[7] = "  _____ __  __  _____   ____            ____      _ \n / ____|  \\/  |/ ____| |  _ \\          |___ \\    | |\n| |    | \\  / | (___   | |_) | __ _ ___  __) | __| |\n| |    | |\\/| |\\___ \\  |  _ < / _` / __||__ < / _` |\n| |____| |  | |____) | | |_) | (_| \\__ \\___) | (_| |\n \\_____|_|  |_|_____/  |____/ \\__,_|___/____/ \\__,_|\n";
print $banner[$NRB];
}     

sub help {
&banner;
print "\nCMS Bas3d help file~\n-------------------------------------------------------------------------------\n";
print "[|]Basic commands:
 |
 +[-] For scan a website, use:
 | |   root:~# perl $0 [WEBSITE]
 | |    Ex: root:~# perl $0 http://target.com
 | |
 +[-] CMS's supported for scan:
 +--+-----------------+--------------------------°18
 |  |                 |
 | [|] Joomla        [|] AdaptCMS
 | [|] XOOPS         [|] Frog
 | [|] SMF           [|] Textpattern
 | [|] WordPress     [|] ATutor
 | [|] vBulletin     [|] b2evolution
 | [|] phpBB         [|] Moodle
 | [|] MyBB          [|] PHP-Nuke
 | [|] Drupal        [|] PostNuke
 | [|] MODx          [|] SilverStripe
 |
 |
 +[-] Verify the CMS of website, use:
 | |   root:~# perl $0 vcms [WEBSITE]
 | |    Ex: root:~# perl $0 vcms http://target.com
 | |
 +[-] CMS's supported for scan:
 +--+----------------+----------------+----------°40
 |  |                |                | 
 | [|] Joomla       [|] AdaptCMS     [|] Apache Roller
 | [|] XOOPS        [|] Frog         [|] openCMS
 | [|] SMF          [|] Textpattern  [|] Ametys
 | [|] WordPress    [|] ATutor       [|] eXo Platform
 | [|] vBulletin    [|] b2evolution  [|] DSpace
 | [|] phpBB        [|] Moodle       [|] DotCMS
 | [|] MyBB         [|] PHP-Nuke     [|] Composite C1
 | [|] Drupal       [|] PostNuke     [|] DotNetNuke
 | [|] MODx         [|] SilverStripe [|] mojoPortal
 | [|] phpVibe      [|] Umbraco      [|] BEdita
 | [|] Chevereto    [|] CMSimple     [|] CMSimple_XH
 | [|] Concrete     [|] Cotonti      [|] Directus
 | [|] DokuWiki     [|] Dotclear     [|] Magento
 | [|] Geeklog
 |
 +[-] For update:
 |  root:~# perl $0 update
 |
 +[|] Please do not change the names of files!
 °
 Developed By Marck =}
  https://twitter.com/7mm5l
 
 Greets: Rei_Gelado
         All friends of caveiratech.com/forum/
";
exit();
}
