const access = document.getElementById("access-info")

const show_waiting_room = () => {
  access.classList.remove("main")
  access.classList.add("secondary");
}

access.addEventListener("click", show_waiting_room);
