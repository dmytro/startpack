---
layout: layout
title:  Що таке Git та Github?

---

Дві основні складові на вершині списку, це Git та Github.

## Що таке git

`git` (або Ґіт) — це програма, що належить до класу так званих Систем Керування Версіями,  тут і далі «СКВ» (англ. VCS - Versions Control System). Є багато різних типів СКВ, на яких ми не будемо детально зупинятися, оскільки цьому присвячено багато інформації в інтернеті. 

`git` був розроблений засновником Лінакса Лінасом Торвальдсом для керування кодами ядра. Ця система стала дуже популярною в останні роки завдяки гнучкості, і не в останню чергу завдяки існуванню такого веб-ресурсу, як [Github](http://github.com).

Кожна СКВ від самої найпростішої до найсучаснішої і до найбільш навороченої забезпечує кілька основих функцій: 

- дозволяє зберігати версії документів (коли це стосується програмування програм),
- дозволяє повертатися (`rollback`, `reset`) за необхідності (якщо, наприклад, щось не так спрацювало або внесені помилки) до попередньої версії документа,
- дозволяє подивитися різницю (`diff`) між поточною версією (чи робочою версією) документа і попереднью (попередніми) версією документа, чи різницю між двома (інколи трьома чи більше) попередніми версіями,
створювати гілки (`branch`) в процесі розробки, коли один чи декілька розробників працюють незалежно від інших над певною функцією,
- та дозволяє зливати (з’єднувати, `merge`) відокремлені гілки в основне «дерево» документа, враховуючи при цьому як зміни зроблені у відокремленій гілці, так і зміни в основному «дереві». 


`git` також належить до розподілених (distributed) СКВ. Це означає, що будь яка копія центрального репозиторія є повновісним репозиторієм сама по собі. Ці властивості роблять `git` одним з найпопулярніших на сьогоднішній день СКВ. 

Добрий опис того, що таке `git` українською мовою є [ось тут](http://www.vitaliypodoba.com/2014/06/git-basics/)

Опис орієнтований більше на програмістів, але в першій частині, дуже доступно описує нащо взагалі Ґіт потрібен, і як це все працює. 


Хоча ґіт і спроектований в першу чергу для програмістів, тим не менше ним можуть користуватися і не дуже обізнані з програмування люди. Завдяки деяким інструментам, про які ідеться далі.


## Що таке Github

Github - це організація, побудована «навколо» `git`. Робота компанії присвячена підтримці програм на платформі `git`. В безкоштовній версії підтримуються проекти з відкритим кодом. Закриті проекти також можливі, але за окрему плату. 

Всі проекти якої базуються на `git` репозиторіях і зберігаються на серверах github'у. Додатково до простого зберігання репозиторіїв і доступу до них Github надає додаткові послуги для проектів та організацій:

- вікі для документації;
- публікацію веб-сторінок проектів (яку саме зараз ви читаєте);
- систему відслідковування помилок (issue tracking);
- систему pull requests, та пов'язану з ними систему перегляду та коментування змін коду.

### Де взяти програми

####  Ґіт
Для початківця, не звиклого працювати з командним рядком знадобляться GUI клієнти:

- [Github для Windows](https://windows.github.com/)
  - [документація](https://help.github.com/categories/58/articles)
- [Github для Mac](https://mac.github.com/)
  - [документація](https://help.github.com/categories/31/articles)
  
 Для тих же, хто себе почуває комфортно командним режимом, git завжди доступний в Лінаксі та на Маку.  Для Віндовса є також [командний рядок](https://msysgit.github.io/), який треба встановлювати додатково. 
 
####  Рубін

Мідлмен і Джекіл написані на мові програмування Рубін (Ruby). Так само в Лінаксі і Маку вона вже або є, або ж встановлюється стандартними засобами. На Віндовсі можна встановити за допомогою [RubyInstaller](http://rubyinstaller.org/)

