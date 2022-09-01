import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';

// Connects to data-controller="threejs"
export default class extends Controller {
  static values = { filePath: String }

  connect() {
    console.log("Threejs controller connected");

    const loader = new GLTFLoader();
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 1000 );
    // const controls = new OrbitControls(camera, renderer);
    // controls.addEventListener('change', renderer);

    const renderer = new THREE.WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    this.element.appendChild( renderer.domElement );

    console.log(this.filePathValue)

    loader.load( this.filePathValue, function ( gltf ) {

      debugger;
	    scene.add( gltf.scene );
      console.log("loaded scene")

    }, undefined, function ( error ) {

	    console.error( error );

    });

    renderer.render( scene, camera );
  }
}
