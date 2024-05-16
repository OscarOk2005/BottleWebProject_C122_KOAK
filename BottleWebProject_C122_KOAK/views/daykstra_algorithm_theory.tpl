
% rebase('layout.tpl', title=title, year=year)
<div class="container">
  <h1 class="text-center header-page">Метод Дейкстры</h1>

  <div class="theory-block">
    <h3>Формальная постановка задачи</h3>
    <p>
      В процессе работы алгоритма Дейкстры поддерживается множество S входящее в V, состоящее из вершин v, для 
      которых δ(s, v) уже найдено. Алгоритм выбирает вершину u ∈ V\S с наименьшим d[u], добавляет u к
      множеству S и производит релаксацию всех рёбер, выходящих из u, после чего цикл повторяется. 
      Вершины, не лежащие в S , хранятся в очереди Q с приоритетами, определяемыми значениями функции d.
      Предполагается, что граф задан с помощью списков смежных вершин.
    </p>
  </div>
  <div class="theory-block">
    <h3>Неформальная постановка задачи</h3>
    <p>
      Каждой вершине из V сопоставим метку — минимальное известное расстояние от этой вершины до a.
      Алгоритм работает пошагово — на каждом шаге он «посещает» одну вершину и пытается уменьшать метки.
      Работа алгоритма завершается, когда все вершины посещены.
    </p>
  </div>
  <div class="theory-block">
    <h3>Описание алгоритма</h3>
    <p>
      Начальная вершина называется a. Алгоритм помечает вершину (v) двумя параметрами:
    </p>
    <ul>
      <li>
        Стоимость — это текущее кратчайшее известное расстояние от a.
      </li>
      <li>
        Вершина — это сосед v на пути от a до v, который дает это кратчайшее известное расстояние.
      </li>
      <li>
        Призведение релаксации - улучшение существующей оценки расстояния до конечной вершины ребра.
      </li>
    </ul>
    <p> 
      Алгоритм выполняется по следующим шагам:
    </p>
    <ul>
      <li>
        Шаг 1. Устанавливаем метки стоимости каждого соседа v на стоимость ребра от а до него и метку вершины на a.
        Помечаем a как искомое. Эта метка будет означать, что мы не будем посещать ее снова.
      </li>
      <li>
        Шаг 2. Выбираем помеченную вершину v с наименьшей стоимостью и развиваем связи по своему усмотрению. 
        Смотрим каждого соседа v. Если сосед не помечен, то мы помечаем его стоимостью c плюс вес ребра к нему от v.
        Его вершинной меткой становится v.
        Если сосед уже помечен, то мы проводим релаксацию данной вершины (сравниваем его текущую стоимость метки с c плюс вес ребра к нему от v).
        Если это не лучше, чем текущая стоимость метки соседа, то мы больше ничего не делаем с этой вершиной.
        В противном случае мы обновляем стоимость метки на эту новую стоимость и обновляем метку соседней вершины на v. 
        Мы повторяем это для каждого незамеченного соседа v и затем помечаем саму v как искомую.
      </li>
      <li>
        Шаг 3. Продолжаем на каждом шаге выбирать немаркированную вершину с наименьшей стоимостью и обновлять метки ее соседей,
        как на втором шаге.
      </li>
      <li>
        Шаг 4. Завершаем алгоритм, когда вершина с наименьшей стоимостью является вершиной назначения.
        Эта стоимость — общая стоимость кратчайшего пути. Затем мы используем метки вершин для поиска пути от начала до
        места назначения.
      </li>
    </ul>
  </div>

  <div class="theory-block">
    <h3>Псевдокод метода Дейкстры</h3>
    <p>Вход:</p>
    <ol>
      <li>Размерность матрицы n</li>
      <li>Матрица смежности cost[i][j]</li>
      <li>Начальная вершина</li>
      <li>
        Связный взвешенный граф G = (V, E, c): заданный матрицей весов
        cost[i][j]
      </li>
    </ol>
    <p>Выход: новый граф с минимальными расстояниями от начальной вершины до других.</p>
    <pre>
        <code id="pseudocode">1.    func dijkstra(s):
            <br>2.    for  v∈V  // По умолчанию присвоим всем вершинам бесконечную стоимость и отметим их как непосещённых
            <br>3.        d[v] = ∞
            <br>4.        used[v] = false
            <br>5.    d[s] = 0  // Присваиваем начальной точке стоимость 0
            <br>6.    for i∈V          
            <br>7.       v = null                 
            <br>8.       for j∈V // Найдём вершину с минимальным расстоянием               
            <br>9.          if !used[j] and (v == null or d[j] < d[v])           
            <br>10.             v = j
            <br>11.      if d[v] == ∞
            <br>12.        break
            <br>13.      used[v] = true
            <br>14.      for e : исходящие из v рёбра     // Произведём релаксацию по всем рёбрам, исходящим из v
            <br>15.         if d[v] + e.len < d[e.to]
            <br>16.             d[e.to] = d[v] + e.len
        </code>
    </pre>
  </div>

  <div class="theory-block">
    <h3>Разбор конкретного примера</h3>
    <p>
        Применим метод Дейкстры для нахождения минимального пути от точки С для графа. <br>
        Шаг 1. Обозначим стоимость вершины С как 0, остальным присвоим бесконечность:
    </p>
    <figure class="text-center mb-3">
      <img src="/static/images/dijkstra_first.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Исходный граф
      </figcaption>
    </figure>
    <p>
         Шаг 2. Подсчитаем стоимость всех соседей для вершины С, прибавив к ним стоимость вершины С и вес соединяющего их ребра. <br>
         Например, для вершины E стоимость будет равна 0 + 9 = 9. <br>
         Помечаем вершин С как проверенную, при последующий действиях она учитываться не будет.  
    </p>
     <figure class="text-center mb-3">
      <img src="/static/images/dijkstra_second.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Граф после выполнения 2 шага
      </figcaption>
    </figure>
     <p>
        Шаг 3. Берём вершину с минимальной стоимостью (отмеченную точку брать нельзя), если таких точек несколько - берём любую.<br>
        В примере это вершина D. Теперь считаем стоимость для всех соседних точек, как в шаге 2. Для отмеченных точек стоимость не считаем. 
        Если у вершины уже была стоимость и она больше новой - заменяем на новую, если меньше - оставляем старую. <br>
        Отмечаем выбранную точку как проверенную.
     </p>
     <figure class="text-center mb-3">
      <img src="/static/images/dijkstra_third.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Граф после выполнения 3 шага
      </figcaption>
    </figure>
     <p>
        Повторяем 3 шаг до тех пор, пока не останется только 1 неотмеченная точка. Полученный граф и будет результатом.
     </p>
     <figure class="text-center mb-3">
      <img src="/static/images/dijkstra_finish.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Конечный граф
      </figcaption>
    </figure>
    <p>
        Ответ также можно представить в виде следующего графа:
     </p>
     <figure class="text-center mb-3">
      <img src="/static/images/dijkstra_finish2.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Граф с кратчайшим расстоянием от вершины С до остальных
      </figcaption>
    </figure>
  </div>
  <div class="theory-block">
    <h3>Оценка сложности</h3>
    <p>
     Изначально поместим в контейнер стартовую вершину s. Основной цикл будет выполняться, пока в контейнере есть хотя бы одна вершина.
     На каждой итерации извлекается вершина с наименьшим расстоянием d
     и выполняются релаксации по рёбрам из неё. При выполнении успешной релаксации нужно удалить из контейнера вершину,
     до которой обновляем расстояние, а затем добавить её же, но с новым расстоянием.

    </p>
    <p>
     В обычных кучах нет операции удаления произвольного элемента. При релаксации можно не удалять старые пары, в результате
     чего в куче может находиться одновременно несколько пар расстояние-вершина для одной вершины (с разными расстояниями).
     Для корректной работы при извлечении из кучи будем проверять расстояние: пары, в которых расстояние отлично от d[v]
     будем игнорировать. При этом асимптотика будет O(mlogm)
     вместо O(mlogn).
    </p>
  </div>
  <div class="theory-block text-center">
    <h3>Попробуйте сами!</h3>
    <p>
      Если вы хотите протестировать метод Дейкстры на своем примере,
      воспользуйтесь нашим калькулятором:
    </p>
    <a href="daykstar_algorithm_calc" class="btn btn-primary">Открыть калькулятор</a>
  </div>
</div>