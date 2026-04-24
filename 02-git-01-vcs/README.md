# Домашнее задание к занятию "`Системы контроля версий`" - `Рыбянцев Павел`

------

### Задание 1. Создание репозитория и первого коммита
В ходе выполнения я инициализировал локальный репозиторий, создал файл `README.md` и сделал первый коммит.

- **Ссылка на репозиторий:**  [https://github.com/ShishelM/VCS-base-hw-2.git]

![alt text](/02-git-01-vcs/img/image.png)
![alt text](/02-git-01-vcs/img/image-1.png)
![alt text](/02-git-01-vcs/img/image-2.png)
![alt text](/02-git-01-vcs/img/image-3.png)
![alt text](/02-git-01-vcs/img/image-4.png)
![alt text](/02-git-01-vcs/img/image-5.png)

### Задание 2. Создание файлов .gitignore и второго коммита

Будут проигнорированы все файлы с расширением .tfstate, а так же каталог terraform

![alt text](/02-git-01-vcs/img/image-6.png)
![alt text](/02-git-01-vcs/img/image-7.png)

### Дополнительно:
`расшифровать файл из примера: https://github.com/github/gitignore/blob/master/Terraform.gitignore`
```
# В данном случае, игнорироватся скрытый каталог terraform и все содержимое
.terraform/

# Тут будут игнорироваться все файлы, оканчивающиеся на .tfstate
*.tfstate

# Игнор любых файлов и папок, в названии которых есть последовательность
*.tfstate.*
----------------------------------------------------
Маски и символы
* — любое количество символов (кроме слэша).
*.log — все файлы, заканчивающиеся на .log.

? — ровно один символ.
file?.txt — проигнорирует file1.txt, fileA.txt, но не file12.txt.

** — произвольная вложенность папок.
logs/**/*.log — найдет все .log файлы во всех подпапках внутри logs.


Исключения (отрицание)
Если нужно выбрать всё, кроме конкретного файла, используется восклицательный знак !:
*.log
!test.log — в итоге все логи скроются, а этот останется.

или например с скрытыми папками и файлами, если нужно чтобы все были исключены, кроме .gitignore:
.*
!.gitignore


Наборы символов
Можно указывать конкретные символы в квадратных скобках:
debug[0-9].log — проигнорирует debug0.log, debug1.log и т.д.
config.[jt]s — проигнорирует config.js и config.ts.

```

### Задание 3. Удаление и перемещение файлов (третий и четвёртый коммит)

![alt text](/02-git-01-vcs/img/image-8.png)
![alt text](/02-git-01-vcs/img/image-9.png)
![alt text](/02-git-01-vcs/img/image-10.png)
![alt text](/02-git-01-vcs/img/image-11.png)

### Задание 3.

```
pavel@ubuntu-24:~/hw-2/VCS-base-hw-2$ git log
commit fcc20ffb69d4e7856881753f9247835cc8992542 (HEAD -> main)
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:54:55 2026 +0300

    Move screenshots to img directory and update readme

commit 448218ba043ad2dd2f64cdccd71e0c2ce64926c2
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:45:22 2026 +0300

    Moved and deleted

commit ede5a4ab27eb87e877fd7e70cd07a9ccc75681fe
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:41:56 2026 +0300

    Prepare to delete and move

commit 75dae07f2017763d700bcbea9e2f76cd6ffe8884
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:29:52 2026 +0300

    Added gitignore

commit c5132cff5e7d93c25a0349dbe57d26379ae796a1
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:17:41 2026 +0300

    Second commit

commit 78827497f6e18482fbe9780c05a6efb539fd32f9
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Wed Apr 22 10:15:54 2026 +0300

    First commit

commit 20516270d3b47a0a1d0de2b2363b40b35f7db432 (origin/main, origin/HEAD)
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Tue Apr 21 15:07:03 2026 +0300

    add readme

commit 2d6f6d9eae4034ba7007df888e4456a971a88e2c
Author: PavelR <121037966+ShishelM@users.noreply.github.com>
Date:   Tue Apr 21 15:03:53 2026 +0300

    Initial commit
```

