<script>
	import { onMount } from "svelte";

	export let q;
	export let r;
	export let colourIntensity;
	export let hexSize;

	// Size of the hexagon and the internal dimensions of the svg viewBox. 
	let xSize = 2 * hexSize;
	let ySize = Math.sqrt(3) * hexSize;

	const sidesOfHexagon = 6;
	let radius = xSize/2;
    const angle = (Math.PI * 2) / sidesOfHexagon;

	let pos_x = 0;
	let pos_y = 0;
	function getTilePos() {
		pos_x = xSize * 3 / 4 * q;
		const yTr1 = ySize / 2 * q;
		const yTr2 = ySize * r;
		pos_y = yTr1 + yTr2;
	}

	// These hexagon points will be the same for all hexagons within their own viewbox dimensions.
	var points = [];
	function setHexagonDetails() {
		// console.log("setting hex details with size: " + hexSize);
		// Size of the hexagon and the internal dimensions of the svg viewBox. 
		xSize = 2 * hexSize;
		ySize = Math.sqrt(3) * hexSize;

		radius = xSize/2;

		const firstPointX = radius * Math.cos(0.0) + (xSize / 2);
		const firstPointY = radius * Math.sin(0.0) + (ySize / 2);

		points = [];
		points.push([firstPointX, firstPointY]);
		for (let i = 1; i <= sidesOfHexagon; i++) {
			const x = radius * Math.cos(angle * i) + (xSize / 2);
			const y = radius * Math.sin(angle * i) + (ySize / 2);
			points.push([x, y]);
		}
	}
	setHexagonDetails();
	getTilePos();

	function handleClick(e) {
		console.log("click event: " + e);
		// window.location.href="/terms";
	}

	export const updateHexagon = function(hexagonSize) {
        // console.log("updateHexagon: " + hexagonSize);
		hexSize = hexagonSize;
		setHexagonDetails();
		getTilePos();
    }

	onMount(() => {
		const interval = setInterval(() => {
			hexagonColour = rgbToHex(
				// 20,
				// 20,
				Math.round(Math.random() * colourIntensity),
				Math.round(Math.random() * colourIntensity),
				Math.round(Math.random() * colourIntensity)
			);
		}, Math.round(200 + Math.random() * 1000));

		return () => {
			clearInterval(interval);
		};
	});

	function componentToHex(c) {
		var hex = c.toString(16);
		return hex.length == 1 ? "0" + hex : hex;
	}

	function rgbToHex(r, g, b) {
		return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
	}

	var hexagonColour = rgbToHex(
		// 20,
		// 20,
		Math.round(Math.random() * colourIntensity),
		Math.round(Math.random() * colourIntensity),
		Math.round(Math.random() * colourIntensity)
	);

</script>

<div class="hex_item" style='--pos_x:{pos_x};--pos_y:{pos_y};'>
    <svg id="hex_svg" class="svg_style" width={xSize} height={ySize} viewBox="0 0 {xSize} {ySize}">
        <g id=hex_button on:click={handleClick} on:keydown={handleClick}>
            <polygon style="--hex-colour: {hexagonColour}" class="hex_polygon" points="
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
            <!-- <image href="https://via.placeholder.com/100" height="{ySize/2}" width="{xSize/2}" x="{xSize/4}" y="{ySize/4}"/> -->
        </g>
    </svg>
</div>

<style>
	.hex_item {
		pointer-events: None;
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

	.svg_style {
		pointer-events: None;
	}

	.hex_polygon {
		pointer-events: auto;
		transition: fill 0.5s ease-in-out;
		stroke: aqua;
		stroke-width: 5;
		cursor: pointer;
		fill: var(--hex-colour);
	}
	.hex_polygon:hover {
		cursor: pointer;
		fill: #F00;
		transition: fill 0s;
	}

	#hex_button {
		pointer-events: None;
	}
</style>
