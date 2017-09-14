import React from 'react';
import { Link, browserHistory } from 'react-router';

const ArtLabelTile = props => {
  let handleDelete = () => {
    props.deleteButton(props.id)
  }
  let button;
  if(props.current_user){
    if (props.currentUser.id === props.user){
      button = <button className='button' onClick={handleDelete}>Delete</button>
    } else {
      button = ""
    }
  }

  return (
    <div>
      <Link to={`/art_labels/${props.id}`}>
        <div className="tile">
          <p>
            Name: {props.name}
            <br />
            Brewery: {props.brewery}
            <img src={props.label_photo.url} height="200"/>
          </p>
        </div>
      </Link>
      {button}
    </div>
  )
}

export default ArtLabelTile;
