import React, { Component } from 'react';
import ArtLabelShow from '../components/ArtLabelShow';
import ReviewShow from '../components/ReviewShow';
import { browserHistory, Link } from 'react-router';

class ArtLabelShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_label: {
        label_photo: {
          url: ""
        },
        user: {
          username: ""
        }
      },
      reviews: []
    }
  }

  componentDidMount() {
    let artLabelId = this.props.params.id;
    fetch(`/api/v1/art_labels/${artLabelId}`)
    .then(response => response.json())
    .then(responseData => {
      this.setState({
        art_label: responseData.art_label,
        reviews: responseData.art_label.reviews
      })
    })
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewShow
          key={review.id}
          id={review.id}
          review={review}
          username={review.user.username}
          art_label_id={review.art_label_id}
        />
      )
    })

    let newAddress = `${this.state.art_label.id}/reviews/new`

    return(
      <div className='container'>
        Art Label Show!!!!
        <ArtLabelShow
          key={this.state.art_label.id}
          id={this.state.art_label.id}
          art_label={this.state.art_label}
        />
        <h2>Reviews:</h2>
        {reviews}
        <h2>Create a New Review:</h2>
        <a href={newAddress}>pants</a>

        <div className="button" onClick={browserHistory.goBack} >
          Back
        </div>
      </div>
    )
  }
}

export default ArtLabelShowContainer;
