import Sortable from "sortablejs"

const list = document.querySelector(".cards-sortable")
const listItems = document.querySelectorAll(".cards-sortable .card")

const initSortable = () => {
  Sortable.create(list, {
    dataIdAttr: 'data-ranking',
    ghostClass: "ghost",
    swap: true,
    animation: 150,
    onSort: (event) => {
      console.log(event.oldIndex + ' -> ' + event.newIndex);
      listItems.forEach((item) => {
        item.dataset.ranking = event.newIndex;
        console.log(item.dataset.ranking);
      });
    }
  });
}

export { initSortable }
