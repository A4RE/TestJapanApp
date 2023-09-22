<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <div class="container">
        <div class="left-half">
            <h3>Макет из задания</h3>
            <img width="320" alt="image" src="https://github.com/A4RE/TestJapanApp/assets/64658088/0fd02271-78cb-45ea-af74-78a2c32e6a45">
        </div>
        <div class="right-half">
            <h3>Макет, полученный при разработке с использованием SwiftUI</h3>
            <img width="320" alt="image" src="https://github.com/A4RE/TestJapanApp/assets/64658088/4044d1fb-02fc-49ef-93ea-b2252bc699b8">
            <!-- Добавьте другое содержимое в правую часть, если необходимо -->
        </div>
    </div>
    <div>
        <h3>Разработать получение списка меню основываясь на вышеприведенном скриншоте.</h3>
        <p>Элементы на экранах, их расположение должны быть максимально идентичны скриншоту, а также динамически изменять свои размеры и положение основываясь на размере экрана устройства (AutoLayout).</p>
        <p>Список категорий — UICollectionView (Горизонтальный скролл)</p>
        <p>Список блюд в категории — UICollectionView (Вертикальный скролл), по две ячейки.</p>
        <p>Логотип можно использовать свой.</p>
    </div>
    <div>
        <h3>API Запрос: Категорий меню</h3>
        <p>POST. Body Form-Data: https://vkus-sovet.ru/api/getMenu.php</p>
        <h4>API Ответ:</h4>
        <pre>
{
  "status": Bool,
  "menuList": [
    {
      "menuID": String,
      "image": String,
      "name": String,
      "subMenuCount": String
    }
  ]
}
        </pre>
    </div>
    <div>
        <h3>API Запрос: Список блюд в категории</h3>
        <p>POST. Body Form-Data: https://vkus-sovet.ru/api/getSubMenu.php</p>
        <pre>
{
  "menuID": "String"
}
        </pre>
        <h4>API Ответ:</h4>
        <pre>
{
  "status": Bool,
  "menuList": [
    {
      "id": String,
      "image": String,
      "name": String,
      "content": String,
      "price": String,
      "weight": String,
      "spicy": String
    }
  ]
}
        </pre>
        <p>Поле spicy — если блюдо острое возвращается "Y", если нет, то null. Нужно для отображения иконки красного перца справа от стоимости.</p>
    </div>
</body>
</html>
