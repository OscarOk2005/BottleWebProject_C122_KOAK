% rebase('layout.tpl', title='Prima algorithm calculator', year=year)
<div class="container">
        <h1 class="text-center mb-3">Калькулятор алгоритма Прима</h1>
        <p class="text-center">Здесь вы можете ввести данные для алгоритма Прима и найти минимальное остовное дерево</p>
        %include('matrix.tpl')
        <div id="matrixContainer"></div>
    </div>
            <script src="/static/scripts/matrix.js">
    </script>

