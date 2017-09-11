import React, { Component } from 'react';
import ArtLabelShow from '../components/ArtLabelShow';
import ReviewShow from '../components/ReviewShow';
import { browserHistory, Link } from 'react-router';

class ArtLabelShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      art_label: {},
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
    return(
      <div className='container'>
        Art Label Show!!!!
        <ArtLabelShow
          key={this.state.art_label.id}
          id={this.state.art_label.id}
          name={this.state.art_label.name}
        />
        {reviews}
        <div className="button" onClick={browserHistory.goBack} >
          Back
        </div>
      </div>
    )
  }
}

export default ArtLabelShowContainer;
