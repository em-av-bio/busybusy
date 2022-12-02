import Sortable from "sortablejs"

const list = document.querySelector(".cards-sortable");
const initSortable = (event) => {
  Sortable.create(list, {
    dataIdAttr: 'data-ranking',
    ghostClass: "ghost",
    swap: true,
    animation: 150,
    onSort: (event) => {
      console.log(event.oldIndex + ' -> ' + event.newIndex);
      let listItems = document.querySelectorAll(".cards-sortable .card")
      let i = listItems.length;
      listItems.forEach((item) => {
        item.dataset.ranking = i;
        i -= 1;
      });
    }
  });
}

export { initSortable }
