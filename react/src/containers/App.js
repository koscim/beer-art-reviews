import React from 'react';
import { Route, IndexRoute, Router, browserHistory, Redirect } from 'react-router';
import ArtLabelsIndexContainer from './ArtLabelsIndexContainer';
import ArtLabelShowContainer from './ArtLabelShowContainer';
// import ArtLabelFormContainer from './ArtLabelFormContainer';

const App = (props) => {
  return (
    <Router history={browserHistory} >
        <Redirect from="/" to="/art_labels" />
        <IndexRoute component={ArtLabelsIndexContainer} />
        <Route exact path="/art_labels" component={ArtLabelsIndexContainer} />
        <Route path="/art_labels/:id" component={ArtLabelShowContainer} />
    </Router>
  );
}

export default App;
