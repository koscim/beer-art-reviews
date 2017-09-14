import React, { Component } from 'react';
import ArtLabelTile from '../components/ArtLabelTile';
import TextField from '../components/TextField';

class ArtLabelsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_labels: [],
      current_user: {},
      search: ""
    }
    this.handleDelete = this.handleDelete.bind(this)
    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleSearch = this.handleSearch.bind(this)
  }

  handleDelete(artLabelId) {
    fetch(`http://localhost:3000/api/v1/art_labels/${artLabelId}`, {
      method: 'DELETE',
      credentials: 'same-origin'
    }).then(response => response.json())
    .catch((thing) => console.log("so sad"))
    this.setState({art_labels: this.state.art_labels.filter(art_label => art_label.id !== artLabelId)})
  }

  handleSearch(event) {
    event.preventDefault()
    fetch(`/api/v1/art_labels/`, {
      credentials: 'same-origin'
    })
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
        let art_labels = [];
        responseBody.art_labels.forEach((label) => {
          if(label.name.toLowerCase().includes(this.state.search.toLowerCase())){
            art_labels = art_labels.concat(label)
          }
        })
        this.setState({
          art_labels: art_labels
        })
    })
  }

  handleInputChange(event) {
    this.setState({ search: event.target.value })
  }

  componentDidMount() {
    fetch(`/api/v1/art_labels/`, {
      credentials: 'same-origin'
    })
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
          current_user: responseBody.current_user,
          art_labels: responseBody.art_labels
        })
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
      <div className="container">
        <form onSubmit={this.handleSearch}>
          <TextField
            content={this.state.search}
            label="Search"
            name="search"
            handlerFunction={this.handleInputChange}
          />
          <input type="submit" value="Submit"/>
        </form>
        <div><h1>All Beer Art Labels</h1></div>
        <div className="center">
          {art_labels}
        </div>
        <a href="http://localhost:3000/art_labels/new">
          Add New Art Label
        </a>
      </div>
    )
  }
}

export default ArtLabelsIndexContainer;
