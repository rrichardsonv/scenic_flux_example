function view(state) {
  const baseElement = document.getElementById("base");
  const newbaseElement = baseElement.cloneNode();


  // Count element
  const count = document.createElement("p");
  count.innerText = `count is: ${state.count}`;
  newbaseElement.appendChild(count);


  // Incrememt button
  const plusButton = document.createElement("button");
  plusButton.innerText = "Add"
  plusButton.addEventListener("click", () => state.dispatch({ type: window._actions.INCREMENT }));
  newbaseElement.appendChild(plusButton);


  // Decrememt button
  const minusButton = document.createElement("button");
  minusButton.innerText = "Subtract"
  minusButton.addEventListener("click", () => state.dispatch({ type: window._actions.DECREMENT }));
  newbaseElement.appendChild(minusButton);


  // Replace the tree
  const parent = baseElement.parentNode;
  parent.removeChild(baseElement);
  parent.appendChild(newbaseElement);
}
