function merge(oldState, newState) {
  return Object.assign({}, oldState, newState)
}
window.actions = {};
const INCREMENT = window.actions.INCREMENT = "INCREMENT";
const DECREMENT = window.actions.DECREMENT = "DECREMENT";
const initialState = window.actions.initialState = {
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
  switch (action.type) {
    case INCREMENT:
      const newState = incrementCounter(action, state);
      console.log(action.type, newState);
      return newState;
    case DECREMENT:
      const newState = decrementCounter(action, state);
      console.log(action.type, newState);
      return newState;
    default:
      return state;
  }
}
