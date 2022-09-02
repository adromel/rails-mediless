import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls";


// Connects to data-controller="threejs"
export default class extends Controller {
  static values = {scenePath: String}

  connect() {
    console.log("Threejs controller connected")

    const loader = new GLTFLoader();
    const scene = new THREE.Scene();
    scene.background = new THREE.Color( 0xd0f5ee );
    const camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 1000 );
    const light = new THREE.HemisphereLight(0xffffbb, 0x080820, 2);
    // controls.addEventListener('change', renderer);

    const renderer = new THREE.WebGLRenderer({antialias: true});
    renderer.setSize( window.innerWidth, window.innerHeight );
    this.element.appendChild( renderer.domElement );
    let controls = new OrbitControls(camera, renderer.domElement);

    loader.load( this.scenePathValue, function ( gltf ) {
      let body = gltf.scene;  // body 3D object is loaded
      body.scale.set(1, 1, 1);
      body.position.y = -1;
      camera.position.z = 3;
      controls.update();
      scene.add(body);
      scene.add(light);
      console.log(controls);
      renderer.render( scene, camera );


    }, undefined, function ( error ) {

	    console.error( error );

    });

    function animate() {

      requestAnimationFrame( animate );

      // required if controls.enableDamping or controls.autoRotate are set to true
      controls.update();

      renderer.render( scene, camera );

    };

    animate();

  }
}
