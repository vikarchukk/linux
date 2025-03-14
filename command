[ unix ]
├─ cd .../... - для переходу між папками
├─ mkdir .../... - створює папку
├─ rm .../... - видаляє
├─ sudo ... - виконання команди від root прав
│  └─ ... | sudo tee | .../... - перезаписує вміст фалу від root
│                    └─ -a - додає щось в кінець
├─ mv .../... .../... - перекинути щось або переіминувати щось
├─ cp .../... /... - скіпіювати і перекинути щось або переіминувати щось
├─ ls | .../... - виводить список файлів
│     ├─ -a - показує також скриті файли (.file)
│     └─ -l - виводить всю інформацію про файли
├─ cat | .../... - виводить вміст файлу
│      ├─ > - перезаписати вміст файлу (enter -> ^c)
│      └─ >> - додати вміст до кінця файлу (enter -> ^c)
├─ wget | https://... - скачати щось
│       └─ --directory-prefix=/... - шлях куди скачати файл
├─ echo ... | - виводить щось
│           ├─ > .../... - перезаписати вміст файлу
│           └─ >> .../... - додати вміст до кінця файлу
├─ sleep ... - пауза на котрись час в сикундах
├─ grep ... - виводить тільки ці рядки де є вказаний текст
├─ sed │ ' │ ' .../... - редагування файлу
│      └───│─ -i - відразу змінює вихідний файл
│          └─ ... │ - номер рядка
│                 ├─ c\ зназу_текст - заміна поточного рядка на новий
│                 ├─ d\ зназу_текст - видалити рядок
│                 └─ a\ зназу_текст - додати рядок після цього рядка
├─ pwd - виводить шлях до поточної папки
├─ top - програма моніторингу пк
├─ clear - очищає консоль
└─[ синтаксис ]
  ├─ ... | ... - передає результат першої команди другій команді
  ├─ . - поточна папка / .. - папка назад / * - все
  ├─ /home/user - ~, $HOME
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
│ ├─ git https://....git - скачування коду програми
│ ├─[ pkgbuild ]- встановлення програм з aur.archlinux.org
│ │ └─ makepkg │ - збирання програми
│ │            ├─ -s - встановленя всіх залежностів
│ │            ├─ -i - встановлює зібраний пакет
│ │            ├─ -r - видаляє залишкові файли після завершення збірки
│ │            └─ -c - очищає каталоги
│ └─[ makefile ]- збирання програми в ручну
│   ├─ make │ - збирання програми
│   │       ├─ │ install - встановити програму
│   │       │  └─ clean - очистити старі файли програми перед встановленням
│   │       └─ uninstall - видалиння програми
│   └─[ розшириння ]- доповнити програму
│     ├─ можна в ручну змінювати код програми і налаштовувати
│     └─ wget https://....diff - скачати файл з змінами
│        └─ patch --merge -i ....diff - примініти файл зі змінами до коду
│           └─ якщо виникає помилка, потрібно видалити >>>>,<<<<,====,code
└─ systemctl │ ... - налаштування роботи демона/програми
             ├─ start - запустити
             ├─ stop - зупинити
             ├─ restart - перегрузити
             ├─ enable │ - додати в автозапуск
             │         └─ --now - і запустити
             └─ disable - видалити з автозапуску
