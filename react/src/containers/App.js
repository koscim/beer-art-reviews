import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ArtLabelsIndexContainer from './ArtLabelsIndexContainer';
import ArtLabelShowContainer from './ArtLabelShowContainer';
// import ArtLabelFormContainer from './ArtLabelFormContainer';
const App = (props) => {
  return (
    <Router history={browserHistory} >
      <Route path='/' >
        <IndexRoute component={ArtLabelsIndexContainer} />
        <Route path="/art_labels" component={ArtLabelsIndexContainer} />
        <Route path="/art_labels/:id" component={ArtLabelShowContainer} />
      </Route>
    </Router>
  );
}

export default App;
