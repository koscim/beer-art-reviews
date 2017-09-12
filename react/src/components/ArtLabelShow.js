import React from 'react';
import { browserHistory, Link } from 'react-router';

const ArtLabelShow = (props) => {
  return(
    <div>
      <h2>{props.art_label.name}</h2>
      <p>Brewery: {props.art_label.brewery}
      <br />
      Beer Style: {props.art_label.beer_style}
      <br />
      Art Style: {props.art_label.art_style}
      <br />
      Container Type: {props.art_label.container_type}
      <br />
      Beer Description: {props.art_label.beer_description}
      <br />
      Art Description: {props.art_label.art_description}
      <br />
      Beer Rating: {props.art_label.beer_rating}
      <br />
      Submitted By: {props.art_label.user.username}
      </p>
    </div>
  )
}

export default ArtLabelShow;
