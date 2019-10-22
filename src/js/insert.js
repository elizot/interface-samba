/*Criação dos Cards*/
fetch('../data/json_create.php')
    .then(res => res.json())
    .then(json => showContent(json))

function showContent(info) {
    const card1 = document.querySelector('.card-panel.card-cpu');
    const card2 = document.querySelector('.card-panel.card-ram');
    const card3 = document.querySelector('.card-panel.card-swap');
    const table1 = document.querySelector('table.table-info');
    const table2 = document.querySelector('table.table-interfaces tbody');

    for (const element in info.uso_cpu) {
        const cpu = `
        <span class="card-title">CPU</span>
        <span class="right card-title">${info.uso_cpu[element]}%</span>
        <div class="progress">
            <div class="determinate" style="width: ${info.uso_cpu[element]}%"></div>
        </div>
        `;
        card1.insertAdjacentHTML('beforeend', cpu);
    }

    for (const element in info.uso_ram) {
        const ram = `
        <span class="card-title">RAM</span>
        <span class="right card-title">${info.uso_ram[element]}%</span>
        <div class="progress">
            <div class="determinate" style="width: ${info.uso_ram[element]}%"></div>
        </div>
        `;
        card2.insertAdjacentHTML('beforeend', ram);
    }

    for (const element in info.uso_swap) {
        const swap = `
        <span class="card-title">SWAP</span>
        <span class="right card-title">${info.uso_swap[element]}%</span>
        <div class="progress">
            <div class="determinate" style="width: ${info.uso_swap[element]}%"></div>
        </div>
        `;
        card3.insertAdjacentHTML('beforeend', swap);
    }

    for (const element in info.informacoes) {
        const tableInfo = `
                <tbody>
                    <tr>
                        <td>${element}</td>
                        <td>${info.informacoes[element]}</td>
                    </tr>
                </tbody>
        `;
        table1.insertAdjacentHTML('beforeend', tableInfo);
    }
   
     for (const element in info.interfaces) {
         const tableInfo = `
                 <tbody>
                     <tr>
                         <td>${element}</td>
                         <td>${info.interfaces[element]}</td>
                     </tr>
                 </tbody>
         `;
         table2.insertAdjacentHTML('beforeend', tableInfo);
    }
   
}