import React from 'react';
import { Link, browserHistory } from 'react-router';

const ArtLabelTile = props => {
  return (
    <Link to={`/art_labels/${props.id}`}>
      <div className="tile">
        <p>
          Name: {props.name}
          <br />
          Brewery: {props.brewery}
        </p>
      </div>
    </Link>
  )
}

export default ArtLabelTile;
