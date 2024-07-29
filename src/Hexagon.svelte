<script>
	export let q;
	export let r;
	export let s;

	const hexSize = 100;
	// The internal dimensions of the svg viewBox. 
	const xSize = 2 * hexSize;
	const ySize = Math.sqrt(3) * hexSize;

	// Actual size of the hexagon on the screen
	const hexWidth = 2 * hexSize;
	const hexHeight = Math.sqrt(3) * hexSize;
	
	const sidesOfHexagon = 6;
	const radius = xSize/2;
    const angle = (Math.PI * 2) / sidesOfHexagon;

	const firstPointX = radius * Math.cos(0.0) + (xSize / 2);
	const firstPointY = radius * Math.sin(0.0) + (ySize / 2);

	// These hexagon points will be the same for all hexagons within their own viewbox dimensions.
    var points = [];
	points.push([firstPointX, firstPointY]);
	for (let i = 1; i <= sidesOfHexagon; i++) {
		const x = radius * Math.cos(angle * i) + (xSize / 2);
		const y = radius * Math.sin(angle * i) + (ySize / 2);
		points.push([x, y]);
    }

	var polygonColour = "#0000FFFF";

	let pos_x = 0;
	let pos_y = 0;
	function handleClick(e) {
		console.log("click event: " + e);
		polygonColour = "#FF0000FF";
	}

	function getTilePos(hexQ, hexR) {
		pos_x = hexSize * 3 / 2 * hexQ - hexSize;
		console.log(Math.sqrt(3));
		const yTr1 = hexSize * (Math.sqrt(3) / 2 * hexQ);
		const yTr2 = hexSize * (Math.sqrt(3) * hexR)
		pos_y = yTr1 + yTr2;

		// slight offset to put the center in the center and not a corner.
		pos_x += hexSize;

		console.log("getting tile position");
		console.log(pos_x);
		console.log(pos_y);
	}
	getTilePos(q, r);

</script>

<div class="hex_item" style='--pos_x:{pos_x};--pos_y:{pos_y};'>
    <svg id="hex_svg" class="svg_style" width={hexWidth} height={hexHeight} viewBox="0 0 {xSize} {ySize}">
        <g id=hex_button fill="{polygonColour}" on:click={handleClick} on:keydown={handleClick}>
            <polygon stroke-width=0 points="
                                            {points[0][0]},{points[0][1]}
                                            {points[1][0]},{points[1][1]}
                                            {points[2][0]},{points[2][1]}
                                            {points[3][0]},{points[3][1]}
                                            {points[4][0]},{points[4][1]}
                                            {points[5][0]},{points[5][1]}">
            </polygon>
            <!-- We add an image to the svg. We have a placeholder image and we set the height to half of the svg viewbox
                We position the x and y start of the image 1/4 of the width and height, 
                which will position the center of the image in the center of the svg. -->
            <image href="https://via.placeholder.com/100" height="{ySize/2}" width="{xSize/2}" x="{xSize/4}" y="{ySize/4}"/>
        </g>
    </svg>
</div>

<style>
	.hex_item {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: 
		translate(
			-50%,
			-50%
			) 
		translate(
			calc( var(--pos_x) * 1px ),
			calc( var(--pos_y) * 1px )
			);
	}

	#hex_button {
		cursor: pointer;
		fill: #900;
	}
	#hex_button:hover {
		cursor: pointer;
		fill: #F00;
	}

	/* div {
		width : calc( var(--pos_x) * 1px );
		height : calc( var(--pos_y) * 1px );
		background-color : green;
	} */
</style>
