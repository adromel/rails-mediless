import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

// Connects to data-controller="threejs"
export default class extends Controller {
  connect() {
    console.log("Threejs controller connected")

    const loader = new GLTFLoader();
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 1000 );
    // const controls = new OrbitControls(camera, renderer);
    // controls.addEventListener('change', renderer);

    const renderer = new THREE.WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    this.element.appendChild( renderer.domElement );

    loader.load( 'hand_fingers_semi_extended.glb', function ( gltf ) {
      let model = gltf.scene;
	    scene.add( model );
      console.log("loaded scene");
      console.log(model.children[0]);

    }, undefined, function ( error ) {

	    console.error( error );

    });

    renderer.render( scene, camera );
  }
}
