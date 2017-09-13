import React, { Component } from 'react';
import { browserHistory, Link } from 'react-router';

class ReviewShow extends Component {
  constructor(props) {
    super(props);
    this.state = {
      votes: [
        {
        vote_number: 0
        }
      ],
      currentUser: {},
      voteTotal: 0
    }
    this.upVote = this.upVote.bind(this)
    this.downVote = this.downVote.bind(this)
  }

  componentDidMount() {
    fetch(`/api/v1/art_labels/${this.props.art_label_id}/reviews/${this.props.review.id}`, {
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
      let voteTotal = 0;
      responseBody.votes.forEach((vote) => {
        voteTotal += parseInt(vote.vote_number)
      })
      this.setState({
        votes: responseBody.votes,
        current_user: responseBody.current_user,
        voteTotal: voteTotal
      })
    })
    .catch((thing) => console.log("so sad"))
  }

  upVote() {
    let upVotePayload = {
      review_id: this.props.review.id,
      user_id: this.state.current_user,
      vote_number: 1
    }
    fetch(`/api/v1/art_labels/${this.props.review.art_label.id}/reviews/${this.props.review.id}/votes`, {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(upVotePayload)
    }).then(response => response.json())
    .then(body => {
      let votePayload = this.state.votes.concat(1)
      this.setState({ votes: upVotePayload })
    })
    .catch((thing) => console.log("so sad"))
  }

  downVote() {
    let downVotePayload = {
      review_id: this.props.review.id,
      user_id: this.state.current_user,
      vote_number: -1
    }
    fetch(`/api/v1/art_labels/${this.props.review.art_label.id}/reviews/${this.props.review.id}/votes`, {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(downVotePayload)
    }).then(response => response.json())
    .then(body => {
      let votePayload = this.state.votes.concat(1)
      this.setState({ votes: downVotePayload })
    })
    .catch((thing) => console.log("so sad"))
  }

  render(){
    return(
      <div>
        <p>
          {this.props.username}
          <br />
          Feels: {this.props.review.feels}
          <br />
          Intoxication Level: {this.props.review.intoxication_level}
          <br />
          Joy: {this.props.review.joy}
          <br />
          Fear: {this.props.review.fear}
          <br />
          Sadness: {this.props.review.sadness}
          <br />
          Disgust: {this.props.review.disgust}
          <br />
          Anger: {this.props.review.anger}
          <br />
          Cleverness: {this.props.review.cleverness}
          <br />
          Collectability: {this.props.review.collectability}
          <br />
          Controversiality: {this.props.review.controversiality}
          <br />
          Buyability: {this.props.review.buyability}
          <br />
          Votes: {this.state.voteTotal}
          <br />
          <button className='button' onClick={this.upVote}>Upvote</button>
          <button className='button' onClick={this.downVote}>Downvote</button>
        </p>
      </div>
    )
  }
}

export default ReviewShow;
