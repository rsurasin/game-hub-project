import Alert from './components/Alert';
import Button from './components/Button';
import ListGroup from './components/ListGroup';

import { useState } from 'react';

function App() {
  const [activeAlert, setActiveAlert] = useState(false);
  const items = ['New York', 'San Francisco', 'Tokyo', 'London', 'Paris'];

  const handleSelectItem = (item: string) => {
    console.log(item);
  };

  const handleClick = () => {
    setActiveAlert(false);
  };

  return (
    <div>
      {activeAlert && (
        <Alert onClose={handleClick}>
          <span>Hello World</span>
        </Alert>
      )}
      <div>
        <Button
          color="secondary"
          onClick={() => {
            console.log('Clicked');
            setActiveAlert(true);
          }}
        >
          My Button
        </Button>
      </div>
      <ListGroup
        items={items}
        heading="Cities"
        onSelectItem={handleSelectItem}
      />
    </div>
  );
}

export default App;
