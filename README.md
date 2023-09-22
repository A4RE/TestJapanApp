# TestJapanApp
Тестовое задание
<div class="split left">
  <div class="centered">
    <h2> Макет из задания </h2>
    <img width="243" alt="image" src="https://github.com/A4RE/TestJapanApp/assets/64658088/0fd02271-78cb-45ea-af74-78a2c32e6a45">
  </div>
</div>

<div class="split right">
  <div class="centered">
    <p>Разработать получение списка меню основываясь на вышеприведенном скриншоте. Элементы на экранах, их расположение должны быть максимально идентичны скриншоту, а также динамически изменять свои размеры и положение основываясь на размере экрана устройства (AutoLayout).
Список категорий — UICollectionView (Горизонтальный скролл)
Список блюд в категории — UICollectionView (Вертикальный скролл), по две ячейки.
Логотип можно использовать свой.
API Запрос:
Категорий меню:
POST. Body Form-Data: https://vkus-sovet.ru/api/getMenu.php
API Ответ:
{
"status": Bool,
"menuList": [
{
"menuID": String, "image": String,
"name": String, "subMenuCount": String
} ]
}
API Запрос:
Список блюд в категории:
POST. Body Form-Data: https://vkus-sovet.ru/api/getSubMenu.php
"menuID": "String" API Ответ:
{
"status": Bool,
"menuList": [
{
"id": String, "image": String, "name": String, "content": String, "price": String, "weight": String, "spicy": String
} ]
}
* Поле spicy — если блюдо острое возвращается "Y", если нет, то null. Нужно для отображения иконки красного перца справа от стоимости.</p>
  </div>
</div>

<h2>Для верстки экрана использовался фреймворк SwiftUI</h2>
*В результате выполения задания был получен такой макет
<img width="366" alt="image" src="https://github.com/A4RE/TestJapanApp/assets/64658088/4044d1fb-02fc-49ef-93ea-b2252bc699b8">
