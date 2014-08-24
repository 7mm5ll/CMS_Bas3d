CMS Bas3d
-

Desenvolvido por Marck ( [**Twitter**](https://twitter.com/7mm5l) / [**CaveiraTech**](http://caveiratech.com/forum/) )

 Script que facilitara o encontro de possíveis vulnerabilidades em várias CMS diferentes e a identificação de qual CMS esta rodando no alvo...

 O scan funciona com as seguintes CMS's:
-
```
 -JOOMLA        -b2evolution
 -XOOPS         -Moodle
 -SMF           -PHP-Nuke
 -WORDPRESS     -PostNuke
 -VBULLETIN     -PHPBB
 -MYBB          -DRUPAl
 -MODx          -SilverStripe
 -Textpattern   -Frog
 -AdaptCMS 
```

 O identificador de CMS's é capaz de identificar cerca de 40 CMS's diferentes, sendo elas: 
```
 -Joomla     -AdaptCMS     -Apache Roller
 -XOOPS      -Frog         -openCMS
 -SMF        -Textpattern  -Ametys
 -WordPress  -ATutor       -eXo Platform
 -vBulletin  -b2evolution  -DSpace
 -phpBB      -Moodle       -DotCMS
 -MyBB       -PHP-Nuke     -Composite C1
 -Drupal     -PostNuke     -DotNetNuke
 -MODx       -SilverStripe -mojoPortal
 -phpVibe    -Umbraco      -BEdita
 -Chevereto  -CMSimple     -CMSimple_XH
 -Concrete   -Cotonti      -Directus
 -DokuWiki   -Dotclear     -Magento
 -Geeklog
 ```
 
 Todos as referencias/exploits encontrados pelo script estão disponíveis em:
 
 °http://exploit-db.com/
 °http://cxsecurity.com/
  e
 °http://www.1337day.com/

Sendo um conteúdo público e disponibilizado de forma gratuita.

O criador desta ferramenta não se responsabiliza pelo mal uso da mesma, sendo assim use de modo responsável!

-
Modo de uso:
-

Esta ferramenta lhe fornece duas opções, ou um scan com o objetivo de procurar vulnerabilidades ( e exploits para a vulnerabilidade encontrada ) ou o scan com o objetivo de identificar qual CMS esta rodando do website.

String para procurar vulnerabilidades:
-
```
$ perl ./cmsbas3d.pl [website]
```

String para verificar a CMS:
-
```
$ perl ./cmsbas3d.pl vcms [website]
```

Atualizar a ferramenta direto do repositório:
-
```
$ perl ./cmsbas3d.pl update
```

OBS: FERRAMENTA FUNCIONAL APENAS PARA LINUX!!!
-
