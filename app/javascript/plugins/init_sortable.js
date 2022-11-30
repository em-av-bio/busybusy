import Sortable from "sortablejs"

const list = document.querySelector(".cards-sortable")

const initSortable = () => {
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150
    }
  )
}

export { initSortable }
