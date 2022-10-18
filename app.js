async function fillTable(url, table){
    const tableHead =  table.querySelector('thead');
    const tableBody = table.querySelector('tbody');
    const response = await fetch(url);
    const data = await response.json();

    console.log(data)
}

fillTable("http://127.0.0.1:4611/pipes", document.querySelector('table'));


