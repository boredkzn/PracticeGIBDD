   M S B A M L   `   `   `  ????H  DPracticeGIBDD, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:PracticeGIBDDPracticeGIBDD  5   	   d `DotNetProjects.Input.Toolkit, Version=6.1.94.0, Culture=neutral, PublicKeyToken=79778c5f2eed289bgKclr-namespace:System.Windows.Controls;assembly=DotNetProjects.Input.ToolkitSystem.Windows.Controls 63       PracticeGIBDD.FineWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:PracticeGIBDD     5   	   `controlsKclr-namespace:System.Windows.Controls;assembly=DotNetProjects.Input.Toolkit     63     ? Title$  Штрафы??5   	   $	??450??6   $	??600??6%    ? WindowStartupLocation$ CenterScreen=?5	   	    ? Icon$ Resources/gibdd_logo.png??5
   	   ??5      ?? 5   
    ?? EndPoint$ 0.5,1&?6    ?? 
StartPoint$ 0.5,0&?6/   .??5      ?  ? Color$ 	#FF4A6156??6   ? 5      $ 	#FF153244??6    ? Offset$
 0.59Q?6-   5      .??5      ? -   5         ?Name$ MainW??5       ? ColumnDefinitions 5   
   ?? 5      $??10 ?6   6,   ?? 5      6"   ?? 5      6"   ?? 5      6"   ?? 5      6"   ?? 5      $??10 ?6   6,   	 ? RowDefinitions	 5   
   ?? 5      $??10 ?6   6*   ?? 5      $	??100 ?6   6+   ?? 5      $??10 ?6   6*   ?? 5       6   ?? 5!      $??10 ?6   6*   ?? 5"      6   ?? 5#      6   ?? 5$      6   ?? 5%      6   ?? 5&      6   ?? 5'      6   ?? 5(      6   ?? 5)      $??10 ?6   6*   .+?5+   
   ?? -   5        
 ??Name$
 na??5+      $??3??65   $??1??6E   $??Right=?6R   $	??Top=?6n   
???????$??95??6?   $??30??6?   $??16(?6?   ??6   ?? *Name+6?   -  'System.Windows.Controls.AutoCompleteBox  5-   
   -   5          Name$ SearchTB??5-   #   $??1??65   $??3??6E   $??3??6R   ???	#FF254150$??22(?6~   $??Times New Roman)?6?   
???????$??143,0,143,9.667q?6?   $??2??6?   ?? 50   
   $??Resources/gibdd_logo.png??6   $??4??62   $??1??6B    J? RenderTransformOrigin$ 0.481,0.996&?6O   6v   ?? 51   
   -   5        $??
Назад??51      $??3??6!   $??1??65   $	??Top=?6B   $??Center=?6Z   $	??250??6w   $??50??6?   ???	#FF99B3C1
???????
???   ?$??Times New Roman)?6?   $??14(?6?   6?   ?? 52   
   $!??Журнал штрафов??6   $??1??6)   $??4??69   $??1??6M   $??Center=?6Z   $??Bottom=?6w   
???????$	??334??6?   $??30??6?   $??16(?6?   $??143,0,96.333,20q?6?   6?   ?? 53   
   -   5        $??Создать??53      $??4??6#   $??3??63   ???	#FF99B3C1
???????
???   ?$??Times New Roman)?6~   $??14(?6?   $??35??6?   $??0,0,0.333,9.667q?6?   $??2??6?   $??Bottom=?6?   6  ?? 54   
   -   5        $??
Поиск??54      $??3??6!   $??3??61   ???	#FF99B3C1
???????
???   ?$??Times New Roman)?6|   $??14(?6?   $??35??6?   $??0.333,0,0,9.667q?6?   $??2??6?   $??Bottom=?6?   6  ?? 56   
   -   5         ??Name$ ListFine??56      $??5??6%   $??1??62   $??7??6B   $??4??6S   ??57      ?? 58      .R?59      ?? 5:      ??5<      ?? 5=      .R?5>      ?? $	??0.3q?6   
???   ?._?5?      ? $	??530??6    5@      ?? 5A   "   $
??0.2* ?63   ?? 5B   "   $
??0.2* ?63   ?? 5C   "   $
??0.4* ?63   ?? 5D   "   $
??0.2* ?63   	 5F      ?? 5G   "   $
??0.2* ?60   ?? 5H   "   $
??0.2* ?60   ?? 5I   "   $
??0.2* ?60   ?? 5J   "   $
??0.2* ?60   ?? 5K   "   $
??0.2* ?60   ?? 5L   "   $
??0.2* ?60   .+?5N      ?? $??0??6$   $??5??61   $??0??6B   $??80??6k   $??80??6v   ??6R   ?? *Photo+6?   ?? 5O      $??Водитель: ??6$   $??1??69   $??0??6I   $??Right=?6V   ?? 5Q      $??2??6J   $??0??6Z   $
??Left=?6g   ??6$   ?? *Drivers.SecondSer+6g   ?? 5R      $??Госномер: ??6$   $??1??69   $??1??6I   $??Right=?6V   ?? 5S      $??2??6B   $??1??6R   $
??Left=?6_   ??6$   ?? *	CarNumber+6_   ?? 5T      $??Регион: ??6$   $??1??67   $??2??6G   $??Right=?6T   ?? 5U      $??2??6E   $??2??6U   ??6$   ?? *RegionNameRU+6U   ?? 5V      $??Лицензия: ??6$   $??1??69   $??3??6I   $??Right=?6V   ?? 5W      $
??Left=?6F   $??2??6a   $??3??6q   $
??Left=?6~   ??6$   ?? *LicenceNumber+6~   ?? 5X      $??Статус: ??6$   $??1??67   $??4??6G   $??Right=?6T   ?? 5Y      $
??Left=?6A   $??2??6\   $??4??6l   $
??Left=?6y   ??6$   ?? *
IdStatus+6y   ?? 5[       ??Name$ 
OpenButton??6%   -   5        $ ??Редактировать??5[   9   $??3??6Q   $??1??6a   $??Right=?6n   $	??100??6?   $??30??6?   6?   ?? 5]      $ DeleteButton??6%   -	   5        $??Удалить??5]   ;   $??3??6M   $??2??6]   $??Right=?6j   $	??100??6?   $??30??6?   6?   5^      5_      5`      5c      ?? 5d   
   $1??+Фильтрация по водителю:??6   $??1??62   $??2??6B   $??1??6V   $??Center=?6c   $??Bottom=?6?   
???????$	??216??6?   $??30??6?   $??16(?6?   $??0,0,70.667,3q?6?   $??2??6?   ?? 5e   
   -
   5        $??Экспорт Excel??5e      $??1??6)   $??2??69   ???	#FF99B3C1
???????
???   ?$??Times New Roman)?6?   $??14(?6?   $??35??6?   $??2??6?   $??Bottom=?6?   5f      5g      