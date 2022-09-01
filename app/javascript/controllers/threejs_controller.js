import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls";


// Connects to data-controller="threejs"
export default class extends Controller {
  connect() {
    console.log("Threejs controller connected")

    const loader = new GLTFLoader();
    const scene = new THREE.Scene();
    scene.background = new THREE.Color( 0xff0000 );
    const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 1000 );
    const light = new THREE.HemisphereLight(0xffffbb, 0x080820, 1);
    // controls.addEventListener('change', renderer);

    const renderer = new THREE.WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    this.element.appendChild( renderer.domElement );
    let controls = new OrbitControls(camera, renderer.domElement);

    loader.load( 'hand_fingers_semi_extended.glb', function ( gltf ) {
      let moto = gltf.scene;  // moto 3D object is loaded
      moto.scale.set(200, 200, 200);
      camera.position.set(0, 0, 500);
      controls.update();
      scene.add(moto);
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
