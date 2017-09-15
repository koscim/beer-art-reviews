import React from 'react';
import { Link, browserHistory } from 'react-router';

const ArtLabelTile = props => {
  let handleDelete = () => {
    props.deleteButton(props.id)
  }
  let button;
  if(props.currentUser){
    if (props.currentUser.id === props.user || props.currentUser.role === "admin"){
      button = <button className='button' onClick={handleDelete}>Delete</button>
    } else {
      button = <button className='hidden-button button'>Delete</button>
    }
  }

  return (
      <div className="tile">
        <Link to={`/art_labels/${props.id}`}>
            <p>
              Name: {props.name}
              <br />
              Brewery: {props.brewery}
              <br />
              <img src={props.label_photo.url} className="tile-size"/>
            </p>
        </Link>
        {button}
      </div>
  )
}

export default ArtLabelTile;
