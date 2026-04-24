# Домашнее задание к занятию "`Основы Git`" - `Рыбянцев Павел`

------

*`немного переделал структуру репозитория, чтобы он  повторял структуру домашних заданий (для удобства)`

### Задание 1. Знакомимся с GitLab и Bitbucket

Настроил репозиторий GitLab по аналогии GitHub

результат команды `git remote -v`
```
gitlab  git@gitlab.com:ShishelM_lab/devops-netology.git (fetch)
gitlab  git@gitlab.com:ShishelM_lab/devops-netology.git (push)
origin  git@github.com:ShishelM/devops-netology.git (fetch)
origin  git@github.com:ShishelM/devops-netology.git (push)
```
Выполните push локальной ветки `main`
```
# Локальный
pavel@ubuntu-24:~/devops-netology$ git log -1 --format="%H"
2793c57b0c2f8511541f913fedbdf621a82211cc

# GitHub
pavel@ubuntu-24:~/devops-netology$ git ls-remote --heads origin main
2793c57b0c2f8511541f913fedbdf621a82211cc        refs/heads/main

# GitLab
pavel@ubuntu-24:~/devops-netology$ git ls-remote --heads gitlab main
2793c57b0c2f8511541f913fedbdf621a82211cc        refs/heads/main

# Проверка что послежний коммит везде совпадает
pavel@ubuntu-24:~/devops-netology$ git log --oneline --graph --all
* 2793c57 (HEAD -> main, origin/main, gitlab/main) Fix: readme
* d4e5e81 Fix: readme amd img
* 6a91b0b Fix: convert submodule to normal folder with files
* dc92e1e Final fix: proper folder structure
```

### Задание 2. Теги

v0.0 (Легковесный): 
    Выглядит максимально просто. 
    Это просто ссылка на состояние кода (на коммит). В истории Git у него нет своего автора или даты создания — подтяшивает значения из коммита.

`git show v0.0`
```
pavel@ubuntu-24:~/devops-netology$ git show v0.0
commit b79a3567f7fec0cf401fb1f17819ecde701dde25 (HEAD -> main, tag: v0.1, tag: v0.0, origin/main, gitlab/main)
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Fri Apr 24 17:11:20 2026 +0300

    add new homework

diff --git a/02-git-02-base/README.md b/02-git-02-base/README.md
new file mode 100644
index 0000000..89da981
--- /dev/null
+++ b/02-git-02-base/README.md
@@ -0,0 +1,38 @@
+# .....................
```

v0.1 (Аннотированный):
    У  этого тега есть сообщение (которое указывал при создании) и информация о том, кто и когда его создал. В GitHub аннотированные теги становятся основой для создания "Releases" с описанием изменений.

`git show v0.1`
```
tag v0.1
Tagger: Pavel <jonyblaze2019@gmail.com>
Date:   Fri Apr 24 17:22:21 2026 +0300

Release version 0.1 with annotated tag

commit b79a3567f7fec0cf401fb1f17819ecde701dde25 (HEAD -> main, tag: v0.1, tag: v0.0, origin/main, gitlab/main)
Author: Pavel <jonyblaze2019@gmail.com>
Date:   Fri Apr 24 17:11:20 2026 +0300

    add new homework

diff --git a/02-git-02-base/README.md b/02-git-02-base/README.md
new file mode 100644
index 0000000..89da981
--- /dev/null
+++ b/02-git-02-base/README.md
@@ -0,0 +1,38 @@
+# .....................
```

для проверки тегов можно выполнить команду:
`git for-each-ref --format='%(refname:short) %(objecttype)' refs/tags`
Покажет, какой тег является просто ссылкой на коммит, а какой отдельным объектом "tag"
```
v0.0 commit
v0.1 tag
```

### Задание 3. Ветки

* `Из за того что переделал структуру репозитория, часть предидущих коммитов из первого задания потерялась, поэтому возьму другой коммит для выполнения задания (например: Fix: readme).`

`git log --oneline`
```
caea181 (HEAD -> main, origin/main, gitlab/main) add new rows readme
7d66d5f clear
7e205cf New to readme
b79a356 (tag: v0.1, tag: v0.0) add new homework
2793c57 Fix: readme
d4e5e81 Fix: readme amd img
6a91b0b Fix: convert submodule to normal folder with files
dc92e1e Final fix: proper folder structure
```

```
# Переходим на выбранный коммит
git checkout 2793c57

# Создаем ветку fix
git switch -c fix

# Отправляем её на GitHub
git push -u origin fix
```
![alt text](/02-git-02-base/img/image.png)


----