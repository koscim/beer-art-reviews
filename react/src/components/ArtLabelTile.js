import React from 'react';
import { Link, browserHistory } from 'react-router';

const ArtLabelTile = props => {
  let handleDelete = () => {
    props.deleteButton(props.id)
  }
  let button;
  let editButton;

  if(props.currentUser){
    if (props.currentUser.id === props.user || props.currentUser.role === "admin"){
      button = <button className='button' onClick={handleDelete}>Delete</button>
    } else {
      button = <button className='hidden-button button'>Delete</button>
    }
  }

  if(props.currentUser){
    if (props.currentUser.id === props.user || props.currentUser.role === "admin"){
      editButton = <a href={`/art_labels/${props.id}/edit`} className='button'>Edit</a>
    } else {
      editButton = <a className='hidden-button button'>Edit</a>
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
        {button}  {editButton}
      </div>
  )
}

export default ArtLabelTile;
