async function fillTable(url, table){
    const tableHead =  table.querySelector('thead');
    const tableBody = table.querySelector('tbody');
    const response = await fetch(url);
    const data = await response.json();

    console.log(data[0])
  
    // clear table
    
    tableHead.innerHTML = "<tr></tr>";
    tableBody.innerHTML = "";
    
    // adding table headers 
    
    for (const headerText in data[0]){
      const headerElement = document.createElement("th");
      headerElement.textContent = headerText;
      tableHead.querySelector('tr').appendChild(headerElement)
    };
    
    //populate the data 
    
    for (let i = 0; i < data.length; i++) {
      const obj = Object.values(data[i]);
      const rowElement =  document.createElement('tr');
      for (const celltext of obj) {
        const cellElement = document.createElement('td');
        cellElement.textContent = celltext;
        rowElement.appendChild(cellElement);
      }
      tableBody.appendChild(rowElement);
    }
}

fillTable("http://127.0.0.1:4611/pipes", document.querySelector('table'));
fillTable("http://127.0.0.1:4611/junctions", document.querySelector('tablej'));


