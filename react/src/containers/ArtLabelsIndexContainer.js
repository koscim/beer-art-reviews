import React, { Component } from 'react';
import ArtLabelTile from '../components/ArtLabelTile';
import { Link, browserHistory } from 'react-router';
import ReactPaginate from 'react-paginate';

class ArtLabelsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_labels: [],
      total: 0,
      current_user: {}
    }
    this.handleDelete = this.handleDelete.bind(this)
    this.handlePageClick = this.handlePageClick.bind(this)
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
    let page = this.props.location.query.page || 1
    fetch(`/api/v1/art_labels?page=${page}`, {
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
      debugger
      this.setState({
        art_labels: responseBody.art_labels,
        current_user: responseBody.current_user,
        total: json.total
      })
    })
  }

  componentWillReceiveProps(nextProps){
    let page = this.props.location.query.page || 1
    fetch(`/api/v1/art_labels?page=${page}`, {
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
        art_labels: responseBody.art_labels,
        current_user: responseBody.current_user,
      })
    })
  }

  handlePageClick(data) {
    let selected = data.selected+1;
    browserHistory.push(`/?page=${selected}`)
  };

  render() {
    let page = this.props.location.query.page || 1
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
          page={page}
          total={this.state.total}
        />
      )
    })
    return (
      <div>
        <h1>All Art Labels!!!</h1>
        {art_labels}
        <a href="http://localhost:3000/art_labels/new">
          Add New Art Label
        </a>
        <div className={"react-paginate"}>
          <ReactPaginate
            previousLabel={"previous"}
            nextLabel={"next"}
            breakLabel={"..."}
            breakClassName={"break"}
            pageCount={Math.ceil(this.props.total/10)}
            marginPagesDisplayed={2}
            pageRangeDisplayed={5}
            onPageChange={this.handlePageClick}
            containerClassName={"pagination"}
            subContainerClassName={"pages pagination"}
            activeClassName={"active"}
          />
        </div>
      </div>
    )
  }
}

export default ArtLabelsIndexContainer;
