import Sortable from "sortablejs"

const list = document.querySelector(".cards-sortable")
const listItems = document.querySelectorAll(".cards")

const initSortable = () => {
  Sortable.create(list, {
    ghostClass: "ghost",
    swap: true,
    animation: 150,
    onSort: (event) => {
      console.log(event.oldIndex + ' -> ' + event.newIndex);
    }
    }
  )
}

export { initSortable }
