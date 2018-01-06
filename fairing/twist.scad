n = 32;

function psin (i) = sin(360*i/n);
function pcos (i) = 1.5*cos(360*i/n);

function twist (i) = (i + 9) % n;
function top (i) = [10*psin(twist(i)), 10*pcos(twist(i)), 20];
function bot (i) = [10*psin(i), 10*pcos(i), 0];

function xp (a, b, c) = 
    let (w = cross(a-b, c-b))
    -3 *  w / norm(w) + b;

module slab(i) {
    // outside (bottom)
    o0 = bot(i);
    o1 = top(i);
    o2 = top(i+1);
    o3 = bot(i+1);
    CubePoints = [
        o0, o1, o2, o3,
        xp(o3, o0, o1),
        xp(o0, o1, o2),
        xp(o1, o2, o3),
        xp(o2, o3, o0)
    ];
    CubeFaces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3]]; // left
    difference() {
        polyhedron( CubePoints, CubeFaces );
        cube(20);
    }
}

module fairing () {
    for (i = [0:n]) {
        slab(i);
    }
}

fairing();