function merge(oldState, newState) {
  return Object.assign({}, oldState, newState)
}
window._actions = {};
var INCREMENT = window._actions.INCREMENT = "INCREMENT";
var DECREMENT = window._actions.DECREMENT = "DECREMENT";
var initialState = window._actions.initialState = {
  count: 0
};

// ActionCreators
const incrementCounter = (action, state) => {
  return merge(state, { count: state.count + 1 });
};

const decrementCounter = (action, state) => {
  return merge(state, { count: state.count - 1 });
};

// reducer
function reducer(state = initialState, action = {}) {
  let newState;
  switch (action.type) {
    case INCREMENT:
      newState = incrementCounter(action, state);
      console.log(action.type, newState);
      return newState;
    case DECREMENT:
      newState = decrementCounter(action, state);
      console.log(action.type, newState);
      return newState;
    default:
      return state;
  }
}
