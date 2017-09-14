import React from 'react';
import { browserHistory, Link } from 'react-router';

const ArtLabelShow = (props) => {
  let review_score = {
    joy: 0,
    fear: 0,
    disgust: 0,
    anger: 0,
    sadness: 0,
    cleverness: 0,
    collectability: 0,
    controversiality: 0,
    buyability: 0
  }
  let tally = {
    joy: 0,
    fear: 0,
    disgust: 0,
    anger: 0,
    sadness: 0,
    cleverness: 0,
    collectability: 0,
    controversiality: 0,
    buyability: 0
  }
  props.reviews.forEach((review) => {
    if(review.joy){
      review_score.joy += review.joy
      tally.joy += 1
    }
    if(review.fear){
      review_score.fear += review.fear
      tally.fear += 1
    }
    if(review.disgust){
      review_score.disgust += review.disgust
      tally.disgust += 1
    }
    if(review.anger){
      review_score.anger += review.anger
      tally.anger += 1
    }
    if(review.sadness){
      review_score.sadness += review.sadness
      tally.sadness += 1
    }
    if(review.cleverness){
      review_score.cleverness += review.cleverness
      tally.cleverness += 1
    }
    if(review.collectability){
      review_score.collectability += review.collectability
      tally.collectability += 1
    }
    if(review.controversiality){
      review_score.controversiality += review.controversiality
      tally.controversiality += 1
    }
    if(review.buyability){
      review_score.buyability += review.buyability
      tally.buyability += 1
    }
  })
  return(
    <div>
      <h2>{props.art_label.name}</h2>
      <img src={props.art_label.label_photo.url} height="200"/>
      <p>Brewery: {props.art_label.brewery ? props.art_label.brewery : "N/A"}
      <br />
      Beer Style: {props.art_label.beer_style ? props.art_label.beer_style : "N/A"}
      <br />
      Art Style: {props.art_label.art_style ? props.art_label.art_style : "N/A"}
      <br />
      Container Type: {props.art_label.container_type ? props.art_label.container_type : "N/A"}
      <br />
      Beer Description: {props.art_label.beer_description ? props.art_label.beer_description : "N/A"}
      <br />
      Art Description: {props.art_label.art_description ? props.art_label.art_description : "N/A"}
      <br />
      Submitted By: {props.art_label.user ? props.art_label.user.username : "N/A"}
      </p>
      <i className="fa fa-birthday-cake" aria-hidden="true"></i>
      Average Joy: {props.reviews.count > 0 ? (review_score.joy/tally.joy).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-heartbeat" aria-hidden="true"></i>
      Average Fear: {props.reviews.count > 0 ? (review_score.fear/tally.fear).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-ambulance" aria-hidden="true"></i>
      Average Disgust: {props.reviews.count > 0 ? (review_score.disgust/tally.disgust).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-tint" aria-hidden="true"></i>
      Average Sadness: {props.reviews.count > 0 ? (review_score.sadness/tally.sadness).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-fire" aria-hidden="true"></i>
      Average Anger: {props.reviews.count > 0 ? (review_score.anger/tally.anger).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-hand-spock-o" aria-hidden="true"></i>
      Average Cleverness: {props.reviews.count > 0 ? (review_score.cleverness/tally.cleverness).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-shopping-basket" aria-hidden="true"></i>
      Average Collectability: {props.reviews.count > 0 ? (review_score.collectability/tally.collectability).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-commenting-o" aria-hidden="true"></i>
      Average Controversiality: {props.reviews.count > 0 ? (review_score.controversiality/tally.controversiality).toFixed(1) : "N/A"}
      <br />
      <i className="fa fa-money" aria-hidden="true"></i>
      Average Buyability: {props.reviews.count > 0 ? (review_score.buyability/tally.buyability).toFixed(1) : "N/A"}
    </div>
  )
}

export default ArtLabelShow;
