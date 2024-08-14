<script>
	import { onMount } from "svelte";

	export let colourIntensity;
	export let hexSize;
	export let hexImage;
	export let logoHex;
	export let toggle = () => {} // called in parent
	export let onClick = () => {} // called in parent

	var className = "hex_polygon"
	if (logoHex) {
		className = "hex_polygon_logo"
	}

	// Size of the hexagon and the internal dimensions of the svg viewBox. 
	let xSize = 2 * hexSize;
	let ySize = Math.sqrt(3) * hexSize;

	const sidesOfHexagon = 6;
	let radius = xSize/2;
    const angle = (Math.PI * 2) / sidesOfHexagon;

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

	export const updateHexagon = function(hexagonSize) {
        // console.log("updateHexagon: " + hexagonSize);
		hexSize = hexagonSize + 0.3;
		setHexagonDetails();
    }

	onMount(() => {
		if (!logoHex) {
			// Change the colour every now and then, but not if this hex is part of the logo
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
		}
	});

	function componentToHex(c) {
		var hex = c.toString(16);
		return hex.length == 1 ? "0" + hex : hex;
	}

	function rgbToHex(r, g, b) {
		return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
	}

	var resetHexHover = function(){
		const testElements = document.getElementsByClassName("hex_polygon_logo");
		for (var i = 0; i < testElements.length; i++) {
			var testElement = testElements[i];
			testElement.style.transition = "fill 0.5s ease-in-out";
			testElement.style.fill = "var(--hex-colour)";
		}
	}

	export const updateHexagonColourHover = function(hexColour) {
		const testElements = document.getElementsByClassName("hex_polygon_logo");
	
		for (var i = 0; i < testElements.length; i++) {
			var testElement = testElements[i];
			testElement.style.transition = "fill 0s";
			testElement.style.fill = "#F00";
			setTimeout(resetHexHover, 250);
		}
	}

	export const updateHexagonColour = function(hexColour) {
		hexagonColour = hexColour;
    }

	var hexagonColour = rgbToHex(
		Math.round(Math.random() * colourIntensity),
		Math.round(Math.random() * colourIntensity),
		Math.round(Math.random() * colourIntensity)
	);

</script>

<svg id="hex_svg" class="svg_style" width={xSize} height={ySize} viewBox="0 0 {xSize} {ySize}">
    <g id=hex_button on:click={onClick} on:keydown={onClick}>
        <polygon style="--hex-colour: {hexagonColour};" class={className} 
		on:mouseenter={toggle}
		points="
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
		{#if hexImage != null}
			<image href="{hexImage}" height="{ySize/2}" width="{xSize/2}" x="{xSize/4}" y="{ySize/4}"/>
		{/if}
    </g>
</svg>

<style>
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

	.hex_polygon_logo {
		pointer-events: auto;
		transition: fill 0.5s ease-in-out;
		fill: var(--hex-colour);
	}

	#hex_button {
		pointer-events: None;
	}
</style>
