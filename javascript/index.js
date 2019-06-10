// Closes over the current state to create an update function
function provider(updateFn, currentState) {
  const dispatch = (action) => {
    updateFn(currentState, action);
  };

  return Object.assign(currentState, { dispatch: dispatch })
}

// Composes the reduce -> connect -> render cycle
function updater(currentState, action) {
  const nextState = reducer(currentState, action);
  const connectedState = provider(updater, nextState);
  view(connectedState);
}

// create the janky updater element
const base = document.createElement("div");
base.id = "base";
document.getElementById("root").appendChild(base);

// get the initial state
const firstState = reducer();
// inject the updater
const firstConnectedState = provider(updater, firstState);
// hydrate the view
view(firstConnectedState);
