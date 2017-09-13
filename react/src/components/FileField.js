import React from 'react';

const FileField = props => {
  return (
    <label>{props.label}
      <input
        name={props.name}
        onChange={props.handlerFunction}
        type='file'
        value={props.content}
      />
    </label>
  );
}

export default FileField;
