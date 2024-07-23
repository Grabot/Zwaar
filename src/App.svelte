<script>
	import { onMount } from "svelte";

	// A box and corresponding width and height value of the box.
	// The box is set to the full screen width and height 
	// and we observe the box for any changes in the size
	let screenBox;
	let screenWidth = 0;
	let screenHeight = 0;

	// The internal dimensions of the svg viewBox. 
	const width = 100;
	const height = 100;

	// Actual size of the hexagon on the screen
	const hexWidth = 100;
	const hexHeight = 100;
	
	const sidesOfHexagon = 6;
	const radius = width/2;
    const angle = (Math.PI * 2) / sidesOfHexagon;

	const firstPointX = radius * Math.cos(0.0) + (width / 2);
	const firstPointY = radius * Math.sin(0.0) + (height / 2);

    var points = [];
	points.push([firstPointX, firstPointY]);
	for (let i = 1; i <= sidesOfHexagon; i++) {
		const x = radius * Math.cos(angle * i) + (width / 2);
		const y = radius * Math.sin(angle * i) + (height / 2);
		points.push([x, y]);
    }

	var polygonColour = "#0000FFFF";

	function handleClick(e) {
		console.log("click event: " + e);
		polygonColour = "#FF0000FF";
	}

	// Add the observer when component mounts and cleanup after
	onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			// We're only watching one element
			const entry = entries.at(0);

			//Get the block size
			screenWidth = entry.contentRect.width;
			screenHeight = entry.contentRect.height;
		});
		resizeObserver.observe(screenBox);
	
		// This callback cleans up the observer
		return () => resizeObserver.unobserve(screenBox);
	});
</script>

<main>
	<!-- Width is {screenWidth}px  Height is {screenHeight}px -->
	<div class="screen_box" bind:this={screenBox}></div>
</main>

<div class="hex_item">
	<svg id="hex_svg" class="svg_style" width={{hexWidth}} height={{hexHeight}} viewBox="0 0 {width} {height}">
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
			<image href="https://via.placeholder.com/100" height="{height/2}" width="{width/2}" x="{width/4}" y="{height/4}"/>
		</g>
	</svg>
</div>

<style>
	.hex_item {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.hex_item image {
	}
	.hex_item svg {
	}

	#hex_button {
		cursor: pointer;
		fill: #900;
	}
	#hex_button:hover {
		cursor: pointer;
		fill: #F00;
	}

	main {
		font-family: sans-serif;
		text-align: center;
	}

	/* the way we detect the screen size. 
	We create an element and make it be the full size of the screen 
	and we observe the width and height of this element. */
	:global(body) {
		margin: 0;
		padding: 0;
	}
	.screen_box {
		width: 100vw;
		height: 100vh;
		background-color: green;
	}
</style>