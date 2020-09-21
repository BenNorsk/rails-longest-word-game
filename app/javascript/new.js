document.addEventListener("turbolinks:load", (event) => {
  let seconds_counter = 0;

const update_time = () => {
  const time = document.querySelector("#time");
  seconds_counter += 1;
  time.innerText = `${seconds_counter}:00`;
  return;
}

setInterval(update_time, 1000);
});

