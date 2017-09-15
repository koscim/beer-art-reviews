import React, { Component } from 'react';
import { browserHistory, Link } from 'react-router';

class ReviewShow extends Component {
  constructor(props) {
    super(props);
    this.state = {
      votes: [
      ],
      currentUser: {},
      voteTotal: 0
    }
    this.upVote = this.upVote.bind(this)
    this.downVote = this.downVote.bind(this)
    this.aggregateReview = this.aggregateReview.bind(this)
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

  aggregateReview(){
    setTimeout(function(){
      fetch(`/api/v1/art_labels/${this.props.art_label_id}/reviews/${this.props.review.id}`, {
        credentials: 'same-origin'
      })
      .then(response => {
        return response.json();
      })
      .then(body => {
        let voteTotal = 0;
        body.votes.forEach((vote) => {
          voteTotal += parseInt(vote.vote_number)
        })
        this.setState({
          votes: body.votes,
          current_user: body.current_user,
          voteTotal: voteTotal
        })
      })}.bind(this), 100)
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
    })
    .catch((thing) => console.log("so sad"))
    this.aggregateReview()
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
      let votePayload = this.state.votes.concat(upVotePayload)
      this.setState({ votes: votePayload })
    })
    .catch((thing) => console.log("so sad"))
    this.aggregateReview()
  }

  render(){
    return(
      <div>
        <p>
          {this.props.username} {this.props.review.user.profile_photo ? <img src={this.props.review.user.profile_photo.url} className="profile-size"/> : "" }
          <br />
          Feels: {this.props.review.feels}
          <br />
          Intoxication Level: {this.props.review.intoxication_level}
          <br />
          {this.props.review.joy ? `Joy: ${this.props.review.joy}` : "Joy: none specified"}
          <br />
          {this.props.review.fear ? `Fear: ${this.props.review.fear}` : "Fear: none specified"}
          <br />
          {this.props.review.sadness ? `Sadness: ${this.props.review.sadness}` : "Sadness: none specified"}
          <br />
          {this.props.review.disgust ? `Disgust: ${this.props.review.disgust}` : "Disgust: none specified"}
          <br />
          {this.props.review.anger ? `Anger: ${this.props.review.anger}` : "Anger: none specified"}
          <br />
          {this.props.review.cleverness ? `Cleverness: ${this.props.review.cleverness}` : "Cleverness: none specified"}
          <br />
          {this.props.review.collectability ? `Collectability: ${this.props.review.collectability}` : "Collectability: none specified"}
          <br />
          {this.props.review.controversiality ? `Controversiality: ${this.props.review.controversiality}` : "Controversiality: none specified"}
          <br />
          {this.props.review.buyability ? `Buyability: ${this.props.review.buyability}` : "Buyability: none specified"}
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
