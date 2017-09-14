import React, { Component } from 'react';
import ArtLabelTile from '../components/ArtLabelTile';

class ArtLabelsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_labels: [],
      current_user: {}
    }
    this.handleDelete = this.handleDelete.bind(this)
  }

  handleDelete(artLabelId) {
    fetch(`http://localhost:3000/api/v1/art_labels/${artLabelId}`, {
      method: 'DELETE',
      credentials: 'same-origin'
    }).then(response => response.json())
    .catch((thing) => console.log("so sad"))
    this.setState({art_labels: this.state.art_labels.filter(art_label => art_label.id !== artLabelId)})
  }

  componentDidMount() {
    fetch(`/api/v1/art_labels/`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(responseBody => {
      if (window.location.href.includes('term')) {

        let searchTerm = window.location.href.substr(53).replace('+', ' ').toLowerCase()

        responseBody.art_labels.forEach((label) => {
          if(label.name.toLowerCase().includes(searchTerm)){
            this.setState({
              art_labels: this.state.art_labels.concat([label])
            })
          }
        })
      } else {
        this.setState({
          art_labels: responseBody.art_labels
        })
      }
    })
  }

  render() {
    let art_labels = this.state.art_labels.map(art_label => {
      return(
        <ArtLabelTile
          key={art_label.id}
          id={art_label.id}
          name={art_label.name}
          brewery={art_label.brewery}
          label_photo={art_label.label_photo}
          deleteButton={this.handleDelete}
          currentUser={this.state.current_user}
          user={art_label.user_id}
        />
      )
    })
    return (
      <div>
        <h1>All Art Labels!!!</h1>
        {art_labels}
      </div>
    )
  }
}

export default ArtLabelsIndexContainer;
