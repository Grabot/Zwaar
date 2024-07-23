<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";

	// A box and corresponding width and height value of the box.
	// The box is set to the full screen width and height 
	// and we observe the box for any changes in the size
	let screenBox;
	let screenWidth = -1;
	let screenHeight = -1;
	
	onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			const entry = entries.at(0);

			screenWidth = entry.contentRect.width;
			screenHeight = entry.contentRect.height;
		});
		resizeObserver.observe(screenBox);
		return () => resizeObserver.unobserve(screenBox);
	});

	// Not the cleanest solution, but we will manually define all the hexagons that we want to display.
	// We will use the q, r, s coordinates system even though just q, r should be sufficient.
	const hexagons = [];
	hexagons.push([0, 0, 0]);
	// hexagons.push([0, -1, 1]);
	// hexagons.push([1, -1, 0]);
	// hexagons.push([1, 0, -1]);
	// hexagons.push([0, 1, -1]);
	// hexagons.push([-1, 1, 0]);
	// hexagons.push([-1, 0, 1]);
</script>

<main>
	<!-- Width is {screenWidth}px  Height is {screenHeight}px -->
	<div class="screen_box" bind:this={screenBox}></div>
</main>

{#each hexagons as hexagon}
	<Hexagon q={hexagon[0]} r={hexagon[1]} s={hexagon[2]}></Hexagon>
{/each}


<style>

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
	}
</style>