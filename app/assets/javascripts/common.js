;$(function(){

    // TYPING TEASER TEXT

    $('#showcase-type').typed({
        strings: ['Best Choice for Your Web App. Premium Quality', 'Ultimate Admin Template for All Your Needs', 'Clean Simple Responsive <br>Easy and Highly Customizable'],
        typeSpeed: 30,
        loop: true,
        backDelay: 1000,
        cursorChar: ''
    });


    // ROTATING 3D CUBE

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, 1110/900, 1, 10000);

    var renderer = new THREE.WebGLRenderer({ alpha: true });
    renderer.setSize(1110, 900);
    renderer.setClearColor( 0xf2f5fa, 0);
    document.getElementById('rotating-cube').appendChild(renderer.domElement);

    var geometry = new THREE.BoxGeometry(700, 700, 700, 3, 2, 2);
    var material = new THREE.MeshBasicMaterial({color: 0xdbe0e7, wireframe: true});
    var cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    camera.position.z = 1000;

    function render() {
        requestAnimationFrame(render);

        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;

        renderer.render(scene, camera);
    };

    render();

    // MENU SCROLLTO
    
    $('.cwt__main-menu a').on('click', function(){
        $('.cwt__main-menu a').removeClass('cwt__main-menu__link--active');
        $(this).addClass('cwt__main-menu__link--active');
    });

    $('.cwt__js-click__preview').on('click', function(){
        $.scrollTo($('.cwt__preview'), 1000);
    });

    $('.cwt__js-click__gallery').on('click', function(){
        $.scrollTo($('.cwt__gallery'), 1000, {offset: -100});
    });

    $('.cwt__js-click__features').on('click', function(){
        $.scrollTo($('.cwt__features'), 1000, {offset: -100});
    });

    $('.cwt__js-click__about').on('click', function(){
        $.scrollTo($('.cwt__about'), 1000, {offset: -100});
    });


});