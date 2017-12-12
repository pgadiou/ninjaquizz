const avatars = document.getElementsByClassName("avatar")

const avatar_circle = () => {
  Array.from(avatars).forEach(function(avatar) {
    avatar != event.currentTarget ? avatar.classList.remove("circled-avatar") : console.log("test");
  });
  event.currentTarget.classList.toggle("circled-avatar");
}

Array.from(avatars).forEach(function(avatar) {
  avatar.addEventListener("click", avatar_circle);
})

