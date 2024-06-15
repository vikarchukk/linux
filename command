[ unix ]
├─ cd /... - для переходу між папками
├─ mkdir /папка - створює папку
├─ rm /... - видаляє
├─ sudo ... - виконання команди від root прав
├─ mv /файл /... - перекинути файл в іншу папку або переіминувати його
├─ cp /файл /... - скопіювати файл в іншу папку або скопіювати і переіминувати
├─ ls | /папка - виводить список файлів що є в папці
│     ├─ -a - показує також скриті файли (.file)
│     └─ -l - виводить всю інформацію про файли
├─ cat | /файл - виводить вміст файлу
│      └─ >> записати щось в кінець файлу (enter -> C^)
├─ wget | https://... - скачати щось з інтернету
│       └─ --directory-prefix=/повний_шлях - показує куди скачати файл
├─ echo 'текст' - виводить просто текст
│  └─ "$..." - для вивидиня якоїсь зміної
├─ sleep 1 - пауза на 1 секунду
├─ grep - виводить тільки ці рядки де є вказаний текст
├─ pwd - виводить шлях до поточної папки
├─ whereis файл - шукає файл тільки в /usr/
├─ top - програма моніторингу пк
├─ clear - очищає консоль
├─ chmod +x .../... - добавляє права на виконання користувачем
└─[ синтаксис ]
  ├─ ... | ... - передає результат першої команди другій команді
  ├─ . поточна папка / .. папка назад / * все
  ├─ /home/user = ~, $HOME
  └─ --help - прапор для виводу інформації про команду

[ app ]
├─[ pacman ]- менеджер програм в arch linux
│ ├─ /etc/pacman.conf - налаштування
│ ├─ pacman │ ...
│ │         ├─ -S │ - встановити або оновити пакет
│ │         │     ├─ -y │ - оновлює pacman.conf
│ │         │     │     └─ -y примусово оновлює
│ │         │     ├─ -c │ - очищення кешу
│ │         │     │     └─ -с глебоке очищення кешу
│ │         │     ├─ -u - оновлення
│ │         │     └─ -s - пошук
│ │         ├─ -Q │ - запит інформації
│ │         │     ├─ -d - пакети котрі були встановленні як залежності для інших пакетів
│ │         │     ├─ -e - пакети котрі були встановленні корестувачем
│ │         │     └─ -t - пакети котрі ніким не використовуються
│ │         ├─ -R │ - видалити
│ │         │     ├─ -n - видалити також невикористовувані залежності
│ │         │     └─ -s - видалити також невикористовувані залежності іншими програмами
│ │         └─ -q - виводить тільки імена пакетів
│ └─[ приклади ]
│   ├─ sudo pacman -Syyu - глобальне оновлення
│   ├─ sudo pacman -Rns $(pacman -Qdtq) - глобальне очищення пакетів
│   └─ sudo pacman -Scc - глобальне очищення кешу
└─[ збирання з коду ]- збирання програми з коду
  ├─ git https://....git - скачування коду програми
  ├─[ pkgbuild ]- встановлення програм з aur.archlinux.org
  │ └─ makepkg │ - збирання програми
  │            ├─ -s - встановленя всіх залежностів
  │            ├─ -i - встановлює зібраний пакет
  │            ├─ -r - видаляє залишкові файли після завершення збірки
  │            └─ -c - очищає каталоги
  └─[ makefile ]- збирання програми в ручну
    ├─ make │ - збирання програми
    │       ├─ │ install - встановити програму
    │       │  └─ clean - очистити старі файли програми перед встановленням
    │       └─ uninstall - видалиння програми
    └─[ розшириння ]- доповнити програму
      ├─ можна в ручну змінювати код програми і налаштовувати
      └─ wget https://....diff - скачати файл з змінами
         └─ patch --merge -i ....diff - примініти файл зі змінами до коду
            └─ якщо виникає помилка, потрібно видалити >>>>,<<<<,====,code

