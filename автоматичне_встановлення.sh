


# встановлення arch linux

## офіційна інструкція по встановленні arch - wiki.archlinux.org/title/Installation_guide
## └─ інструкції для macbook - wiki.archlinux.org/title/Laptop/Apple
##    └─ інструкція для macbook pro 2019 на intel/t2 - wiki.t2linux.org/distributions/arch/installation/

## скачати ios і встановити на флешку
### ios - github.com/t2linux/archiso-t2/releases/tag/2024.04.09
### запис на флешку - etcher.balena.io

## підключення до інтернету по wifi
### > iwctl # вхід в програму для wifi
### > device list # сканування доступних пристроїв (wlan0)
### > station wlan0 get-networks # сканування доступних wifi
### > station wlan0 connect "name_wifi" # підключиння до wifi
### > exit # вихід з програми
### > ping google.com # перевірка інтернету
### > controc + c # зупинняє перевірку

echo "[1] налаштування часу
 "
read -p "часова зона (Europe/Stockholm): " timezone
echo "
> timedatectl set-ntp true # підключення до сервера з даними про час  $(timedatectl set-ntp true)
> timedatectl set-timezone $timezone # налаштування часової зони $(timedatectl set-timezone Europe/$timezone)
> timedatectl status # перевірка часу
------------------------------------------------------------------------------
$(timedatectl status)
------------------------------------------------------------------------------"
read -p "вірний час (y/n)? " time_correct
if [[ "$time_correct" == "n" ]]; then exit 0; fi

echo "
------------------------------------------------------------------------------
[2] розбиття диску

> fdisk -l # перегляд дисків
------------------------------------------------------------------------------
$(fdisk -l)
------------------------------------------------------------------------------
> fdisk name_of_disk # вхід в редагування диску
> d > 1 # потрібно видалити всі розділи по черзі
> g # налаштування сестеме диску
> n > enter > enter > +300M > y # виділиння розділу для efi (запуск пк) (якщо 1 загрузчик 300M)
> n > enter > enter > enter > y # виділиння розділу для root (сестема) (23G < nG)
> t > 1 > 1 # зміна типу розділу для efi
> w # зберегти зміни і вийти"
read -p "розбито диск на розділи (y/n)? " disk_partitioning
if [[ "$disk_partitioning" == "n" ]]; then exit 0; fi

echo "
------------------------------------------------------------------------------
[3] форматування диску

> fdisk -l # перегляд дисків
------------------------------------------------------------------------------
$(fdisk -l)
------------------------------------------------------------------------------"
read -p "ім'я розділу /dev/efi_partition: " dev_efi_partition
read -p "ім'я розділу /dev/root_partition: " dev_root_partition
echo "> mkfs.fat -F 32 $dev_efi_partition # формотування розділу для efi 
$(mkfs.fat -F 32 $dev_efi_partition)
> mkfs.ext4 $dev_root_partition # формотування розділу для root 
$(mkfs.ext4 $dev_root_partition)"

echo "
------------------------------------------------------------------------------
[4] монтування диску

> mount $dev_root_partition /mnt # монтування розділу root в папку /mnt $(mount $dev_root_partition /mnt)
> mount --mkdir $dev_efi_partition /mnt/efi # монтування розділу efi в папку /mnt/efi $(mount --mkdir $dev_efi_partition /mnt/efi)"

echo "
------------------------------------------------------------------------------
[5] встановлення системи

> pacstrap /mnt base linux-xanmod-t2 linux-firmware apple-bcm-firmware
# base - для запуску arch
# linux-xanmod-t2 - для роботи системи з чипом t2
# linux-firmware - для роботи апаратних компонентів (клавіатура, трекпад...)
# apple-bcm-firmware - для роботи Wi-Fi та Bluetooth на чипі t2
------------------------------------------------------------------------------"
read -p "встановлювати (y/n)? " install_y_n
if [[ "$install_y_n" == "n" ]]; then exit 0; fi
pacstrap /mnt base linux-xanmod-t2 linux-firmware apple-bcm-firmware

echo "
------------------------------------------------------------------------------
[6] налаштування системи

> genfstab -U /mnt >> /mnt/etc/fstab # генеруйте файл fstab ${genfstab -U /mnt >> /mnt/etc/fstab}
> arch-chroot /mnt # перехід до коренової папки в новій сестемі ${arch-chroot /mnt}
> ln -sf /usr/share/zoneinfo/$timezone /etc/localtime # встановлення часової зони ${ln -sf /usr/share/zoneinfo/$timezone /etc/localtime}
> hwclock --systohc # синхронізація часу ${hwclock --systohc}

> pacman -S vim iwd dhcpcd sudo # встановлення базових інструментів
# vim - для редагування файлів
# iwd, dhcpcd - для роботи інтернету
# sudo - для того щоб користувач міг виконувати команди від root прав"
read -p "встановлювати (y/n)? " install_y_n_2
if [[ "$install_y_n_2" == "n" ]]; then exit 0; fi
pacman -S vim iwd dhcpcd sudo
echo "
> vim /etc/locale.gen { en_US.UTF-8 UTF-8, uk_UA.UTF-8 UTF-8 } # розкоментувати для налаштування розкладки
> locale-gen # генерування налаштування розкладки
> echo 'LANG=en_US.UTF-8' > /etc/locale.conf # запис мови в locale.conf"
sed -i '
171c\
en_US.UTF-8 UTF-8
474c\
uk_UA.UTF-8 UTF-8' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
read -p "імя хосту (macbookpro): " host_name
echo "> echo '$host_name' > /etc/hostname # запис імя хоста (компютера)"
echo "$host_name" > /etc/hostname





