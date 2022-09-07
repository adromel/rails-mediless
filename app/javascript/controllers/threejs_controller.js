import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls";
import { GUI } from 'dat.gui';



// Connects to data-controller="threejs"
export default class extends Controller {
  static targets = ['container']
  static values = {scenePath: String}

  pointsCoordinates = {
    "TB23": {x: 0.065, y: 0.85, z: 0.12},
    "20GI": {x: 0.023, y: 0.797, z: 0.15},
    "4GI": {x: 0, y: 0, z: 0},
    "27R": {x: 0, y: 0, z: 0},
    "7P": {x: 0, y: 0, z: 0},
    "6Rt": {x: 0, y: 0, z: 0},
    "3F": {x: 0, y: 0, z: 0},
    "Le point Tian Inférieur": {x: 0, y: 0, z: 0},
    "5C": {x: 0, y: 0, z: 0},
    "5PC": {x: 0, y: 0, z: 0},
    "7C": {x: 0, y: 0, z: 0}
  }

  initialize() {
    this.animate = this.animate.bind(this)
  }

  addPoints() {
    this.points = {}
    Object.keys(this.pointsCoordinates).forEach((name, index) => {
      const coordinates = this.pointsCoordinates[name]

      const geometry = new THREE.SphereGeometry(0.003, 32, 32); // (radius, widthSegments, heightSegments)
      const material = new THREE.MeshBasicMaterial( {color: 0xf71b1b} );
      const sphere = new THREE.Mesh(geometry, material);
      sphere.position.set(coordinates.x, coordinates.y, coordinates.z);
      sphere.layers.set(index + 1);
      this.scene.add(sphere);
      this.camera.layers.enable(index + 1);
      this.points[name] = sphere
    })
  }

  animate() {
    requestAnimationFrame( this.animate )
    this.controls.update();
    this.renderer.render( this.scene, this.camera );
  }

  connect() {
    // console.log("Threejs controller connected")


    // Scene
    const loader = new GLTFLoader();
    this.scene = new THREE.Scene();
    this.scene.background = new THREE.Color( 0xd0f5ee );
    this.camera = new THREE.PerspectiveCamera( 50, this.containerTarget.offsetWidth / this.containerTarget.offsetHeight, 0.01, 10 );
    const light = new THREE.HemisphereLight(0xffffbb, 0x080820, 2);
    // controls.addEventListener('change', renderer);

    window.aa = this.containerTarget

    this.renderer = new THREE.WebGLRenderer({antialias: true});
    this.renderer.domElement.id = 'model';
    console.log('this.containerTarget.offsetWidth', this.containerTarget.offsetWidth)
    console.log('this.containerTarget.offsetHeight', this.containerTarget.offsetHeight)
    this.renderer.setSize( this.containerTarget.offsetWidth, this.containerTarget.offsetHeight );
    this.containerTarget.appendChild( this.renderer.domElement );
    this.controls = new OrbitControls(this.camera, this.renderer.domElement);
    this.controls.maxDistance = 3;
    this.controls.minDistance = 0.2;

    //SPHERE

    this.addPoints()


    //GUI
    // const gui = new GUI()
    // const cameraFolder = gui.addFolder('Camera')
    // cameraFolder.add(this.camera.position, 'x', 0, 10)
    // cameraFolder.add(this.camera.position, 'y', 0, 10)
    // cameraFolder.add(this.camera.position, 'z', 0, 10)
    // cameraFolder.open()

    const that = this
    loader.load( this.scenePathValue, ( gltf ) => {
      let body = gltf.scene;  // body 3D object is loaded
      body.scale.set(1, 1, 1);
      body.position.y = -1;
      that.camera.position.z = 3;
      that.controls.update();
      that.scene.add(body);
      that.scene.add(light);
      that.renderer.render( that.scene, that.camera );
    }, undefined, function ( error ) {

	    console.error( error );

    });

    this.animate()

  }

    //ORBITCHANGETARGET
    focus(event) {
      const name = event.currentTarget.dataset.name
      this.controls.target = this.points[name].position
    };
  };
