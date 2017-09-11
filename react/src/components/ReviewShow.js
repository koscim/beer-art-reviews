import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewShow = (props) => {
  return(
    <div>
      Review Show!
      <p>
        {props.username}
        <br />
        Feels: {props.review.feels}
        <br />
        Intoxication Level: {props.review.intoxication_level}
        <br />
        Joy: {props.review.joy}
        <br />
        Fear: {props.review.fear}
        <br />
        Sadness: {props.review.sadness}
        <br />
        Disgust: {props.review.disgust}
        <br />
        Anger: {props.review.anger}
        <br />
        Cleverness: {props.review.cleverness}
        <br />
        Collectability: {props.review.collectability}
        <br />
        Controversiality: {props.review.controversiality}
        <br />
        Buyability: {props.review.buyability}
      </p>
    </div>
  )
}

export default ReviewShow;
