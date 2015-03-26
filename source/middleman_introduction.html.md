---
layout: layout
title: Коротко про Мідлмен

---

## Структура директорій

Мідлмен встановлює свій набір правил, погоджень щодо розташування файлів та структури директорій проекту. Нижче показаний типовий вигляд директорій мінімального проекту. В даному випадку зразок веб майданчика складається з однієї єдиної сторінки `index.html`
    

    .
    ├── build
    ├── config.rb
    ├── data
    │   └── site.yml
    └── source
        ├── assets
        │   ├── fonts
        │   ├── images
        │   │   ├── new_fork.png
        │   │   └── new_repo.png
        │   ├── javascripts
        │   │   ├── all.js
        │   │   ├── bootstrap.min.js
        │   │   └── jquery-1.9.1.min.js
        │   └── stylesheets
        │       ├── all.css
        │       ├── bootstrap.min.css
        │       └── style.css.scss
        ├── index.html.md
        ├── layouts
        │   └── layout.html.slim
        └── partials
            ├── _footer.html.slim
            ├── _navigation.html.slim
            └── _toc.html.slim

- **build** --- ця директорія містить (буде містити) згенеровані файли вашого проекту. Для публікації сайту на вебі, просто скопіюйте цю директорію як вона є на веб сервер.
- **config.rb** --- конфігурація проекту Мідлмен.
- **source** --- вихідні тексти веб майданчика, включає активи (графіку, шрифти, CSS стилі), шаблони та макети сторінки, тексти.
- **source/assets** --- активи: графіка, Javascript та CSS
- **source/assets/javascripts** --- файли Javascript
- **source/assets/stylesheets** --- файли CSS стилів
- **source/assets/image** --- графічні файли
- **layouts** --- шаблони макети майданчику.
- **partials** --- "часткові" шаблони. Часто вживані елементи макета можна помістити в окремий файл для того, щоб їх можна було включати в різні частини макета. За домовленістю, яку Мідлмен успадкував від Ruby-on-rails, назви файлів часткових шаблонів мають починатися з символа підкреслення ("`_`"). В нашому випадку використовуються три файли часткових шаблонів `_footer.html.slim`, `_navigation.html.slim` та  `_toc.html.slim` для підвалу сторінки, меню навігації та таблиці змісту, відповідно.
- **data** --- структуровані дані сторінки. Структури даних можуть бути створені у форматах JSON або YAML. При макетуванні сторінки ці дані можна включати в файли шаблонів, таким чином всі дані про майданчик (як, наприклад, ім'я та координати автора, категоризацію, тощо) можна тримати в одному і місці і використовувати їх за потребою.

### Препроцесори та попередня обробка

Деякі файли у Мідлмені можуть мати по кілька розширень (типів файла). 

Як, наприклад, вже згадані файли часткових шаблонів мають по два розширення: `.html.slim` Ці типи вказують Мідлмену: у якому форматі має бути остаточно згенегований файл, та яким(якими) препроцесором потрібно його обробляти. В нашому випадку, Мідлмен повинен створити файл у форматі HTML, а початковий вихідний текст файлу --- у форматі [SLIM](http://slim-lang.com/). 

Так само для генерування файлів стилів CSS можуть використовуватися або [SASS (SCSS)](http://sass-lang.com/), або [LESS](http://lesscss.org/), тож відповідно файли в директорії `source/assets/stylesheets` будуть або мати типи `.css.scss`, `.css.sass` чи `.css.less`.

Теж саме стосується не тільки шаблонів, а й власне змісту майданчику. Більшість текстових файлів створюються у форматі Markdown, тож текстові файли вмісту мають тип `.html.md`

Мідлмен може використовувати більше одного препроцесора для генерації остаточного файла, в такому випадку Міддлмен читає розширення файлів зправа наліво і застосовує препроцесори по черзі. В даному проекті подвійний препроцесор використовується у файлі [`first_steps.html.md.erb`](https://github.com/dmytro/startpack/blob/master/source/first_steps.html.md.erb#L47), де для функції-помічника використовується формат ERB, а після нього --- Markdown.

## Обробка активів

Кілька слів потрібно сказати про обробку активів, особливо файлів Javascript та CSS.

Мідлмен користується системою обробки активів, так званим "[трубопроводом активів](http://dict#asset%20pipeline)" (тут далі --- ТА), під назвою [Sprockets](https://github.com/sstephenson/sprockets) (англ. "шерстеня"), який використовується в Ruby-on-Rails. ТА оптимізує активи, включені в проект з метою прискорення роботи веб сторінки. 

### Активи Sprockets

Насьогодні розробники веб майданчиків користуються сторонніми розробками, такими, як наприклад, бібліотекою jQuery та різноманітними модулями для неї, або стилями для Bootstrap. Це приводить до того, що при завантаженні кожної HTML сторінки, разом з нею мають завантажуватися численні `*.js` та `*.css` файли. Кожен з них може бути зовсім невеличким, але для завантаження кожного з цих файлів веб клієнт (броузер), повинен надіслати запит до веб-сервера і звантажити цей файл. Це значно сповільнює завантаження кожної сторінки для користувача.

ТА згруповує всі `*.js` файли у один файл, `all.js`, а всі таблиці стилів `*.css` у один файл `all.css`.  А також проводить його попередню обробку, наприклад, компресію (чи мінімізацію) за рахунок видалення несуттєвого: пустих пробілі, порожніх рядків та коментарів.

Sprockets використовує спеціальний синтаксис: у файлах `all.js` та `all.css` здебільшого немає ні Javascript, ні CSS коду, а міститься тільки псевдо-код, для включення потрібних файлів, а в HTML шаблон включається тільки посилання на `all.*` файли.

Наприклад, `all.js` може виглядати приблизно так:

    //= require jquery-1.9.1.min
    //= require bootstrap.min
    //= require material.min
    //= require ripples.min
    
або навіть ось так (цим будуть вкючені всі файли `source/assets/javascripts/*.js`):

    //= require_tree .
    
#### Хеш теги активів

Для полегшення роботи кешу веб переглядачами, Sprockets додає до назв файлів `all.js` та  `all.css` спеціальну "етикетку", яка змінюється тільки коли зміст цих файлів змінюється. В згенерованому HTML чи посилання будуть виглядати приблизно так:

    <link href="assets/stylesheets/all-c0e86d17.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="assets/javascripts/all-ccaaadd2.js" type="text/javascript"></script>