import { IonContent, 
  IonHeader, 
  IonButton, 
  IonToast, 
  IonIcon,
  IonPage, 
  IonTitle, 
  IonToolbar } from '@ionic/react';
import ExploreContainer from '../components/ExploreContainer';
import './Home.css';
import { entries } from '../data';
import {play as playIcon} from 'ionicons/icons';
import React, {useState } from 'react';
import {Link} from 'react-router-dom'

const Home: React.FC = () => {
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Home</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent className="ion-padding">
        Go to <Link to="/settings">Settings</Link>
      </IonContent>
    </IonPage>
  );
};

export default Home;