[ bash ]
├─ #!/bin/bash - перший рядок
├─ # ... - коментар
├─ bash ....sh - виконати скрипт
├─[ параметри ]
│ ├─ ...=... - створення парамитра з якимось значенням
│ ├─ $( ... ) - получання значення з котрогось коду
│ ├─ $? - код виходу з останьої команди
│ ├─ $HOME - деректорія користувача (~) ] ... 
│ ├─ bash ...sh ..... ..... .......
│ │  │    └─ $0 └─ $1 └─ $2 └─ $...
│ │  └─ $... - параметр який переданий при запуску скрипта
│ ├─ read │ ... - дась вести параметр корестовачеві 
│ │       └─ -p "..." - вивидеть текст перед полем воду
│ └─ $... - використовування параметра
├─[ умови ]
│ ├─[ булеві значення ]
│ │ ├─ true - вірно
│ │ └─ false - хиба
│ ├─[ знаки рівності ]
│ │ ├─ -eq - ==
│ │ ├─ -ne - !=
│ │ ├─ -lt - <
│ │ ├─ -le - <=
│ │ ├─ -gt - >
│ │ └─ -ge - >=
│ ├─[ логічні оператори ]
│ │ ├─ || - або
│ │ └─ && - і
│ └─[ перевірка на наявність файлу чи папки ]
│   ├─ -f імя_файлу - провірка на найвність файлу
│   ├─ -d імя_папки - провірка на найвність папки
│   └─ -e імя_файлу_або_папки - провірка на найвність файлу або папки
├─[ конструкції ]
│ ├─[ умови ]
│ │ ├─┐ if [[ ... ]] || [ ... ]
│ │ │ │ then ...
│ │ │ │ elif [[ ... ]] || [ ... ]
│ │ │ │ then ...
│ │ │ │ else ...
│ │ │ └ if
│ │ └─┐ case $... in ...) ....;;
│ │   │ ...) ...;;
│ │   │ *) ...;;
│ │   └ esac
│ └─[ цикли ]
│   ├─┐ for i in {1..9}
│   │ │ do ...
│   │ └ done
│   ├─┐ for ((i = 0; i < 10; i++))
│   │ │ do ...
│   │ └ done
│   ├─┐ while [[ ... ]] || [ ... ]
│   │ │ do ...
│   │ └ done
│   ├─ break - вийти з циклу
│   └─ continue - перйти до наступного циклу
├─[ матиматичні операції ]
│ ├─ let " ... "
│ └─ $(( ... ))
├─ trap " ... " сигнал - виконається команда коли надійде очікуваний сегнал
│  └─ trap -- сигнал - перестає очікувати сегнал
├─[ функція ]
│ ├─┐ function ... { echo "$..."
│ │ │ ...
│ │ │ return 0-255 # повртає код виходу функції
│ │ │ }
│ │ └ ... ...
│ ├─ $# - кількість всіх аргументів
│ └─ $@ - всі аргументи
├─[ масив ]
│ └─┐ ...=(... ... ...)
│   └ ${...[...]}
├─[ модуль ]- . .../.../...sh
└─ ; - перехід на новий рядок

[ awk ]
├─ інструмент котрий примає текст
│  ├─ ... | awk ... - приймає текст з іної команди
│  └─ awk .../... - приймає текст з файлу
├─ '{...}' - код
│  └─ 'BEGIN {...} {...} END {...}'
├─ -f .../... - виконує код awk з файлу
├─ print ..., ... - виводить щось
├─ awk має матиматичні і рядкові операції
├─[ параметри ]
│ ├─ $0 - весь текст
│ ├─[ текіт розділиний ]
│ │ ├─ класично текст розді по пробілам
│ │ ├─ -F'...' - параметр котрий змінює класичний роздільник
│ │ ├─ BEGIN {...} - блок котрий виконується першим
│ │ │  ├─ FS"..." - те сам що вище але пишиться в коді
│ │ │  └─ OFS"..." - змінює роздільний символ на інший
│ │ ├─ $1 - перший текст кожного рядка
│ │ ├─ $2 - друге текст кожного рядка
│ │ └─ $... - ... слово кожного рядка
│ ├─ $...=... - замінює параметр на щось
│ ├─ ...=... - створює параметр
│ ├─ ARGC - кількість аргументів
│ └─ ARGV[...] - звернення до якогось аргументу
│    └─ awk  ....... .... .... ......
│       └─ 0 └─ ARGV └─ 1 └─ 2 └─ ...
├─[ конструкції ]
│ ├─[ умови ]
│ │ └─┐ if (...) {
│ │   │ ...
│ │   │ }
│ │   │ else if (...) {
│ │   │ ...
│ │   │ }
│ │   │ else {
│ │   │ ...
│ │   └ }
│ └─[ цикли ]
│   ├─┐ for ( i = 1 ; i < 10; i++ ) {
│   │ │ ...
│   │ └ }
│   ├─┐ while (...) {
│   │ │ ...
│   │ └ }
│   ├─ break - вийти з циклу
│   └─ continue - перйти до наступного циклу
├─[ функція ]
│ └─┐ function ... () {
│   │ ...
│   └ }
└─ ; - перехід на новий рядок
