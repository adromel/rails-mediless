import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls";
import gsap from 'gsap'
import { GUI } from 'dat.gui';



// Connects to data-controller="threejs"
export default class extends Controller {
  static targets = ['container']
  static values = {scenePath: String}

  pointsCoordinates = {
    "TB23": {x: 0.065, y: 0.85, z: 0.12},
    "20GI": {x: 0.023, y: 0.797, z: 0.15},
    "4GI": {x: -0.538, y: 0.021, z: 0.095},
    "27R": {x: 0, y: 0, z: 0},
    "7P": {x: 0, y: 0, z: 0},
    "6Rt": {x: -0.179, y: -0.83, z: -0.033},
    "3F": {x: -0.215, y: -0.93, z: 0.037},
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

      const geometry = new THREE.SphereGeometry(0.006, 32, 32); // (radius, widthSegments, heightSegments)
      const material = new THREE.MeshBasicMaterial( {color: 0xffffff} );
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
    this.controls.enablePan = false;

    //SPHERE

    this.addPoints()

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
      console.log(this.camera.position)
    }, undefined, function ( error ) {

	    console.error( error );

    });

    this.animate()

  }

    //ORBITCHANGETARGET
    focus(event) {
      console.log(this.camera.position)
      this.camera.position.set(0, 0.2, 3)
      window.scrollTo(0, 0)
      const name = event.currentTarget.dataset.name
      this.controls.target = this.points[name].position
      const that = this
      gsap.to( this.camera, {
        duration: 2,
        zoom: 13,
        onUpdate: function () {
          that.camera.updateProjectionMatrix();
          that.controls.update();
        }
      } );
    };
  };
