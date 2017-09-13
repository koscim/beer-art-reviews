import React, { Component } from 'react';
import ArtLabelTile from '../components/ArtLabelTile';

class ArtLabelsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_labels: []
    }
  }

  componentDidMount() {
    if (window.location.href.includes('term')) {

      let searchTerm = window.location.href.substr(53).replace('+', ' ').toLowerCase()

      fetch(`/api/v1/art_labels/`)
      .then(response => {
        if (response.ok) {
          return response
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage)
          throw(error)
        }
      })
      .then(response => response.json())
      .then(responseBody => {
        responseBody.art_labels.forEach((label) => {
          if(label.name.toLowerCase().includes(searchTerm)){
            this.setState({
              art_labels: this.state.art_labels.concat([label])
            })
          }
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))

    } else {
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
        this.setState({
          art_labels: responseBody.art_labels
        })
      })
    }

  }
  render() {
    let art_labels = this.state.art_labels.map(art_label => {
      return(
        <ArtLabelTile
          key={art_label.id}
          id={art_label.id}
          name={art_label.name}
          brewery={art_label.brewery}
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
