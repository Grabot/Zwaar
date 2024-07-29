<script>
	export let q;
	export let r;
	export let s;
	// The internal dimensions of the svg viewBox. 
	const viewBoxWidth = 100;
	const viewBoxHeight = 100;

	// Actual size of the hexagon on the screen
	const hexWidth = 100;
	const hexHeight = 100;
	
	const sidesOfHexagon = 6;
	const radius = viewBoxWidth/2;
    const angle = (Math.PI * 2) / sidesOfHexagon;

	const firstPointX = radius * Math.cos(0.0) + (viewBoxWidth / 2);
	const firstPointY = radius * Math.sin(0.0) + (viewBoxHeight / 2);

	// These hexagon points will be the same for all hexagons within their own viewbox dimensions.
    var points = [];
	points.push([firstPointX, firstPointY]);
	for (let i = 1; i <= sidesOfHexagon; i++) {
		const x = radius * Math.cos(angle * i) + (viewBoxWidth / 2);
		const y = radius * Math.sin(angle * i) + (viewBoxHeight / 2);
		points.push([x, y]);
    }

	var polygonColour = "#0000FFFF";

	let pos_x = 0;
	let pos_y = 0;
	function handleClick(e) {
		console.log("click event: " + e);
		polygonColour = "#FF0000FF";
	}

</script>

<div class="hex_item" style='--pos_x:{pos_x};--pos_y:{pos_y};'>
    <svg id="hex_svg" class="svg_style" width={hexWidth} height={hexHeight} viewBox="0 0 {viewBoxWidth} {viewBoxHeight}">
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
            <image href="https://via.placeholder.com/100" height="{viewBoxHeight/2}" width="{viewBoxWidth/2}" x="{viewBoxWidth/4}" y="{viewBoxHeight/4}"/>
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
