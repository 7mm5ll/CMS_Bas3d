package bin::atutor;
use Exporter qw(import);
our @EXPORT_OK = qw(vatu);
use Term::ANSIColor qw(:constants);
use LWP::UserAgent;

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#By Marck -+\/+-                                                                      |
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

sub vatu {
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


 if ($v =~ /1.2/){ $expN = $expN + 1;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.2 Multiple Vulnerabilities\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/22160/\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/19610\n\n";
  }

 if ($v =~ /2.0.2/){ $expN = $expN + 3;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 2.0.2 Multiple Vulnerabilities\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/16620\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/17631/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 2.0.2 Multiple Remote Vulnerabilities (SQLi/XSS/PD)\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011080042\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 2.0.2 (lang) HTTP Response Splitting Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2011080041\n\n";
  }

 if ($v =~ /1.6.4/){ $expN = $expN + 2;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.6.4 Multiple Cross Site Scripting Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/11203\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/11685/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.6.4 Cross Site Scripting\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2010030211\n\n";
  }

 if ($v =~ /1.6.1/){ $expN = $expN + 2;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor <= 1.6.1-pl1 (import.php) Remote File Inclusion Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/3466\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2008080076\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/6153/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.1pl2 SQL Injection / Command Execution Exploit\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/196\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/1298/\n\n";

  }

 if ($v =~ /1.5.3.1/){ $expN = $expN + 3;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor <= 1.5.3.1 (links) Remote Blind SQL Injection Exploit\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/2088/\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2006080039\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.1337day.com/exploit/618\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.3 - Multiple Remote File Include Vulnerabilities\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28832/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.3 - Multiple Input Validation Vulnerabilities\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28192/\n\n";
  }

 if ($v =~ /1.5./){ $expN = $expN + 5;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.x create_course.php Multiple Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28176/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.x documentation/admin/index.php XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28177/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.x password_reminder.php forgot Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28178/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.x users/browse.php cat Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28179/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.x admin/fix_content.php submit Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/28180/\n\n";
  }

 if ($v =~ /1./){ $expN = $expN + 3;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.x forum.inc.php Arbitrary Command Execution\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26431/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.x body_header.inc.php section Parameter Local File Inclusion\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26432/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.x print.php section Parameter Remote File Inclusion\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26433/\n\n";
  }

 if ($v =~ /1.5.1/){ $expN = $expN + 4;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.1 Password_Reminder.PHP SQL Injection Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26257/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.1 Chat Logs Remote Information Disclosure Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26258/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.1 login.php course Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/26170/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.1 SQL Injection / Admin credentials disclosure / remote code execution\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2005090007\n\n";
  }

 if ($v =~ /1.4.3/){ $expN = $expN + 9;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 browse.php show_course Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25826/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 contact.php subject Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25827/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 content.php cid Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25828/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 send_message.php l Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25829/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 search.php Multiple Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25830/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 inbox/index.php view Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25831/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 tile.php Multiple Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25832/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 subscribe_forum.php us Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25833/\n",BOLD GREEN,"|\n";
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.4.3 directory.php Multiple Parameter XSS\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://www.exploit-db.com/exploits/25834/\n\n";
  }
  
  if ($v =~ /1.5.3.2/){ $expN = $expN + 1;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 1.5.3.2=> Remote File Include Vulnerability\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2006110026\n\n";
  }
  
  if ($v =~ /2.0.3/){ $expN = $expN + 1;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 2.0.3 Cross Site Scripting\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2012010119\n\n";
  }
  
  if ($v =~ /2.1.1/){ $expN = $expN + 1;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor 2.1.1 Cross Site Scripting\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2014020183\n\n";
  }
  
  if ($v =~ /1.5.5/){ $expN = $expN + 1;
  print BOLD WHITE,"+-[",BOLD GREEN,"|",BOLD WHITE,"] ATutor <= 1.5.5 Cross Site Scripting\n";
  print BOLD WHITE,"+--[",BOLD GREEN,"-",BOLD WHITE,"]",BOLD YELLOW," http://cxsecurity.com/issue/WLB-2008020072\n\n";
  }  

 if ($expN==0){ print "\n[", BOLD RED,"~", BOLD WHITE,"] Exploits not found :'( \n"; exit(); }
print BOLD WHITE,"-------------------------------------------------------------------------------\nEnd...\nPossible exploits found: ",BOLD MAGENTA $expN."",BOLD WHITE,"\n-------------------------------------------------------------------------------\n";

exit();
}

Marck;
