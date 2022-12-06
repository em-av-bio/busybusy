import Sortable from "sortablejs"

const list = document.querySelector(".cards-sortable");
const initSortable = (event) => {
  Sortable.create(list, {
    dataIdAttr: 'data-ranking',
    ghostClass: "ghost",
    swap: true,
    animation: 150,
    onSort: (event) => {
      let listItems = document.querySelectorAll(".cards-sortable .card");
      let i = listItems.length;
      listItems.forEach((item) => {
        let hidden = item.querySelector('.hidden_ranking');
        hidden.value = i;
        console.log(hidden.value)
        i -= 1;
      });
    }
  });
}

export { initSortable }
