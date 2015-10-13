## Task #4

>Приложение должно отображать посты, которые возвращает Instagram API по запросу https://api.instagram.com/v1/tags/<tag_name>/media/recent
Посты в UI должны отображаться с “пейджингом”, то есть приложение загружает посты “пачками”, размер которой Вы определяете сами. Пользователь скроллит таблицу/коллекшн вью, и по достижении последнего поста приложение должно загружать следующую пачку.
Запрос, который возвращает посты - авторизированный, то есть перед загрузкой постов Вам необходимо будет залогинить пользователя в Instagram 
Все посты, загруженные из Instagram, должны сохраняться в Core Data, и затем отображаться в UI по той же схеме, что и в третьем задании - с помощью NSFetchedResultsController
В UIImageView отображается собственно фото из поста в оригинальном размере, текст находится внутри объекта “пост” по ключу “caption.text”
Ручное добавление постов можно удалять, удаление постов - на Ваше усмотрение

###Project Structure sketch (reciving posts)

![alt tag](https://raw.githubusercontent.com/YAInternship2015/AndrewPetrovTask1/master/Task2ClassesDiagram.png)


## Task #3

>Теперь все модели должны храниться не в plist, а в Core Data
Для получения данных и отслеживания изменений в Persistent Store необходимо использовать NSFetchedResultsController
Необходимо добавить возможность удалять данные из таблицы (по свайпу влево на ячейке должна появляться кнопка Delete, выглядит это так http://cdn2.raywenderlich.com/wp-content/uploads/2014/01/iOS-Simulator-Screen-shot-Nov-28-2013-1.06.41-PM-213x320.png)
Необходимо добавить возможность удалять ячейки из коллекшн вью по жесту Long Tap (то есть юзер делает long tap на ячейке и ячейка удаляется)
Все изменения контента таблицы (добавление/удаление данных) должны происходить анимированно. Если есть желание, то можете заморочиться и с коллекшн вью.


## Task #2

>К Вашему выполненному заданию 1 необходимо добавить следующий функционал:
Смена вида представления данных - добавить возможность переключения между UITableView и UICollectionView. В UICollectionViewCell необходимо отображать только картинку в весь размер ячейки, что-то вроде этого http://www.appcoda.com/wp-content/uploads/2013/01/RecipePhoto-App-First-Version.jpg
Хранить данные моделей в plist-файле
Добавить возможность добавлять новые элементы - пользователь может ввести текст для новой модели, этот текст не может быть короче трех символов. Картинку пока не выбыраем. Модель сохраняется в plist. После сохранения модели она должна добавиться в plist и отобразиться в таблице и collection view. 


###Project Structure sketch

![alt tag](https://raw.githubusercontent.com/YAInternship2015/AndrewPetrovTask1/master/Task2ClassesDiagram.png)



## Task #1

>Написать приложение, в котором будет один экран с таблицей (UITableViewController). В таблице каждая ячейка (UITableViewCell) должна содержать следующую информацию:  картинка (UIImageView) и справа от нее текст (UILabel). В таблице должно быть 10 ячеек высотой 80 пикселей.  В качестве картинки показать любую картинку добавленную в проект и в качестве текста показать любой текст, но они должны быть разными для каждой ячейки.  Экран должен быть создан в Storyboard с использованием Autolayout.

Test app displays list of 10 musical instruments.

###Model


*APInstrument* object represents musical instrument

*APInstrumentsManager* plays role of some data provider it allows to generate list of instruments

###UI
*APTableViewCell* present musical instrument (*APInstrument*) in table
